#!/usr/bin/env python3
"""Fresh namespace-local mathematical support, not actual C VC credit."""
from pathlib import Path
import argparse,hashlib,json,os,re,shutil,subprocess,tempfile,time
C=Path(__file__).resolve().parents[1]
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 p=argparse.ArgumentParser();p.add_argument('--config',type=Path,required=True);p.add_argument('--jobs',type=int,default=32);a=p.parse_args();assert 1<=a.jobs<=32
 r=Path(tempfile.mkdtemp(prefix='math-fresh-',dir=C/'.build'));coq=r/'coq';coq.mkdir();mods=['Bits','Model','CountFacts','NanFacts'];records=[];inputs={}
 for n in mods:
  s=C/'proof/coq'/(n+'.v');assert not re.search(r'\b(?:Admitted|Axiom|Parameter|Abort)\b',s.read_text());inputs[str(s.relative_to(C))]=sha(s);shutil.copy2(s,coq/s.name)
 inputs['proof/check_math.py']=sha(__file__)
 flags=json.loads(a.config.read_text())['flags']+['-Q',str(coq),'MaxPool'];env=os.environ.copy();env['PATH']=str(C.parents[3]/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+env['PATH']
 facts=[]
 for n in mods:
  facts += ['MaxPool.'+n+'.'+x for x in re.findall(r'^Lemma\s+(\w+)',(coq/(n+'.v')).read_text(),re.M)]
 (coq/'MathCheck.v').write_text('From MaxPool Require Import '+ ' '.join(mods)+'.\n'+''.join('Print Assumptions '+n+'.\n'for n in facts))
 for n in mods+['MathCheck']:
  log=r/(n+'.log');cmd=['prlimit','--as=17179869184:17179869184','--',*flags,'-time',str(coq/(n+'.v'))];start=time.monotonic()
  with log.open('w')as f:p=subprocess.run(cmd,cwd=r,env=env,stdout=f,stderr=f,timeout=7200)
  records.append(dict(label=n,command=cmd,exit_code=p.returncode,seconds=time.monotonic()-start,log_sha256=sha(log),source_sha256=sha(coq/(n+'.v'))));assert p.returncode==0,log.read_text()[-3000:]
 assert inputs=={p:sha(C/p)for p in inputs}
 status=dict(passed=True,whole_kernel_verified=False,actual_c_vcs=0,scope='ordinary Coq mathematical support only, ISA definitions source-reviewed separately',run_directory=str(r),configured_jobs=a.jobs,maximum_actual_live_jobs=1,dependency_order=mods+['MathCheck'],facts=facts,checked_math_lemmas=len(facts),input_sha256=inputs,records=records,assumptions_log_sha256=sha(r/'MathCheck.log'),source_provenance='fresh local namespace; selected standard bit facts adapted from published Rndne sources and recompiled, no inherited checker credit')
 (r/'status.json').write_text(json.dumps(status,indent=2)+'\n');(C/'proof/math-status.json').write_bytes((r/'status.json').read_bytes());print(json.dumps({'passed':True,'run':str(r),'math_lemmas':len(facts),'actual_C_VCs':0}))
if __name__=='__main__':main()
