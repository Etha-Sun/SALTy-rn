"""Independent WP statistics repair: honor already-trivial tactic children only."""
from pathlib import Path
import hashlib,json,os,shutil,subprocess
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2];BASE=ROOT/'experiments/shim-c-v2';parent=HERE/'model-native-bytes32-v4';frontend=HERE/'model-native-bytes32-v2';out=HERE/'model-native-bytes32-v5-bookkeeping'
if out.exists():raise SystemExit('Fresh namespace required')
out.mkdir();(out/'.build').mkdir();subprocess.run(['cp','-a','--reflink=auto',str(frontend/'.build/source'),str(out/'.build/source')],check=True)
p=out/'.build/source/src/plugins/wp/ProofEngine.ml';old=p.read_text();needle='''let prover_stats ~smoke goal =
  Stats.results ~smoke @@
  List.filter is_prover @@
  Wpo.get_results goal''';replacement='''let prover_stats ~smoke goal =
  (* Trivial tactic children may have no stored prover result. *)
  if Wpo.is_trivial goal then
    Stats.results ~smoke
      [Prover.Qed, VCS.result ~solver:(Wpo.qed_time goal) VCS.Valid]
  else
    Stats.results ~smoke @@
    List.filter is_prover @@
    Wpo.get_results goal''';assert old.count(needle)==1;p.write_text(old.replace(needle,replacement));a=subprocess.run(['diff','-u','--label','a/src/plugins/wp/ProofEngine.ml','--label','b/src/plugins/wp/ProofEngine.ml',str(frontend/'.build/source/src/plugins/wp/ProofEngine.ml'),str(p)],stdout=subprocess.PIPE);assert a.returncode==1;(out/'trivial-child-stats.patch').write_bytes(a.stdout)
shutil.copytree(parent/'wp-share',out/'wp-share')
for name in ['frama-c.py','acsl-bits.driver','z3.drv','cvc5.drv','why3.conf']:
 s=(parent/name).read_text().replace(str(parent/'z3.drv'),str(out/'z3.drv')).replace(str(parent/'cvc5.drv'),str(out/'cvc5.drv'))
 if name=='frama-c.py':s=s.replace("install=here.parent/'model-native-bytes32-v2/.build/install'","install=here/'.build/install'")
 (out/name).write_text(s)
(out/'frama-c.py').chmod(0o755)
(out/'source-change.json').write_text(json.dumps({'scope':'Only ProofEngine statistics for internally Wpo.is_trivial child goals; no condition, hypothesis, source/spec, float semantics or nontrivial prover path changed.','before_sha256':hashlib.sha256(old.encode()).hexdigest(),'after_sha256':hashlib.sha256(p.read_bytes()).hexdigest(),'parent_frontend':str(frontend.relative_to(ROOT)),'parent_model':str(parent.relative_to(ROOT)),'qualification':'Not yet qualified; root must independently audit controls before formal use.'},indent=2)+'\n')
env=dict(os.environ,OPAMROOT=str(BASE/'toolchain-build/.build/opam'));prefix=[str(BASE/'toolchain-build/.build/bin/opam'),'exec','--switch=shim-wp-fix','--','dune'];commands=[prefix+['build','-j','4','--release','--promote-install-files=false','@install'],prefix+['install','--prefix='+str(out/'.build/install'),'--release']];(out/'build-command.json').write_text(json.dumps(commands,indent=2)+'\n')
with (out/'build.log').open('w') as log:
 for cmd in commands:subprocess.run(cmd,cwd=out/'.build/source',env=env,stdout=log,stderr=subprocess.STDOUT,timeout=900,check=True)
# Replay exactly the existing nine helper VCs against the independent driver/share.
helper=out/'wp-share/why3/frama_c_wp/float_bits32.mlw';cmd=json.loads((parent/'helper-proof-command.json').read_text());cmd=[str(out/'why3.conf') if x==str(parent/'why3.conf') else str(out/'wp-share/why3') if x==str(parent/'wp-share/why3') else str(helper) if x.endswith('/frama_c_wp/float_bits32.mlw') else x for x in cmd];(out/'helper-proof-command.json').write_text(json.dumps(cmd,indent=2)+'\n')
with (out/'helper-proof.log').open('w') as log:r=subprocess.run(cmd,stdout=log,stderr=subprocess.STDOUT,timeout=180)
s=(out/'helper-proof.log').read_text();assert r.returncode==0 and s.count('Prover result is: Valid')==9,s;(out/'helper-proof-result.json').write_text(json.dumps({'exit':0,'passed':9,'total':9,'scope':'Exact unchanged v4 helper module, all body assertions/preconditions/postconditions replayed.'},indent=2)+'\n')
lock=json.loads((parent/'float_model_lock.json').read_text());lock.update(version='experimental-native-bytes32-v5-trivial-child-statistics',qualification='Compiled and nine unchanged helpers checked; true/nontrivial/negative controls and independent root audit required before formal use.',share=str((out/'wp-share').relative_to(ROOT)),why3_config=str((out/'why3.conf').relative_to(ROOT)))
paths=[x for x in out.rglob('*') if x.is_file() and '.build' not in x.relative_to(out).parts]+[p,Path(__file__).resolve()]+[x for x in (out/'.build/install').rglob('*') if x.is_file()]
for path in paths:lock['files'][str(path.relative_to(ROOT))]=hashlib.sha256(path.read_bytes()).hexdigest()
(out/'float_model_lock.json').write_text(json.dumps(lock,indent=2)+'\n');print('model_sha256',hashlib.sha256((out/'float_model_lock.json').read_bytes()).hexdigest())
