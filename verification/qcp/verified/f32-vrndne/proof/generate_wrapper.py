#!/usr/bin/env python3
"""Fresh full public read/observation/comparator/caller TU from live spec.c."""
from pathlib import Path
import importlib.util,json,re,hashlib,subprocess,tempfile,time
H=Path(__file__).resolve().parent;C=H.parent;R=next(p for p in C.parents if (p/'.git').exists());B=R/'verification/qcp/verified/f32-vadd';sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def wrapper_text():
 spec=(C/'spec.c').read_text();m=importlib.util.spec_from_file_location('rndne_base_prepare',B/'proof/prepare.py');prepare=importlib.util.module_from_spec(m);m.loader.exec_module(prepare);names=['test_neon','test_rvv','qcp_vadd_read','preserve_float','check_observation','same_lane','compare_outputs','equivalent'];fs={n:prepare.function(spec,n)for n in names};pre=spec[:min(spec.index(t)for t in fs.values())];parts=[pre,'/*@ include strategies "comparator.strategies" */','/*@ include strategies "wrapper.strategies" */'];patches={}
 for n in names:
  t=fs[n];rows=[]
  if n=='compare_outputs':
   ann=json.loads((B/'proof/c/VaddComparator/comparator.annotations.json').read_text())['compare_outputs'][0];ann={**ann,'text':ann['text'].replace('4611686018427387900','4611686018427387903')};rows.append(ann)
  if n=='equivalent':
   first='''/*@ Assert n == (n * sizeof(float))/4 && (n * sizeof(float))%4 == 0 &&
 0 < n * sizeof(float) && n * sizeof(float) <= 18446744073709551615 &&
 n == n@pre && input == input@pre && left == left@pre && right == right@pre && params == params@pre &&
 0 < n && n <= 4611686018427387903 && input != 0 && left != 0 && right != 0 &&
 FloatArray::full(input,n+3,A) * FloatArray::undef_full(left,n) * FloatArray::undef_full(right,n) */''';rows.append({'before':'test_neon(n * sizeof(float)','text':first})
   second='''/*@ Assert n == n@pre && input == input@pre && left == left@pre && right == right@pre && params == params@pre &&
 0 < n && n <= 4611686018427387903 && outputs_related(rndne_values(n,A),rndne_rvv_values(n,A)) &&
 FloatArray::full(input,n+3,A) * FloatArray::full(left,n,rndne_values(n,A)) * FloatArray::full(right,n,rndne_rvv_values(n,A)) */''';rows.append({'before':'return compare_outputs(n,left,right);','text':second})
  for row in rows:
   assert t.count(row['before'])==1,(n,row['before']);t=t.replace(row['before'],row['text']+'\n'+row['before'],1)
  assert prepare.tokens(t)==prepare.tokens(fs[n]),'Public C executable tokens changed';patches[n]=rows;parts.append(t)
 return spec,'\n\n'.join(parts),patches
def main():
 run=Path(tempfile.mkdtemp(prefix='wrapper-',dir=C/'.build'));raw,text,patches=wrapper_text();(H/'c/wrapper.annotations.json').write_text(json.dumps(patches,indent=2)+'\n');records=[];s={'generation_passed':False,'whole_kernel_verified':False,'run_directory':str(run),'public_spec_sha256':sha(C/'spec.c'),'records':records}
 def execute(cmd,label,budget=1800):
  cmd=list(map(str,cmd));log=run/(label+'.log');start=time.monotonic()
  try:
   with log.open('w')as f:r=subprocess.run(['prlimit','--as='+str(16*1024**3),'--']+cmd,cwd=run,stdout=f,stderr=f,timeout=budget)
   ec=r.returncode
  except subprocess.TimeoutExpired:ec=124
  records.append({'command':cmd,'label':label,'exit_code':ec,'seconds':time.monotonic()-start,'log_sha256':sha(log)});print(label,ec,flush=True);return ec
 try:
  for n,body in [('raw',raw),('wrapper_unit',text)]:
   p=run/(n+'.raw.c');p.write_text(body);assert execute(['gcc','-E','-P','-CC','-nostdinc','-I',C,p,'-o',run/(n+'.c')],n+'-cpp',60)==0
  def tokens(t):return re.findall(r'\w+|[^\w\s]',re.sub(r'/\*.*?\*/|//[^\n]*','',t,flags=re.S))
  assert tokens((run/'raw.c').read_text())==tokens((run/'wrapper_unit.c').read_text())
  cmd=['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit=1024','--input-file='+str(run/'wrapper_unit.c'),'--coq-output-dir='+str(run),'--coq-logic-path=Rndne','-slp',str(C/'shim'),'Rndne','-slp',str(H/'c'),'Rndne']
  for d in sorted((B/'proof/c').iterdir()):
   if d.is_dir():cmd+=['-slp',str(d),d.name]
  assert execute(cmd,'qcp')==0,'actual public C QCP failed';p=run/'wrapper_unit_goal.v';fs=re.findall(r'^Axiom proof_of_(\w+)\s*:',p.read_text(),re.M);assert fs;s.update(generation_passed=True,actual_c_fields=len(fs),fields=fs,goal_sha256=sha(p),cpp_sha256=sha(run/'wrapper_unit.c'),same_frontend_cpp_tokens_preserved=True);__import__('shutil').copyfile(p,H/'coq/wrapper_unit_goal.v')
 except Exception as e:s['error']=str(e)
 (run/'generation-status.json').write_text(json.dumps(s,indent=2)+'\n');(H/'wrapper-generation-status.json').write_text(json.dumps(s,indent=2)+'\n');print(run);raise SystemExit(0 if s['generation_passed'] else 1)
if __name__=='__main__':main()
