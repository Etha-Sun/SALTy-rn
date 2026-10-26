#!/usr/bin/env python3
"""Fresh actual-C goal generation; automatic Float record definitions are rejected.
The actual goal stays byte-identical; the per-TU definition module explicitly
exports the single faithful fp32/Float, Arch64LE VectorRecords representation.
This command alone grants no complete C or kernel proof credit.
"""
from pathlib import Path
import argparse,hashlib,json,os,re,shutil,subprocess,tempfile,time
C=Path(__file__).resolve().parents[1];R=C.parents[3]
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--source',required=True);ap.add_argument('--stem',required=True);ap.add_argument('--timeout',type=int,default=7200);a=ap.parse_args();assert re.fullmatch(r'[a-z][a-z_0-9]*',a.stem)and 0<a.timeout<=21600
 assert not json.loads((R/'.build/memory/quota/state.json').read_text())['wind_down_requested']
 source=(C/a.source).resolve();assert source.is_relative_to(C)
 run=Path(tempfile.mkdtemp(prefix=a.stem+'-generation-',dir=C/'.build'));gen=run/'generated';gen.mkdir();records=[]
 sources=[source,Path(__file__),*sorted((C/'shim').glob('*.h')),*sorted((C/'proof/coq').glob('*.v'))];sources=list(dict.fromkeys(sources));inputs={str(p.relative_to(C)):sha(p)for p in sources}
 s=dict(passed=False,whole_kernel_verified=False,scope='fresh actual C goal generation only',run_directory=str(run),actual_source=a.source,stem=a.stem,input_sha256=inputs,configured_jobs=32,max_live_processes=1,per_process_memory_GiB=16,records=records)
 env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
 try:
  pp=run/(a.stem+'.c')
  for label,cmd in [('cpp',['gcc','-E','-P','-CC','-nostdinc',str(source),'-o',str(pp)]),('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit=8192','--input-file='+str(pp),'--coq-output-dir='+str(gen),'--coq-logic-path=ExpMinusMax','-slp',str(C/'shim'),'ExpMinusMax'])]:
   cmd=['prlimit','--as=17179869184:17179869184','--']+cmd;log=run/(label+'.log');t=time.monotonic()
   try:
    with log.open('w')as f:ec=subprocess.run(cmd,cwd=run,env=env,stdout=f,stderr=f,timeout=a.timeout).returncode
   except subprocess.TimeoutExpired:ec=124
   records.append(dict(label=label,command=cmd,exit_code=ec,seconds=time.monotonic()-t,log_sha256=sha(log)));assert ec==0,log.read_text()[-4000:]
  gp=gen/(a.stem+'_goal.v');fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',gp.read_text(),re.M);assert fields
  assert inputs=={n:sha(C/n)for n in inputs},'input changed during generation'
  emitted=gen/(a.stem+'_def.v');e=emitted.read_text();rejected=[]
  if re.search(r'float32\w*_s\d+\s*:\s*R\b',e):rejected.append('automatic Float field uses R and Int, rejected')
  if 'Import naive_C_Rules.'in e:rejected.append('automatic naive_C_Rules32/BigEndian configuration, rejected')
  canonical=C/'proof/coq'/(a.stem+'_def.v');canonical.write_text('From ExpMinusMax Require Export VectorRecords.\n')
  dest=C/'proof/coq'/gp.name
  if dest.exists():assert dest.read_bytes()==gp.read_bytes(),'existing actual goal changed; preserve before replacement'
  else:dest.write_bytes(gp.read_bytes())
  s.update(passed=True,actual_C_fields=len(fields),fields=fields,goal_path=str(gp),goal_sha256=sha(gp),actual_CPP_sha256=sha(pp),raw_definition_sha256=sha(emitted),raw_definition_rejected=rejected,canonical_definition_export_sha256=sha(canonical),canonical_vector_representation_sha256=sha(C/'proof/coq/VectorRecords.v'))
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');out=C/'proof'/(a.stem+'-generation-status.json')
 if out.exists():
  h=C/'proof/history';h.mkdir(exist_ok=True);shutil.copy2(out,h/(out.stem+'-'+sha(out)+'.json'))
 out.write_bytes((run/'status.json').read_bytes());print(json.dumps({k:s.get(k)for k in ['passed','run_directory','actual_C_fields','error']}),flush=True);return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
