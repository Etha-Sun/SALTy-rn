"""Build a new integer frontend that removes only the universal pointer range law."""
from pathlib import Path
import hashlib,json,os,shutil,subprocess
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
BASE=HERE/'model-integer-byte-v3-bookkeeping';OUT=HERE/'model-integer-byte-v4-no-pointer-range'
if OUT.exists():raise SystemExit('Use a fresh namespace')
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
patch=ROOT/'experiments/codex-kernel-wave1/maxpool-address-wave2/integer-v4-no-pointer-range-proposal.patch'
assert sha(patch)=='73dbd9ef5ef9754b19d61545c7f13831b1c23594c68ca5a01c6ea3d30e93973e'
OUT.mkdir();(OUT/'.build').mkdir();(OUT/'.gitignore').write_text('.build/\n')
subprocess.run(['cp','-a','--reflink=auto',str(BASE/'.build/source'),str(OUT/'.build/source')],check=True)
shutil.copyfile(patch,OUT/'no-pointer-range.patch')
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(OUT/'no-pointer-range.patch')],cwd=OUT/'.build/source',check=True)
for name in ['wp-share','libc']:shutil.copytree(BASE/name,OUT/name)
shutil.copyfile(BASE/'frama-c.py',OUT/'frama-c.py');(OUT/'frama-c.py').chmod(0o755)
(OUT/'controls').mkdir();shutil.copyfile(BASE/'controls/bookkeeping-controls.c',OUT/'controls/bookkeeping-controls.c')
def source_hashes(directory):
 return {str(p.relative_to(directory)):sha(p) for p in directory.rglob('*') if p.is_file() and '_build' not in p.relative_to(directory).parts and '.git' not in p.relative_to(directory).parts}
before=source_hashes(BASE/'.build/source');after=source_hashes(OUT/'.build/source');changed=[p for p in before if before[p]!=after.get(p)];added=sorted(set(after)-set(before));removed=sorted(set(before)-set(after))
assert changed==['src/plugins/wp/MemBytes.ml'] and not added and not removed,(changed,added,removed)
assert after[changed[0]]=='9e309b4179f45606239feae47985588bcb931c9ca6ffca91ccf9481ad450032b'
for name in ['src/plugins/wp/MemAddr.ml','src/plugins/wp/MemLoader.ml','src/plugins/wp/ProofEngine.ml','src/plugins/wp/share/why3/frama_c_wp/cint.mlw','src/plugins/wp/share/why3/frama_c_wp/memaddr.mlw']:
 assert before[name]==after[name],name
assert 'Pure-integer Bytes profile forbids CODEC_FLOAT generation' in (OUT/'.build/source/src/plugins/wp/MemBytes.ml').read_text()
assert sha(BASE/'frama-c.py')==sha(OUT/'frama-c.py')
(OUT/'source-audit.json').write_text(json.dumps({'original_frontend':str(BASE.relative_to(ROOT)),'unchanged_source_files':len(before)-1,'changed_source_files':changed,'added_source_files':added,'removed_source_files':removed,'MemBytes_before':before[changed[0]],'MemBytes_after':after[changed[0]],'patch_sha256':sha(OUT/'no-pointer-range.patch'),'source_before':before,'source_after':after,'scope':'Delete only the universal PointersProperties.pointers_int_range Admit generator and call. No new law. MemAddr/Cint/byte codecs/float rejection/ProofEngine statistics unchanged.'},indent=2)+'\n')
tools=ROOT/'experiments/shim-c-v2/toolchain-build/.build';env=dict(os.environ,OPAMROOT=str(tools/'opam'));prefix=[str(tools/'bin/opam'),'exec','--switch=shim-wp-fix','--','dune'];commands=[prefix+['build','-j','4','--release','--promote-install-files=false','@install'],prefix+['install','--prefix='+str(OUT/'.build/install'),'--release']]
(OUT/'build-command.json').write_text(json.dumps(commands,indent=2)+'\n')
with (OUT/'build.log').open('w') as out:
 for command in commands:subprocess.run(command,cwd=OUT/'.build/source',env=env,stdout=out,stderr=subprocess.STDOUT,check=True,timeout=900)
lock=json.loads((BASE/'model_lock.json').read_text());lock.update(version='pure-integer-bytes-v4-no-universal-pointer-range',status='candidate-awaiting-root-independent-source-and-controls-audit',share=str((OUT/'wp-share').relative_to(ROOT)),proof_scope=lock['proof_scope']+'; removed only universal pointer range Admit; old conditional proof results require fresh complete replay')
paths=[p for p in OUT.rglob('*') if p.is_file() and '.build' not in p.relative_to(OUT).parts and p.name not in ['model_lock.json','build.log']]+[Path(__file__).resolve()]+[OUT/'.build/source'/name for name in after]+[p for p in (OUT/'.build/install').rglob('*') if p.is_file()]
for path in paths:lock['files'][str(path.relative_to(ROOT))]=sha(path)
(OUT/'model_lock.json').write_text(json.dumps(lock,indent=2)+'\n');print('model_lock_sha256',sha(OUT/'model_lock.json'),'locked_files',len(lock['files']))
