"""Pure live-source constructors; no verifier or public-state writes.
Plans carry only proof annotations. Every C body is read from current impl/shim.
"""
from pathlib import Path
import re,json,hashlib
CASE=None
NS='HwcConv'
def configure(case):
 global CASE
 CASE=Path(case).resolve()
def require(v,m):
 if not v:raise ValueError(m)
def tokens(s):return re.findall(r'\w+|[^\s]',re.sub(r'/\*.*?\*/|//[^\n]*','',s,flags=re.S))
def call_ends(raw,names):
 for m in re.finditer(r'\b('+ '|'.join(re.escape(n)for n in names)+r')\s*\(',raw):
  n=m.end();depth=1
  while depth:
   require(n<len(raw),'Unclosed actual C call');depth+=(raw[n]=='(')-(raw[n]==')');n+=1
  yield m[1],n,raw[m.end():n-1]
def render_kernel(side,raw):
 require(CASE is not None and side in {'neon','rvv'},'Case/side required')
 plan=json.loads((CASE/'proof/annotation-plans'/(side+'.json')).read_text());edits=[]
 require('XNN_OOB_READS'in raw,'Expected actual kernel signature')
 edits.append((raw.index('{',raw.index('XNN_OOB_READS')),plan['contract']))
 for anchor,assertion in plan.items():
  if anchor in {'contract','bindings','completed-pixel8-source-prefix27'}:continue
  require(raw.count(anchor)==1,'Nonunique or absent loop anchor '+anchor)
  edits.append((raw.index(anchor),'/*@ Inv Assert '+assertion+' */\n'))
 if side=='neon':
  names=['vld1q_f32','vld1q_dup_f32','vld1q_lane_f32','hc_neon_rows_pixel27','hc_store_low_half','hc_store_high_half','vst1q_lane_f32']
  actual=[]
  for name,end,args in call_ends(raw,names):
   binding='F=F'if name.startswith('vld')or name=='hc_neon_rows_pixel27'else'W=W'
   edits.append((end,' /*@ where '+binding+' */'));actual.append((name,args,binding))
  require(sum(x[0]=='hc_neon_rows_pixel27'for x in actual)==8,'Exact eight ordinary pixel calls required')
  prefix='#define HWC_FORMAL 1\n#include "'+str(CASE/'shim/neon_kernel_program.h')+'"\n'
 else:
  cut='        v_o0c0 = hc_max_f32m1';require(raw.count(cut)==1,'Exact post-pixel cut anchor')
  edits.append((raw.index(cut),'/*@ Assert '+plan['completed-pixel8-source-prefix27']+' */\n'))
  names=['hc_rvv_pixel9_raw','hc_read_scalar']+sorted(set(re.findall(r'\b__riscv_\w+(?=\()',raw)))
  actual=[]
  for name,end,args in call_ends(raw,names):
   bs=['F=F']if name in {'hc_rvv_pixel9_raw','hc_read_scalar','__riscv_vlse32_v_f32m1_m'}else['W=W']if name=='__riscv_vse32_v_f32m1'else[]
   if bs:
    edits.append((end,' /*@ where '+','.join(bs)+' */'));actual.append(dict(name=name,args=args,bindings=bs))
  require(actual==plan['bindings'],'Actual RVV ghost binding shape changed')
  prefix='#define HWC_FORMAL 1\n#include "'+str(CASE/'shim/kernel_program.h')+'"\n/*@ Extern Coq (hc_output_address:Z->Z->Z->Z->Z->Z->Z) */\n'
 ann=raw
 for position,text in sorted(edits,reverse=True):ann=ann[:position]+text+ann[position:]
 require(tokens(raw)==tokens(ann),'Executable tokens changed by kernel annotations')
 return raw,ann,prefix

def render(stem,row):
 require(CASE is not None,'Case must be explicit');source=CASE/row['source'];raw=source.read_text()
 if stem in {'neon_unit','rvv_unit'}:
  raw,ann,pre=render_kernel('neon'if stem=='neon_unit'else'rvv',raw)
  return pre+raw,pre+ann
 if stem=='support_unit':
  ann=raw.replace('size_t hc_round_down4(size_t n){','size_t hc_round_down4(size_t n)\n/*@ Require emp Ensure __return == hc_round_model(n) && emp */\n{').replace('size_t hc_doz(size_t a,size_t b){','size_t hc_doz(size_t a,size_t b)\n/*@ Require emp Ensure __return == hc_doz_model(a,b) && emp */\n{')
  require(ann!=raw and tokens(raw)==tokens(ann),'Support body/token construction changed')
  pre=(CASE/'shim/types.h').read_text()+'\n/*@ Import Coq Require Import HwcConv.SupportModel */\n/*@ Extern Coq (hc_doz_model : Z -> Z -> Z) (hc_round_model : Z -> Z) */\n'
  return pre+raw,pre+ann
 # Ordinary helper source contracts and bodies are live source, no old CPP input.
 pre='#define HWC_FORMAL 1\n'
 for header in row.get('prefix_headers',[]):pre+='#include "'+str(CASE/header)+'"\n'
 pre+='#include "'+str(source)+'"\n'
 return None,pre
