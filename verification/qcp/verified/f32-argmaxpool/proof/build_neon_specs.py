from pathlib import Path
C=Path(__file__).resolve().parents[1]
def fields(var,prefix,n,typ):return ' * '.join('store(&('+var+'.s'+str(i)+'),'+typ+','+prefix+str(i)+')'for i in range(n))
def result(vals,typ):return ' * '.join('store(&(__return.s'+str(i)+'),'+typ+','+v+')'for i,v in enumerate(vals))
def bind(prefix,n,typ):return ' '.join('('+prefix+str(i)+':'+typ+')'for i in range(n))
def declare(sig,withs,pre,post,name=''):
 return sig+'\n/*@ '+(name+' 'if name else'')+('With '+withs+' 'if withs else'')+'Require '+pre+'\n Ensure '+post+' */;\n'
s='''#ifndef ARGMAXPOOL_NEON_SPECS_H
#define ARGMAXPOOL_NEON_SPECS_H
#include "formal_types.h"
#include "read_table.h"
#include "read_previous.h"
/*@ Import Coq Require Import ArgmaxPool.PackModel ArgmaxPool.ReadWindows ArgmaxPool.LaneInsertModel */
/*@ Extern Coq (APOutput :: *) (APIndex :: *) */
/*@ Extern Coq (ap_output:list Z->APOutput->Assertion) (ap_index:list Z->APIndex->Assertion)
 (ap_write_window:list Z->Z->Z->Prop)
 (ap_output_readable:APOutput->Z->Z->Prop) (ap_index_readable:APIndex->Z->Z->Prop)
 (ap_output_loaded_lane:APOutput->Z->Z->fp32->Prop) (ap_index_loaded_lane:APIndex->Z->Z->Z->Prop)
 (ap_output_write:APOutput->Z->Z->(Z->fp32)->APOutput) (ap_index_write:APIndex->Z->Z->(Z->Z)->APIndex)
 (ap_fpack2:fp32->fp32->Z->fp32) (ap_fpack4:fp32->fp32->fp32->fp32->Z->fp32)
 (ap_insert_f32:fp32->fp32->fp32->fp32->fp32->Z->Z->fp32)
 (ap_insert_u32:Z->Z->Z->Z->Z->Z->Z->Z)
 (ap_ipack2:Z->Z->Z->Z) (ap_ipack4:Z->Z->Z->Z->Z->Z) */
'''
s+=declare('float32x4_t vld1q_f32(const float*p)','(F:APMap)','ap_window(F,p,4) && ap_data(F)','ap_data(F) * '+result(['ap_load_lane(F,p,'+str(i)+')'for i in range(4)],'float'),'readonly_map')
for ctype,coqty,maptype,pred,loaded in [('float32x4_t','fp32','APOutput','ap_output','ap_output_loaded_lane'),('uint32x4_t','Z','APIndex','ap_index','ap_index_loaded_lane')]:
 fn='vld1q_f32'if coqty=='fp32'else'vld1q_u32';scalar='float'if coqty=='fp32'else'uint32_t';ann='float'if coqty=='fp32'else'unsigned int'
 post='exists '+bind('r',4,coqty)+', '+' && '.join(loaded+'(O,p,'+str(i)+',r'+str(i)+')'for i in range(4))+' && '+pred+'(W,O) * '+result(['r'+str(i)for i in range(4)],ann)
 s+=declare(ctype+' '+fn+'(const '+scalar+'*p)','(W:list Z) (O:'+maptype+')','ap_write_window(W,p,4) && '+('ap_output_readable'if coqty=='fp32'else'ap_index_readable')+'(O,p,4) && '+pred+'(W,O)',post,'output_map')
s+=declare('uint32x4_t vdupq_n_u32(uint32_t x)','','emp',result(['x']*4,'unsigned int'))
s+=declare('uint32x4_t vaddq_u32(uint32x4_t a,uint32x4_t b)',bind('a',4,'Z')+' '+bind('b',4,'Z'),fields('a','a',4,'unsigned int')+' * '+fields('b','b',4,'unsigned int'),result(['ap_add_u32(a'+str(i)+',b'+str(i)+')'for i in range(4)],'unsigned int'))
s+=declare('uint32x4_t vcgtq_f32(float32x4_t a,float32x4_t b)',bind('a',4,'fp32')+' '+bind('b',4,'fp32'),fields('a','a',4,'float')+' * '+fields('b','b',4,'float'),result(['ap_gt_mask(a'+str(i)+',b'+str(i)+')'for i in range(4)],'unsigned int'))
for suffix,vec,ann,coqtyp,select in [('f32','float32x4_t','float','fp32','ap_select_f32'),('u32','uint32x4_t','unsigned int','Z','ap_select_u32')]:
 pre=' && '.join('ap_bool_mask(m'+str(i)+')'for i in range(4))+' && '+fields('m','m',4,'unsigned int')+' * '+fields('a','a',4,ann)+' * '+fields('b','b',4,ann)
 s+=declare(vec+' vbslq_'+suffix+'(uint32x4_t m,'+vec+' a,'+vec+' b)',bind('m',4,'Z')+' '+bind('a',4,coqtyp)+' '+bind('b',4,coqtyp),pre,result([select+'(m'+str(i)+',a'+str(i)+',b'+str(i)+')'for i in range(4)],ann))
for suffix,vec4,vec2,ann,coqty in [('f32','float32x4_t','float32x2_t','float','fp32'),('u32','uint32x4_t','uint32x2_t','unsigned int','Z')]:
 for part,off in [('low',0),('high',2)]:
  s+=declare(vec2+' vget_'+part+'_'+suffix+'('+vec4+' a)',bind('a',4,coqty),fields('a','a',4,ann),result(['a'+str(i+off)for i in range(2)],ann))
# Borrow each actual local vector; preserve its original fields around the store.
# These are representation views of the original intrinsic, with explicit specs.
def borrowed_fields(n,typ):
 return ' * '.join('store(&(a->s'+str(i)+'),'+typ+',a'+str(i)+')'for i in range(n))
for suffix,scalar,vec4,vec2,ann,coqty,maptype,pred,writer,packer in [('f32','float','float32x4_t','float32x2_t','float','fp32','APOutput','ap_output','ap_output_write','ap_fpack'),('u32','uint32_t','uint32x4_t','uint32x2_t','unsigned int','Z','APIndex','ap_index','ap_index_write','ap_ipack')]:
 for fn,count,vec,nparam in [('vst1q_',4,vec4,4),('vst1_',2,vec2,2),('vst1_lane_',1,vec2,2)]:
  original=fn+suffix;view='ap_'+original+'_view'
  sig='void '+view+'('+scalar+'*p,const '+vec+'*a'+(',int lane'if count==1 else'')+')'
  fields_a=borrowed_fields(nparam,ann)
  pre=('lane==0 && 'if count==1 else'')+'ap_write_window(W,p,'+str(count)+') && '+pred+'(W,O) * '+fields_a
  value=packer+str(nparam)+'('+','.join('a'+str(i)for i in range(nparam))+')'
  post=pred+'(W,'+writer+'(O,p,'+str(count)+','+value+')) * '+fields_a
  s+=declare(sig,'(W:list Z) (O:'+maptype+') '+bind('a',nparam,coqty),pre,post)
  s+='#define '+original+'(p,a'+(',lane'if count==1 else'')+') '+view+'((p),&(a)'+(',(lane)'if count==1 else'')+')\n'
# Original ACLE MOV/INS lane replacement, legal constant lane0..3.
for suffix,scalar,vec,ann,coqty,model in [('f32','float','float32x4_t','float','fp32','ap_insert_f32'),('u32','uint32_t','uint32x4_t','unsigned int','Z','ap_insert_u32')]:
 sig=vec+' vsetq_lane_'+suffix+'('+scalar+' value,'+vec+' a,int lane)'
 pre='0<=lane && lane<4 && '+fields('a','a',4,ann)
 post=result([model+'(value,a0,a1,a2,a3,lane,'+str(j)+')'for j in range(4)],ann)
 s+=declare(sig,bind('a',4,coqty),pre,post)
s+='#endif\n';(C/'shim/neon_specs.h').write_text(s)
print('Prepared source-reviewed NEON contract views; all6 borrowed stores preserve the actual vector owner. C implementations optional; final kernel proofs required.')
