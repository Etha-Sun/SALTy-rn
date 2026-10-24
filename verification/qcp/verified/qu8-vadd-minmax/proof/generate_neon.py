#!/usr/bin/env python3
"""Annotate the repaired raw NEON C body; preserve all C tokens through CPP."""
from pathlib import Path
import argparse,hashlib,json,re,subprocess,tempfile,time
C=Path(__file__).resolve().parent.parent;NS='Qu8Add';sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def tokens(s):return re.findall(r'\w+|[^\s\w]',re.sub(r'/\*.*?\*/|//[^\n]*','',s,flags=re.S))
PARAMS=[('Az','a_zero_point','unsigned char',0,255),('Bz','b_zero_point','unsigned char',0,255),('RawBias','bias','int',-2147483648,2147483647),('Ma','a_multiplier','int',-2147483648,2147483647),('Mb','b_multiplier','int',-2147483648,2147483647),('RawShift','shift','int',-2147483648,2147483647),('Oz','output_zero_point','short',-32768,32767),('Lo','output_min','unsigned char',0,255),('Hi','output_max','unsigned char',0,255)]
def param_cells():return[f'store(&(params->scalar.{field}),{t},{n})'for n,field,t,_,_ in PARAMS]
def vector_cells():
 out=[]
 for v,t,n,x in [('va_zero_point','unsigned char',8,'Az'),('vb_zero_point','unsigned char',8,'Bz'),('va_multiplier','int',4,'Ma'),('vb_multiplier','int',4,'Mb'),('vright_shift','int',4,'qu_ctrl(RawShift)'),('voutput_zero_point','short',8,'Oz'),('voutput_min','unsigned char',8,'Lo'),('voutput_max','unsigned char',8,'Hi')]:out +=[f'store(&({v}.s{i}),{t},{x})'for i in range(n)]
 return out
BOUNDS=' && '.join(f'({lo})<={n} && {n}<={hi}'for n,_,_,lo,hi in PARAMS)
def state(entry=False,tail=False,active=False):
 n='batch@pre';k='(batch@pre-batch)';v='qu_values('+','.join([k,'Az','Bz','Ma','Mb','RawShift','Oz','Lo','Hi','A','B'])+')'
 pure=[f'Zlength(A)=={n}+7',f'Zlength(B)=={n}+7','sizeof(uint8_t)==1',f'0<{n}',f'{n}<=18446744073709551608','0<=batch',f'batch<={n}',f'0<={k}','params==params@pre','params!=0',BOUNDS]
 if entry:pure+=['batch%sizeof(uint8_t)==0','input_a!=0','input_b!=0','output!=0','batch==batch@pre','input_a==input_a@pre','input_b==input_b@pre','output==output@pre']
 else:pure+=[(f'(batch>0 && input_a==input_a@pre+{k} && input_b==input_b@pre+{k} && output==output@pre+{k})'if active else f'((batch>0 && input_a==input_a@pre+{k} && input_b==input_b@pre+{k} && output==output@pre+{k}) || batch==0)')]
 if not entry:pure+=['right_shift==qu_ctrl(RawShift)','input_a@pre<=input_a','input_a<=input_a@pre+batch@pre+7','input_b@pre<=input_b','input_b<=input_b@pre+batch@pre+7']
 if tail:pure+=['batch<8']
 heap=[f'UCharArray::full(input_a@pre,{n}+7,A)',f'UCharArray::full(input_b@pre,{n}+7,B)']
 if entry:heap +=['UCharArray::undef_full(output,batch)']
 else:heap +=[f'UCharArray::full(output@pre,{k},{v})','UCharArray::undef_full(output,batch)']
 heap+=param_cells()
 if not entry:heap+=vector_cells()
 return ' && '.join(pure)+' && '+' * '.join(heap)
def calls(raw):
 names={n:args for n,args in [('vreinterpretq_s16_u16','a'),('vsubl_u8','ab'),('vget_low_s16','a'),('vget_high_s16','a'),('vmovl_s16','a'),('vmulq_s32','ab'),('vmlaq_s32','abc'),('vrshlq_s32','ab'),('vqmovn_s32','a'),('vcombine_s16','ab'),('vqaddq_s16','ab'),('vqmovun_s16','a'),('vmax_u8','ab'),('vmin_u8','ab'),('vmax_u8','ab'),('vmin_u8','ab')]};edits=[];records=[];masked=re.sub(r'/\*.*?\*/',lambda m:' '*len(m[0]),raw,flags=re.S);tail=raw.index('  if XNN_UNLIKELY');seen={}
 for m in re.finditer(r'\b('+ '|'.join(sorted(names))+r'|vld1_u8|vext_u8)\s*\(',masked):
  start=m.end();depth=1;i=start
  while depth:
   depth+=(masked[i]=='(')-(masked[i]==')');i+=1
  inner=raw[start:i-1];args=[];d=0;last=0
  for j,ch in enumerate(inner):
   d+=(ch=='(')-(ch==')')
   if ch==','and d==0:args.append(inner[last:j].strip());last=j+1
  args.append(inner[last:].strip());name=m[1]
  if name=='vext_u8':assert len(args)==3 and args[0]==args[1] and re.fullmatch(r'\w+',args[0])and args[2]in ['2','4'];continue
  if name=='vld1_u8':
   assert args in [['input_a'],['input_b']];var=args[0];phase='tail'if m.start()>tail else'bulk';key=(phase,var);j=seen.get(key,0);seen[key]=j+1;assert j==0;idx='batch@pre-batch'+('+'+str(8*j)if j else'');bind=f'base={var}@pre,count=batch@pre+7,idx={idx},L='+('A'if var=='input_a'else'B')
  else:
   assert len(args)==len(names[name]);bindings=[]
   for formal,arg in zip(names[name],args):
    if re.fullmatch(r'[A-Za-z_]\w*',arg):bindings.append(formal+'=&'+arg)
    else:
     assert re.match(r'^(?:'+ '|'.join(names)+r')\s*\(',arg),arg
     bindings.append(formal+'=0')
   bind=','.join(bindings)
  edits.append((i,' /*@ where '+bind+' */'));records.append(dict(function=name,arguments=args,where=bind))
 for at,text in sorted(edits,reverse=True):raw=raw[:at]+text+raw[at:]
 return raw,records
def bit_cases(text,values):
 pure,heap=text.split(' && UCharArray::full',1)
 cases=' || '.join('(batch=='+str(j)+' && '+' && '.join('(batch & ('+str(w)+' * sizeof(uint8_t)))=='+str(j&w)for w in [4,2,1])+')'for j in values)
 return pure+' && ('+cases+') && UCharArray::full'+heap
def construct():
 raw=(C/'impl/testNEON.c').read_text();repair=json.loads((C/'proof/repair.json').read_text());assert sha(C/'impl/testNEON.c')==repair['repaired_neon_sha256'];spec=(C/'spec.c').read_text();contract=re.search(r'/\*@.*?\*/',spec[spec.index('void test_neon('):],re.S)[0];s,binds=calls(raw);s=s.replace('\n{','\n'+contract+'\n{',1);entry='/*@ Assert '+state(entry=True)+' */';inv='/*@ Inv Assert '+state()+' */';assert s.count('  assert(batch != 0);')==1;s=s.replace('  assert(batch != 0);',entry+'\n  assert(batch != 0);',1);assert s.count('  for (;')==1;s=s.replace('  for (;',inv+'\n  for (;',1);cut='/*@ Assert '+bit_cases(state(tail=True,active=True),range(1,8))+' */';anchor='  if XNN_UNLIKELY(batch != 0) {';assert s.count(anchor)==1;s=s.replace(anchor,anchor+'\n'+cut,1);assert tokens(raw)==tokens(s);return raw,s,dict(entry_cut=entry,bulk_invariant=inv,tail_entry_cut=cut,call_bindings=binds)

def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--timeout',type=int,default=1800);a=p.parse_args();r=Path(tempfile.mkdtemp(prefix='neon-kernel-',dir=C/'.build'));raw,annotated,ann=construct();(C/'proof/c/neon.annotations.json').write_text(json.dumps(ann,indent=2)+'\n');prefix='#include "'+str(C/'shim/neon_frontend.h')+'"\n';records=[]
 for label,text in [('original',raw),('neon_unit',annotated)]:
  src=r/(label+'.input.c');src.write_text(prefix+text);dest=r/(label+'.c');p=subprocess.run(['gcc','-E','-P','-CC','-nostdinc',src,'-o',dest],stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True,timeout=60);(r/(label+'-cpp.log')).write_text(p.stdout);assert not p.returncode,p.stdout
 assert tokens((r/'original.c').read_text())==tokens((r/'neon_unit.c').read_text());cmd=['prlimit','--as=17179869184:17179869184','--','stdbuf','-oL','-eL','qcp','--arch=64','--endian=little','--no-exec-info','--strategy-application-limit=4096','--input-file='+str(r/'neon_unit.c'),'--coq-output-dir='+str(r),'--coq-logic-path='+NS,'-slp',str(C/'shim'),NS,'-slp',str(C/'proof/c'),NS];work=r/'qcp-work';work.mkdir();t=time.monotonic()
 with(r/'qcp.log').open('w')as f:
  try:code=subprocess.run(cmd,cwd=work,stdout=f,stderr=f,timeout=a.timeout).returncode
  except subprocess.TimeoutExpired:code=124
 goal=r/'neon_unit_goal.v';s=dict(generation_passed=code==0 and sha(C/'impl/testNEON.c')==hashlib.sha256(raw.encode()).hexdigest(),whole_kernel_verified=False,run_directory=str(r),command=cmd,exit_code=code,seconds=time.monotonic()-t,raw_c_sha256=hashlib.sha256(raw.encode()).hexdigest(),raw_source_unchanged=sha(C/'impl/testNEON.c')==hashlib.sha256(raw.encode()).hexdigest(),same_frontend_cpp_tokens_identical=True,generated_c_vcs=len(re.findall(r'^Axiom proof_of_',goal.read_text(),re.M))if goal.exists()else 0)
 for p in [r/'status.json',C/'proof/neon-generation-status.json']:p.write_text(json.dumps(s,indent=2)+'\n')
 print(json.dumps(s,indent=2),flush=True)
 if code:print((r/'qcp.log').read_text()[-4500:],flush=True)
 return code
if __name__=='__main__':raise SystemExit(main())
