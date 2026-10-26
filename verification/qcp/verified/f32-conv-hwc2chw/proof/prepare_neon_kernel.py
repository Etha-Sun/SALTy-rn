#!/usr/bin/env python3
from pathlib import Path
import json,re,subprocess,tempfile,time,os,hashlib,argparse
from prepare_rvv_kernel import tokens
C=Path(__file__).resolve().parents[1];P=C/'proof';R=next(p for p in C.parents if(p/'.git').exists());sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def construct():
 raw=(C/'impl/testNEON.c').read_text();assert re.findall(r'round_down_po2\(([^,]+),\s*([^\)]+)\)',raw)==[('input_width','4')];edits=[];meta={}
 eqs=['input_height==H','input_width==N','input_padding_top==Top','output_y_start==Start','output_y_end==End','input==Input','zero==Zero','weights==Weights','output==Output','params==Params','output_channels==Cn','output_height_stride==Hs','output_channel_stride==Cs']
 dom=['hc_input_domain(F,Input,Zero,Weights,Params,H,N,Top,Start,End,Cn)','hc_output_layout(Output,Hs,Cs,H,N,Cn,End)','hc_output_owned(W,Output,Hs,Cs,Cn,Start,End,(N+1)/2)','hc_present(F,&(params->scalar.min))','hc_present(F,&(params->scalar.max))','hc_same_bits(hc_get(F,&(params->scalar.min)),Lo)','hc_same_bits(hc_get(F,&(params->scalar.max)),Hi)','0<H','0<N','0<Cn','0<=Top','Top<=1','0<=Start','Start<End']
 base=eqs+dom;rr='hc_visible(hc_neon_raw(F,Input,Zero,Weights,H,N,Top,Lo,Hi),Cn)';y='output_y';ch='Cn-c';ow='(N+1)/2';x='(N-iw)/2'
 def progress(y,ch,x):return 'hc_progress('+rr+',O,Output,Hs,Cs,Cn,Start,End,'+ow+','+y+','+ch+','+x+')'
 def assertion(pures,heap,ex=[]):return ('exists '+''.join('('+v+':'+t+') 'for v,t in ex)+','if ex else'')+' && '.join('('+v+')'for v in pures)+' && '+' * '.join(heap)
 def inv(at,pures,heap,ex=[]):
  a=assertion(pures,heap,ex);edits.append((raw.index(at),'/*@ Inv Assert '+a+' */\n'));meta[at]=a
 ghost='(F:HwcROMap) (O:HwcOutput) (W:list Z) '+' '.join('('+v+':Z)'for v in ['H','N','Top','Start','End','Input','Zero','Weights','Output','Params','Cn','Hs','Cs'])+' (Lo:fp32) (Hi:fp32)'
 contract='/*@ With '+ghost+' Require '+assertion(base,['hc_data(F)','hc_output(W,O)'])+' Ensure hc_data(F)*hc_output(W,hc_final('+rr+',O,Output,Hs,Cs,Cn,Start,End,'+ow+')) */\n';edits.append((raw.index('{',raw.index('XNN_OOB_READS')),contract));meta['contract']=contract
 fixed=base+['input_height_stride==12*N','input_width_increment==12*hc_round_model(N)','output_width=='+ow,'output_channel_increment==hc_addr64(4*Cs-4*('+ow+'))']
 minex=[('LMin','Recordfloat32x4_t'),('LMax','Recordfloat32x4_t')];minp=['hc_neon_dup4(LMin,Lo)','hc_neon_dup4(LMax,Hi)'];minh=['StructPredfloat32x4_t(&vmin,LMin)','StructPredfloat32x4_t(&vmax,LMax)']
 outer=fixed+['Start<=output_y','output_y<=End+1','hc_rows_pending(Input,Zero,H,N,Top,output_y,End,i0,i1,i2,i3,i4)','hc_pending_outputs(Output,Hs,output_y,End,output0,output1)']
 inv('for (size_t output_y =',outer+minp,['hc_data(F)','hc_output(W,'+progress(y,'0','0')+')']+minh,minex)
 chan=fixed+['input_y2==hc_addr64(2*output_y+2-Top)','input_y4==hc_addr64(2*output_y+4-Top)']+['output0==hc_addr64(Output+Hs*output_y)','output1==hc_addr64(Output+Hs*hc_store_row(End,output_y,1))','Start<=output_y','output_y<End','0<=c','c<=Cn','c==0 || (Cn-c)%4==0','hc_outer_input(Input,Zero,H,N,Top,output_y,i0,i1,i2,i3,i4)','c==0 || w==hc_addr64(Weights+448*((Cn-c)/4))','hc_channel_pending(Output,Hs,Cs,Cn,End,output_y,Cn-c,o0c0,o0c1,o0c2,o0c3,o1c0,o1c1,o1c2,o1c3)']
 inv('while (c != 0)',chan+minp,['hc_data(F)','hc_output(W,'+progress(y,ch,'0')+')']+minh,minex)
 wi=fixed+['input_y2==hc_addr64(2*output_y+2-Top)','input_y4==hc_addr64(2*output_y+4-Top)']+['output0==hc_addr64(Output+Hs*output_y)','output1==hc_addr64(Output+Hs*hc_store_row(End,output_y,1))','Start<=output_y','output_y<End','0<c','c<=Cn','(Cn-c)%4==0','w==hc_addr64(Weights+448*((Cn-c)/4))','0<=iw','iw<=N','(N-iw)%4==0']
 heap=['hc_data(F)','hc_output(W,'+progress(y,ch,x)+')']+minh;ex=list(minex);pure=list(minp)
 for row in range(5):
  bp='hc_row_base(Input,Zero,H,N,2*output_y-Top+'+str(row)+')';wi+=['i'+str(row)+'==hc_addr64('+bp+'+12*(N-iw))'];a='Prev'+str(row);ex.append((a,'Recordfloat32x4_t'));pure+=['hc_neon_previous('+a+',F,Input,Zero,H,N,Top,output_y,'+str(row)+',N-iw)'];heap+=['StructPredfloat32x4_t(&vi'+str(row)+'x0,'+a+')']
 for row in range(2):
  for lane in range(4):wi+=['o'+str(row)+'c'+str(lane)+'==hc_addr64(Output+Cs*(Cn-c+'+str(lane)+')+Hs*hc_store_row(End,output_y,'+str(row)+')+4*('+x+'))']
 # Before clipping tail channel pointers are already aliases. Use the exact
 # channel projection rather than assuming all four logical channels exist.
 for row in range(2):
  for lane in range(4):
   old='o'+str(row)+'c'+str(lane)+'==hc_addr64(Output+Cs*(Cn-c+'+str(lane)+')+Hs*hc_store_row(End,output_y,'+str(row)+')+4*('+x+'))'
   new='o'+str(row)+'c'+str(lane)+'==hc_addr64(Output+Cs*hc_store_channel(Cn,Cn-c,'+str(lane)+')+Hs*hc_store_row(End,output_y,'+str(row)+')+4*('+x+'))';wi[wi.index(old)]=new
 inv('for (; iw >= 4;',wi+pure,heap,ex)
 for m in re.finditer(r'\b(vld1q_f32|vld1q_dup_f32|vld1q_lane_f32|hc_store_low_half|hc_store_high_half|vst1q_lane_f32)\s*\(',raw):
  n=m.end();dep=1
  while dep:dep+=(raw[n]=='(')-(raw[n]==')');n+=1
  b='F=F'if m[1].startswith('vld')else'W=W';edits.append((n,' /*@ where '+b+' */'))
 ann=raw
 for pos,text in sorted(edits,reverse=True):ann=ann[:pos]+text+ann[pos:]
 assert tokens(raw)==tokens(ann)
 return raw,ann,'#define HWC_FORMAL 1\n#include "'+str(C/'shim/neon_kernel_program.h')+'"\n',meta

def main():
 ap=argparse.ArgumentParser();ap.add_argument('--timeout',type=int,default=600);a=ap.parse_args();assert not json.loads((R/'.build/memory/quota/state.json').read_text())['wind_down_requested'];raw,ann,pre,meta=construct();run=Path(tempfile.mkdtemp(prefix='neon-main-',dir=C/'.build'));env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
 for n,s in [('raw',raw),('neon_unit',ann)]:
  p=run/(n+'.input.c');p.write_text(pre+s);cmd=['gcc','-E','-P','-CC','-nostdinc','-I',str(C/'shim'),str(p)];r=subprocess.run(cmd,capture_output=True,text=True);(run/(n+'.cpp.log')).write_text(r.stderr);assert r.returncode==0,r.stderr;(run/(n+'.c')).write_text(r.stdout)
 assert tokens((run/'raw.c').read_text())==tokens((run/'neon_unit.c').read_text());(run/'annotations.json').write_text(json.dumps(meta,indent=2)+'\n');wd=run/'work';wd.mkdir();cmd=['prlimit','--as=34359738368:34359738368','--','stdbuf','-oL','-eL','qcp','--arch=64','--endian=little','--no-exec-info','--strategy-application-limit=1024','--input-file='+str(run/'neon_unit.c'),'--coq-output-dir='+str(run),'--coq-logic-path=HwcConv','-slp',str(C/'shim'),'HwcConv','-slp',str(P/'c'),'HwcConv'];s={'prepared':True,'generation_passed':False,'whole_kernel_verified':False,'run_directory':str(run),'command':cmd,'timeout_seconds':a.timeout,'memory_GiB':32,'raw_c_sha256':sha(C/'impl/testNEON.c'),'annotation_sha256':sha(run/'annotations.json'),'cpp_sha256':sha(run/'neon_unit.c'),'same_raw_tokens':True,'same_frontend_cpp_tokens':True};(run/'started.json').write_text(json.dumps(s,indent=2)+'\n');print(run,flush=True);t=time.monotonic()
 with(run/'generation.log').open('w')as f:
  try:code=subprocess.run(cmd,cwd=wd,env=env,stdout=f,stderr=f,timeout=a.timeout).returncode
  except subprocess.TimeoutExpired:code=124
 goal=run/'neon_unit_goal.v';fields=re.findall(r'^Axiom proof_of_(\w+)',goal.read_text(),re.M)if goal.exists()else[];s.update(generation_passed=code==0 and bool(fields),exit_code=code,seconds=time.monotonic()-t,goal_sha256=sha(goal)if goal.exists()else None,fields=fields,actual_C_fields=len(fields));(run/'status.json').write_text(json.dumps(s,indent=2)+'\n');dest=P/'neon-generation-status.json'
 if dest.exists():hist=P/'history'/'main-generations';hist.mkdir(parents=True,exist_ok=True);(hist/(sha(dest)+'.json')).write_bytes(dest.read_bytes())
 dest.write_bytes((run/'status.json').read_bytes());print({k:s[k]for k in ['generation_passed','exit_code','seconds','actual_C_fields']},flush=True);return 0 if s['generation_passed']else 1
if __name__=='__main__':raise SystemExit(main())
