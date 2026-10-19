"""Experiment with Why3's existing checked-theorem instantiation transform."""
from pathlib import Path
import hashlib, json, shutil
R = Path(__file__).resolve().parents[4]
B = R/'experiments/shim-c-v2'
old, new = B/'stage3-byte-fp-front-v17', B/'stage3-byte-fp-front-v18'
sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
prior = old/'experimental-inputs02.json'
files = json.loads(prior.read_text())['files']
assert all(sha(Path(p)) == s for p, s in files.items())
new.mkdir()
shutil.copytree(old/'wp-share', new/'wp-share')
for name in ['bytefloat.driver','z3-codec.drv','cvc5-codec02.drv',
             'cvc5-supported.py','why3-02.conf','run-qualification02.py']:
    p = new/name
    p.write_text((old/name).read_text().replace(str(old),str(new)))
    p.chmod((old/name).stat().st_mode)
(new/'qualification01').mkdir()
for p in (old/'qualification01').glob('*.c'):
    shutil.copyfile(p,new/'qualification01'/p.name)
p=new/'sliced-z3-adapter.py';text=(old/'sliced-z3-adapter.py').read_text();assert text.count('"auto_instance","H"}')==1
p.write_text(text.replace('"auto_instance","H"}','"auto_instance","H","to_uint64\'def","is_uint64\'def"}'));p.chmod(0o755)
files[str(Path(__file__).with_name('supported-assumptions-adapter-v15.py'))] = sha(Path(__file__).with_name('supported-assumptions-adapter-v15.py'))
files[str(Path(__file__).with_name('sliced-z3-adapter.py'))] = sha(Path(__file__).with_name('sliced-z3-adapter.py'))
files[str(prior)] = sha(prior)
files[str(Path(__file__).resolve())] = sha(Path(__file__))
source = B/'environment-recovery-local/.build/opam/shim-local/.opam-switch/sources/why3.1.8.2/src/transform/instantiate_predicate.ml'
files[str(source)] = sha(source)
for p in new.rglob('*'):
    if p.is_file(): files[str(p)] = sha(p)
(new/'experimental-inputs02.json').write_text(json.dumps({
    'qualification':False,'previous_snapshot_sha256':sha(prior),
    'change':'Retain two existing uint64 definitions in the stronger sliced solver task. No statement or term changes. Wide store trigger was checked in v17. Experimental, not qualified.',
    'files':files},indent=2)+'\n')
print('UNQUALIFIED v18',len(files),sha(new/'experimental-inputs02.json'))
