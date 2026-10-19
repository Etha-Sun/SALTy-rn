"""Experiment with Why3's existing checked-theorem instantiation transform."""
from pathlib import Path
import hashlib, json, shutil
R = Path(__file__).resolve().parents[4]
B = R/'experiments/shim-c-v2'
old, new = B/'stage3-byte-fp-front-v10', B/'stage3-byte-fp-front-v11'
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
source = B/'stage3-proof-next/byte-fp-prototype/load-trigger-v18/triggerframe02.mlw'
proof = source.parent/'root02.json'
assert json.loads(proof.read_text())['exit'] == 0
assert (source.parent/'root02.log').read_text().count('Prover result is: Valid') == 2
shutil.copyfile(source, new/'wp-share/why3/triggerframe02.mlw')
with (new/'bytefloat.driver').open('a') as f:
    f.write('why3.import += "triggerframe02.LoadFrameTrigger32";\n')
with (new/'z3-codec.drv').open('a') as f:
    f.write('''
theory triggerframe02.LoadFrameTrigger32
 meta "instantiate:auto" prop checked_decode_frame32_trigger
end
(* These are pre-existing MemBytes library lemmas with explicit triggers.
   Only instantiate their existing statements; add no memory law. *)
theory frama_c_wp.membytes_le.MemBytes
 meta "instantiate:auto" prop read_uint64_write_uint32_sep
 meta "instantiate:auto" prop read_sint64_write_uint32_sep
end
''')
for p in [source, proof, source.parent/'root02.log']:
    files[str(p)] = sha(p)
files[str(prior)] = sha(prior)
files[str(Path(__file__).resolve())] = sha(Path(__file__))
source = B/'environment-recovery-local/.build/opam/shim-local/.opam-switch/sources/why3.1.8.2/src/transform/instantiate_predicate.ml'
files[str(source)] = sha(source)
for p in new.rglob('*'):
    if p.is_file(): files[str(p)] = sha(p)
(new/'experimental-inputs02.json').write_text(json.dumps({
    'qualification':False,'previous_snapshot_sha256':sha(prior),
    'change':'Body-proved decoded frame trigger and instances of existing 64-bit read/32-bit write frame lemmas. Native memory/IEEE semantics unchanged.',
    'files':files},indent=2)+'\n')
print('UNQUALIFIED v11',len(files),sha(new/'experimental-inputs02.json'))
