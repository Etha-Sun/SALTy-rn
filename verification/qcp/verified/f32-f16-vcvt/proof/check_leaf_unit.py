#!/usr/bin/env python3
"""Fresh live C unit plus recursive Coq support and exact typed field closure."""
from pathlib import Path
import argparse,json,hashlib,re,shutil,subprocess,tempfile,time,concurrent.futures
H=Path(__file__).resolve().parent;C=H.parent;R=next(p for p in C.parents if(p/'.git').exists());sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--stem',required=True);ap.add_argument('--support',required=True);ap.add_argument('--tactic',required=True);ap.add_argument('--module',required=True);ap.add_argument('--jobs',type=int,default=16);ap.add_argument('--timeout',type=int,default=3600);a=ap.parse_args();assert all(re.fullmatch(r'\w+',x)for x in [a.stem,a.support,a.tactic,a.module])and 1<=a.jobs<=16 and 0<a.timeout<=14400
 run=Path(tempfile.mkdtemp(prefix=a.stem+'-proof-',dir=C/'.build'));coq=run/'coq';coq.mkdir();records=[];s={'passed':False,'whole_kernel_verified':False,'scope':'one_actual_C_unit_only','run_directory':str(run),'records':records};sources=[C/'shim'/(a.stem+'.c'),*sorted((C/'shim').glob('*.h')),Path(__file__)];inputs={str(p.relative_to(C)):sha(p)for p in sources};s['input_sha256']=inputs
 cfg=json.loads((R/'.build/simple-kernels-bootstrap/coq-flags.json').read_text());dep=R/'verification/qcp/verified/f32-vadd/.build/full-1f5wequq/coq';flags=cfg['flags']+sum((['-Q',str(p),''if p.name=='relations'else p.name]for p in sorted(dep.iterdir())if p.is_dir()),[])+['-Q',str(coq),'F32F16'];copied={}
 def execute(cmd,label):
  cmd=list(map(str,cmd));work=run/'jobs'/label;work.mkdir(parents=True);log=run/(label+'.log');t=time.monotonic()
  with log.open('w')as f:
   try:ec=subprocess.run(['prlimit','--as=17179869184:17179869184','--']+cmd,cwd=work,stdout=f,stderr=f,timeout=a.timeout).returncode
   except subprocess.TimeoutExpired:ec=124
  rec={'label':label,'command':cmd,'exit_code':ec,'seconds':time.monotonic()-t,'log_sha256':sha(log)};records.append(rec);print(label,ec,flush=True);return ec
 def visit(n):
  if n in copied:return
  p=H/'coq'/(n+'.v');t=p.read_text();clean=re.sub(r'\(\*.*?\*\)','',t,flags=re.S);assert n.endswith('_goal')or not re.search(r'\b(?:Axiom|Parameter|Admitted|admit|Abort)\b',clean),n
  deps=[]
  for m in re.finditer(r'From\s+F32F16\s+Require\s+(?:Import|Export)\s+([^.]*)\.',clean):deps+=m[1].split()
  copied[n]=sha(p)
  for d in sorted(set(deps)):visit(d)
  shutil.copyfile(p,coq/p.name);assert execute(flags+[coq/p.name],n)==0,n
 try:
  assert execute(['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(C/'shim'/(a.stem+'.c')),'--coq-output-dir='+str(coq),'--coq-logic-path=F32F16','-slp',C/'shim','F32F16'],'qcp')==0,'QCP failed'
  goaltext=(coq/(a.stem+'_goal.v')).read_text();fs=re.findall(r'^Axiom proof_of_(\w+)\s*:',goaltext,re.M);assert fs;visit(a.support)
  gdeps=[]
  for m in re.finditer(r'From\s+F32F16\s+Require\s+(?:Import|Export)\s+([^.]*)\.',goaltext):gdeps+=m[1].split()
  gdeps+=re.findall(r'Require\s+(?:Import|Export)\s+F32F16\.(\w+)\.',goaltext)
  for name in sorted(set(gdeps)):visit(name)
  assert execute(flags+[coq/(a.stem+'_goal.v')],a.stem+'_goal')==0
  names=[]
  for i in range(min(a.jobs,len(fs))):
   n=a.module+'Part'+str(i);names.append(n);text='From F32F16 Require Import '+a.support+' '+a.stem+'_goal.\nImport Snaive_C_Rules64. Local Open Scope Z_scope. Local Open Scope sac.\nModule Checked'+n+'.\n'
   for f in fs[i::a.jobs]:text+=f'Lemma proof_of_{f} : F32F16.{a.stem}_goal.{f}.\nProof. unfold F32F16.{a.stem}_goal.{f}; {a.tactic}. Qed.\n'
   (coq/(n+'.v')).write_text(text+'End Checked'+n+'.\n')
  codes=list(concurrent.futures.ThreadPoolExecutor(max_workers=a.jobs).map(lambda n:execute(flags+[coq/(n+'.v')],n),names));assert not any(codes),'C field proof failed'
  text='From F32F16 Require Import '+a.stem+'_goal '+' '.join(names)+'.\nModule Checked'+a.module+' : F32F16.'+a.stem+'_goal.VC_Correct.\n'+''.join('Include '+n+'.Checked'+n+'.\n'for n in names)+'End Checked'+a.module+'.\n'+'\n'.join('Print Assumptions Checked'+a.module+'.proof_of_'+f+'.'for f in fs)+'\n';(coq/(a.module+'Checked.v')).write_text(text);assert execute(flags+[coq/(a.module+'Checked.v')],a.module+'Checked')==0,'Typed gate failed'
  for n in names+[a.module+'Checked',a.stem+'_goal']:shutil.copyfile(coq/(n+'.v'),H/'coq'/(n+'.v'))
  assert all(sha(C/p)==h for p,h in inputs.items());assert all(sha(H/'coq'/(n+'.v'))==h for n,h in copied.items());s.update(passed=True,vc_correct_passed=True,checked_c_vcs=len(fs),goal_sha256=sha(coq/(a.stem+'_goal.v')),fields=fs,checked_module='F32F16.'+a.module+'Checked.Checked'+a.module,source_sha256={**inputs,**{'proof/coq/'+n+'.v':h for n,h in copied.items()},**{'proof/coq/'+n+'.v':sha(coq/(n+'.v'))for n in names+[a.module+'Checked']}})
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');(H/(a.stem+'-status.json')).write_text(json.dumps(s,indent=2)+'\n');print(run,flush=True);raise SystemExit(0 if s['passed'] else 1)
if __name__=='__main__':main()
