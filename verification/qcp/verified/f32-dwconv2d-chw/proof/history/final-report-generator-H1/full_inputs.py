"""Live actual translation units for regeneration and relocation identity.
Constructing C supplies no proof credit. Historical CPP files are not inputs.
"""
from pathlib import Path
import hashlib
from importlib import import_module
from prepare_neon import construct as neon_construct
from prepare_kernels import construct as rvv_construct
CASE=Path(__file__).resolve().parents[1]
NS='DwChw'
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def iter_current_unit_texts():
 for stem,renderer in [
  ('borrow_unit','generate_borrow'),
  ('propagating_unit','generate_propagating'),
  ('support_unit','generate_support'),
  ('neon_borrow_unit','generate_neon_borrow'),
  ('rvv_extended_unit','generate_rvv_extended'),
  ('store8_unit','generate_store8'),
  ('read_scalar_unit','generate_read_scalar'),
  ('pixel_unit','generate_vector_pixel'),
  ('neon_pixel_unit','generate_neon_vector_pixel')]:
  module=import_module(renderer);raw,ann=module.construct()
  assert module.tokens(raw)==module.tokens(ann),stem
  yield dict(label=stem,stem=stem,text='#define DWCHW_FORMAL 1\n'+ann,
             cpp_flags=['-I',str(CASE/'shim')])
 yield dict(label='public_caller',stem='public_caller',
            text='#include "'+str(CASE/'spec.c')+'"\n',cpp_flags=['-I',str(CASE)])
 for side,renderer in [('neon',neon_construct),('rvv',rvv_construct)]:
  raw,ann,prefix,_=renderer(side)
  from prepare_kernels import toks
  assert toks(raw)==toks(ann),side
  yield dict(label=side+'_unit',stem=side+'_unit',text=prefix+ann,
             cpp_flags=['-I',str(CASE/'shim')])
 yield dict(label='type_width',stem='type_width',
            text='#include "'+str(CASE/'proof/c/type_width.c')+'"\n',cpp_flags=[])
