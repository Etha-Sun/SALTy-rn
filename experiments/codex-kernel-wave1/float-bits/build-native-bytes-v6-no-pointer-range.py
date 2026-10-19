"""Independent native32/FMA models: delete only universal pointer range injection."""
from pathlib import Path
import hashlib,json,os,shutil,subprocess
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2];BASE=HERE/'model-native-bytes32-v5-bookkeeping';OUT=HERE/'model-native-bytes32-v6-no-pointer-range';FMA=HERE.parent/'core-float-wave2/model-native-bytes32-v6-fma';OLD_FMA=HERE.parent/'core-float-wave2/model-native-bytes32-v5-fma'
if OUT.exists() or FMA.exists():raise SystemExit('Fresh namespaces required')
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
patch=HERE.parent/'maxpool-address-wave2/native-v6-no-pointer-range-proposal.patch';assert sha(patch)=='03badd89444ab455ebd8c11f09b1ae9abccac48d648864d370dc8430036aaf1b'
OUT.mkdir();(OUT/'.build').mkdir();(OUT/'.gitignore').write_text('.build/\n');subprocess.run(['cp','-a','--reflink=auto',str(BASE/'.build/source'),str(OUT/'.build/source')],check=True);shutil.copyfile(patch,OUT/'no-pointer-range.patch');subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(OUT/'no-pointer-range.patch')],cwd=OUT/'.build/source',check=True)
shutil.copytree(BASE/'wp-share',OUT/'wp-share')
for name in ['frama-c.py','acsl-bits.driver','z3.drv','cvc5.drv']:shutil.copyfile(BASE/name,OUT/name)
(OUT/'frama-c.py').chmod(0o755)
config=(BASE/'why3.conf').read_text();newconfig=config.replace(str(BASE/'z3.drv'),str(OUT/'z3.drv')).replace(str(BASE/'cvc5.drv'),str(OUT/'cvc5.drv'));assert newconfig!=config;(OUT/'why3.conf').write_text(newconfig)
def source_hashes(directory):
 return {str(p.relative_to(directory)):sha(p) for p in directory.rglob('*') if p.is_file() and '_build' not in p.relative_to(directory).parts and '.git' not in p.relative_to(directory).parts}
before=source_hashes(BASE/'.build/source');after=source_hashes(OUT/'.build/source');changed=[p for p in before if before[p]!=after.get(p)];assert changed==['src/plugins/wp/MemBytes.ml'] and before.keys()==after.keys(),changed
assert before[changed[0]]=='e1c9d9ab625f6d3bccab6e9a340ab6eb5bccc34758da82d7c1b0299918019044';assert after[changed[0]]=='3de8c76038b4a959dc62197d43e928d99bc2ea2823b605cbf8de9ebd018de57f'
assert source_hashes(BASE/'wp-share')==source_hashes(OUT/'wp-share')
for name in ['frama-c.py','acsl-bits.driver','z3.drv','cvc5.drv']:assert sha(BASE/name)==sha(OUT/name)
(OUT/'source-audit.json').write_text(json.dumps({'base':str(BASE.relative_to(ROOT)),'source_before':before,'source_after':after,'changed_source_files':changed,'unchanged_source_files':len(before)-1,'added_source_files':[],'removed_source_files':[],'unchanged_runtime_files':{name:sha(OUT/name) for name in ['frama-c.py','acsl-bits.driver','z3.drv','cvc5.drv']},'share_all_files_byte_identical':True,'why3_config_change':'Only the two existing driver absolute paths relocated from v5 to v6; no content/option change','why3_config_before_sha256':sha(BASE/'why3.conf'),'why3_config_after_sha256':sha(OUT/'why3.conf'),'patch_sha256':sha(OUT/'no-pointer-range.patch'),'scope':'Only remove universal pointers_int_range Admit generator/call. Cint/Cfloat/NaN-word/native32/float64 rejection/FMA semantics and ProofEngine statistics unchanged.'},indent=2)+'\n')
tools=ROOT/'experiments/shim-c-v2/toolchain-build/.build';env=dict(os.environ,OPAMROOT=str(tools/'opam'));prefix=[str(tools/'bin/opam'),'exec','--switch=shim-wp-fix','--','dune'];commands=[prefix+['build','-j','4','--release','--promote-install-files=false','@install'],prefix+['install','--prefix='+str(OUT/'.build/install'),'--release']];(OUT/'build-command.json').write_text(json.dumps(commands,indent=2)+'\n')
with (OUT/'build.log').open('w') as log:
 for cmd in commands:subprocess.run(cmd,cwd=OUT/'.build/source',env=env,stdout=log,stderr=subprocess.STDOUT,check=True,timeout=900)
cmd=json.loads((BASE/'helper-proof-command.json').read_text());cmd=[str(OUT/'why3.conf') if x==str(BASE/'why3.conf') else str(OUT/'wp-share/why3') if x==str(BASE/'wp-share/why3') else str(OUT/'wp-share/why3/frama_c_wp/float_bits32.mlw') if x.endswith('/frama_c_wp/float_bits32.mlw') else x for x in cmd];(OUT/'helper-proof-command.json').write_text(json.dumps(cmd,indent=2)+'\n')
with (OUT/'helper-proof.log').open('w') as log:r=subprocess.run(cmd,stdout=log,stderr=subprocess.STDOUT,timeout=180)
assert r.returncode==0 and (OUT/'helper-proof.log').read_text().count('Prover result is: Valid')==9
(OUT/'helper-proof-result.json').write_text(json.dumps({'exit':0,'passed':9,'total':9,'scope':'Unchanged native32 helper module, exact original checks under relocated driver paths.'},indent=2)+'\n')
lock=json.loads((BASE/'float_model_lock.json').read_text());lock.update(version='experimental-native-bytes32-v6-no-universal-pointer-range',qualification='Candidate: compiled and nine helpers replayed; remaining controls and independent root audit required.',share=str((OUT/'wp-share').relative_to(ROOT)),why3_config=str((OUT/'why3.conf').relative_to(ROOT)))
paths=[p for p in OUT.rglob('*') if p.is_file() and '.build' not in p.relative_to(OUT).parts and p.name not in ['float_model_lock.json','build.log']]+[Path(__file__).resolve()]+[OUT/'.build/source'/name for name in after]+[p for p in (OUT/'.build/install').rglob('*') if p.is_file()]
for p in paths:lock['files'][str(p.relative_to(ROOT))]=sha(p)
(OUT/'float_model_lock.json').write_text(json.dumps(lock,indent=2)+'\n')
FMA.mkdir();s=(OLD_FMA/'frama-c.py').read_text();needle='float-bits/model-native-bytes32-v5-bookkeeping/frama-c.py';assert s.count(needle)==1;(FMA/'frama-c.py').write_text(s.replace(needle,'float-bits/model-native-bytes32-v6-no-pointer-range/frama-c.py'));(FMA/'frama-c.py').chmod(0o755)
fmalock=json.loads((OUT/'float_model_lock.json').read_text());fmalock.update(previous_model=str(OUT.relative_to(ROOT)),composition='Exact existing fma.driver with new weakened native32 v6 backend; no FMA/libc/codec law added or changed.',qualification='Candidate awaiting FMA positive/negative controls and root independent audit.')
for p in [OUT/'float_model_lock.json',ROOT/'experiments/shim-c-v2/model-fma/fma.driver',Path(__file__).resolve(),FMA/'frama-c.py']:fmalock['files'][str(p.relative_to(ROOT))]=sha(p)
(FMA/'float_model_lock.json').write_text(json.dumps(fmalock,indent=2)+'\n');print(json.dumps({'native_lock_sha256':sha(OUT/'float_model_lock.json'),'native_locked_files':len(lock['files']),'fma_lock_sha256':sha(FMA/'float_model_lock.json'),'fma_locked_files':len(fmalock['files'])}))
