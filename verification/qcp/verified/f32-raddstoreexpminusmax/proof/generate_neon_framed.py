#!/usr/bin/env python3
"""Preserve all three dead C-argument stack cells at the final assertion.
Private alternate generation only; the current public goal is not replaced.
No C token, public contract, or mathematical model changes are made.
"""
from pathlib import Path
import argparse,hashlib,json,re,os,subprocess,tempfile,time
import generate_neon_staged as S
C=S.C;B=S.B;R=B.R;sha=B.sha;tokens=B.tokens
EXTRA_INPUTS=[Path(__file__).resolve(),Path(S.__file__).resolve()]
def prefix():return B.prefix()
def render():
 raw,s=S.render()
 anchor='exists (A:Recordfloat32x4_t)(Y:fp32),max==M'
 # The base renderer currently writes the compact annotation syntax below.
 if anchor not in s:anchor='exists(A:Recordfloat32x4_t)(Y:fp32),max==M'
 assert s.count(anchor)==1
 replacement=anchor.replace(',max==M','(FinalBatch:Z)(FinalInput:Z)(FinalOutput:Z),batch==FinalBatch&&input==FinalInput&&output==FinalOutput&&max==M')
 s=s.replace(anchor,replacement)
 assert tokens(s)==tokens(raw)
 return raw,s

def main():
 ap=argparse.ArgumentParser();ap.add_argument('--prepare-only',action='store_true');ap.add_argument('--memory-gib',type=int,choices=[16,32],default=32);ap.add_argument('--timeout',type=int,default=21600);a=ap.parse_args();assert 0<a.timeout<=21600
 assert not json.loads((R/'.build/memory/quota/state.json').read_text())['wind_down_requested']
 run=Path(tempfile.mkdtemp(prefix='neon-kernel-',dir=C/'.build'));gen=run/'generated';gen.mkdir();source=run/'neon_unit.c';orig=run/'raw.c';raw,s=render();source.write_text(prefix()+s);orig.write_text(prefix()+raw)
 paths=[Path(__file__),*EXTRA_INPUTS,C/'impl/testNEON.c',C/'spec.c',*sorted((C/'shim').glob('*.h')),*sorted((C/'proof/coq').glob('*.v'))];inputs={str(p.relative_to(C)):sha(p)for p in paths};recs=[];st=dict(passed=False,whole_kernel_verified=False,scope='actual current compatibility C kernel goal generation; not a proof',run_directory=str(run),input_sha256=inputs,records=recs,configured_jobs=32,max_live_processes=1,per_process_memory_GiB=a.memory_gib,timeout_seconds=a.timeout)
 env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
 try:
  cmds=[('cpp',['gcc','-E','-P','-CC','-nostdinc',str(source),'-o',str(run/'neon_unit.i')]),('raw-cpp',['gcc','-E','-P','-CC','-nostdinc',str(orig),'-o',str(run/'raw.i')])]
  if not a.prepare_only:cmds.append(('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit=8192','--input-file='+str(run/'neon_unit.i'),'--coq-output-dir='+str(gen),'--coq-logic-path=ExpMinusMax','-slp',str(C/'shim'),'ExpMinusMax']))
  for label,cmd in cmds:
   if label=='qcp':assert tokens((run/'neon_unit.i').read_text())==tokens((run/'raw.i').read_text())
   cmd=['prlimit','--as='+str(a.memory_gib*1024**3)+':'+str(a.memory_gib*1024**3),'--']+cmd;log=run/(label+'.log');t=time.monotonic()
   try:
    with log.open('w')as f:ec=subprocess.run(cmd,cwd=run,env=env,stdout=f,stderr=f,timeout=a.timeout).returncode
   except subprocess.TimeoutExpired:ec=124
   recs.append(dict(label=label,command=cmd,exit_code=ec,seconds=time.monotonic()-t,log_sha256=sha(log)));(run/'status.json').write_text(json.dumps(st,indent=2)+'\n');assert ec==0,log.read_text()[-4000:]
  assert inputs=={n:sha(C/n)for n in inputs};assert tokens((run/'neon_unit.i').read_text())==tokens((run/'raw.i').read_text());st.update(passed=True,prepare_only=a.prepare_only,original_compatibility_CPP_tokens_identical=True,CPP_sha256=sha(run/'neon_unit.i'))
  if not a.prepare_only:
   gp=gen/'neon_unit_goal.v';st.update(goal_path=str(gp),goal_sha256=sha(gp),actual_C_fields=len(re.findall(r'^Axiom proof_of_',gp.read_text(),re.M)))
 except Exception as e:st['error']=str(e)
 (run/'status.json').write_text(json.dumps(st,indent=2)+'\n');out=C/'.build/neon-framed-generation-status.json'
 if out.exists():
  history=C/'proof/history';history.mkdir(exist_ok=True);(history/('neon-generation-'+sha(out)+'.json')).write_bytes(out.read_bytes())
 out.write_bytes((run/'status.json').read_bytes());print(json.dumps({k:st.get(k)for k in ['passed','run_directory','actual_C_fields','error']}),flush=True);return 0 if st['passed']else 1

if __name__=='__main__':raise SystemExit(main())
