"""Experiment with Why3's existing checked-theorem instantiation transform."""
from pathlib import Path
import hashlib, json, shutil
R = Path(__file__).resolve().parents[4]
B = R/'experiments/shim-c-v2'
old, new = B/'stage3-byte-fp-front-v8', B/'stage3-byte-fp-front-v9'
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
with (new/'z3-codec.drv').open('a') as f:
    f.write('''
(* Existing Why3 transformations only. The selected theorem has a checked body.
   Instantiate that theorem before native FP conversion reaches the solver. *)
transformation "introduce_premises"
transformation "instantiate_predicate"
theory trigger.StoreTrigger32
 meta "instantiate:auto" prop checked_store_read32_trigger
end
''')
files[str(prior)] = sha(prior)
files[str(Path(__file__).resolve())] = sha(Path(__file__))
source = B/'environment-recovery-local/.build/opam/shim-local/.opam-switch/sources/why3.1.8.2/src/transform/instantiate_predicate.ml'
files[str(source)] = sha(source)
for p in new.rglob('*'):
    if p.is_file(): files[str(p)] = sha(p)
(new/'experimental-inputs02.json').write_text(json.dumps({
    'qualification':False,'previous_snapshot_sha256':sha(prior),
    'change':'Existing Why3 introduce_premises/instantiate_predicate on body-proved StoreTrigger32 only. No new assumptions or semantic changes.',
    'files':files},indent=2)+'\n')
print('UNQUALIFIED v9',len(files),sha(new/'experimental-inputs02.json'))
