"""Experiment with Why3's existing checked-theorem instantiation transform."""
from pathlib import Path
import hashlib, json, shutil
R = Path(__file__).resolve().parents[4]
B = R/'experiments/shim-c-v2'
old, new = B/'stage3-byte-fp-front-v16', B/'stage3-byte-fp-front-v17'
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
shutil.copyfile(old/'sliced-z3-adapter.py',new/'sliced-z3-adapter.py')
(new/'sliced-z3-adapter.py').chmod(0o755)
source=Path(__file__).parent/'store-trigger-wide01/triggerwide.mlw'
proof=json.loads((source.parent/'root01.json').read_text());assert proof['exit']==0 and proof['source_sha256']==sha(source)
assert 'Valid (0.02s)' in (source.parent/'root01.log').read_text()
shutil.copyfile(source,new/'wp-share/why3/triggerwide.mlw')
with (new/'bytefloat.driver').open('a') as out:out.write('\nwhy3.import += "triggerwide.StoreWideTrigger32";\n')
with (new/'z3-codec.drv').open('a') as out:out.write('\ntheory triggerwide.StoreWideTrigger32\n meta "instantiate:auto" prop checked_store_read32_wide_trigger\nend\n')
for p in source.parent.iterdir():
 if p.is_file():files[str(p)]=sha(p)
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
    'change':'Add a store-trigger form proved by body and rewrite of the prior checked theorem; trigger on write_uint32 so a loop read at a different symbolic index still instantiates the store-at-written-index equation. No new assumed theorem. Experimental, not qualified.',
    'files':files},indent=2)+'\n')
print('UNQUALIFIED v17',len(files),sha(new/'experimental-inputs02.json'))
