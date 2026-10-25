"""Exact native-to-formal C operation correspondence for the ordinary NaN unit.

Borrowed argument views name original RVV intrinsics, not unproved ordinary C
helpers. Every ordinary scalar/read/write/propagation body is included below.
The views evaluate each named vector lvalue exactly once, by its address.
"""
from pathlib import Path
import re
from generate_kernel import tokens
C=Path(__file__).resolve().parents[1]
NAMES=['mp_restore_lane','mp_array_read','mp_array_write','mp_propagate_nan']
def function_blocks(text,names):
 masked=re.sub(r'/\*.*?\*/|//[^\n]*',lambda m:re.sub(r'[^\n]',' ',m[0]),text,flags=re.S);out={}
 for name in names:
  found=list(re.finditer(r'(?m)^(?:uint32_t|void|vfloat32m8_t|vuint32m8_t)\s+'+re.escape(name)+r'\([^;{}]*\)',masked));found=[m for m in found if masked[m.end():].lstrip().startswith('{')];assert len(found)==1,(name,len(found));m=found[0];i=masked.index('{',m.end())+1;depth=1
  while depth:depth+=(masked[i]=='{')-(masked[i]=='}');i+=1
  out[name]=text[m.start():i]
 return out
def lower_named_intrinsic_views(text):
 for arg in ['a','b','numeric']:text=text.replace('__riscv_vreinterpret_v_f32m8_u32m8('+arg+')','mp_intrinsic_borrow_vreinterpret_v_f32m8_u32m8(&'+arg+')')
 for arr,v in [('a_bits','ua'),('b_bits','ub'),('r_bits','un')]:text=text.replace('__riscv_vse32_v_u32m8('+arr+','+v+',vl)','mp_u32_array_store_view('+arr+',&'+v+',vl)')
 return text.replace('__riscv_vreinterpret_v_u32m8_f32m8(result)','mp_intrinsic_borrow_vreinterpret_v_u32m8_f32m8(&result)')
def annotated_nan_array():
 native=function_blocks((C/'shim/propagate.c').read_text(),NAMES);annotation=(C/'proof/c/propagate.annotations.c').read_text();formal=function_blocks(annotation,NAMES)
 for name in NAMES:assert tokens(lower_named_intrinsic_views(native[name]))==tokens(formal[name]),'Ordinary C token correspondence failed: '+name
 return '#include "shim/nan_array_specs.h"\n'+annotation
