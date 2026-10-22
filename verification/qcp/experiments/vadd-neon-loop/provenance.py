"""Hash the explicit cpp input and local QCP inputs; no general C equivalence claim."""
import hashlib,shlex,shutil,subprocess
from pathlib import Path
HERE=Path(__file__).resolve().parent
QCP=HERE.parents[1]
ROOT=QCP.parents[1]
def sha(path):return hashlib.sha256(path.read_bytes()).hexdigest()
def inputs(source,preprocessed):
 cmd=['gcc','-M','-nostdinc',str(source)]
 deps=subprocess.run(cmd,cwd=ROOT,capture_output=True,text=True,check=True).stdout
 paths={Path(x).resolve() for x in shlex.split(deps.split(':',1)[1].replace('\\\n',' '))}
 paths.update([ROOT/'kernels/source/f32-vadd.c',HERE.parent/'vadd-proof/neon_kernel.c',HERE/'lane0.c',QCP/'shared/vadd/intrinsics.c'])
 for directory in [QCP/'shared/vadd',HERE.parent/'vadd-neon',HERE]:paths.update(directory.glob('*.strategies'))
 local={str(p.relative_to(ROOT)):sha(p) for p in sorted(paths)}
 tools={str(Path(shutil.which(name)).resolve()):sha(Path(shutil.which(name)).resolve()) for name in ['qcp','gcc','qcp-env']}
 return {'files':local,'tool_files':tools,'preprocessed_path':str(preprocessed.relative_to(ROOT)),'preprocessed_sha256':sha(preprocessed),'dependency_command':cmd,'preprocess_command':['gcc','-E','-P','-CC','-nostdinc',str(source)]}
def verify(manifest):
 for name,digest in manifest['files'].items():assert sha(ROOT/name)==digest,'Generation source changed: '+name
 for name,digest in manifest['tool_files'].items():assert sha(Path(name))==digest,'Generation tool changed: '+name
 stored=ROOT/manifest['preprocessed_path']
 assert sha(stored)==manifest['preprocessed_sha256'],'Stored actual QCP input changed'
 current=subprocess.run(manifest['preprocess_command'],cwd=ROOT,capture_output=True,check=True).stdout
 assert hashlib.sha256(current).hexdigest()==manifest['preprocessed_sha256'],'Current cpp output differs from actual QCP input'
