"""Live CPP constructors shared by full regeneration and relocation identity audit.
No proof credit is obtained from rendering C.
"""
from pathlib import Path
import hashlib
from generate_neon import kernel_text as neon_text,tokens
from generate_rvv import kernel_text as rvv_text
CASE=Path(__file__).resolve().parents[1]
NS='X32Transpose'
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def iter_current_unit_texts():
 for stem in ['control','scalar','strided_store','width','observe','caller']:
  src=CASE/'spec.c'if stem=='caller'else CASE/'shim'/(stem+'.c')
  yield dict(label=stem,stem=stem,text='#include "'+str(CASE/'shim/program_model.h')+'"\n#include "'+str(src)+'"\n',cpp_flags=[])
 for stem,renderer,prefix in [('neon_unit',neon_text,'#include "'+str(CASE/'shim/neon_program.h')+'"\n'),('rvv_unit',rvv_text,'#include "'+str(CASE/'shim/program_model.h')+'"\n#include "'+str(CASE/'shim/rvv_load_specs.h')+'"\n')]:
  raw,text,ann=renderer();assert tokens(raw)==tokens(text)
  yield dict(label=stem,stem=stem,text=prefix+text,cpp_flags=['-I',str(CASE/'impl')])
