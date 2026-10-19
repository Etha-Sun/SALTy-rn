"""Add independently checked Word/Int composition lemmas; no codec axioms."""
from pathlib import Path
import hashlib,json,shutil,subprocess
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2];BASE=ROOT/'experiments/shim-c-v2';parent=HERE/'model-native-bytes32-v2-dual';out=HERE/'model-native-bytes32-v3'
if out.exists():raise SystemExit('Fresh model required')
out.mkdir();shutil.copytree(HERE/'model-native-bytes32/wp-share',out/'wp-share')
shared=out/'wp-share/why3/frama_c_wp'
for name in ['float_bits32.mlw','float_bits32_primitive.mlw']:
 s=(HERE/'probes'/name).read_text().replace('use float_bits32_primitive.Codec32','use frama_c_wp.float_bits32_primitive.Codec32');(shared/name).write_text(s)
p=shared/'cfloat.mlw';s=p.read_text().replace('  type f32 = F32.t','  use frama_c_wp.float_bits32.FloatBits32 as Bits32\n\n  type f32 = F32.t')
s=s.replace('  function repr_decode32 int : f32','  function repr_decode32 (u:int) : f32 = Bits32.decode_int u').replace('  function repr_encode32 f32 : int','  function repr_encode32 (x:f32) : int = Bits32.encode_int x');p.write_text(s)
for prover,source in [('z3',HERE/'model-native-bytes32/z3.drv'),('cvc5',parent/'cvc5-conservative.drv')]:
 lines=source.read_text().splitlines();s='\n'.join(x for x in lines if 'syntax function repr_' not in x)+'\n'
 s+='\ntheory bv.BV32\n syntax function of_int "((_ int2bv 32) %1)"\nend\ntheory frama_c_wp.float_bits32_primitive.Codec32\n syntax function decode_word "((_ to_fp 8 24) %1)"\n'
 if prover=='z3':s+=' syntax function encode_word "(fp.to_ieee_bv %1)"\n'
 s+='end\n';(out/(prover+'.drv')).write_text(s)
s=(parent/'why3.conf').read_text().replace(str(HERE/'model-native-bytes32/z3.drv'),str(out/'z3.drv')).replace(str(parent/'cvc5-conservative.drv'),str(out/'cvc5.drv'));(out/'why3.conf').write_text(s)
shutil.copyfile(parent/'acsl-bits.driver',out/'acsl-bits.driver')
s=(parent/'frama-c.py').read_text().replace("here.parent/'model-native-bytes32/wp-share'","here/'wp-share'");(out/'frama-c.py').write_text(s);(out/'frama-c.py').chmod(0o755)
why3=BASE/'toolchain-build/.build/opam/shim-wp-fix/bin/why3';cmd=[str(why3),'prove','-C',str(out/'why3.conf'),'-L',str(out/'wp-share/why3'),'-P','Z3','-t','10','-m','1024','-a','split_vc',str(shared/'float_bits32.mlw')]
(out/'helper-proof-command.json').write_text(json.dumps(cmd,indent=2)+'\n')
with (out/'helper-proof.log').open('w') as log:a=subprocess.run(cmd,stdout=log,stderr=subprocess.STDOUT,timeout=180)
s=(out/'helper-proof.log').read_text()
if a.returncode or s.count('Prover result is: Valid')!=8:raise SystemExit('Helper qualification failed')
(out/'helper-proof-result.json').write_text(json.dumps({'exit':a.returncode,'passed':8,'total':8,'source':str((shared/'float_bits32.mlw').relative_to(ROOT)),'method':'Why3 split_vc; all helper postconditions, assertions and call preconditions checked','scope':'explicit uint32 range and non-NaN inverse; no NaN inverse or unbounded integer inverse'},indent=2)+'\n')
lock=json.loads((parent/'float_model_lock.json').read_text());lock.update(version='experimental-native-bytes32-v3-checked-word-int-bridge',qualification='helper proof passed; whole model/root qualification pending',share=str((out/'wp-share').relative_to(ROOT)),why3_config=str((out/'why3.conf').relative_to(ROOT)),encoder_per_prover={'z3':'native word codec; body-checked finite inverses','cvc5':'word encoder uninterpreted; may use only independently checked helper postconditions, no assumed codec inverse axioms'})
paths=[p for p in out.rglob('*') if p.is_file()]+[Path(__file__).resolve()]
for p in paths:lock['files'][str(p.relative_to(ROOT))]=hashlib.sha256(p.read_bytes()).hexdigest()
(out/'float_model_lock.json').write_text(json.dumps(lock,indent=2)+'\n');print('model_sha',hashlib.sha256((out/'float_model_lock.json').read_bytes()).hexdigest())
