"""Recreate the independent Cint/builtin overlay and verify its locked inputs."""
from pathlib import Path
import hashlib
import json
import shutil
here = Path(__file__).resolve().parent
root = here.parents[2]
share = here / 'wp-share'
shutil.copytree(here.parent / 'model-front/wp-share', share, dirs_exist_ok=True)
shutil.copyfile(here / 'cint.mlw', share / 'why3/frama_c_wp/cint.mlw')
for name, digest in json.loads((here / 'float_model_lock.json').read_text())['files'].items():
    path = Path(name) if Path(name).is_absolute() else root / name
    assert hashlib.sha256(path.read_bytes()).hexdigest() == digest, name
print('Locked Cint/builtin overlay ready')
