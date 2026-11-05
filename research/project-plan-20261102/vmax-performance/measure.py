from pathlib import Path
import subprocess,os,json,re,hashlib,time,concurrent.futures,statistics,csv
R=Path(__file__).resolve().parent;ROOT=R.parents[2];OLD=ROOT/'research/sol-pipeline-comparison-20261030';CY=OLD/'round2/hardware/chipyard'
SIM=CY/'sims/verilator/simulator-chipyard.harness-GENV512D256ShuttleConfig'
T=json.loads((OLD/'round2/hardware/benchmarks-scalar/direct/build.json').read_text())
NAMES=['xnn-u4','xnn-u8','optimized','repaired'];SIZES=[16,64,256,1024,4096,16384,65536]
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def write(p,x):p.write_text(json.dumps(x,indent=2)+'\n')
def run(cmd,log,timeout=120,env=None,cwd=None):
 with log.open('w') as f:p=subprocess.run([str(x) for x in cmd],stdout=f,stderr=subprocess.STDOUT,timeout=timeout,env=env,cwd=cwd)
 if p.returncode:raise RuntimeError(str(log)+' exit '+str(p.returncode))
 return p.returncode
PREFIX='#include <stdint.h>\n#include <stddef.h>\n#include <assert.h>\n#include <riscv_vector.h>\n#include "src/xnnpack/common.h"\n#include "src/xnnpack/microparams.h"\n'
def prepare():
 # Pre-materialized finite fixtures; no data generation in timed regions or simulator startup.
 a=[(i%127)-63 for i in range(65536)];b=[(i%113)-56+0.25 for i in range(65536)]
 text=''.join('static const float '+name+'[65536] __attribute__((aligned(4096)))={'+','.join(float(x).hex()+'f' for x in vals)+'};\n' for name,vals in [('a',a),('b',b),('gold',[max(x,y) for x,y in zip(a,b)])])
 (R/'fixture.h').write_text(text)
 (R/'harness.c').write_text(PREFIX+'''#include <stdio.h>
#include "fixture.h"
void test_rvv(size_t,const float*,const float*,float*,const struct xnn_f32_default_params*);
static float out[65540] __attribute__((aligned(4096)));
int main(void){
  const size_t sizes[]={16,64,256,1024,4096,16384,65536};
  struct xnn_f32_default_params params={0};
  for(unsigned s=0;s<7;s++){
    size_t n=sizes[s];out[n]=123456.0f;
    test_rvv(n*4,a,b,out,&params);
    for(unsigned trial=0;trial<3;trial++){
      unsigned long begin,end;
      __asm__ volatile("fence rw,rw; rdcycle %0":"=r"(begin)::"memory");
      test_rvv(n*4,a,b,out,&params);
      __asm__ volatile("fence rw,rw; rdcycle %0":"=r"(end)::"memory");
      printf("CYCLE_COUNTER n%lu-t%u %lu\\n",(unsigned long)n,trial,end-begin);
    }
    for(size_t i=0;i<n;i++){if(out[i]!=gold[i]){printf("FAIL n%lu i%lu\\n",(unsigned long)n,(unsigned long)i);return 1;}}
    if(out[n]!=123456.0f){printf("FAIL canary\\n");return 1;}
  }
  printf("PASS\\n");return 0;
}
''')
def build(name):
 d=R/'runs'/name;d.mkdir(parents=True,exist_ok=True)
 src=(R/'sources'/(name+'.c')).read_text();src=src.replace('void test_rvv(','void __attribute__((noipa)) test_rvv(',1)
 (d/'kernel.c').write_text(PREFIX+src)
 old=T['kernel_command'];flags=old[1:old.index('-c')];kc=[old[0],*flags,'-c',str(d/'kernel.c'),'-o',str(d/'kernel.o')];run(kc,d/'kernel-compile.log')
 old=T['harness_link_command'];om=old[old.index('-T')+2];oo=next(x for x in old if x.endswith('/kernel.o'))
 link=[str(R/'harness.c') if x==om else str(d/'kernel.o') if x==oo else str(d/'test.elf') if x==old[-1] else x for x in old];run(link,d/'link.log')
 # Execute the exact GCC kernel object under QEMU before RTL timing.
 repro=R.parent/'final-minmax-reproduction'
 cmd=[str(OLD/'tools/ziglang/zig'),'cc','-target','riscv64-linux-musl','-mcpu=generic_rv64+m+a+f+d+c+v','-O2','-fno-fast-math','-static','-I'+str(repro),str(repro/'harness.c'),str(d/'kernel.o'),'-o',str(d/'qemu.elf')]
 env=dict(os.environ,ZIG_GLOBAL_CACHE_DIR='/tmp/vekto-perf-zig-global',ZIG_LOCAL_CACHE_DIR='/tmp/vekto-perf-zig-local');run(cmd,d/'qemu-compile.log',env=env)
 for vl in [128,256,512]:
  qcmd=[str(OLD/'tools/qemu-riscv64-static'),'-cpu',f'rv64,v=true,vlen={vl},elen=64,vext_spec=v1.0',str(d/'qemu.elf')];log=d/f'qemu-vlen{vl}.jsonl';run(qcmd,log)
  rows=[json.loads(x) for x in log.read_text().splitlines()];assert len(rows)==60
  for row in rows:
   assert row['uniform'] and row['output_frame'];u=int(row['output'],16);nan=(u&0x7fffffff)>0x7f800000
   if row['case'] in ['left_qnan','right_qnan']:assert nan if name=='repaired' else u==0x3f800000
   elif row['case']=='both_qnan':assert nan
   else:assert u==0x40000000
 write(d/'build.json',{'source_sha256':sha(R/'sources'/(name+'.c')),'kernel_command':kc,'link_command':link,'qemu_link_command':cmd,'elf_sha256':sha(d/'test.elf'),'object_sha256':sha(d/'kernel.o'),'qemu_cases':180,'nan_semantics':'propagating' if name=='repaired' else 'returns numeric operand for single NaN'})
 print(name,'compiled; GCC-object QEMU checks passed',flush=True)
 return d

def measure(name):
 d=R/'runs'/name;binary=d/'test.elf';log=d/'rtl.log'
 cmd=[str(SIM),'+permissive','+dramsim','+dramsim_ini_dir='+str(CY/'generators/testchipip/src/main/resources/dramsim2_ini'),'+max-cycles=20000000','+verilator+seed+1','+loadmem='+str(binary),'+permissive-off',str(binary)]
 env=dict(os.environ,LD_LIBRARY_PATH=str(CY/'tools/DRAMSim2')+':'+str(OLD/'tools/spike-compatible-install/lib'))
 start=time.monotonic()
 try:
  run(cmd,log,timeout=1800,env=env,cwd=d)
  txt=log.read_text();vals=[{'n':int(n),'trial':int(t),'cycles':int(c)} for n,t,c in re.findall(r'CYCLE_COUNTER n(\d+)-t(\d+) (\d+)',txt)]
  assert len(vals)==21 and re.search(r'^PASS\s*$',txt,re.M) and 'FAIL' not in txt
  row={'name':name,'passed':True,'samples':vals,'median_cycles':{str(n):statistics.median(x['cycles'] for x in vals if x['n']==n) for n in SIZES}}
 except Exception as e:row={'name':name,'passed':False,'error':str(e)}
 row.update(command=cmd,elapsed_seconds=time.monotonic()-start,simulator_sha256=sha(SIM),elf_sha256=sha(binary));write(d/'result.json',row);print(name,row,flush=True);return row
if __name__=='__main__':
 prepare()
 for name in NAMES:build(name)
 write(R/'environment.json',{'simulator':str(SIM),'simulator_sha256':sha(SIM),'configuration':'GENV512D256ShuttleConfig, Saturn VLEN512 DLEN256, DRAMSim2, seed 1','metric':'target cycles, fences included','sizes_elements':SIZES,'protocol':'one warm call then 3 measured calls per size; comparison outside timing; finite preloaded fixture; no LTO; separate noipa kernel object; scalar harness','fixture_sha256':sha(R/'fixture.h'),'xnnpack_commit':'867d5a344790802ee067be62f572c2e2722bf6fb','optimized_commit':'80feb4564cb470de301062109b6f89db672bdf9d','compiler_version':subprocess.check_output([T['kernel_command'][0],'--version'],text=True).splitlines()[0]} )
 with concurrent.futures.ThreadPoolExecutor(max_workers=4) as pool:results=list(pool.map(measure,NAMES))
 write(R/'results.json',results)
 assert all(x['passed'] for x in results)
