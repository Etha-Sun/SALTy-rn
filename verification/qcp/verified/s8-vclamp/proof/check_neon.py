#!/usr/bin/env python3
"""Check the original signed-clamp NEON C kernel and its complete typed interface."""
import argparse,concurrent.futures,hashlib,importlib.util,json,re,shutil,subprocess,tempfile,time
from pathlib import Path
CASE=Path(__file__).resolve().parent.parent
NS='S8Clamp'
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def local_imports(text):
 text=re.sub(r'\(\*.*?\*\)','',text,flags=re.S);out=set()
 for m in re.finditer(r'(?:From\s+([\w.]+)\s+)?Require\s+(?:Import\s+|Export\s+)?(.+?)\.(?=\s|$)',text,re.S):
  prefix,items=m.groups()
  for name in items.split():
   full=(prefix+'.' if prefix else '')+name
   if full.startswith(NS+'.'):out.add(full[len(NS)+1:])
 return out

def main():
 ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--config',type=Path,required=True);ap.add_argument('--jobs',type=int,choices=range(1,17),default=16)
 ap.add_argument('--generation-run',type=Path,help='Use a prior actual QCP goal only after exact live CPP and goal identity checks; otherwise generate afresh.')
 args=ap.parse_args();driver_start=sha(Path(__file__));config_start=sha(args.config);generation_status_start=sha(CASE/'proof/neon-generation-status.json');run=Path(tempfile.mkdtemp(prefix='neon-proof-',dir=CASE/'.build'));coq=run/'coq';coq.mkdir();(run/'jobs').mkdir();records=[]
 status=dict(passed=False,vc_correct_passed=False,whole_kernel_verified=False,scope='Original NEON actual C body under separately checked callee contracts; paired whole-case gate still required',run_directory=str(run),records=records,limits=dict(jobs=args.jobs,per_process_address_space_bytes=17179869184,qcp_seconds=1200,coq_module_seconds=1800))
 def execute(cmd,label,budget=1800):
  job=run/'jobs'/label;job.mkdir(exist_ok=True);log=run/(label+'.log');cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];start=time.monotonic()
  with log.open('w')as out:
   try:r=subprocess.run(cmd,cwd=job,stdout=out,stderr=out,timeout=budget);rc=r.returncode
   except subprocess.TimeoutExpired:rc=124
  d=dict(label=label,command=cmd,cwd=str(job),exit_code=rc,seconds=time.monotonic()-start,log_sha256=sha(log));records.append(d)
  if rc:raise RuntimeError(label+': '+log.read_text()[-3500:])
  return d
 try:
  spec=importlib.util.spec_from_file_location('s8_live_neon',CASE/'proof/generate_neon.py');gen=importlib.util.module_from_spec(spec);spec.loader.exec_module(gen)
  current,original=gen.text();(run/'neon_unit.raw.c').write_text(current);(run/'original.raw.c').write_text(original)
  for label in ['neon_unit','original']:
   execute(['gcc','-E','-P','-CC','-nostdinc',run/(label+'.raw.c'),'-o',run/(label+'.c')],label+'-cpp',120)
  if gen.tokens((run/'neon_unit.c').read_text())!=gen.tokens((run/'original.c').read_text()):raise ValueError('Original NEON same-frontend executable tokens changed')
  canonical=json.loads((CASE/'proof/neon-generation-status.json').read_text())
  for name,h in canonical['live_source_sha256'].items():
   if sha(CASE/name)!=h:raise ValueError('NEON generation input changed: '+name)
  if args.generation_run:
   prior=args.generation_run.resolve();goal=prior/'generated/neon_unit_goal.v';prior_status=json.loads((prior/'status.json').read_text())
   if not prior_status.get('passed') or sha(goal)!=canonical['goal_sha256'] or (prior/'neon_unit.c').read_bytes()!=(run/'neon_unit.c').read_bytes():raise ValueError('Prior generation does not match current exact live CPP/goal')
   status['qcp_generation_reused']=True;status['generation_run_directory']=str(prior)
  else:
   out=run/'generated';out.mkdir();execute(['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit','1024','--input-file='+str(run/'neon_unit.c'),'--coq-output-dir='+str(out),'--coq-logic-path='+NS,'-slp',CASE/'shim',NS,'-slp',CASE/'proof/c',NS],'qcp',1200);goal=out/'neon_unit_goal.v';status['qcp_generation_reused']=False
   if sha(goal)!=canonical['goal_sha256']:raise ValueError('Fresh actual NEON goal differs from frozen checked interface')
  shutil.copyfile(goal,coq/'neon_unit_goal.v');fields=re.findall(r'^Axiom proof_of_(\w+) :',goal.read_text(),re.M)
  if len(fields)!=248:raise ValueError('Expected original NEON 248 actual C fields')
  tool=Path(shutil.which('qcp')).resolve().parent/'StrategyCheck';strategy_rows=[]
  for stem,path,checked in [('s8_arrays','proof/c/s8_arrays.strategies','S8ArraysStrategy.CheckedS8Arrays'),('signed_tail','shim/signed_tail.strategies','signed_tail_strategy_proof.CheckedSignedTailStrategy'),('s8_neon_memory','proof/c/s8_neon_memory.strategies','NeonMemoryStrategy.CheckedNeonMemoryStrategy')]:
   out=run/('strategy-'+stem);out.mkdir();execute([tool,'--arch=64','--endian=little','--no-exec-info','--input-file='+str(CASE/path),'--coq-output-dir='+str(out),'--coq-logic-path='+NS],'strategy-'+stem,120)
   g=out/(stem+'_strategy_goal.v');shutil.copyfile(g,coq/g.name);names=re.findall(r'^  Axiom (\w+) :',g.read_text(),re.M);strategy_rows.append(dict(stem=stem,fields=names,checked_module=NS+'.'+checked,goal_sha256=sha(g)))
  sources={};deps={};visiting=set()
  def collect(name):
   if name in visiting:raise ValueError('Cyclic local proof dependency: '+name)
   if name in sources:return
   visiting.add(name);src=coq/(name+'.v')
   if not src.exists():
    public=CASE/'proof/coq'/(name+'.v')
    if not public.exists():raise ValueError('Missing checked source '+str(public))
    text=public.read_text()
    if re.search(r'\b(?:Admitted|Axiom|Parameter)\b',re.sub(r'\(\*.*?\*\)','',text,flags=re.S)):raise ValueError('Unproved public declaration in '+name)
    shutil.copyfile(public,src)
   sources[name]=src;deps[name]=local_imports(src.read_text())
   for d in deps[name]:collect(d)
   visiting.remove(name)
  collect('NeonKernelChecked');flags=list(json.loads(args.config.read_text())['flags'])+['-Q',str(coq),NS];done=set();active={};todo=set(sources)
  with concurrent.futures.ThreadPoolExecutor(max_workers=args.jobs)as pool:
   while todo or active:
    for n in sorted(todo.copy()):
     if len(active)>=args.jobs:break
     if deps[n]<=done:active[pool.submit(execute,[*flags,sources[n]],n)]=n;todo.remove(n)
    if not active:raise RuntimeError('Unresolved local Coq dependency graph')
    completed,_=concurrent.futures.wait(active,return_when=concurrent.futures.FIRST_COMPLETED)
    for f in completed:done.add(active.pop(f));f.result()
  gate=['From S8Clamp Require Import neon_unit_goal NeonKernelChecked.','Module Typed : S8Clamp.neon_unit_goal.VC_Correct := S8Clamp.NeonKernelChecked.CheckedNeonKernel.']
  gate+=['Print Assumptions Typed.proof_of_'+n+'.'for n in fields]
  for row in strategy_rows:
   alias='Typed_'+row['stem'];gate+=['Module '+alias+' : S8Clamp.'+row['stem']+'_strategy_goal.'+row['stem']+'_Strategy_Correct := '+row['checked_module']+'.'];gate+=['Print Assumptions '+alias+'.'+n+'.'for n in row['fields']]
  (coq/'NeonKernelGate.v').write_text('\n'.join(gate)+'\n');execute([*flags,coq/'NeonKernelGate.v'],'NeonKernelGate')
  public_names=['proof/check_neon.py','proof/neon-generation-status.json']+[str((CASE/'proof/coq'/(n+'.v')).relative_to(CASE))for n in sources if(CASE/'proof/coq'/(n+'.v')).exists()]
  inputs={**canonical['live_source_sha256'],**{n:sha(CASE/n)for n in public_names}}
  inputs['proof/check_neon.py']=driver_start;inputs['proof/neon-generation-status.json']=generation_status_start
  if sha(args.config)!=config_start:raise ValueError('Coq configuration changed during run')
  for n,h in inputs.items():
   if sha(CASE/n)!=h:raise ValueError('NEON proof input drift: '+n)
  for n,src in sources.items():
   public=CASE/'proof/coq'/(n+'.v')
   if public.exists()and sha(public)!=sha(src):raise ValueError('Compiled source no longer matches public '+n)
  status.update(passed=True,vc_correct_passed=True,checked_c_vcs=len(fields),actual_c_vcs=len(fields),fields=fields,checked_module='S8Clamp.NeonKernelChecked.CheckedNeonKernel',goal_sha256=sha(coq/'neon_unit_goal.v'),cpp_sha256=sha(run/'neon_unit.c'),input_sha256=inputs,compiled_source_sha256={NS+'.'+n:sha(src)for n,src in sources.items()},strategies=strategy_rows,checked_strategy_fields=sum(len(x['fields'])for x in strategy_rows),fresh_compiled_local_modules=len(sources)+1,config_sha256=config_start,no_component_vo_reused=True,same_frontend_cpp_tokens_identical=True,final_gate_sha256=sha(coq/'NeonKernelGate.v'),final_assumptions_log_sha256=sha(run/'NeonKernelGate.log'))
 except Exception as e:status['error']=str(e)
 (run/'status.json').write_text(json.dumps(status,indent=2)+'\n');dest=CASE/'proof/neon-proof-status.json'
 if dest.exists():
  old=dest.read_bytes();(CASE/'proof/history'/('neon-proof-status-'+hashlib.sha256(old).hexdigest()+'.json')).write_bytes(old)
 dest.write_text(json.dumps(status,indent=2)+'\n');print(json.dumps({k:status.get(k)for k in ['passed','run_directory','checked_c_vcs','error']},indent=2));return 0 if status['passed']else 1
if __name__=='__main__':raise SystemExit(main())
