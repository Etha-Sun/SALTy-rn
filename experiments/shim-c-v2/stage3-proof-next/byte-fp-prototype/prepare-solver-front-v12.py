"""Experiment with Why3's existing checked-theorem instantiation transform."""
from pathlib import Path
import hashlib, json, shutil
R = Path(__file__).resolve().parents[4]
B = R/'experiments/shim-c-v2'
old, new = B/'stage3-byte-fp-front-v11', B/'stage3-byte-fp-front-v12'
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
# Dropping already-proved support propositions strengthens solver tasks.
# Native IEEE/BV interpretations remain exactly unchanged.
cv = (new/'cvc5-codec02.drv').read_text()
removals = cv[cv.index('theory frama_c_wp.bytefloat_checked.DecodeEncode32'):]
with (new/'z3-codec.drv').open('a') as f:
    f.write('\n'+removals)
    for theory, prop in [
        ('injective32.DecodeInjective32','checked_decode_injective32'),
        ('injective64.DecodeInjective64','checked_decode_injective64'),
        ('zero32.NegativeZero32','checked_negative_zero32'),
        ('zero64.NegativeZero64','checked_negative_zero64'),
        ('loadframe.LoadFrame32','checked_decode_frame32'),
        ('triggerframe02.LoadFrameTrigger32','checked_decode_frame32_trigger')]:
        f.write('\ntheory '+theory+'\n remove prop '+prop+'\nend\n')
files[str(prior)] = sha(prior)
files[str(Path(__file__).resolve())] = sha(Path(__file__))
source = B/'environment-recovery-local/.build/opam/shim-local/.opam-switch/sources/why3.1.8.2/src/transform/instantiate_predicate.ml'
files[str(source)] = sha(source)
for p in new.rglob('*'):
    if p.is_file(): files[str(p)] = sha(p)
(new/'experimental-inputs02.json').write_text(json.dumps({
    'qualification':False,'previous_snapshot_sha256':sha(prior),
    'change':'Remove native-FP quantified support propositions from Z3 tasks while retaining existing standard instantiation transforms and all native definitions; strengthens obligations, adds no assumptions.',
    'files':files},indent=2)+'\n')
print('UNQUALIFIED v12',len(files),sha(new/'experimental-inputs02.json'))
