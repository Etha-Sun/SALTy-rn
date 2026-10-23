#!/usr/bin/env python3
"""Test real RVV16 memory helper C bodies against independent original bit arrays."""
from pathlib import Path
import hashlib,json,os,subprocess,tempfile,time
HERE=Path(__file__).resolve().parent;CASE=HERE.parent
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def main():
 run=Path(tempfile.mkdtemp(prefix='rvv-store-native-',dir=CASE/'.build'));records=[]
 files=[CASE/'shim/rvv_store.c',CASE/'shim/rvv_store.h',CASE/'shim/rvv_store_def.h',CASE/'shim/types.h',Path(__file__)]
 inputs={str(p.relative_to(CASE)):sha(p)for p in files}
 status={'passed':False,'whole_kernel_verified':False,'scope':'Real C get16/store helper finite regression; exact bits and output/input frame','run_directory':str(run),'records':records,'input_hashes':inputs}
 driver=run/'driver.c';driver.write_text('#include <stdint.h>\n#include <stdio.h>\n#include <stdlib.h>\n#include <string.h>\n#include <float.h>\nstruct vfloat32m4_t { float s0; float s1; float s2; float s3; float s4; float s5; float s6; float s7; float s8; float s9; float s10; float s11; float s12; float s13; float s14; float s15; };\nfloat qcp_vcmul_get16(const struct vfloat32m4_t*,unsigned long long);\nvoid qcp_vcmul_store_next(float*,unsigned long long,unsigned long long,float);\nvoid __riscv_vse32_v_f32m4(float*,const struct vfloat32m4_t*,unsigned long long);\n_Static_assert(sizeof(float)==4&&FLT_RADIX==2&&FLT_MANT_DIG==24,"binary32");\n_Static_assert(sizeof(struct vfloat32m4_t)==64,"host scalar field layout");\nint main(void){\n const uint32_t edge[]={0,0x80000000,1,0x80000001,0x7f800000,0xff800000,0x7fc12345,0xffc23456,0x7fa12345,0xffa23456,0x7fffffff,0xffffffff};\n uint32_t state=0x7349b15u;unsigned calls=0,lanes=0;\n for(unsigned round=0;round<128;round++){\n  uint32_t original[16],answer[16],got[16];struct vfloat32m4_t input;\n  for(unsigned j=0;j<16;j++){state=1664525u*state+1013904223u;original[j]=round<12?edge[(round+j)%12]:state;}\n  memcpy(&input,original,64);\n  for(unsigned j=0;j<16;j++){float value=qcp_vcmul_get16(&input,j);uint32_t bits;memcpy(&bits,&value,4);if(bits!=original[j])return 1;calls++;lanes++;}\n  for(unsigned vl=0;vl<=16;vl++){\n   float *output=malloc((vl+2)*4);if(!output)return 2;\n   for(unsigned j=0;j<vl+2;j++){uint32_t sentinel=0x35a00000+j;memcpy(output+j,&sentinel,4);}\n   __riscv_vse32_v_f32m4(output,&input,vl);calls++;\n   for(unsigned j=0;j<vl+2;j++){uint32_t bits;memcpy(&bits,output+j,4);uint32_t want=j<vl?original[j]:0x35a00000+j;if(bits!=want)return 3;lanes++;}\n   if(memcmp(&input,original,64))return 4;\n   for(unsigned j=0;j<vl+2;j++){uint32_t sentinel=0x35a00000+j;memcpy(output+j,&sentinel,4);}\n   for(unsigned j=0;j<vl;j++){\n    float value;memcpy(&value,original+j,4);qcp_vcmul_store_next(output,vl,j,value);calls++;\n    for(unsigned k=0;k<vl+2;k++){uint32_t bits;memcpy(&bits,output+k,4);uint32_t want=k<=j?original[k]:0x35a00000+k;if(bits!=want)return 5;lanes++;}\n   }\n   free(output);\n  }\n }\n struct vfloat32m4_t input;memset(&input,0,sizeof input);__riscv_vse32_v_f32m4(NULL,&input,0);calls++;\n printf("{\\"passed\\":true,\\"calls\\":%u,\\"lanes\\":%u,\\"input_frame_checked\\":true,\\"output_frame_checked\\":true,\\"zero_vl_null_checked\\":true}\\n",calls,lanes);return 0;\n}\n')
 def execute(command,label):
  start=time.monotonic();env=dict(os.environ,ASAN_OPTIONS='detect_leaks=1:halt_on_error=1:abort_on_error=1',UBSAN_OPTIONS='halt_on_error=1:print_stacktrace=1')
  result=subprocess.run(list(map(str,command)),cwd=run,env=env,capture_output=True,text=True,timeout=180)
  log=run/(label+'.log');log.write_text(result.stdout+result.stderr);records.append({'command':list(map(str,command)),'label':label,'exit_code':result.returncode,'seconds':time.monotonic()-start,'log_sha256':sha(log)})
  if result.returncode:raise RuntimeError(log.read_text()[-4000:])
  return result.stdout
 try:
  binary=run/'native';execute(['gcc','-std=c11','-O1','-g','-fno-pie','-no-pie','-fno-fast-math','-ffp-contract=off','-fsanitize=address,undefined','-fno-sanitize-recover=all',CASE/'shim/rvv_store.c',driver,'-o',binary],'build')
  result=json.loads(execute([binary],'native'));expected=1+128*(16+17+sum(range(17)));assert result['passed']and result['calls']==expected and result['lanes']==128*(16+sum((vl+2)*(vl+1) for vl in range(17)))
  assert all(sha(CASE/k)==v for k,v in inputs.items()),'Input changed'
  status.update(result,oracle='Every active output is an independent original uint32 bit pattern; later outputs retain separate literal sentinels. All 16 getter indices and every VL 0..16 are tested.',asan_ubsan_checked=True)
 finally:
  (run/'status.json').write_text(json.dumps(status,indent=2)+'\n');(HERE/'rvv-store-native-status.json').write_text(json.dumps(status,indent=2)+'\n')
 print(json.dumps({k:status[k]for k in ['passed','calls','lanes','run_directory']}))
if __name__=='__main__':main()
