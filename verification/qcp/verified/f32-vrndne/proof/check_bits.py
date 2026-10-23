#!/usr/bin/env python3
"""Regenerate and check the real four-byte binary32 representation helper."""
from pathlib import Path
import argparse, hashlib, json, os, re, resource, shutil, subprocess, tempfile, time
HERE=Path(__file__).resolve().parent
CASE=HERE.parent
REPO=next(p for p in CASE.parents if (p/'.git').exists())
parser=argparse.ArgumentParser()
parser.add_argument('--config',type=Path,default=REPO/'.build/simple-kernels-bootstrap/coq-flags.json')
parser.add_argument('--run-dir')
parser.add_argument('--generate-only',action='store_true')
args=parser.parse_args()
CFG=json.loads(args.config.read_text())
RUN=Path(args.run_dir) if args.run_dir else Path(tempfile.mkdtemp(prefix='bits-',dir=CASE/'.build'))
RUN.mkdir(parents=True,exist_ok=True)
COQ=RUN/'coq'; COQ.mkdir(exist_ok=True)
records=[]
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def limited(): resource.setrlimit(resource.RLIMIT_AS,(16*1024**3,16*1024**3))
def execute(command,label,timeout=120):
 start=time.monotonic(); log=RUN/(label+'.log')
 work=RUN/'jobs'/label; work.mkdir(parents=True,exist_ok=True)
 with log.open('w') as out:
  result=subprocess.run(list(map(str,command)),cwd=work,stdout=out,stderr=out,timeout=timeout,preexec_fn=limited)
 records.append({'label':label,'exit_code':result.returncode,'seconds':time.monotonic()-start,'command':list(map(str,command)),'log_sha256':sha(log)})
 print(label,result.returncode,flush=True)
 if result.returncode: raise RuntimeError(log.read_text()[-8000:])
flags=[*CFG['flags'],'-Q',COQ,'Rndne']
status={'passed':False,'scope':'binary32_representation_helpers_only','whole_kernel_verified':False,'run_directory':str(RUN),'records':records}
try:
 execute(['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(CASE/'shim/bits.c'),'--coq-output-dir='+str(COQ),'--coq-logic-path=Rndne','-slp',CASE/'shim','Rndne'],'qcp')
 for name in ['Bits.v','BitsChecked.v']: shutil.copyfile(HERE/'coq'/name,COQ/name)
 if not args.generate_only:
  proof_source=(COQ/'BitsChecked.v').read_text()
  assert 'Module CheckedBits : Rndne.bits_goal.VC_Correct.' in proof_source, 'Missing concrete VC_Correct module; model-only compilation is not verification'
  vcs=re.findall(r'^Axiom proof_of_(\w+) :',(COQ/'bits_goal.v').read_text(),re.M)
  proved=re.findall(r'^Lemma proof_of_(\w+) :',proof_source,re.M)
  assert set(vcs)==set(proved) and len(vcs)==len(proved), 'Fresh VC/module field mismatch'
  for source in [COQ/'Bits.v',COQ/'BitsChecked.v']:
   assert not re.search(r'\b(Axiom|Admitted|admit)\b',source.read_text()), 'Unproved declaration in handwritten module'
  functions={'qcp_float_bits_at','qcp_float_bits','qcp_float_from_bits_at','qcp_float_from_bits'}
  c_source=re.sub(r'/\*.*?\*/|//[^\n]*','',(CASE/'shim/bits.c').read_text(),flags=re.S)
  calls=set(re.findall(r'\b([A-Za-z_]\w*)\s*\(',c_source))-{'return','if','while','for','sizeof'}
  assert calls==functions, 'Unexpected C helper/call in representation unit: '+str(calls-functions)
  for name in ['Bits.v','bits_goal.v','BitsChecked.v']: execute(flags+[COQ/name],name)
  gate='From Rndne Require Import Bits bits_goal BitsChecked.\nModule FinalBitsCheck : bits_goal.VC_Correct := BitsChecked.CheckedBits.\n'
  gate+='\n'.join('Print Assumptions FinalBitsCheck.proof_of_'+v+'.' for v in vcs)+'\n'
  (COQ/'BitsGate.v').write_text(gate)
  execute(flags+[COQ/'BitsGate.v'],'BitsGate.v')
  driver=RUN/'native.c'
  driver.write_text('''#include <stdint.h>
#include <string.h>
#include <stdio.h>
#include "bits.h"
int main(void) {
 uint32_t edges[]={0,0x80000000u,1,0x80000001u,0x7f800000u,0xff800000u,0x7fc00000u,0xffc00000u,0x7f800001u,0xff800001u,0x7fffffffu,0xffffffffu};
 uint32_t state=0x12345678u;
 for(unsigned i=0;i<65548;i++) {
  uint32_t u;
  if(i<12) u=edges[i]; else { state=1664525u*state+1013904223u;u=state; }
  float x;memcpy(&x,&u,4);
  if(qcp_float_bits(x)!=u) {printf("read mismatch %08x\\n",u);return 1;}
  float y=qcp_float_from_bits(u);uint32_t back;memcpy(&back,&y,4);
  if(back!=u) {printf("write mismatch %08x %08x\\n",u,back);return 2;}
 }
 puts("131096 independent bit-read/bit-write comparisons passed"); return 0;
}
''')
  execute(['cc','-std=c11','-O2','-Wall','-Wextra','-Werror','-I',CASE/'shim',CASE/'shim/bits.c',driver,'-o',RUN/'native'],'native-build')
  execute([RUN/'native'],'native')
  status.update(passed=True,checked_c_vcs=len(vcs),fresh_local_coq_modules=4,checked_functions=sorted(functions),external_c_callees=sorted(calls-functions),native_cases=131096,checked_module='Rndne.BitsChecked.CheckedBits',goal_sha256=sha(COQ/'bits_goal.v'),artifacts_sha256={str(p.relative_to(RUN)):sha(p) for p in [COQ/'Bits.v',COQ/'bits_goal.v',COQ/'BitsChecked.v',COQ/'BitsGate.v',driver]},excluded_historical_model_only_run={'directory':str(CASE/'.build/bits-wmq_str0'),'reason':'The early scaffold checker only compiled the model and an empty proof stub; its passed field does not establish any helper VC. The current checker requires exact fresh VC fields and a concrete VC_Correct module.'})
except Exception as error:
 status['error']=str(error); print(error,flush=True)
status['sources_sha256']={str(p.relative_to(CASE)):sha(p) for p in [CASE/'shim/bits.c',CASE/'shim/bits.h',HERE/'coq/Bits.v',HERE/'coq/BitsChecked.v',Path(__file__)]}
(RUN/'status.json').write_text(json.dumps(status,indent=2)+'\n')
print(json.dumps({'passed':status['passed'],'run_directory':str(RUN)}))
raise SystemExit(0 if status['passed'] or args.generate_only and 'error' not in status else 1)
