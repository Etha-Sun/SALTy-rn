#!/usr/bin/env python3
from pathlib import Path
import json,re,subprocess,tempfile,time,os,hashlib,argparse
C=Path(__file__).resolve().parents[1];P=C/'proof';R=next(p for p in C.parents if(p/'.git').exists());sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def tokens(s):return re.findall(r'\w+|[^\s]',re.sub(r'/\*.*?\*/|//[^\n]*','',s,flags=re.S))
def call_ends(raw):
 for m in re.finditer(r'\b(hc_read_scalar|__riscv_\w+)\s*\(',raw):
  n=m.end();dep=1
  while dep:
   dep+=(raw[n]=='(')-(raw[n]==')');n+=1
  yield m[1],n,raw[m.end():n-1]
def construct():
 raw=(C/'impl/testRVV.c').read_text();edits=[];meta={}
 eqs=['input_height==H','input_width==N','input_padding_top==Top','output_y_start==Start','output_y_end==End','input==Input','zero==Zero','weights==Weights','output==Output','params==Params','output_channels==Cn','output_height_stride==Hs','output_channel_stride==Cs']
 dom=['hc_input_domain(F,Input,Zero,Weights,Params,H,N,Top,Start,End,Cn)','hc_output_layout(Output,Hs,Cs,H,N,Cn,End)','hc_output_owned(W,Output,Hs,Cs,Cn,Start,End,(N+1)/2)','hc_present(F,&(params->scalar.min))','hc_present(F,&(params->scalar.max))','hc_same_bits(hc_get(F,&(params->scalar.min)),Lo)','hc_same_bits(hc_get(F,&(params->scalar.max)),Hi)']
 base=eqs+dom+['0<H','0<N','0<Cn','0<=Top','Top<=1','0<=Start','Start<End'];rr='hc_visible(hc_rvv_raw(F,Input,Zero,Weights,H,N,Top,Lo,Hi),Cn)';x='ow_done';y='output_y';ch='Cn-c';ow='(N+1)/2'
 def progress(y,ch,x):return 'hc_progress('+rr+',O,Output,Hs,Cs,Cn,Start,End,'+ow+','+y+','+ch+','+x+')'
 def assertion(pures,heap,ex=[]):return ('exists '+''.join('('+v+':'+t+') 'for v,t in ex)+','if ex else'')+' && '.join('('+v+')'for v in pures)+' && '+' * '.join(heap)
 def inv(at,pures,heap,ex=[]):
  a=assertion(pures,heap,ex);edits.append((raw.index(at),'/*@ Inv Assert '+a+' */\n'));meta[at]=a
 ghost='(F:HwcROMap) (O:HwcOutput) (W:list Z) '+' '.join('('+v+':Z)'for v in ['H','N','Top','Start','End','Input','Zero','Weights','Output','Params','Cn','Hs','Cs'])+' (Lo:fp32) (Hi:fp32)'
 contract='/*@ With '+ghost+' Require '+assertion(base,['hc_data(F)','hc_output(W,O)'])+' Ensure hc_data(F)*hc_output(W,hc_final('+rr+',O,Output,Hs,Cs,Cn,Start,End,'+ow+')) */\n'
 edits.append((raw.index('{',raw.index('XNN_OOB_READS')),contract));meta['contract']=contract
 fixed=base+['input_height_stride==12*N','output_width=='+ow,'output_channel_increment==hc_addr64(4*Cs-4*('+ow+'))'];
 outer=fixed+['Start<=output_y','output_y<=End+1','hc_rows_pending(Input,Zero,H,N,Top,output_y,End,i0,i1,i2,i3,i4)','hc_pending_outputs(Output,Hs,output_y,End,output0,output1)']
 inv('for (size_t output_y =',outer,['hc_data(F)','hc_output(W,'+progress(y,'0','0')+')'])
 clipped='hc_outer_input(Input,Zero,H,N,Top,output_y,i0,i1,i2,i3,i4)'
 chan=fixed+['input_y2==hc_addr64(2*output_y+2-Top)','input_y4==hc_addr64(2*output_y+4-Top)']+['output0==hc_addr64(Output+Hs*output_y)','output1==hc_addr64(Output+Hs*hc_store_row(End,output_y,1))']+['Start<=output_y','output_y<End','0<=c','c<=Cn','c==0 || (Cn-c)%4==0',clipped,'c==0 || w==hc_addr64(Weights+448*((Cn-c)/4))','hc_channel_pending(Output,Hs,Cs,Cn,End,output_y,Cn-c,o0c0,o0c1,o0c2,o0c3,o1c0,o1c1,o1c2,o1c3)']
 # w pointer is unused once c==0; its modular address is still well-defined.
 inv('while (c != 0)',chan,['hc_data(F)','hc_output(W,'+progress(y,ch,'0')+')'])
 wi=fixed+['input_y2==hc_addr64(2*output_y+2-Top)','input_y4==hc_addr64(2*output_y+4-Top)']+['output0==hc_addr64(Output+Hs*output_y)','output1==hc_addr64(Output+Hs*hc_store_row(End,output_y,1))']+['Start<=output_y','output_y<End','0<c','c<=Cn','(Cn-c)%4==0',clipped,'w==hc_addr64(Weights+448*((Cn-c)/4))','0<=ow_done','ow_done<='+ow,'ow=='+ow+'-ow_done','hc_channel_output(Output,Hs,Cs,Cn,End,output_y,Cn-c,o0c0,o0c1,o0c2,o0c3,o1c0,o1c1,o1c2,o1c3)']
 for row in range(5):wi+=['i'+str(row)+'_base==hc_addr64(i'+str(row)+'-12)']
 for row in range(2):
  for lane in range(4):wi+=['current_o'+str(row)+'c'+str(lane)+'==hc_addr64(o'+str(row)+'c'+str(lane)+'+4*ow_done)']
 heap=['hc_data(F)','hc_output(W,'+progress(y,ch,x)+')']
 inv('while (ow > 0)',wi,heap)
 def registers(step,kind):
  pure=[];cells=[];ex=[]
  def add(v,t,n,pred=None):
   ex.append((n,'Record'+t));cells.append('StructPred'+t+'(&'+v+','+n+')')
   if pred:pure.append(pred)
  for dy in range(2):
   for lane in range(4):
    v='v_o'+str(dy)+'c'+str(lane);a='A'+str(dy)+str(lane);add(v,'vfloat32m1_t',a,'hc_acc_prefix('+a+',F,Input,Zero,Weights,H,N,Top,output_y+'+str(dy)+',ow_done,Cn-c,'+str(lane)+','+step+',vl)')
  add('v_zero','vfloat32m1_t','VZero','hc_rvv_splat(VZero,hc_zero,vl)');add('vj','vuint32m1_t','VId','hc_rvv_id(VId,vl)')
  if kind>=1:
   add('mask','vbool32_t','M','hc_legal_mask(M,vl)');pure+=['hc_source_mask(M,N,ow_done,dx,vl)','valid_start==hc_mask_start(dx,ow_done)','valid_end==hc_mask_end(dx,N,ow,vl)'];add('mask_ge','vbool32_t','Mge');add('mask_lt','vbool32_t','Mlt')
  if kind>=2:
   pure+=['scalar_offset==4*(dx*3+c_in)','v_off==hc_addr64(24*ow_done+scalar_offset)','v_str==24']
   for row in range(5):
    add('loaded'+str(row),'vfloat32m1_t','Ld'+str(row));a='I'+str(row);add('v_in'+str(row),'vfloat32m1_t',a,'hc_source_input('+a+',F,Input,Zero,H,N,Top,output_y,ow_done,'+str(row)+',dx,c_in,vl)')
  return pure,cells,ex
 common=wi+['0<ow','hc_rvv_vl(ow,vl)','0<vl','vl<=ow']
 pu,hs,ex=registers('9*dx',0);inv('for (int dx =',common+['0<=dx','dx<=3']+pu,heap+hs,ex)
 pu,hs,ex=registers('9*dx+3*c_in',1);inv('for (int c_in =',common+['0<=dx','dx<3','0<=c_in','c_in<=3']+pu,heap+hs,ex)
 pu,hs,ex=registers('9*dx+3*c_in+ky',2);inv('for (int ky =',common+['0<=dx','dx<3','0<=c_in','c_in<3','0<=ky','ky<=3']+pu,heap+hs,ex)
 bindings=[]
 for name,end,args in call_ends(raw):
  b=[]
  if name in ['hc_read_scalar','__riscv_vlse32_v_f32m1_m']:b=['F=F']
  if name=='__riscv_vse32_v_f32m1':b=['W=W']
  if b:edits.append((end,' /*@ where '+','.join(b)+' */'));bindings.append({'name':name,'args':args,'bindings':b})
 ann=raw
 for pos,text in sorted(edits,reverse=True):ann=ann[:pos]+text+ann[pos:]
 assert tokens(raw)==tokens(ann)
 meta['bindings']=bindings
 return raw,ann,'#define HWC_FORMAL 1\n#include "'+str(C/'shim/kernel_program.h')+'"\n',meta

def main():
 ap=argparse.ArgumentParser();ap.add_argument('--timeout',type=int,default=600);ap.add_argument('--prepare-only',action='store_true');a=ap.parse_args();assert not json.loads((R/'.build/memory/quota/state.json').read_text())['wind_down_requested'];raw,ann,pre,meta=construct();run=Path(tempfile.mkdtemp(prefix='rvv-main-',dir=C/'.build'));env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
 for n,s in [('raw',raw),('rvv_unit',ann)]:
  p=run/(n+'.input.c');p.write_text(pre+s);cmd=['gcc','-E','-P','-CC','-nostdinc','-I',str(C/'shim'),str(p)];r=subprocess.run(cmd,capture_output=True,text=True);(run/(n+'.cpp.log')).write_text(r.stderr);assert r.returncode==0,r.stderr;(run/(n+'.c')).write_text(r.stdout)
 assert tokens((run/'raw.c').read_text())==tokens((run/'rvv_unit.c').read_text());(run/'annotations.json').write_text(json.dumps(meta,indent=2)+'\n');wd=run/'work';wd.mkdir();cmd=['prlimit','--as=34359738368:34359738368','--','stdbuf','-oL','-eL','qcp','--arch=64','--endian=little','--no-exec-info','--strategy-application-limit=1024','--input-file='+str(run/'rvv_unit.c'),'--coq-output-dir='+str(run),'--coq-logic-path=HwcConv','-slp',str(C/'shim'),'HwcConv','-slp',str(P/'c'),'HwcConv'];s={'prepared':True,'generation_passed':False,'whole_kernel_verified':False,'run_directory':str(run),'command':cmd,'timeout_seconds':a.timeout,'memory_GiB':32,'raw_c_sha256':sha(C/'impl/testRVV.c'),'annotation_sha256':sha(run/'annotations.json'),'cpp_sha256':sha(run/'rvv_unit.c'),'same_raw_tokens':True,'same_frontend_cpp_tokens':True};(run/'started.json').write_text(json.dumps(s,indent=2)+'\n');print(run,flush=True)
 if a.prepare_only:return 0
 t=time.monotonic()
 with(run/'generation.log').open('w')as f:
  try:code=subprocess.run(cmd,cwd=wd,env=env,stdout=f,stderr=f,timeout=a.timeout).returncode
  except subprocess.TimeoutExpired:code=124
 goal=run/'rvv_unit_goal.v';fields=re.findall(r'^Axiom proof_of_(\w+)',goal.read_text(),re.M)if goal.exists()else[];s.update(generation_passed=code==0 and bool(fields),exit_code=code,seconds=time.monotonic()-t,goal_sha256=sha(goal)if goal.exists()else None,fields=fields,actual_C_fields=len(fields));(run/'status.json').write_text(json.dumps(s,indent=2)+'\n');dest=P/'rvv-generation-status.json'
 if dest.exists():hist=P/'history'/'main-generations';hist.mkdir(parents=True,exist_ok=True);(hist/(sha(dest)+'.json')).write_bytes(dest.read_bytes())
 dest.write_bytes((run/'status.json').read_bytes());print({k:s[k]for k in ['generation_passed','exit_code','seconds','actual_C_fields']},flush=True);return 0 if s['generation_passed']else 1
if __name__=='__main__':raise SystemExit(main())
