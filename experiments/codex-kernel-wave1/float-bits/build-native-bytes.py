"""Build an isolated experimental binary32 byte codec; never alter live models."""
from pathlib import Path
import hashlib,json,os,shutil,subprocess
HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[2]
BASE=ROOT/'experiments/shim-c-v2'
OUT=HERE/'model-native-bytes32'
if OUT.exists():raise SystemExit('Use a fresh model directory')
OUT.mkdir();(OUT/'.build').mkdir()
source=BASE/'toolchain-build/.build/source/frama-c-33.0-Arsenic'
subprocess.run(['cp','-a','--reflink=auto',str(source),str(OUT/'.build/source')],check=True)
p=OUT/'.build/source/src/plugins/wp/MemBytes.ml';old=p.read_text()
assert hashlib.sha256(p.read_bytes()).hexdigest()=='0a0cc11febb13fc297fb5608ab4de466e53079ffecf3c56b90a5230cb007f781'
start=old.index('let float_cluster () =');end=old.index('let load_int_raw memory kind addr =')
new=r'''(* Experimental relational binary32 representation. No codec axioms.
   Native FP collapses NaN payloads. Each FLOAT STORE therefore gets a fresh
   universally quantified choice of any uint32 NaN encoding. This is an
   over-approximation; memcpy itself still copies concrete byte memory. *)
module Float = struct
  let ikind = function Float32 -> UInt32 | Float64 -> UInt64
end

let codec32_encode =
  Lang.extern_f ~library:"cfloat" ~result:Lang.t_int "repr_encode32"
let codec32_decode =
  Lang.extern_f ~library:"cfloat"
    ~result:(Cfloat.tau_of_float Float32) "repr_decode32"
let codec32_is_nan = Lang.extern_fp ~library:"cfloat" "is_NaN_f32"

let float_to_int fkind f =
  match fkind with
  | Float64 -> Wp_parameters.fatal "Experimental byte codec supports binary32 only"
  | Float32 ->
    let choice = Lang.freshvar ~basename:"nan_store_bits" Lang.t_int in
    let bits = Cint.convert UInt32 (e_var choice) in
    let exp = e_fun Cint.f_land [bits;e_int 0x7f800000] in
    let frac = e_fun Cint.f_land [bits;e_int 0x007fffff] in
    let is_nan_bits = e_and [e_eq exp (e_int 0x7f800000); e_neq frac e_zero] in
    let nan_bits = e_if is_nan_bits bits (e_int 0x7fc00000) in
    e_if (e_prop (p_call codec32_is_nan [f])) nan_bits
      (e_fun codec32_encode [f])

let int_to_float fkind bits =
  match fkind with
  | Float64 -> Wp_parameters.fatal "Experimental byte codec supports binary32 only"
  | Float32 -> e_fun codec32_decode [bits]

'''
new=old[:start]+new+old[end:];p.write_text(new)
diff=subprocess.run(['diff','-u','--label','a/src/plugins/wp/MemBytes.ml','--label','b/src/plugins/wp/MemBytes.ml',str(source/'src/plugins/wp/MemBytes.ml'),str(p)],stdout=subprocess.PIPE)
assert diff.returncode==1;(OUT/'mem-bytes-native32.patch').write_bytes(diff.stdout)
for folder in ['wp-share','libc']:shutil.copytree(BASE/'model-plus'/folder,OUT/folder)
for endian in ['le','be']:
 shutil.copyfile(BASE/'model-integer-byte-v2/why3/frama_c_wp'/('membytes_'+endian+'.mlw'),OUT/'wp-share/why3/frama_c_wp'/('membytes_'+endian+'.mlw'))
p=OUT/'wp-share/why3/frama_c_wp/cfloat.mlw';s=p.read_text();i=s.rindex('\nend');p.write_text(s[:i]+'\n  (* Native decoder and non-NaN encoder; no inverse axioms. *)\n  function repr_decode32 int : f32\n  function repr_encode32 f32 : int\n'+s[i:])
for prover in ['z3','cvc5']:
 s=(BASE/'model-front'/(prover+'.drv')).read_text()
 s+='\ntheory frama_c_wp.cfloat.Cfloat\n syntax function repr_decode32 "((_ to_fp 8 24) ((_ int2bv 32) %1))"\n syntax function repr_encode32 "(bv2nat (fp.to_ieee_bv %1))"\nend\n'
 (OUT/(prover+'.drv')).write_text(s)
s=(BASE/'model-front/why3.conf').read_text()
for prover in ['z3','cvc5']:s=s.replace(str(BASE/'model-front'/(prover+'.drv')),str(OUT/(prover+'.drv')))
(OUT/'why3.conf').write_text(s)
(OUT/'candidate-source.json').write_text(json.dumps({'status':'experimental; not qualified or frozen','parent_mem_bytes_sha256':hashlib.sha256(old.encode()).hexdigest(),'candidate_mem_bytes_sha256':hashlib.sha256(new.encode()).hexdigest(),'native_decoder':'SMT-LIB bitvector to IEEE Float32; all 32-bit patterns','native_encoder':'SMT-LIB fp.to_ieee_bv, selected only for non-NaN','nan_store':'fresh per symbolic store; arbitrary uint32 NaN encoding; over-approximate, not payload preservation','byte_copy':'unchanged v2 byte model; byte memory copied exactly','added_axioms':0,'supported_float_width':32},indent=2)+'\n')
opam=BASE/'toolchain-build/.build/bin/opam'
env=dict(os.environ,OPAMROOT=str(BASE/'toolchain-build/.build/opam'))
cmds=[[str(opam),'exec','--switch=shim-wp-fix','--','dune','build','-j','4','--release','--promote-install-files=false','@install'],[str(opam),'exec','--switch=shim-wp-fix','--','dune','install','--prefix='+str(OUT/'.build/install'),'--release']]
(OUT/'build-command.json').write_text(json.dumps(cmds,indent=2)+'\n')
with (OUT/'build.log').open('w') as log:
 for cmd in cmds:
  a=subprocess.run(cmd,cwd=OUT/'.build/source',env=env,stdout=log,stderr=subprocess.STDOUT,timeout=900)
  if a.returncode:raise SystemExit('Build failed: '+str(a.returncode))
print('Independent candidate compiled, not qualified:',OUT)
