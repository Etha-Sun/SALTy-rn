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


def mathematical_support_reports(coq_directory, math_modules, strategies):
 """Use actual checked strategy module paths; reject unknown nested scopes.

 An ordinary module's top-level support lemmas retain their original names.
 The three strategy implementation modules are already named and fully typed
 by the frozen H. Do not shorten their nested theorem paths to file names.
 """
 import re
 prefixes = {}
 for strategy in strategies:
  provider = strategy.get('typed_instance', strategy.get('checked_module'))
  assert provider and provider.startswith(NS + '.')
  file_name, nested = provider.rsplit('.', 1)
  assert file_name not in prefixes, 'Duplicate checked strategy provider file'
  prefixes[file_name] = nested
 reports = []
 for name in math_modules:
  text = (Path(coq_directory) / (name + '.v')).read_text()
  # Keep line layout while removing nested Coq comments.
  clean = []; depth = 0; index = 0
  while index < len(text):
   if text.startswith('(*', index): depth += 1; clean.extend('  '); index += 2
   elif depth and text.startswith('*)', index): depth -= 1; clean.extend('  '); index += 2
   else:
    char = text[index]; clean.append(char if not depth or char == '\n' else ' '); index += 1
  assert depth == 0, 'Unclosed support source comment: ' + name
  clean = ''.join(clean)
  prefix = NS + '.' + name
  current_module = None
  for line in clean.splitlines():
   opened = re.match(r"^\s*Module\s+([\w']+)\b", line)
   closed = re.match(r"^\s*End\s+([\w']+)\s*\.", line)
   assert not re.match(r'^\s*Section\b', line), 'Unknown support Section template: ' + name
   if opened:
    assert current_module is None and ':=' not in line, 'Unknown nested/alias module template: ' + name
    current_module = opened[1]
   elif closed:
    assert current_module == closed[1], 'Unmatched support scope: ' + name
    current_module = None
   field = re.match(r"^\s*(?:Lemma|Theorem)\s+([\w']+)", line)
   if not field: continue
   field = field[1]
   if field.startswith(('proof_of_', 'typed_', 'dw_proof_')) or field == 'checked': continue
   qualified = prefix
   if current_module:
    assert prefix in prefixes and prefixes[prefix] == current_module, 'Unknown nested public support theorem: ' + name
    qualified += '.' + current_module
   reports.append('Print Assumptions ' + qualified + '.' + field + '.')
  assert current_module is None, 'Unclosed support module: ' + name
 assert len(reports) == len(set(reports)), 'Duplicate support report identity'
 return reports
