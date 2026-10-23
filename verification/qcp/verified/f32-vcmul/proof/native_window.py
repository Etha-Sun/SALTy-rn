#!/usr/bin/env python3
"""Instrumented bit-level test of the real window_load.c body against memcpy."""
import hashlib,json,os,subprocess,tempfile,time
from pathlib import Path
HERE=Path(__file__).resolve().parent;CASE=HERE.parent
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 run=Path(tempfile.mkdtemp(prefix='window-native-',dir=CASE/'.build'));records=[]
 files=[CASE/'shim/window_load.c',CASE/'shim/window_load.h',CASE/'shim/window_def.h',CASE/'shim/types.h',Path(__file__)]
 inputs={str(p.relative_to(CASE)):sha(p)for p in files}
 status={'passed':False,'whole_kernel_verified':False,'scope':'Finite real-C load4 bit regression only','run_directory':str(run),'records':records,'input_hashes':inputs}
 driver=run/'driver.c';driver.write_text('''#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <float.h>
struct float32x4_t { float s0,s1,s2,s3; };
struct float32x4_t qcp_vcmul_load4(const float *p);
_Static_assert(sizeof(float)==4&&FLT_RADIX==2&&FLT_MANT_DIG==24,"binary32");
int main(void){
 const uint32_t edge[]={0,0x80000000,1,0x80000001,0x7f800000,0xff800000,0x7fc12345,0xffc23456,0x7fa12345,0xffa23456,0x7fffffff,0xffffffff};
 uint32_t state=0x38471a9u;unsigned calls=0,lanes=0;
 for(unsigned n=4;n<=70;n++){
  float *input=malloc(n*4);uint32_t *expected=malloc(n*4);
  if(!input||!expected)return 1;
  for(unsigned j=0;j<n;j++){state=1664525u*state+1013904223u;expected[j]=j<12?edge[j]:state;memcpy(input+j,expected+j,4);}
  for(unsigned i=0;i+4<=n;i++){
   struct float32x4_t r=qcp_vcmul_load4(input+i);uint32_t got[4];
   memcpy(got,&r.s0,4);memcpy(got+1,&r.s1,4);memcpy(got+2,&r.s2,4);memcpy(got+3,&r.s3,4);
   for(unsigned k=0;k<4;k++){if(got[k]!=expected[i+k]){fprintf(stderr,"mismatch n=%u i=%u lane=%u\\n",n,i,k);return 2;}lanes++;}
   calls++;
  }
  if(memcmp(input,expected,n*4))return 3;free(expected);free(input);
 }
 printf("{\\"passed\\":true,\\"calls\\":%u,\\"lanes\\":%u,\\"input_frame_checked\\":true}\\n",calls,lanes);return 0;
}
''')
 def execute(command,label):
  start=time.monotonic();env=dict(os.environ,ASAN_OPTIONS='detect_leaks=1:halt_on_error=1:abort_on_error=1',UBSAN_OPTIONS='halt_on_error=1:print_stacktrace=1')
  result=subprocess.run(list(map(str,command)),cwd=run,env=env,capture_output=True,text=True,timeout=120)
  log=run/(label+'.log');log.write_text(result.stdout+result.stderr);records.append({'command':list(map(str,command)),'label':label,'exit_code':result.returncode,'seconds':time.monotonic()-start,'log_sha256':sha(log)})
  if result.returncode:raise RuntimeError(log.read_text()[-4000:])
  return result.stdout
 try:
  binary=run/'native';execute(['gcc','-std=c11','-O1','-g','-fno-pie','-no-pie','-fno-fast-math','-ffp-contract=off','-fsanitize=address,undefined','-fno-sanitize-recover=all',CASE/'shim/window_load.c',driver,'-o',binary],'build')
  result=json.loads(execute([binary],'native'));assert result['passed']and result['calls']==2278 and result['lanes']==9112
  assert all(sha(CASE/k)==v for k,v in inputs.items()),'Input changed'
  status.update(result,oracle='Independent memcpy from original uint32 source bits; exact NaN/sign/payload and signed-zero checks',asan_ubsan_checked=True)
 finally:
  (run/'status.json').write_text(json.dumps(status,indent=2)+'\n');(HERE/'window-native-status.json').write_text(json.dumps(status,indent=2)+'\n')
 print(json.dumps({k:status[k]for k in ['passed','calls','lanes','run_directory']}))
if __name__=='__main__':main()
