"""Isolated unqualified experiment; preserve all earlier input snapshots."""
from pathlib import Path
import hashlib, json, shutil

R = Path(__file__).resolve().parents[4]
B = R / 'experiments/shim-c-v2'
old, new = B/'stage3-byte-fp-front-v7', B/'stage3-byte-fp-front-v8'
sha = lambda p: hashlib.sha256(p.read_bytes()).hexdigest()
prior = old/'experimental-inputs02.json'
watch = json.loads(prior.read_text())['files']
assert all(sha(Path(p)) == s for p, s in watch.items())
new.mkdir()
shutil.copytree(old/'wp-share', new/'wp-share')
for name in ['bytefloat.driver', 'z3-codec.drv', 'cvc5-codec02.drv',
             'cvc5-supported.py', 'why3-02.conf', 'run-qualification02.py']:
    target = new/name
    target.write_text((old/name).read_text().replace(str(old), str(new)))
    target.chmod((old/name).stat().st_mode)
(new/'qualification01').mkdir()
for p in (old/'qualification01').glob('*.c'):
    shutil.copyfile(p, new/'qualification01'/p.name)
trigger = B/'stage3-proof-next/byte-fp-prototype/store-trigger-v17/trigger.mlw'
shutil.copyfile(trigger, new/'wp-share/why3/trigger.mlw')
with (new/'bytefloat.driver').open('a') as f:
    f.write('why3.import += "trigger.StoreTrigger32";\n')
with (new/'cvc5-codec02.drv').open('a') as f:
    f.write('\ntheory trigger.StoreTrigger32\n remove prop checked_store_read32_trigger\nend\n')
proof = trigger.parent/'root04-rewrite.json'
assert json.loads(proof.read_text())['exit'] == 0
assert 'Prover result is: Valid' in (trigger.parent/'root04-rewrite.log').read_text()
files = dict(watch)
files[str(prior)] = sha(prior)
for p in [Path(__file__).resolve(), trigger, proof, trigger.parent/'root04-rewrite.log']:
    files[str(p)] = sha(p)
for p in new.rglob('*'):
    if p.is_file(): files[str(p)] = sha(p)
(new/'experimental-inputs02.json').write_text(json.dumps({
    'qualification': False,
    'previous_snapshot_sha256': sha(prior),
    'change': 'Add body-proved explicit-trigger restatement of existing store/read theorem. Native IEEE/BV definitions unchanged. No new axiom.',
    'files': files,
}, indent=2)+'\n')
assert all(sha(Path(p)) == s for p, s in watch.items())
print('Isolated UNQUALIFIED v8 snapshot', len(files), sha(new/'experimental-inputs02.json'))
