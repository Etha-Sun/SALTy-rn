from pathlib import Path
import argparse,hashlib,json,subprocess,os,tempfile,shutil,re,time
c=Path(__file__).resolve().parent.parent;root=next(p for p in c.parents if(p/'.git').exists());pa=argparse.ArgumentParser();pa.add_argument('--core',type=Path,required=True);a=pa.parse_args();core=a.core.resolve();run=Path(tempfile.mkdtemp(prefix='pointer-probe-recheck-',dir=c/'.build'));coq=run/'coq';coq.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();records=[];s={'passed':False,'whole_kernel_verified':False,'scope':'actual diagnostic C probe typed proof; same-source checked dependency bundle reuse, no new whole-case claim','run_directory':str(run),'dependency_core':str(core),'records':records}
try:
 for p in core.glob('*.v'):
  public=c/'proof/coq'/p.name
  if p.name=='PointerProbeChecked.v':continue
  if public.exists():assert p.read_bytes()==public.read_bytes(),p.name
  shutil.copyfile(p,coq/p.name)
 for p in core.glob('*.vo'):
  if p.stem!='PointerProbeChecked':shutil.copyfile(p,coq/p.name)
 flags=json.loads((root/'.build/simple-kernels-bootstrap/coq-flags.json').read_text())['flags'][2:]+['-Q',str(coq),'Qs8Rdsum'];env={**os.environ,'PATH':str(root/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
 source=c/'proof/diagnostics/pointer-units/pointer_loop_probe.c';cpp=run/'current.c';subprocess.run(['gcc','-E','-P','-CC','-nostdinc',source,'-o',cpp],cwd=run,check=True);assert cpp.read_bytes()==(core.parent/'pointer_loop_probe.c').read_bytes(),'Current CPP differs from actual generated target'
 shutil.copyfile(c/'proof/coq/PointerProbeChecked.v',coq/'PointerProbeChecked.v');goal=coq/'pointer_loop_probe_goal.v';names=re.findall(r'^Axiom proof_of_(\w+) :',goal.read_text(),re.M);assert names
 (coq/'FinalPointerProbeCheck.v').write_text('From Qs8Rdsum Require Import pointer_loop_probe_goal PointerProbeChecked.\nModule Actual : Qs8Rdsum.pointer_loop_probe_goal.VC_Correct := Qs8Rdsum.PointerProbeChecked.CheckedPointerProbe.\n'+''.join('Print Assumptions Actual.proof_of_'+n+'.\n'for n in names))
 for stem in ['PointerProbeChecked','FinalPointerProbeCheck']:
  cmd=['prlimit','--as=17179869184:17179869184','--','qcp-env','coqc','-time',*flags,str(coq/(stem+'.v'))];wd=run/stem;wd.mkdir();log=run/(stem+'.log');t=time.monotonic()
  with log.open('w')as f:code=subprocess.run(cmd,cwd=wd,env=env,stdout=f,stderr=f,timeout=3600).returncode
  records.append(dict(module=stem,command=cmd,exit_code=code,seconds=time.monotonic()-t,source_sha256=sha(coq/(stem+'.v')),log_sha256=sha(log)));print(stem,code,flush=True)
  if code:raise RuntimeError(log.read_text()[-5000:])
 text=(run/'FinalPointerProbeCheck.log').read_text();assert len(re.findall(r'^(?:Axioms:|Closed under the global context)',text,re.M))==len(names);s.update(passed=True,vc_correct_passed=True,actual_c_vcs=len(names),fields=names,goal_sha256=sha(goal),cpp_sha256=sha(cpp),typed_instance='Qs8Rdsum.PointerProbeChecked.CheckedPointerProbe')
except Exception as e:s['error']=str(e);print(e,flush=True)
s['proof_source_sha256']={p.name:sha(p)for p in coq.glob('*.v')};s['dependency_vo_sha256']={p.name:sha(p)for p in core.glob('*.vo')if p.stem!='PointerProbeChecked'}
for p in[run/'status.json',c/'proof/pointer-probe-recheck-status.json']:p.write_text(json.dumps(s,indent=2)+'\n')
print(run,flush=True);raise SystemExit(0 if s['passed']else 1)
