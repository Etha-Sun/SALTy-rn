from pathlib import Path
import json,hashlib,shutil,subprocess
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2];parent=HERE/'model-native-bytes32-v3';out=HERE/'model-native-bytes32-v4'
if out.exists():raise SystemExit('Fresh model required')
out.mkdir();shutil.copytree(parent/'wp-share',out/'wp-share')
for name in ['frama-c.py','acsl-bits.driver','z3.drv','cvc5.drv','why3.conf']:
 s=(parent/name).read_text().replace(str(parent/'z3.drv'),str(out/'z3.drv')).replace(str(parent/'cvc5.drv'),str(out/'cvc5.drv'));(out/name).write_text(s)
(out/'frama-c.py').chmod(0o755)
p=out/'wp-share/why3/frama_c_wp/float_bits32.mlw';s=p.read_text();i=s.rindex('\nend');s=s[:i]+'''\n  let lemma encoder_uint32_bounds (x:F.t)
    ensures { 0 <= encode_int x < 4294967296 }
  = ()\n'''+s[i:];p.write_text(s)
cmd=json.loads((parent/'helper-proof-command.json').read_text());cmd=[str(out/'why3.conf') if x==str(parent/'why3.conf') else str(out/'wp-share/why3') if x==str(parent/'wp-share/why3') else str(p) if x.endswith('/frama_c_wp/float_bits32.mlw') else x for x in cmd];(out/'helper-proof-command.json').write_text(json.dumps(cmd,indent=2)+'\n')
with (out/'helper-proof.log').open('w') as log:a=subprocess.run(cmd,stdout=log,stderr=subprocess.STDOUT,timeout=180)
s=(out/'helper-proof.log').read_text();assert a.returncode==0 and s.count('Prover result is: Valid')==9,s
(out/'helper-proof-result.json').write_text(json.dumps({'exit':0,'passed':9,'total':9,'change':'One extra body-checked encoder range property; uint32/non-NaN inverse conditions unchanged.'},indent=2)+'\n')
lock=json.loads((parent/'float_model_lock.json').read_text());lock.update(version='experimental-native-bytes32-v4-checked-encoder-range',share=str((out/'wp-share').relative_to(ROOT)),why3_config=str((out/'why3.conf').relative_to(ROOT)))
for p in [x for x in out.rglob('*') if x.is_file()]+[Path(__file__).resolve()]:lock['files'][str(p.relative_to(ROOT))]=hashlib.sha256(p.read_bytes()).hexdigest()
(out/'float_model_lock.json').write_text(json.dumps(lock,indent=2)+'\n');print(hashlib.sha256((out/'float_model_lock.json').read_bytes()).hexdigest())
