#!/usr/bin/env python3
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
import argparse,json,re,hashlib,subprocess,os,tempfile,time,sys
P=Path(__file__).resolve().parent;C=P.parent;R=next(p for p in C.parents if(p/'.git').exists());sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def toks(s):return re.findall(r'\w+|[^\s]',re.sub(r'/\*.*?\*/|//[^\n]*','',s,flags=re.S))
def splitargs(s):
 out=[];depth=0;last=0
 for i,ch in enumerate(s):
  depth+=(ch=='(')-(ch==')')
  if ch==','and not depth:out.append(s[last:i].strip());last=i+1
 out.append(s[last:].strip());return out
def allcalls(raw,names):
 masked=re.sub(r'/\*.*?\*/|//[^\n]*',lambda m:' '*len(m[0]),raw,flags=re.S);calls=[]
 for m in re.finditer(r'\b('+ '|'.join(sorted(names,key=len,reverse=True))+r')\s*\(',masked):
  i=m.end();dep=1
  while dep:dep+=(masked[i]=='(')-(masked[i]==')');i+=1
  calls.append({'name':m[1],'start':m.start(),'end':i,'args':splitargs(raw[m.end():i-1])})
 return calls
meta=json.loads((P/'intrinsic-contract-inventory.json').read_text())['numeric_contracts'];by={r['name']:r for r in meta};typ={'int8x8_t':8,'int16x4_t':4,'int16x8_t':8,'int32x4_t':4,'float32x4_t':4,'vint8m2_t':32,'vint16m4_t':32,'vint32m8_t':32,'vfloat32m8_t':32}
scalar_params=[('a_zero_point','char','AZ'),('b_zero_point','char','BZ'),('scale','float','Scale'),('output_zero_point','short','OZ'),('output_min','char','Lo'),('output_max','char','Hi')]
def parheap(p='params'):
 return ['store(&('+p+'->scalar.'+n+'),'+t+','+g+')'for n,t,g in scalar_params]
def constants():
 out=[]
 for n,t,k,value in [('va_zero_point','char',8,'AZ'),('vb_zero_point','char',8,'BZ'),('vscale','float',4,'Scale'),('vmagic_bias','float',4,'qm_magic'),('vmagic_bias_less_output_zero_point','int',4,'1262485504-OZ'),('voutput_min','char',8,'Lo'),('voutput_max','char',8,'Hi')]:out+=['store(&('+n+'.s'+str(i)+'),'+t+','+value+')'for i in range(k)]
 return out
purebase='0<batch@pre && batch@pre<=18446744073709551615 && input_a@pre!=0 && input_b@pre!=0 && output@pre!=0 && params@pre!=0 && -128<=AZ && AZ<=127 && -128<=BZ && BZ<=127 && -32768<=OZ && OZ<=32767 && -128<=Lo && Lo<=127 && -128<=Hi && Hi<=127 && qm_inputs(M,input_a@pre,input_b@pre,batch@pre)'
def state(side,entry=False):
 k='(batch@pre-batch)';pure=purebase+' && sizeof(int8_t)==1 && 0<=batch && batch<=batch@pre && input_a==input_a@pre+'+k+' && input_b==input_b@pre+'+k+' && (batch==0 || output==output@pre+'+k+') && params==params@pre';heap=['rd_mem(M)','CharArray::full(output@pre,'+k+',qm_values('+k+',M,input_a@pre,input_b@pre,AZ,BZ,Scale,OZ,Lo,Hi))','CharArray::undef_full(output,batch)',*parheap()]
 if not entry:
  if side=='neon':heap+=constants()
  else:heap+=['store(&('+n+'),'+t+','+g+')'for n,t,g in [('a_zero_point','char','AZ'),('b_zero_point','char','BZ'),('scale','float','Scale'),('output_zero_point','short','OZ'),('output_min','char','Lo'),('output_max','char','Hi')]]
 if entry:pure+=' && batch==batch@pre && batch%sizeof(int8_t)==0 && input_a==input_a@pre && input_b==input_b@pre && output==output@pre'
 return pure+' && '+' * '.join(heap)
def bind_fields(formal,arg,k):
 assert re.fullmatch(r'[A-Za-z_]\w*',arg),arg
 return [formal+'=&'+arg]+[formal+str(i)+'='+arg+'.s'+str(i)for i in range(k)]
def construct(side):
 raw=(C/'impl'/('testNEON.c'if side=='neon'else'testRVV.c')).read_text();names=set(by)|{'vst1_s8','vst1_lane_u32','vst1_lane_u16','vst1_lane_s8','__riscv_vse8_v_i8m2'};masked=[];active=True;stack=[]
 for line in raw.splitlines(keepends=True):
  if re.match(r'\s*#if XNN_ARCH_ARM64\s*$',line):stack.append(active);active=active and True
  elif re.match(r'\s*#else\s*$',line)and stack:active=stack[-1]and not active
  elif re.match(r'\s*#endif\s*$',line)and stack:active=stack.pop()
  masked.append(line if active else ''.join('\n'if x=='\n'else' 'for x in line))
 calls=allcalls(''.join(masked),names);edits=[];owned=[];records=[]
 for call in calls:
  if any(lo<call['start']<hi for lo,hi in owned):continue
  n=call['name'];a=call['args'];b=[];special=False
  if n=='vmull_s16':
   match=[re.fullmatch(r'vget_(low|high)_s16\((\w+)\)',z)for z in a];assert all(match)and match[0][1]==match[1][1];b=bind_fields('a',match[0][2],8)+bind_fields('b',match[1][2],8);special=True
  elif n=='vreinterpretq_s32_f32':
   m=re.fullmatch(r'vaddq_f32\((\w+),\s*(\w+)\)',a[0]);assert m,a;b=bind_fields('a',m[1],4)+bind_fields('b',m[2],4);special=True
  elif n=='vqmovn_high_s32':
   m=re.fullmatch(r'vqmovn_s32\((\w+)\)',a[0]);assert m and re.fullmatch(r'\w+',a[1]);b=bind_fields('a',m[1],4)+bind_fields('b',a[1],4);special=True
  elif n in ['vst1_s8','vst1_lane_s8','vst1_lane_u32','vst1_lane_u16']:
   if n in ['vst1_lane_u32','vst1_lane_u16']:
    bits='32'if n.endswith('u32')else'16';m=re.fullmatch(r'vreinterpret_u'+bits+r'_s8\((\w+)\)',a[1]);assert m and a[2]=='0';v=m[1];special=True
   else:v=a[1];assert len(a)==2 or a[2]=='0'
   b=['x'+str(i)+'='+v+'.s'+str(i)for i in range(8)]
  elif n=='vext_s8':
   assert a[0]==a[1]and re.fullmatch(r'\w+',a[0])and a[2]in ['2','4'];b=['x'+str(i)+'='+a[0]+'.s'+str(i)for i in range(8)]
  elif n=='__riscv_vsub_vx_i16m4':
   m=re.fullmatch(r'__riscv_vsext_vf2_i16m4\((\w+),\s*(\w+)\)',a[0]);assert m and m[2]==a[2]=='vl';v=m[1];b=['a=&'+v,'A=qm_vec32('+','.join(v+'.s'+str(i)for i in range(32))+')'];special=True
  elif n=='__riscv_vse8_v_i8m2':
   assert a[0]=='output'and a[1]=='vout'and a[2]=='vl';b=['x'+str(i)+'='+a[1]+'.s'+str(i)for i in range(32)]
  elif n in ['vld1_s8','__riscv_vle8_v_i8m2']:b=['M=M']
  else:
   for (t,f),v in zip(by[n].get('arguments',[]),a):
    if t not in typ:continue
    if side=='rvv':b+=[f+'=&'+v,f.upper()+'='+('qm_fpvec32'if t=='vfloat32m8_t'else'qm_vec32')+'('+','.join(v+'.s'+str(i)for i in range(32))+')']
    else:b+=bind_fields(f,v,typ[t])
   if n=='__riscv_vreinterpret_v_f32m8_i32m8':b+=['vl=vl']
  if special:owned.append((call['start'],call['end']))
  if b:edits.append((call['end'],' /*@ where '+','.join(b)+' */'))
  records.append({**call,'where':','.join(b),'supported_source_shape_checked':True,'nested_ordinary_adapter':special})
 ann=raw
 for pos,s in sorted(edits,reverse=True):ann=ann[:pos]+s+ann[pos:]
 spec=(C/'spec.c').read_text();off=spec.index('void test_'+side+'(');contract=re.search(r'/\*@.*?\*/',spec[off:],re.S)[0];needle=') XNN_OOB_READS\n{';assert ann.count(needle)==1;ann=ann.replace(needle,') XNN_OOB_READS\n'+contract+'\n{',1)
 entry='/*@ Assert '+state(side,True)+' */';ann=ann.replace('  assert(batch != 0);',entry+'\n  assert(batch != 0);',1);inv='/*@ Inv Assert '+state(side)+' */';needle='  for (; batch >='if side=='neon'else'  while (batch > 0)';assert ann.count(needle)==1;ann=ann.replace(needle,inv+'\n'+needle,1);assert toks(raw)==toks(ann)
 tailcut=None
 if side=='neon':
  cases=' || '.join('(batch=='+str(j)+' && '+' && '.join('(batch & ('+str(w)+' * sizeof(int8_t)))=='+str(j&w)for w in [4,2,1])+')'for j in range(1,8))
  tailstate=state(side).replace('(batch==0 || output==output@pre+(batch@pre-batch))','output==output@pre+(batch@pre-batch)')
  tailcut='/*@ Assert '+tailstate+' && 0<batch && batch<8 && rd_window(M,input_a,8) && rd_window(M,input_b,8) && ('+cases+') */'
  needle='  if XNN_UNLIKELY(batch != 0) {\n';assert ann.count(needle)==1;ann=ann.replace(needle,needle+tailcut+'\n',1)
 return raw,ann,{'entry_cut':entry,'loop_invariant':inv,'tail_cut':tailcut,'call_bindings':records,'same_raw_tokens':True,'scope':'Current actual repaired C, fullscale/fullint16zero, single byte map permits input aliases, no complete proof from generation.'}
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--side',choices=['neon','rvv','both'],default='both');ap.add_argument('--timeout',type=int,default=21600);args=ap.parse_args();env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
 def one(side):
  raw,ann,meta=construct(side);af=P/'c'/(side+'.annotations.json');af.write_text(json.dumps(meta,indent=2)+'\n');run=Path(tempfile.mkdtemp(prefix=side+'-kernel-',dir=C/'.build'));prefix='#include "'+str(C/'shim'/('rvv_frontend_prefix.h'if side=='rvv'else'neon_frontend.h'))+'"\n'
  for label,s in [('original',raw),(side+'_unit',ann)]:
   src=run/(label+'.input.c');src.write_text(prefix+s);out=run/(label+'.c');r=subprocess.run(['gcc','-E','-P','-CC','-nostdinc',src,'-o',out],stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True);(run/(label+'-cpp.log')).write_text(r.stdout);assert r.returncode==0,r.stdout
  assert toks((run/'original.c').read_text())==toks((run/(side+'_unit.c')).read_text());cmd=['prlimit','--as=34359738368:34359738368','--','stdbuf','-oL','-eL','qcp','--arch=64','--endian=little','--no-exec-info','--strategy-application-limit=4096','--input-file='+str(run/(side+'_unit.c')),'--coq-output-dir='+str(run),'--coq-logic-path=Qs8Mul','-slp',str(C/'shim'),'Qs8Mul','-slp',str(P/'c'),'Qs8Mul'];work=run/'qcp-work';work.mkdir();t=time.monotonic()
  with(run/'qcp.log').open('w')as f:
   try:code=subprocess.run(cmd,cwd=work,env=env,stdout=f,stderr=f,timeout=args.timeout).returncode
   except subprocess.TimeoutExpired:code=124
  goal=run/(side+'_unit_goal.v');d={'generation_passed':code==0,'whole_kernel_verified':False,'run_directory':str(run),'exit_code':code,'seconds':time.monotonic()-t,'command':cmd,'raw_c_sha256':hashlib.sha256(raw.encode()).hexdigest(),'annotation_sha256':sha(af),'cpp_sha256':sha(run/(side+'_unit.c')),'same_raw_tokens':True,'same_frontend_cpp_tokens':True,'goal_sha256':sha(goal)if goal.exists()else None,'generated_c_vcs':len(re.findall(r'^Axiom proof_of_',goal.read_text(),re.M))if goal.exists()else 0};(run/'status.json').write_text(json.dumps(d,indent=2)+'\n');(P/(side+'-generation-status.json')).write_text(json.dumps(d,indent=2)+'\n');print(side,json.dumps(d),flush=True)
  if code:print((run/'qcp.log').read_text()[-3500:],flush=True)
  return d
 with ThreadPoolExecutor(max_workers=2)as pool:results=list(pool.map(one,['neon','rvv']if args.side=='both'else[args.side]))
 return 0 if all(r['generation_passed']for r in results)else 1
if __name__=='__main__':raise SystemExit(main())
