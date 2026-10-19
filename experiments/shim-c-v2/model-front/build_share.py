"""Recreate patched-front-end IEEE/FMA theories without modifying old overlays."""
from pathlib import Path
import hashlib,json,shutil
here=Path(__file__).resolve().parent
root=here.parents[2]
share=here/'wp-share'
shutil.copytree(here.parent/'model-fma/wp-share',share,dirs_exist_ok=True)
shutil.copyfile(here/'cfloat.mlw',share/'why3/frama_c_wp/cfloat.mlw')
lockfile=here/'float_model_lock.json'
if lockfile.exists():
    for name,digest in json.loads(lockfile.read_text())['files'].items():
        path=Path(name) if Path(name).is_absolute() else root/name
        assert hashlib.sha256(path.read_bytes()).hexdigest()==digest,name
print('Patched-front-end model share ready')
