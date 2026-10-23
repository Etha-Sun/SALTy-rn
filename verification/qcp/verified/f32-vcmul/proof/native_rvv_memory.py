#!/usr/bin/env python3
"""Test real RVV16 memory helper C bodies against independent original bit arrays."""
from pathlib import Path
import hashlib,json,os,subprocess,tempfile,time
HERE=Path(__file__).resolve().parent;CASE=HERE.parent
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 run=Path(tempfile.mkdtemp(prefix='rvv-memory-native-',dir=CASE/'.build'));records=[]
 files=[CASE/'shim/rvv_memory.c',CASE/'shim/rvv_memory.h',CASE/'shim/rvv_memory_def.h',CASE/'shim/types.h',Path(__file__)]
 inputs={str(p.relative_to(CASE)):sha(p)for p in files}
 status={'passed':False,'whole_kernel_verified':False,'scope':'Real C load16/VL helper finite regression; zero inactive fields describe this C shim, not hardware','run_directory':str(run),'records':records,'input_hashes':inputs}
 driver=run/'driver.c';driver.write_text('''#include <stdint.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <float.h>
struct vfloat32m4_t { '''+' '.join('float s'+str(i)+';'for i in range(16))+''' };
struct vfloat32m4_t qcp_vcmul_load16(const float*,unsigned long long);
unsigned long long __riscv_vsetvl_e32m4(unsigned long long);
_Static_assert(sizeof(float)==4&&FLT_RADIX==2&&FLT_MANT_DIG==24,"binary32");
_Static_assert(sizeof(struct vfloat32m4_t)==64,"host scalar field layout");
int main(void){
 const uint32_t edge[]={0,0x80000000,1,0x80000001,0x7f800000,0xff800000,0x7fc12345,0xffc23456,0x7fa12345,0xffa23456,0x7fffffff,0xffffffff};
 uint32_t state=0x7349b15u;unsigned calls=0,lanes=0;
 for(unsigned n=0;n<=35;n++){
  float *input=malloc((n?n:1)*4);uint32_t *expected=malloc((n?n:1)*4);
  if(!input||!expected)return 1;
  for(unsigned j=0;j<n;j++){state=1664525u*state+1013904223u;expected[j]=j<12?edge[j]:state;memcpy(input+j,expected+j,4);}
  for(unsigned vl=0;vl<=16&&vl<=n;vl++)for(unsigned i=0;i+vl<=n;i++){
   struct vfloat32m4_t r=qcp_vcmul_load16(input+i,vl);uint32_t got[16];memcpy(got,&r,64);
   for(unsigned k=0;k<16;k++){uint32_t answer=k<vl?expected[i+k]:0;if(got[k]!=answer){fprintf(stderr,"mismatch n=%u vl=%u i=%u lane=%u\\n",n,vl,i,k);return 2;}lanes++;}
   calls++;
  }
  if(memcmp(input,expected,n*4))return 3;free(expected);free(input);
 }
 struct vfloat32m4_t empty=qcp_vcmul_load16(NULL,0);uint32_t zeros[16];memcpy(zeros,&empty,64);
 for(unsigned k=0;k<16;k++){if(zeros[k])return 4;lanes++;}calls++;
 const unsigned long long avl[]={0,1,15,16,17,31,32,65,UINT64_MAX};
 const unsigned long long answer[]={0,1,15,16,16,16,16,16,16};
 for(unsigned i=0;i<9;i++)if(__riscv_vsetvl_e32m4(avl[i])!=answer[i])return 5;
 printf("{\\"passed\\":true,\\"calls\\":%u,\\"lanes\\":%u,\\"vl_checks\\":9,\\"input_frame_checked\\":true,\\"zero_vl_null_checked\\":true}\\n",calls,lanes);return 0;
}
''')
 def execute(command,label):
  start=time.monotonic();env=dict(os.environ,ASAN_OPTIONS='detect_leaks=1:halt_on_error=1:abort_on_error=1',UBSAN_OPTIONS='halt_on_error=1:print_stacktrace=1')
  result=subprocess.run(list(map(str,command)),cwd=run,env=env,capture_output=True,text=True,timeout=180)
  log=run/(label+'.log');log.write_text(result.stdout+result.stderr);records.append({'command':list(map(str,command)),'label':label,'exit_code':result.returncode,'seconds':time.monotonic()-start,'log_sha256':sha(log)})
  if result.returncode:raise RuntimeError(log.read_text()[-4000:])
  return result.stdout
 try:
  binary=run/'native';execute(['gcc','-std=c11','-O1','-g','-fno-pie','-no-pie','-fno-fast-math','-ffp-contract=off','-fsanitize=address,undefined','-fno-sanitize-recover=all',CASE/'shim/rvv_memory.c',driver,'-o',binary],'build')
  result=json.loads(execute([binary],'native'));expected=1+sum(n-vl+1for n in range(36)for vl in range(min(n,16)+1));assert result['passed']and result['calls']==expected and result['lanes']==16*expected
  assert all(sha(CASE/k)==v for k,v in inputs.items()),'Input changed'
  status.update(result,oracle='Active lanes are exact original uint32 bits; inactive lanes are literal positive zero. VL answers are a separate fixed boundary table.',asan_ubsan_checked=True)
 finally:
  (run/'status.json').write_text(json.dumps(status,indent=2)+'\n');(HERE/'rvv-memory-native-status.json').write_text(json.dumps(status,indent=2)+'\n')
 print(json.dumps({k:status[k]for k in ['passed','calls','lanes','run_directory']}))
if __name__=='__main__':main()
