"""Generate actual original kernel VCs under separately reviewed intrinsic specs."""
from pathlib import Path
import argparse,re,json,subprocess,tempfile,time,hashlib
C=Path(__file__).resolve().parent.parent;H=C/'proof';R=next(p for p in C.parents if(p/'.git').exists());B=R/'verification/qcp/verified/f32-vadd';sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def tokens(t):return re.findall(r'\w+|[^\s\w]',re.sub(r'/\*.*?\*/|//[^\n]*','',t,flags=re.S))
def kernel_text(isa):
 raw=(C/'impl'/('testNEON.c'if isa=='neon'else'testRVV.c')).read_text();spec=(C/'spec.c').read_text();m=re.search(r'void test_'+isa+r'\([^;]+?(/\*@.*?\*/);',spec,re.S);assert m;contract=m[1];text=raw.replace('\n{','\n'+contract+'\n{',1);N='(batch@pre/4)';a='input@pre';o='output@pre';patches=[];where={};values='sqrt_'+('arm'if isa=='neon'else'rvv')+'_values';k='('+N+'-batch/4)'if isa=='neon'else'('+N+'-n)'
 def heap():return f'FloatArray::full({a},{N}+3,A) * FloatArray::seg({o},0,{k},{values}({k},A)) * FloatArray::undef_full(output,{N}-{k})'
 if isa=='neon':
  pure=f'unused_params == unused_params@pre && sizeof(float) == 4 && batch == 4*(batch/4) && batch % 4 == 0 && batch % sizeof(float) == 0 && 0 < {N} && {N} <= 4611686018427387903 && 0 <= batch/4 && batch/4 <= {N} && input == pointer_offset({a},{k},float) && output == pointer_offset({o},{k},float)'
  entry=f'/*@ Assert unused_params == unused_params@pre && batch == batch@pre && input == input@pre && output == output@pre && 0 < batch && batch <= 18446744073709551615 && batch % 4 == 0 && input != 0 && output != 0 && sizeof(float) == 4 && batch % sizeof(float) == 0 && 0 < {N} && {N} <= 4611686018427387903 && FloatArray::full(input,{N}+3,A) * FloatArray::undef_full(output,{N}) */'
  text=text.replace('  assert(batch != 0);',entry+'\n  assert(batch != 0);',1)
  anchor='  for (; batch >= 4 * sizeof(float); batch -= 4 * sizeof(float)) {';cut='/*@ Inv Assert '+pure+' && '+heap()+' */';assert text.count(anchor)==1;text=text.replace(anchor,cut+'\n'+anchor);patches.append({'anchor':anchor,'annotation':cut})
  def fields(v,count,fun):return ' * '.join('store(&('+v+'.s'+str(i)+'),float,'+fun(i)+')'for i in range(count))
  tailheap=heap()+' * '+fields('vx',4,lambda i:f'sqrt_lane({k}+{i},A)')+' * '+fields('vy',4,lambda i:f'sqrt_arm(sqrt_lane({k}+{i},A))')+' * '+fields('vy_lo',2,lambda i:f'sqrt_arm(sqrt_lane({k}+{i},A))')
  anchor='    if (batch & (2 * sizeof(float))) {'
  cut='/*@ Assert '+' || '.join('('+pure+' && batch == '+str(b)+' && '+tailheap+')'for b in [4,8,12])+' */'
  assert text.count(anchor)==1;text=text.replace(anchor,cut+'\n'+anchor);patches.append({'anchor':anchor,'annotation':cut})
  where['vld1q_f32(input)']=f'base={a},total={N}+3,k={k},A=A';where['vsqrtq_f32(vx)']='a=&vx,x0=vx.s0,x1=vx.s1,x2=vx.s2,x3=vx.s3';where['vget_low_f32(vy)']='a=&vy,x0=vy.s0,x1=vy.s1,x2=vy.s2,x3=vy.s3';where['vget_high_f32(vy)']=where['vget_low_f32(vy)']
 else:
  pure=f'unused_params == unused_params@pre && sizeof(float) == 4 && batch == batch@pre && batch % 4 == 0 && batch % sizeof(float) == 0 && 0 < {N} && {N} <= 4611686018427387903 && 0 <= n && n <= {N} && input == pointer_offset({a},{k},float) && output == pointer_offset({o},{k},float)'
  entry=f'/*@ Assert unused_params == unused_params@pre && batch == batch@pre && input == input@pre && output == output@pre && 0 < batch && batch <= 18446744073709551615 && batch % 4 == 0 && input != 0 && output != 0 && sizeof(float) == 4 && batch % sizeof(float) == 0 && 0 < {N} && {N} <= 4611686018427387903 && FloatArray::full(input,{N}+3,A) * FloatArray::undef_full(output,{N}) */';text=text.replace('  assert(batch != 0);',entry+'\n  assert(batch != 0);',1)
  anchor='  while (n > 0) {';cut='/*@ Inv Assert '+pure+' && '+heap()+' */';assert text.count(anchor)==1;text=text.replace(anchor,cut+'\n'+anchor);patches.append({'anchor':anchor,'annotation':cut})
  where['__riscv_vle32_v_f32m8(input, vl)']=f'base={a},total={N}+3,k={k},A=A';where['__riscv_vfsqrt_v_f32m8(vx, vl)']='a=&vx,'+','.join('x'+str(i)+'=vx.s'+str(i)for i in range(32))
 for call,binding in where.items():assert call in text;text=text.replace(call,call+' /*@ where '+binding+' */')
 assert tokens(text)==tokens(raw)
 return raw,text,dict(contract=contract,entry_assertion=entry,invariants=patches,where=where,source_sha256=sha(C/'impl'/('testNEON.c'if isa=='neon'else'testRVV.c')))
def kernel_header(isa):return '#include "'+str(C/'shim/intrinsics.h')+'"\n/*@ include strategies "sqrt_arrays.strategies" */\n'
def main():
 p=argparse.ArgumentParser();p.add_argument('--isa',choices=['neon','rvv'],required=True);p.add_argument('--timeout',type=int,default=21600);a=p.parse_args();assert 0<a.timeout<=21600
 run=Path(tempfile.mkdtemp(prefix=a.isa+'-kernel-',dir=C/'.build'));stem=a.isa+'_unit';raw,text,ann=kernel_text(a.isa);(H/'c'/(a.isa+'.annotations.json')).write_text(json.dumps(ann,indent=2)+'\n');recs=[];s=dict(generation_passed=False,whole_kernel_verified=False,run_directory=str(run),records=recs,isa=a.isa)
 def execute(cmd,label,limit,timeout):
  cmd=['prlimit','--as='+str(limit*1024**3)+':'+str(limit*1024**3),'--',*map(str,cmd)];log=run/(label+'.log');t=time.monotonic()
  with log.open('w')as f:
   try:ec=subprocess.run(cmd,cwd=run,stdout=f,stderr=f,timeout=timeout).returncode
   except subprocess.TimeoutExpired:ec=124
  recs.append(dict(label=label,command=cmd,exit_code=ec,seconds=time.monotonic()-t,log_sha256=sha(log)));print(label,ec,flush=True);assert ec==0,label
 try:
  for n,body in [('raw',raw),(stem,text)]:
   q=run/(n+'.raw.c');q.write_text(kernel_header(a.isa)+body);execute(['gcc','-E','-P','-CC','-nostdinc',q,'-o',run/(n+'.c')],n+'-cpp',16,120)
  assert tokens((run/'raw.c').read_text())==tokens((run/(stem+'.c')).read_text())
  slp=['-slp',str(C/'shim'),'Sqrt','-slp',str(H/'c'),'Sqrt']
  for d in sorted((B/'proof/c').iterdir()):
   if d.is_dir():slp+=['-slp',str(d),d.name]
  execute(['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit=8192','--input-file='+str(run/(stem+'.c')),'--coq-output-dir='+str(run),'--coq-logic-path=Sqrt',*slp],'qcp',32,a.timeout)
  goal=run/(stem+'_goal.v');fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert fields;s.update(generation_passed=True,fields=fields,generated_c_vcs=len(fields),goal_sha256=sha(goal),cpp_sha256=sha(run/(stem+'.c')),raw_cpp_tokens_preserved=True,original_tokens_unchanged=True)
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');print(run)
if __name__=='__main__':main()
