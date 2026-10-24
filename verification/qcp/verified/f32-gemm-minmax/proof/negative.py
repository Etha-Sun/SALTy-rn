#!/usr/bin/env python3
"""False theorem/source-identity rejection and the actual original-RVV NaN counterexample."""
from pathlib import Path
import argparse,json,subprocess,re,shutil,hashlib,os
ROOT=Path(__file__).resolve().parents[1]
p=argparse.ArgumentParser();p.add_argument('--run',required=True);p.add_argument('--jobs',type=int,default=32);a=p.parse_args();assert a.jobs==32 and re.fullmatch(r'[A-Za-z0-9_-]+',a.run)
O=ROOT/'.build'/a.run/'negative';O.mkdir(parents=True,exist_ok=False)
f=O/'RejectFalse.v';f.write_text('Lemma rejected_false : False.\nProof. exact I. Qed.\n')
r=subprocess.run(['/usr/bin/prlimit','--as=17179869184','--cpu=120','--','/tmp/qcp-coq820-install/bin/coqc','-q',str(f)],capture_output=True,text=True,timeout=150);(O/'false.log').write_text(r.stdout+r.stderr)
assert r.returncode!=0 and 'Error:' in r.stderr+r.stdout and not f.with_suffix('.vo').exists()
M=O/'mutant';(M/'impl').mkdir(parents=True);(M/'proof/c').mkdir(parents=True)
for rel in ['impl/testNEON.c','proof/prepare.py','proof/c/neon.json','spec.c']:shutil.copy2(ROOT/rel,M/rel)
f=M/'impl/testNEON.c';s=f.read_text();assert 'while (nc != 0)' in s;f.write_text(s.replace('while (nc != 0)','while (nc == 0)',1))
r=subprocess.run(['python3','-c',"import sys;sys.path.insert(0,sys.argv[1]);import prepare;prepare.prepare('neon')",str(M/'proof')],text=True,capture_output=True,timeout=60);(O/'source-tamper.log').write_text(r.stdout+r.stderr);assert r.returncode!=0 and 'source changed' in r.stderr
original=ROOT.parents[3]/'kernels/target/f32-gemm-minmax.c';identity=json.loads((ROOT/'proof/source-identity.json').read_text());assert hashlib.sha256(original.read_bytes()).hexdigest()==identity['rvv']['original_sha256']
unit=O/'original.c';unit.write_text('#include "fp_primitives.h"\n#include <stdlib.h>\nvoid qcp_assert(int x){if(!x)abort();}\n#include "'+str(ROOT/'impl/testNEON.c')+'"\n#include "'+str(original)+'"\n#define QCP_GEMM_NATIVE_TYPES 1\n#include "'+str(ROOT/'spec.c')+'"\n')
driver=O/'driver.c';driver.write_text('''#include "fp_primitives.h"
#include <stdio.h>
int equivalent(size_t,size_t,size_t,const float*,const float*,float*,float*,const struct xnn_f32_minmax_params*);
int main(void){float A[4]={0},W[16]={0},L[4]={0},R[4]={0};uint32_t q=0x7fc00000;memcpy(A,&q,4);for(int i=8;i<16;i++)W[i]=1;struct xnn_f32_minmax_params p={{-1,1}};int ret=equivalent(1,1,4,A,W,L,R,&p);uint32_t l,r;memcpy(&l,L,4);memcpy(&r,R,4);printf("{\\"return\\":%d,\\"neon_bits\\":%u,\\"rvv_bits\\":%u}\\n",ret,l,r);return ret==0&&l==0x7fc00000&&r==0x3f800000?0:1;}
''')
N=ROOT/'proof/native';exe=O/'original';cmd=['gcc','-std=c11','-O1','-frounding-math','-ffp-contract=off','-fno-builtin-fmaf','-fsanitize=address,undefined','-I',str(N),'-I',str(ROOT),str(unit),str(driver),*[str(f) for f in sorted(N.glob('fp_*.c'))],'-lm','-o',str(exe)]
r=subprocess.run(cmd,capture_output=True,text=True,timeout=600);(O/'original-build.log').write_text(r.stdout+r.stderr);assert r.returncode==0,r.stderr[-2000:]
r=subprocess.run([str(exe)],capture_output=True,text=True,timeout=60,env=dict(os.environ,ASAN_OPTIONS='detect_leaks=0'));(O/'original-execute.log').write_text(r.stdout+r.stderr);assert r.returncode==0,r.stdout+r.stderr
result={'passed':True,'configured_jobs':32,'false_goal_rejected':True,'source_tamper_rejected':True,'original_RVV_counterexample':json.loads(r.stdout),'counterexample_inputs':{'mr':1,'N':1,'K':1,'kc_bytes':4,'A0_bits':'0x7fc00000','bias':0,'weights':1,'lo':-1,'hi':1,'full_NR8_panel_allocated':True},'original_rvv_sha256':identity['rvv']['original_sha256'],'scope':'native actual original RVV counterexample under listed value emulators; not hardware ISA execution'}
(O/'result.json').write_text(json.dumps(result,indent=2)+'\n');print(result)
