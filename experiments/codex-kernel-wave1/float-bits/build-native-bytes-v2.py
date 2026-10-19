"""Independent equivalent NaN filter: test native decode, without integer bit axioms."""
from pathlib import Path
import hashlib,json,os,shutil,subprocess
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2];BASE=ROOT/'experiments/shim-c-v2'
parent=HERE/'model-native-bytes32';bridge=HERE/'model-native-bytes32-z3';out=HERE/'model-native-bytes32-v2'
if out.exists():raise SystemExit('Use fresh model version')
out.mkdir();(out/'.build').mkdir();subprocess.run(['cp','-a','--reflink=auto',str(parent/'.build/source'),str(out/'.build/source')],check=True)
p=out/'.build/source/src/plugins/wp/MemBytes.ml';s=p.read_text();old=s
start=s.index('    let exp = e_fun Cint.f_land [bits;e_int 0x7f800000] in');end=s.index('    let nan_bits =',start)
s=s[:start]+'    let is_nan_bits = e_prop (p_call codec32_is_nan [e_fun codec32_decode [bits]]) in\n'+s[end:];p.write_text(s)
a=subprocess.run(['diff','-u','--label','a/src/plugins/wp/MemBytes.ml','--label','b/src/plugins/wp/MemBytes.ml',str(parent/'.build/source/src/plugins/wp/MemBytes.ml'),str(p)],stdout=subprocess.PIPE);assert a.returncode==1;(out/'nan-filter-native.patch').write_bytes(a.stdout)
shutil.copyfile(bridge/'acsl-bits.driver',out/'acsl-bits.driver');shutil.copyfile(bridge/'why3.conf',out/'why3.conf')
s=(bridge/'frama-c.py').read_text().replace("install=here.parent/'model-native-bytes32/.build/install'","install=here/'.build/install'");(out/'frama-c.py').write_text(s);(out/'frama-c.py').chmod(0o755)
env=dict(os.environ,OPAMROOT=str(BASE/'toolchain-build/.build/opam'));prefix=[str(BASE/'toolchain-build/.build/bin/opam'),'exec','--switch=shim-wp-fix','--','dune'];commands=[prefix+['build','-j','4','--release','--promote-install-files=false','@install'],prefix+['install','--prefix='+str(out/'.build/install'),'--release']]
(out/'build-command.json').write_text(json.dumps(commands,indent=2)+'\n')
with (out/'build.log').open('w') as log:
 for cmd in commands:subprocess.run(cmd,cwd=out/'.build/source',env=env,stdout=log,stderr=subprocess.STDOUT,timeout=900,check=True)
lock=json.loads((bridge/'float_model_lock.json').read_text());lock.update(version='experimental-native-bytes32-v2-native-nan-filter',qualification='experimental, independent root qualification pending',why3_config=str((out/'why3.conf').relative_to(ROOT)))
paths=[out/'frama-c.py',out/'why3.conf',out/'acsl-bits.driver',out/'nan-filter-native.patch',p,Path(__file__).resolve()]+sorted(x for x in (out/'.build/install').rglob('*') if x.is_file())
for p in paths:lock['files'][str(p.relative_to(ROOT))]=hashlib.sha256(p.read_bytes()).hexdigest()
(out/'float_model_lock.json').write_text(json.dumps(lock,indent=2)+'\n');print('model_sha',hashlib.sha256((out/'float_model_lock.json').read_bytes()).hexdigest())
