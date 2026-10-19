"""Prepare reviewable sources only: never build, install, run solvers, or edit a model."""
from pathlib import Path
import difflib,json,hashlib
R=Path('/srv/home/yuechunsun/tools/lean/build/shim-c');H=Path(__file__).resolve().parent;B=R/'experiments/shim-c-v2'
base=B/'stage3-unary-front/.build/source/src/plugins/wp/MemBytes.ml';old=base.read_text();start=old.index('let float_cluster () =');end=old.index('let load_int_raw memory kind addr =',start)
new='''(* Native IEEE bit-representation prototype. No CODEC_FLOAT axioms.
   Byte storage keeps raw NaN bits; float stores overapproximate payloads. *)
module Float = struct
  let ikind = function Float32 -> UInt32 | Float64 -> UInt64
  let suffix = function Float32 -> "32" | Float64 -> "64"
end

let native_float kind =
  if Cfloat.tau_of_float kind <> Cfloat.ftau kind then
    Wp_parameters.abort ~current:true
      "Native byte-float codec requires IEEE Float, not Real"

let int_to_float kind bits =
  native_float kind ;
  let decode = Lang.extern_f ~library:"bytefloat"
      ~result:(Cfloat.ftau kind) "decode%s" (Float.suffix kind) in
  e_fun decode [ bits ]

let float_to_int kind value seed =
  native_float kind ;
  let encode = Lang.extern_f ~library:"bytefloat"
      ~result:Lang.t_int "encode%s" (Float.suffix kind) in
  e_fun encode [ value ; seed ]

'''
text=old[:start]+new+old[end:];needle='''let store_float sigma kind addr v =
  store_int sigma (Float.ikind kind) addr @@ float_to_int kind v''';assert needle in text
text=text.replace(needle,'''let store_float sigma kind addr v =
  (* Allocate here, never inside a cached codec definition or at load time.
     As in MemLoader.assigned_loc, this remains free until universal VC closure. *)
  let seed = Lang.freshvar ~basename:"nan_seed" Lang.t_int in
  store_int sigma (Float.ikind kind) addr @@ float_to_int kind v (e_var seed)''')
(H/'MemBytes-native-codec.patch').write_text(''.join(difflib.unified_diff(old.splitlines(True),text.splitlines(True),fromfile='a/src/plugins/wp/MemBytes.ml',tofile='b/src/plugins/wp/MemBytes.ml')))
(H/'why3/frama_c_wp/bytefloat.mlw').write_text('''theory Bytefloat
  use int.Int
  use frama_c_wp.cfloat.Cfloat

  (* Primitive symbols interpreted ONLY by the two reviewed native SMT drivers.
     No codec axiom, inverse law, range assumption, or abstract Real encoding. *)
  function decode32 int : f32
  function decode64 int : f64
  function encode32 f32 int : int
  function encode64 f64 int : int
end
''')
for solver,conv in [('z3','bv2int'),('cvc5','bv2nat')]:
 lines=['import '+json.dumps(str(B/'handoff-model-front'/(solver+'.drv'))),'','theory frama_c_wp.bytefloat.Bytefloat']
 for width,eb,sb,sign,exp,frac in [(32,8,24,'80000000','7f800000','007fffff'),(64,11,53,'8000000000000000','7ff0000000000000','000fffffffffffff')]:
  digits=width//4;one='#x'+format(1,'0'+str(digits)+'x');low='#x'+format((1<<(width-1))-1,'0'+str(digits)+'x');seed=f'((_ int2bv {width}) %2)'
  nan=f'(bvor (bvand {seed} #x{sign}) (bvadd #x{exp} (bvadd {one} (bvurem (bvand {seed} {low}) #x{frac}))))'
  lines.append(f' syntax function decode{width} "((_ to_fp {eb} {sb}) ((_ int2bv {width}) %1))"')
  lines.append(f' syntax function encode{width} "({conv} (ite (fp.isNaN %1) {nan} (fp.to_ieee_bv %1)))"')
 lines.append('end');(H/(solver+'-codec.drv')).write_text('\n'.join(lines)+'\n')
files=[base,B/'model-integer-byte-v2/why3/frama_c_wp/membytes_le.mlw',B/'model-integer-byte-v2/why3/frama_c_wp/membytes_be.mlw',B/'model-plus/cint.mlw',B/'handoff-model-front/z3.drv',B/'handoff-model-front/cvc5.drv']
(H/'SOURCE-PROVENANCE.json').write_text(json.dumps(dict(status='source-only-uncompiled-unqualified',base_and_required_inherited_inputs={str(p.relative_to(R)):hashlib.sha256(p.read_bytes()).hexdigest() for p in files},new_codec_axioms=0,build_or_install_performed=False),indent=2)+'\n')
