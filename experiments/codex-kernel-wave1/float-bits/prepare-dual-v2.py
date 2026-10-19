from pathlib import Path
import json,hashlib,shutil
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2];parent=HERE/'model-native-bytes32-v2';out=HERE/'model-native-bytes32-v2-dual'
if out.exists():raise SystemExit('Use a fresh model version')
out.mkdir();base=HERE/'model-native-bytes32'
s=(parent/'frama-c.py').read_text().replace("install=here/'.build/install'","install=here.parent/'model-native-bytes32-v2/.build/install'");(out/'frama-c.py').write_text(s);(out/'frama-c.py').chmod(0o755);shutil.copyfile(parent/'acsl-bits.driver',out/'acsl-bits.driver')
s=(base/'cvc5.drv').read_text();s=s.replace(' syntax function repr_encode32 "(bv2nat (fp.to_ieee_bv %1))"\n','');s+='\n(* repr_encode32 intentionally left uninterpreted: conservative abstraction.\n   No inverse or range axioms. Exact encoder-dependent VCs require native Z3. *)\n';(out/'cvc5-conservative.drv').write_text(s)
s=(parent/'why3.conf').read_text();s+='\n[prover]\nname = "CVC5"\nversion = "1.2.1"\ncommand = "/zp_vegeta/scratch_sb/ycsun/verus/research/agent-qs8-rsum/provers/bin/cvc5 --lang=smt2 --tlimit-per=%t000 %f"\ndriver = "'+str(out/'cvc5-conservative.drv')+'"\n';(out/'why3.conf').write_text(s)
lock=json.loads((parent/'float_model_lock.json').read_text());lock.update(version='experimental-native-bytes32-v2-dual-precision',qualification='not admitted; CVC5 encoder is sound overapproximation, Z3 exact; root audit pending',provers=['z3','cvc5'],why3_config=str((out/'why3.conf').relative_to(ROOT)),encoder_per_prover={'z3':'native fp.to_ieee_bv outside NaN','cvc5':'uninterpreted, no inverse/bounds axioms; weaker approximation'})
for p in out.iterdir():lock['files'][str(p.relative_to(ROOT))]=hashlib.sha256(p.read_bytes()).hexdigest()
lock['files'][str(Path(__file__).resolve().relative_to(ROOT))]=hashlib.sha256(Path(__file__).read_bytes()).hexdigest();(out/'float_model_lock.json').write_text(json.dumps(lock,indent=2)+'\n');print(hashlib.sha256((out/'float_model_lock.json').read_bytes()).hexdigest())
