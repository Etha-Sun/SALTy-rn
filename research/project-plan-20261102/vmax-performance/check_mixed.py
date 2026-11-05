from pathlib import Path
import os,subprocess,json
R=Path(__file__).resolve().parent;repo=R.parents[2];old=repo/'research/sol-pipeline-comparison-20261030';repro=R.parent/'final-minmax-reproduction';d=R/'mixed-check';d.mkdir(exist_ok=True)
s='''#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include "prelude.h"
#ifdef __aarch64__
#define K test_neon
#else
#define K test_rvv
#endif
void K(size_t,const float*,const float*,float*,const struct xnn_f32_default_params*);
static float from(uint32_t u){float f;memcpy(&f,&u,4);return f;}
int main(void){
#ifdef __aarch64__
 __asm__ volatile("msr fpcr,xzr");
#else
 __asm__ volatile("csrw fcsr,zero");
#endif
 const uint32_t vals[]={0x7fc12345,0x7f800001,0xffc12345,0xff800001,0x7f800000,0xff800000,0,0x80000000,1,0x80000001,0x7f7fffff,0xff7fffff,0x3f800000,0xbf800000};
 float a[1030],b[1030],out[1030];uint32_t rng=1234567;
 for(unsigned i=0;i<1030;i++){
  rng^=rng<<13;rng^=rng>>17;rng^=rng<<5;uint32_t u=rng;
  rng^=rng<<13;rng^=rng>>17;rng^=rng<<5;
  a[i]=from(i<196?vals[i/14]:u);b[i]=from(i<196?vals[i%14]:rng);
 }
 const unsigned ns[]={1,31,32,33,127,128,129,257,1024};
 struct xnn_f32_default_params params={0};
 for(unsigned s=0;s<9;s++){
  K(ns[s]*4,a,b,out,&params);
  for(unsigned i=0;i<ns[s];i++){uint32_t u;memcpy(&u,out+i,4);printf("%u %u %08x\\n",ns[s],i,u);}
 }
 return 0;
}
'''
(d/'harness.c').write_text(s)
env=dict(os.environ,ZIG_GLOBAL_CACHE_DIR='/tmp/vekto-perf-zig-global',ZIG_LOCAL_CACHE_DIR='/tmp/vekto-perf-zig-local')
logs=[]
for arch,target,src,flags,qemu in [('neon','aarch64-linux-musl',str(repro/'vmax/neon.c'),[],Path('/tmp/vekto-qemu-arm/extracted/usr/bin/qemu-aarch64-static')),('rvv','riscv64-linux-musl',str(R/'runs/repaired/kernel.o'),['-mcpu=generic_rv64+m+a+f+d+c+v'],old/'tools/qemu-riscv64-static')]:
 cmd=[str(old/'tools/ziglang/zig'),'cc','-target',target,*flags,'-O3','-fno-fast-math','-ffp-contract=off','-static','-include',str(repro/'prelude.h'),'-I'+str(repro),str(d/'harness.c'),src,'-o',str(d/(arch+'.elf'))]
 p=subprocess.run(cmd,env=env,capture_output=True,text=True,timeout=120);(d/(arch+'-compile.log')).write_text(p.stdout+p.stderr);assert p.returncode==0,p.stderr
 for vl in ([128,256,512] if arch=='rvv' else [None]):
  cmd=[str(qemu),'-cpu',f'rv64,v=true,vlen={vl},elen=64,vext_spec=v1.0' if vl else 'max',str(d/(arch+'.elf'))]
  p=subprocess.run(cmd,capture_output=True,text=True,timeout=30);assert p.returncode==0,p.stderr
  (d/(arch+str(vl)+'.log')).write_text(p.stdout)
  vals={(int(n),int(i)):int(v,16) for n,i,v in (x.split() for x in p.stdout.splitlines())}
  if not vl:ref=vals
  else:
   assert vals.keys()==ref.keys()
   def nan(u):return (u&0x7fffffff)>0x7f800000
   assert all(v==ref[k] or (nan(v) and nan(ref[k])) or ((v&0x7fffffff)==0 and (ref[k]&0x7fffffff)==0) for k,v in vals.items())
   logs.append({'vlen':vl,'compared_outputs':len(vals),'passed':True})
(d/'results.json').write_text(json.dumps({'scope':'mixed lane QEMU comparison against unmodified compiled NEON; exact finite values, both NaN and signed zeros equivalent; GCC repaired object identical to RTL timing object','results':logs},indent=2)+'\n');print(logs)
