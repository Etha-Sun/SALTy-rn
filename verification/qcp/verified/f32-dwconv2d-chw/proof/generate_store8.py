#!/usr/bin/env python3
from pathlib import Path
import argparse,hashlib,json,os,re,subprocess,tempfile,time
P=Path(__file__).resolve().parent;C=P.parent;R=next(p for p in C.parents if(p/'.git').exists())
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def tokens(s):return re.findall(r'\w+|[^\s]',re.sub(r'/\*.*?\*/|//[^\n]*','',s,flags=re.S))
def bind(p,v):
 prefix='a'if p=='p'else'b'
 return[p+'=&'+v]+[prefix+str(i)+'='+v+'.s'+str(i)for i in range(8)]
def construct():
 raw=(C/'shim/store8.c').read_text();return raw,raw

def main():
 ap=argparse.ArgumentParser();ap.add_argument('--timeout',type=int,default=600);a=ap.parse_args();quota=json.loads((R/'.build/memory/quota/state.json').read_text());assert not quota['wind_down_requested'];run=Path(tempfile.mkdtemp(prefix='store8-vcs-',dir=C/'.build'));raw,ann=construct();env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
 for label,text in [('original',raw),('store8_unit',ann)]:
  source=run/(label+'.input.c');source.write_text('#define DWCHW_FORMAL 1\n'+text);r=subprocess.run(['gcc','-E','-P','-CC','-nostdinc','-I',str(C/'shim'),str(source),'-o',str(run/(label+'.c'))],stdout=subprocess.PIPE,stderr=subprocess.STDOUT,text=True);(run/(label+'-cpp.log')).write_text(r.stdout);assert r.returncode==0,r.stdout
 assert tokens((run/'original.c').read_text())==tokens((run/'store8_unit.c').read_text());wd=run/'qcp-work';wd.mkdir();cmd=['prlimit','--as=34359738368:34359738368','--','stdbuf','-oL','-eL','qcp','--arch=64','--endian=little','--no-exec-info','--strategy-application-limit=4096','--input-file='+str(run/'store8_unit.c'),'--coq-output-dir='+str(run),'--coq-logic-path=DwChw','-slp',str(C/'shim'),'DwChw','-slp',str(P/'c'),'DwChw'];start=time.monotonic()
 with(run/'qcp.log').open('w')as f:
  try:code=subprocess.run(cmd,cwd=wd,env=env,stdout=f,stderr=f,timeout=a.timeout).returncode
  except subprocess.TimeoutExpired:code=124
 goal=run/'store8_unit_goal.v';s=goal.read_text()if goal.exists()else'';out={'generation_passed':code==0,'whole_kernel_verified':False,'configured_jobs':32,'actual_QCP_jobs':1,'per_process_memory_GiB':32,'timeout_seconds':a.timeout,'run_directory':str(run),'seconds':time.monotonic()-start,'command':cmd,'exit_code':code,'same_raw_tokens':True,'same_frontend_cpp_tokens':True,'actual_source':'shim/store8.c','raw_source_sha256':sha(C/'shim/store8.c'),'CPP_sha256':sha(run/'store8_unit.c'),'goal_sha256':sha(goal)if goal.exists()else None,'actual_C_fields':len(re.findall(r'^Axiom proof_of_',s,re.M)),'input_sha256':{str(p.relative_to(C)):sha(p)for p in(C/'shim').glob('*.h')}};(run/'status.json').write_text(json.dumps(out,indent=2)+'\n');(P/'store8-generation-status.json').write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2));return code!=0
if __name__=='__main__':raise SystemExit(main())
