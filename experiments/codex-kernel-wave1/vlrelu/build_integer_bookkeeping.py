"""Independent integer-only frontend; only the reviewed trivial-child statistics fix."""
from pathlib import Path
import hashlib,json,os,shutil,subprocess

HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
BASE=ROOT/'experiments/shim-c-v2/model-integer-byte-v2'
OUT=HERE/'model-integer-byte-v3-bookkeeping'
if OUT.exists():raise SystemExit('Use a fresh namespace')
OUT.mkdir();(OUT/'.build').mkdir();(OUT/'.gitignore').write_text('.build/\n')
subprocess.run(['cp','-a','--reflink=auto',str(BASE/'.build/source'),str(OUT/'.build/source')],check=True)
patch=ROOT/'experiments/codex-kernel-wave1/float-bits/model-native-bytes32-v5-bookkeeping/trivial-child-stats.patch'
shutil.copyfile(patch,OUT/'trivial-child-stats.patch')
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(OUT/'trivial-child-stats.patch')],cwd=OUT/'.build/source',check=True)
for name in ['wp-share','libc']:shutil.copytree(BASE/name,OUT/name)
wrapper=(BASE/'frama-c.py').read_text();assert 'root = here.parents[2]' in wrapper
(OUT/'frama-c.py').write_text(wrapper.replace('root = here.parents[2]','root = here.parents[3]'));(OUT/'frama-c.py').chmod(0o755)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def source_hashes(directory):
 return {str(p.relative_to(directory)):sha(p) for p in directory.rglob('*') if p.is_file() and '_build' not in p.relative_to(directory).parts and '.git' not in p.relative_to(directory).parts}
before=source_hashes(BASE/'.build/source');after=source_hashes(OUT/'.build/source');changed=[p for p in before if before[p]!=after.get(p)];added=sorted(set(after)-set(before));removed=sorted(set(before)-set(after))
assert changed==['src/plugins/wp/ProofEngine.ml'] and not added and not removed,(changed,added,removed)
assert sha(BASE/'.build/source/src/plugins/wp/MemBytes.ml')==sha(OUT/'.build/source/src/plugins/wp/MemBytes.ml')
assert 'CODEC_FLOAT' in (OUT/'.build/source/src/plugins/wp/MemBytes.ml').read_text()
(OUT/'source-audit.json').write_text(json.dumps({'original_frontend':str(BASE.relative_to(ROOT)),'unchanged_source_files':len(before)-1,'changed_source_files':changed,'added_source_files':added,'removed_source_files':removed,'ProofEngine_before':before[changed[0]],'ProofEngine_after':after[changed[0]],'MemBytes_unchanged_sha256':after['src/plugins/wp/MemBytes.ml'],'patch_sha256':sha(OUT/'trivial-child-stats.patch'),'source_before':before,'source_after':after,'scope':'Statistics only for internally Wpo.is_trivial children. Original pure-integer MemBytes and all semantic libraries copied unchanged; float codec remains fatal.'},indent=2)+'\n')
tools=ROOT/'experiments/shim-c-v2/toolchain-build/.build';env=dict(os.environ,OPAMROOT=str(tools/'opam'))
prefix=[str(tools/'bin/opam'),'exec','--switch=shim-wp-fix','--','dune']
commands=[prefix+['build','-j','4','--release','--promote-install-files=false','@install'],prefix+['install','--prefix='+str(OUT/'.build/install'),'--release']]
(OUT/'build-command.json').write_text(json.dumps(commands,indent=2)+'\n')
with (OUT/'build.log').open('w') as f:
 for command in commands:subprocess.run(command,cwd=OUT/'.build/source',env=env,stdout=f,stderr=subprocess.STDOUT,check=True,timeout=900)
lock=json.loads((BASE/'model_lock.json').read_text());lock.update(version='pure-integer-bytes-v3-trivial-child-statistics',status='candidate-awaiting-root-independent-controls-audit',share=str((OUT/'wp-share').relative_to(ROOT)),proof_scope=lock['proof_scope']+'; only ProofEngine trivial-child statistics changed; controls not yet audited')
paths=[p for p in OUT.rglob('*') if p.is_file() and '.build' not in p.relative_to(OUT).parts and p.name not in ['model_lock.json','build.log']]+[OUT/'.build/source/src/plugins/wp/ProofEngine.ml',OUT/'.build/source/src/plugins/wp/MemBytes.ml',Path(__file__).resolve()]+[p for p in (OUT/'.build/install').rglob('*') if p.is_file()]
for p in paths:lock['files'][str(p.relative_to(ROOT))]=sha(p)
(OUT/'model_lock.json').write_text(json.dumps(lock,indent=2)+'\n')
print('model_lock_sha256',sha(OUT/'model_lock.json'))
