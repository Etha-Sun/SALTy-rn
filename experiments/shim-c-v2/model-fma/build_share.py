"""Recreate the FMA share from the preserved base overlay, verifying its lock."""
from pathlib import Path
import hashlib,json,shutil
here=Path(__file__).resolve().parent
root=here.parents[2]
share=here/'wp-share'
shutil.copytree(here.parent/'model/wp-share',share,dirs_exist_ok=True)
shutil.copyfile(here/'Fma.mlw',share/'why3/frama_c_wp/fma.mlw')
lock=json.loads((here/'float_model_lock.json').read_text())
for name,digest in lock['files'].items():
    path=Path(name) if Path(name).is_absolute() else root/name
    assert hashlib.sha256(path.read_bytes()).hexdigest()==digest,name
print('FMA model lock verified')
