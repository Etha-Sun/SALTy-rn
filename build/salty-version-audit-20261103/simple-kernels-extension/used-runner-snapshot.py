import argparse,hashlib,json,os,re,subprocess,time
from pathlib import Path
ROOT=Path(__file__).resolve().parents[2]; OUT=Path(__file__).resolve().parent
R=ROOT/'research/sol-pipeline-comparison-20261030'; CY=R/'round2/hardware/chipyard'
SIM=CY/'sims/verilator/simulator-chipyard.harness-GENV512D256ShuttleConfig'
PREFIX='#include <stdint.h>\n#include <stddef.h>\n#include <assert.h>\n#include <math.h>\n#include <riscv_vector.h>\n#include "src/xnnpack/common.h"\n#include "src/xnnpack/math.h"\n#include "src/xnnpack/microparams.h"\n'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def write(p,x):p.write_text(json.dumps(x,indent=2)+'\n')
def command(cmd,log,timeout=120,**kw):
 with log.open('w') as f:
  try:return subprocess.run([str(x) for x in cmd],stdout=f,stderr=subprocess.STDOUT,timeout=timeout,**kw).returncode
  except subprocess.TimeoutExpired:return 'HOST_TIMEOUT'
def timing(call,check,tag,setup='',warm=None,reps=3,clear='for(size_t j=0;j<OUT_N;j++)out[j]=0;'):
 # Author common MEASURE ordering, including instret CSR reads and their exact vsetvli x0,x0 reset sequence.
 # Setup is outside timing; author common protocol checks the final output after 3 calls.
 warmcode='' if warm is None else f'for(int z=0;z<{warm};z++){{{call}}}'
 return setup+warmcode+f'''unsigned long cyc[{reps}],ins[{reps}];
 for(int rep=0;rep<{reps};rep++){{
 {clear}
 unsigned long sc,ec,si,ei;
 __asm__ volatile("fence rw,rw; vsetvli zero,zero,e8,m1,ta,ma; rdcycle %0; rdinstret %1":"=r"(sc),"=r"(si)::"memory");
 {call}
 __asm__ volatile("fence rw,rw; vsetvli zero,zero,e8,m1,ta,ma; rdinstret %0; rdcycle %1":"=r"(ei),"=r"(ec)::"memory");
 cyc[rep]=ec-sc;ins[rep]=ei-si;
 }}
 int ok=1;{check}
 for(int rep=0;rep<{reps};rep++)printf("SAMPLE {tag} %d %lu %lu %d\\n",rep,cyc[rep],ins[rep],ok);
 if(!ok)return 1;
 '''

def harness(k,proto,shape,role):
 f=OUT/'fixtures'/k
 # Inputs and scalar-gold snapshots are frozen in this audit directory.
 base=PREFIX+'#include <stdio.h>\n#include "'+str(proto)+'"\n#include "'+str(f/'data.h')+'"\n'
 if k=='f32-vmulc':
  n=1024;call='test_rvv(4096,a,b,out,&params);'
  check='for(size_t j=0;j<1024;j++)if(out[j]!=gold[j])ok=0;'
  body='struct xnn_f32_default_params params={0};for(int z=0;z<3;z++)reference_kernel(4096,a,b,out,&params);'
  return base+'void reference_kernel(size_t,const float*,const float*,float*,const struct xnn_f32_default_params*);\n#define OUT_N 1024\nstatic float out[OUT_N];\nint main(void){'+body+timing(call,check,'n1024')+'printf("PASS\\n");return 0;}\n'
 i=int(shape.split('-')[0])
 meta=json.loads((f/'manifest.json').read_text());s=meta['shapes'][i]
 n=s.get('elements',s.get('nc',s.get('height',1)*s.get('width',1)))
 ctype='uint32_t' if k=='x32-transposec' else 'float'
 base+=f'#define OUT_N {n}\nstatic {ctype} output_storage[OUT_N+2];\n#define out (output_storage+1)\n'
 vt='vuint32m8_t' if ctype=='uint32_t' else 'vfloat32m8_t'
 zero='__riscv_vmv_v_x_u32m8(0,vl)' if ctype=='uint32_t' else '__riscv_vfmv_v_f_f32m8(0,vl)'
 store='__riscv_vse32_v_u32m8' if ctype=='uint32_t' else '__riscv_vse32_v_f32m8'
 base+=f'static void clear_output({ctype}* p,size_t n){{while(n){{size_t vl=__riscv_vsetvl_e32m8(n);{vt} z={zero};{store}(p,z,vl);p+=vl;n-=vl;}}}}\n'
 base+='''static int exact(const void* a,const void* b,size_t n){
 const uint32_t* x=a;const uint32_t* y=b;
 while(n){size_t vl=__riscv_vsetvl_e32m8(n);
 vuint32m8_t xx=__riscv_vle32_v_u32m8(x,vl),yy=__riscv_vle32_v_u32m8(y,vl);
 if(__riscv_vcpop_m_b4(__riscv_vmsne_vv_u32m8_b4(xx,yy,vl),vl))return 0;x+=vl;y+=vl;n-=vl;}return 1;}
 static int approx(const float* x,const float* y,size_t n,float rel,float floor){
 while(n){size_t vl=__riscv_vsetvl_e32m8(n);
 vfloat32m8_t xx=__riscv_vle32_v_f32m8(x,vl),yy=__riscv_vle32_v_f32m8(y,vl);
 vfloat32m8_t diff=__riscv_vfabs_v_f32m8(__riscv_vfsub_vv_f32m8(xx,yy,vl),vl);
 vfloat32m8_t tol=__riscv_vfmax_vf_f32m8(__riscv_vfmul_vf_f32m8(__riscv_vfabs_v_f32m8(yy,vl),rel,vl),floor,vl);
 if(__riscv_vcpop_m_b4(__riscv_vmfle_vv_f32m8_b4(diff,tol,vl),vl)!=vl)return 0;
 x+=vl;y+=vl;n-=vl;}return 1;}
 '''
 setup='';warm=0
 if k=='x32-transposec':
  h,w=s['height'],s['width'];call=f'test_rvv(c{i}_input,out,{w*4},{h*4},{w},{h});'
  check=f'ok=exact(out,c{i}_gold,OUT_N);';warm=0 if 'cold1' in shape else 5
 elif k=='f32-raddstoreexpminusmax':
  setup='float sum=-1;';call=f'test_rvv({n*4},c{i}_x,c{i}_max,out,&sum,NULL);'
  check=f'for(size_t j=0;j<OUT_N;j++)if(!isfinite(out[j]) || fabs((double)out[j]-c{i}_gold[j])>fabs(c{i}_gold[j])*1e-6)ok=0; if(!isfinite(sum) || fabs((double)sum-c{i}_sum[0])>fabs(c{i}_sum[0])*1e-6)ok=0;';warm=5
  if 'fastcheck' in shape:
   base+='#include "'+str(f/'bounds.h')+'"\n'
   base+='''static int within(const float* x,const float* lo,const float* hi,size_t n){
while(n){size_t vl=__riscv_vsetvl_e32m8(n);vfloat32m8_t a=__riscv_vle32_v_f32m8(x,vl),b=__riscv_vle32_v_f32m8(lo,vl),c=__riscv_vle32_v_f32m8(hi,vl);
vbool4_t ok=__riscv_vmand_mm_b4(__riscv_vmfge_vv_f32m8_b4(a,b,vl),__riscv_vmfle_vv_f32m8_b4(a,c,vl),vl);
if(__riscv_vcpop_m_b4(ok,vl)!=vl)return 0;x+=vl;lo+=vl;hi+=vl;n-=vl;}return 1;}
'''
   check=f'ok=within(out,c{i}_lower,c{i}_upper,OUT_N);if(!isfinite(sum) || fabs((double)sum-c{i}_sum[0])>fabs(c{i}_sum[0])*1e-6)ok=0;'
 elif k=='f32-gemm-minmax':
  setup='struct xnn_f32_minmax_params params;params.scalar.min=-5;params.scalar.max=5;'
  weights='w';stride=32
  if role=='D-manual-nr64':
   base+='#include "'+str(OUT/'fixtures/f32-gemm-minmax/manual-weights.h')+'"\n';weights='manual_w';stride=256
  call=f'test_rvv(1,512,2048,a,2048,{weights},out,2048,{stride},&params);'
  check='ok=exact(out,gold,OUT_N);';warm=0 if 'cold1' in shape else 1
 elif k=='f32-dwconv2d-chw':
  h,w=s['height'],s['width'];setup=f'static const float zero[{w+64}]={{0}};struct xnn_f32_minmax_params params;params.scalar.min=-10;params.scalar.max=10;'
  call=f'test_rvv({h},{w*4},c{i}_input,c{i}_weights,zero,out,1,&params);'
  check=f'ok=approx(out,c{i}_gold,OUT_N,1e-5f,1e-6f);'
 else:raise ValueError(k)
 check+='if(output_storage[0]!=123456 || output_storage[OUT_N+1]!=123456)ok=0;'
 clear='for(size_t j=0;j<OUT_N;j++)out[j]=0;' if k=='f32-raddstoreexpminusmax' else 'clear_output(out,OUT_N);'
 return base+'int main(void){output_storage[0]=123456;output_storage[OUT_N+1]=123456;'+timing(call,check,s['tag'],setup,warm,reps=1,clear=clear)+'printf("PASS\\n");return 0;}\n'
def build(k,role,shape='all'):
 src=OUT/'sources'/k/(role+'.c');d=OUT/'runs'/k/role/shape;d.mkdir(parents=True,exist_ok=False)
 text=src.read_text();text=re.sub(r'^\s*#\s*include[^\n]*\n','',text,flags=re.M)
 text=re.sub(r'struct xnn_f32_default_params\s*\{[^}]*\};','',text,flags=re.S)
 syms=re.findall(r'\bvoid\s+(\w+)\s*\(',text);entry=next((s for s in syms if s in ['test_rvv','test'] or s.startswith('xnn_')),None)
 if entry is None:raise ValueError('entry missing')
 text=text.replace(entry,'test_rvv');m=re.search(r'\bvoid\s+test_rvv\s*\([^)]*\)',text,re.S)
 (d/'proto.h').write_text(m[0]+';\n')
 text=text[:m.start()]+m[0].replace('void ','void __attribute__((noipa)) ',1)+text[m.end():]
 reference='' 
 if k=='f32-vmulc':reference=(OUT/'sources'/k/'B-initial.c').read_text().replace('void test_rvv(', 'void __attribute__((noipa)) reference_kernel(')
 if k=='f32-gemm-minmax' and role=='E-frozen':text=(OUT/'sources'/k/'frozen-helpers/identity-native.c').read_text()+text
 (d/'kernel.c').write_text(PREFIX+text+'\n'+reference);(d/'main.c').write_text(harness(k,d/'proto.h',shape,role))
 if 'avl0' in shape:
  (d/'main.c').write_text((d/'main.c').read_text().replace('vsetvli zero,zero,e8,m1,ta,ma','vsetivli zero,0,e8,m1,ta,ma'))
 if 'aligned64' in shape:
  main=(d/'main.c').read_text().replace('/data.h"','/data-aligned64.h"').replace('/manual-weights.h"','/manual-weights-aligned64.h"')
  if k=='f32-vmulc':
   main=main.replace('static float out[OUT_N];','static float out[OUT_N] __attribute__((aligned(64)));')
  else:
   main=main.replace('output_storage[OUT_N+2];','output_storage[OUT_N+32] __attribute__((aligned(64)));').replace('#define out (output_storage+1)','#define out (output_storage+16)').replace('output_storage[0]','output_storage[15]').replace('output_storage[OUT_N+1]','output_storage[OUT_N+16]')
  (d/'main.c').write_text(main)
 if 'diagnostic' in shape:
  main=(d/'main.c').read_text()
  old='if(__riscv_vcpop_m_b4(__riscv_vmsne_vv_u32m8_b4(xx,yy,vl),vl))return 0;'
  new='if(__riscv_vcpop_m_b4(__riscv_vmsne_vv_u32m8_b4(xx,yy,vl),vl)){for(size_t j=0;j<vl;j++)if(x[j]!=y[j]){printf("BAD index=%lu got=%lx expected=%lx\\n",(unsigned long)(x-(const uint32_t*)a+j),(unsigned long)x[j],(unsigned long)y[j]);break;}return 0;}'
  (d/'main.c').write_text(main.replace(old,new))
 old=json.loads((R/'round2/hardware/benchmarks-scalar/direct/build.json').read_text());kc=old['kernel_command'];kc=kc[:kc.index('-c')]+['-c',str(d/'kernel.c'),'-o',str(d/'kernel.o')]
 if 'clang' in shape:
  flags=[x for x in kc[1:kc.index('-c')] if x not in ['-nostdlib','-nostartfiles','-static','-fno-tree-loop-distribute-patterns'] and not x.startswith('-march=')]
  kc=[str(R/'tools/ziglang/zig'),'cc','-target','riscv64-linux-musl','-mcpu=generic_rv64+m+a+f+d+c+v+zvfh',*flags,'-c',str(d/'kernel.c'),'-o',str(d/'kernel.o')]
 link=old['harness_link_command'];oldmain=link[link.index('-T')+2];oldobj=next(x for x in link if x.endswith('/kernel.o'));oldelf=link[-1]
 link=[str(d/'main.c') if x==oldmain else str(d/'kernel.o') if x==oldobj else str(d/'test.elf') if x==oldelf else x for x in link]
 helpers=[];helper_commands=[];helper_rcs=[]
 if k=='x32-transposec' and role=='E-frozen':
  decl='void xt_store_strided(uint32_t*,size_t,const vuint32m8_t*,size_t);\n'
  (d/'kernel.c').write_text(PREFIX+decl+text)
  hp=d/'strided_store.c'
  body=(OUT/'sources'/k/'frozen-helpers/strided_store.c').read_text()
  body=re.sub(r'/\*.*?\*/','',body,flags=re.S)
  body=re.sub(r'^\s*#\s*include[^\n]*\n','',body,flags=re.M)
  hp.write_text(PREFIX+decl+body);obj=d/'strided_store.o'
  cmd=kc[:kc.index('-c')]+['-c',str(hp),'-o',str(obj)]
  helper_commands.append(cmd);helper_rcs.append(command(cmd,d/'helper-compile.log',env=dict(os.environ,ZIG_GLOBAL_CACHE_DIR=str(OUT/'zig-global-cache'),ZIG_LOCAL_CACHE_DIR=str(OUT/'zig-local-cache'))));helpers.append(str(obj))
  link[link.index('-lm'):link.index('-lm')]=helpers
 if k=='f32-dwconv2d-chw' and role=='E-frozen':
  decl='''vfloat32m2_t dw_r_fma(const vfloat32m2_t*,float,const vfloat32m2_t*,size_t);
vfloat32m2_t dw_r_up(const vfloat32m2_t*,float,size_t);
vfloat32m2_t dw_r_down(const vfloat32m2_t*,float,size_t);
vfloat32m2_t dw_chw_propagating_max(vfloat32m2_t,float,size_t);
vfloat32m2_t dw_chw_propagating_min(vfloat32m2_t,float,size_t);
float dw_read_scalar(const float*);
vfloat32m2_t dw_vector_pixel_compute(const vfloat32m2_t*,const vfloat32m2_t*,const vfloat32m2_t*,const float*,float,float,float,float,float,float,float,float,size_t);
'''
  (d/'kernel.c').write_text(PREFIX+decl+text)
  for name in ['vector_pixel','rvv_extended_borrow','read_scalar','propagating']:
   body=(OUT/'sources'/k/'frozen-helpers'/(name+'.c')).read_text()
   body=re.sub(r'/\*.*?\*/','',body,flags=re.S)
   body=re.sub(r'^\s*#\s*include[^\n]*\n','',body,flags=re.M)
   hp=d/(name+'.c');hp.write_text(PREFIX+decl+body);obj=d/(name+'.o')
   cmd=kc[:kc.index('-c')]+['-c',str(hp),'-o',str(obj)]
   helper_commands.append(cmd);helper_rcs.append(command(cmd,d/(name+'-compile.log'),env=dict(os.environ,ZIG_GLOBAL_CACHE_DIR=str(OUT/'zig-global-cache'),ZIG_LOCAL_CACHE_DIR=str(OUT/'zig-local-cache'))));helpers.append(str(obj))
  link[link.index('-lm'):link.index('-lm')]=helpers
 rc=command(kc,d/'kernel-compile.log',env=dict(os.environ,ZIG_GLOBAL_CACHE_DIR=str(OUT/'zig-global-cache'),ZIG_LOCAL_CACHE_DIR=str(OUT/'zig-local-cache')));lc=command(link,d/'link.log') if rc==0 and all(x==0 for x in helper_rcs) else None
 meta=dict(kernel=k,role=role,shape=shape,source=str(src),source_sha256=sha(src),kernel_command=kc,link_command=link,kernel_rc=rc,link_rc=lc,compiler_sha256=sha(Path(kc[0])),simulator_sha256=sha(SIM))
 write(d/'build.json',meta)
 meta.update(helper_commands=helper_commands,helper_rcs=helper_rcs,repetitions=3 if k=='f32-vmulc' else 1,validation_scope='final output after timed calls; identical deterministic inputs; canaries for non-VMULC',harness_sha256=sha(d/'main.c'),compiled_source_sha256=sha(d/'kernel.c'))
 write(d/'build.json',meta)
 if rc!=0 or lc!=0:raise RuntimeError('compile failed '+str(d))
 return d
def run(d,timeout=180,maxcycles=20000000):
 binary=d/'test.elf';cmd=[str(SIM),'+permissive','+dramsim','+dramsim_ini_dir='+str(CY/'generators/testchipip/src/main/resources/dramsim2_ini'),'+max-cycles='+str(maxcycles),'+verilator+seed+1','+loadmem='+str(binary),'+permissive-off',str(binary)]
 env=dict(os.environ,LD_LIBRARY_PATH=str(CY/'tools/DRAMSim2')+':'+str(R/'tools/spike-compatible-install/lib'))
 start=time.monotonic();rc=command(cmd,d/'rtl.log',timeout,cwd=d,env=env);t=(d/'rtl.log').read_text()
 samples=[dict(shape=s,repeat=int(rep),cycles=int(c),instret=int(ins),correct=bool(int(ok))) for s,rep,c,ins,ok in re.findall(r'SAMPLE (\S+) (\d+) (\d+) (\d+) ([01])',t)]
 expected=json.loads((d/'build.json').read_text()).get('repetitions',3)
 valid=rc==0 and '\nPASS\n' in t and len(samples)==expected and all(s['correct'] for s in samples)
 result=dict(valid=valid,returncode=rc,command=cmd,timeout_seconds=timeout,elapsed_seconds=time.monotonic()-start,binary_sha256=sha(binary),simulator_sha256=sha(SIM),samples=samples,min_cycles=min(s['cycles'] for s in samples) if valid else None)
 write(d/'result.json',result);print(d.relative_to(OUT),json.dumps(result),flush=True)
 return result

def native_check(d):
 """Functional precheck of the actual kernel objects; QEMU counters are discarded."""
 template=json.loads((OUT/'fixtures/f32-vmulc/manifest.json').read_text())['compile_command']
 oldmain=template[template.index('-lm')-1];oldelf=template[-1]
 cmd=[str(d/'main.c') if x==oldmain else str(d/'native.elf') if x==oldelf else x for x in template]
 objects=[str(d/'kernel.o')]+[c[-1] for c in json.loads((d/'build.json').read_text()).get('helper_commands',[])]
 cmd[cmd.index('-lm'):cmd.index('-lm')]=objects
 env=dict(os.environ,ZIG_GLOBAL_CACHE_DIR=str(OUT/'zig-global-cache'),ZIG_LOCAL_CACHE_DIR=str(OUT/'zig-local-cache'))
 rc=command(cmd,d/'native-compile.log',120,env=env)
 qcmd=[str(R/'tools/qemu-riscv64-static'),'-cpu','rv64,v=true,vlen=512,elen=64,vext_spec=v1.0',str(d/'native.elf')]
 qrc=command(qcmd,d/'native.log',45) if rc==0 else None
 text=(d/'native.log').read_text() if (d/'native.log').exists() else ''
 valid=rc==0 and qrc==0 and 'PASS' in text.splitlines() and 'FAIL' not in text.splitlines()
 write(d/'native.json',dict(valid=valid,compile_returncode=rc,run_returncode=qrc,compile_command=cmd,run_command=qcmd,metric='functional only; QEMU cycle values discarded'))
 return valid
if __name__=='__main__':
 p=argparse.ArgumentParser();p.add_argument('kernel');p.add_argument('role');p.add_argument('--shape',default='all');p.add_argument('--timeout',type=int,default=180);a=p.parse_args()
 run(build(a.kernel,a.role,a.shape),a.timeout)
