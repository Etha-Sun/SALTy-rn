"""Current actual C input inventory; rendering is not a proof certificate."""
from pathlib import Path
import hashlib
CASE=Path(__file__).resolve().parents[1]
NS='X32Packw'
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
STEMS=['scalar_memory','neon_pair','neon_odd','neon_header','rvv_store_pair','rvv_pair','rvv_odd','rvv_header','neon_unit','rvv_unit','observe','assert','caller']
def iter_current_unit_texts():
 for stem in STEMS:
  source=CASE/'spec.c'if stem=='caller'else(CASE/'proof/c'/(stem+'.c')if stem.endswith('_unit')else CASE/'shim'/(stem+'.c'))
  yield dict(label=stem,stem=stem,text='#include "'+str(source)+'"\n',cpp_flags=[])
