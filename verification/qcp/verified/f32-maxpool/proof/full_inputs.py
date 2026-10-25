"""Live C constructors for the eventual whole-case gate and relocation audit.

No generation/proof credit is obtained by rendering a translation unit.
"""
from pathlib import Path
import hashlib,json,re
from generate_kernel import annotation_source,tokens
from generate_rvv import kernel_text
CASE=Path(__file__).resolve().parents[1]
NS='MaxPool'
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def annotated_propagate():
 source=(CASE/'shim/propagate.c').read_text();original=source
 positions={
  '__riscv_vreinterpret_v_f32m8_u32m8':[(0,'a')],
  '__riscv_vreinterpret_v_u32m8_f32m8':[(0,'a')],
  '__riscv_vand_vx_u32m8':[(0,'a')], '__riscv_vor_vx_u32m8':[(0,'a')],
  '__riscv_vmsgtu_vx_u32m8_b4':[(0,'a')], '__riscv_vmseq_vx_u32m8_b4':[(0,'a')],
  '__riscv_vmand_mm_b4':[(0,'a'),(1,'b')],
  '__riscv_vmerge_vvm_f32m8':[(0,'a'),(1,'b'),(2,'m')],
  '__riscv_vfmax_vv_f32m8':[(0,'a'),(1,'b')],
  '__riscv_vfmin_vv_f32m8':[(0,'a'),(1,'b')],
  'mp_propagate_nan':[(0,'a'),(1,'b'),(2,'numeric')],
  'mp_max_vv':[(0,'a'),(1,'b')],'mp_min_vv':[(0,'a'),(1,'b')]}
 lines=[]
 for line in source.splitlines(True):
  m=re.search(r'\b('+'|'.join(positions)+r')\(',line)if line.startswith('  ')else None
  if m:
   depth=1;j=m.end();start=j;args=[]
   while depth:
    ch=line[j]
    if ch=='(':depth+=1
    elif ch==')':depth-=1
    if ch==','and depth==1:args.append(line[start:j].strip());start=j+1
    j+=1
   args.append(line[start:j-1].strip());bind=[]
   for i,n in positions[m[1]]:
    assert re.fullmatch(r'[A-Za-z_]\w*',args[i]);bind.append(n+'=&'+args[i])
   line=line[:j]+'/*@ where '+','.join(bind)+' */'+line[j:]
  lines.append(line)
 source=''.join(lines)
 specs=re.findall(r'(vfloat32m8_t\s+(mp_\w+)\([^;{]*\))\s*(/\*@.*?\*/);',(CASE/'shim/propagate_specs.h').read_text(),re.S);assert len(specs)==5
 for signature,name,contract in specs:
  matches=list(re.finditer(r'(vfloat32m8_t\s+'+name+r'\([^{}]*\))\s*\{',source));assert len(matches)==1
  m=matches[0];source=source[:m.start()]+m[1]+'\n'+contract+'\n{'+source[m.end():]
 assert tokens(source)==tokens(original),'NaN-helper annotations changed C tokens'
 return source
def iter_current_unit_texts():
 for stem in ['type_width','count','assert']:
  yield dict(label=stem,stem=stem,text='#include "shim/'+stem+'.c"\n',cpp_flags=[])
 for stem,text in [
  ('read_table','#include "shim/read_table.c"\n'),
  ('compare','#include "shim/compare_intrinsic_specs.h"\n#include "shim/compare.c"\n'),
  ('load_views','#include "proof/c/load_view_probes.c"\n'),
  ('caller','#include "shim/compare_intrinsic_specs.h"\n#define restrict\n#include "spec.c"\n')]:
  yield dict(label=stem,stem=stem,text=text,cpp_flags=[])
 raw,text,_=annotation_source('neon');assert tokens(raw)==tokens(text)
 yield dict(label='neon',stem='neon_unit',text='#include "shim/kernel_state.h"\n#include "shim/neon_specs.h"\nvoid mp_assert(int ok) /*@ Require ok!=0 && emp Ensure emp */;\n#define assert(x) mp_assert(x)\n#define restrict\n'+text,cpp_flags=['-I',str(CASE/'impl')])
 raw,text,_=kernel_text();assert tokens(raw)==tokens(text)
 yield dict(label='rvv',stem='rvv_unit',text='#include "shim/kernel_state.h"\n#include "shim/rvv_memory_specs.h"\n#include "shim/propagate_specs.h"\n#define MP_PROPAGATE_H\nvoid mp_assert(int ok) /*@ Require ok!=0 && emp Ensure emp */;\n#define assert(x) mp_assert(x)\n#define restrict\n'+text,cpp_flags=['-I',str(CASE/'impl')])
 from nan_array_source import annotated_nan_array
 yield dict(label='propagate',stem='propagate',text=annotated_nan_array(),cpp_flags=['-I',str(CASE/'shim')])
 from generate_nan_wrappers import wrapper_source
 yield dict(label='nan_wrappers',stem='nan_wrappers',text=wrapper_source(),cpp_flags=['-I',str(CASE/'shim')])
