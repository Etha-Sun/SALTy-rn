"""Existing kernels only: serial, finite RTL comparisons; user revoked quota stop."""
import csv,hashlib,json,math,os,re,shutil,struct,subprocess,sys,time,traceback
from fractions import Fraction
from pathlib import Path
HERE=Path(__file__).resolve().parent
AUDIT=HERE.parent
ROOT=AUDIT.parents[1]
sys.path.insert(0,str(AUDIT))
import bench as base

KERNELS=['f32-vadd','f32-vsub','f32-vmul','f32-vdiv','f32-vmin','f32-vmax','f32-vsqrt','f32-vlrelu']
SIZES=[1024,1031]
ROLES=['A-target','C-public','D-xnnpack-u8v']
HEAVY=['f32-vdiv','f32-vsqrt']
def sizes_for(k):return [128,135] if k in HEAVY else SIZES
def run_dir(k,role,n):return HERE/'runs'/k/role/('n'+str(n)+('-warm1' if k in HEAVY else ''))
def write(p,j):p.write_text(json.dumps(j,indent=2,ensure_ascii=False)+'\n')
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def bits(x):return struct.unpack('<I',struct.pack('<f',x))[0]
def flt(b):return struct.unpack('<f',struct.pack('<I',b))[0]
def f32(x):return flt(bits(x))
def neighbor(c,up):
 if c==0:return flt(1 if up else 0x80000001)
 return flt(bits(c)+(1 if (c>0)==up else -1))
def rounding_check(c,exact,sqrt=False):
 if c==0:
  assert exact==0
  return
 lo=(Fraction.from_float(neighbor(c,False))+Fraction.from_float(c))/2
 hi=(Fraction.from_float(neighbor(c,True))+Fraction.from_float(c))/2
 if sqrt:lo,hi=lo*lo,hi*hi
 assert lo<=exact<=hi,(c,exact,lo,hi)
 if exact in [lo,hi]:assert bits(c)%2==0

def prepare():
 (HERE/'sources').mkdir(exist_ok=True);(HERE/'fixtures').mkdir(exist_ok=True)
 origins=json.loads((AUDIT/'sources.json').read_text());ledger=[]
 xhead=subprocess.check_output(['git','-C',str(ROOT/'benchmark/XNNPACK'),'rev-parse','HEAD']).decode().strip()
 for k in KERNELS:
  dest=HERE/'sources'/k;dest.mkdir(exist_ok=True)
  for role in ['A-target','C-public','E-frozen']:
   source=ROOT/'kernels/target'/(k+'.c') if role=='A-target' else AUDIT/'sources'/k/(role+'.c')
   b=source.read_bytes()
   if role!='A-target':assert sha(source)==next(r['sha256'] for r in origins if r['kernel']==k and r['role']==role)
   q=dest/(role+'.c')
   if q.exists():assert q.read_bytes()==b
   else:q.write_bytes(b)
   ledger.append(dict(kernel=k,role=role,source=str(source),snapshot=str(q),sha256=sha(q),commit='working-tree intake' if role=='A-target' else '821969733d7953a212c51839194add416fd5799b' if role=='E-frozen' else '80feb4564cb470de301062109b6f89db672bdf9d'))
  rel=f'src/f32-vbinary/gen/{k}-rvv-u8v.c' if k not in ['f32-vsqrt','f32-vlrelu'] else f'src/{k}/gen/{k}-rvv-'+('sqrt-' if k=='f32-vsqrt' else '')+'u8v.c'
  source=ROOT/'benchmark/XNNPACK'/rel;q=dest/'D-xnnpack-u8v.c'
  if q.exists():assert q.read_bytes()==source.read_bytes()
  else:shutil.copyfile(source,q)
  blob=subprocess.check_output(['git','-C',str(ROOT/'benchmark/XNNPACK'),'ls-tree','HEAD',rel]).decode().split()[2]
  actual=subprocess.check_output(['git','hash-object',str(source)]).decode().strip();assert blob==actual,(k,'modified XNNPACK source')
  ledger.append(dict(kernel=k,role='D-xnnpack-u8v',source=str(source),snapshot=str(q),sha256=sha(q),commit=xhead,git_blob=blob,selection='preselected u8v candidate; no tuning search; not claimed best or paper symbol'))
  a=[f32(((i*37)%257-128)/32) for i in range(1055)]
  b=[f32(((i*13)%31+1)/8) for i in range(1055)]
  a[0],a[1],a[2]=0.0,-0.0,1.0
  if k=='f32-vsqrt':a=[abs(x) for x in a];a[1]=-0.0
  gold=[]
  for x,y in zip(a[:1031],b[:1031]):
   xx,yy=Fraction.from_float(x),Fraction.from_float(y)
   if k=='f32-vadd':v=f32(x+y);rounding_check(v,xx+yy)
   elif k=='f32-vsub':v=f32(x-y);rounding_check(v,xx-yy)
   elif k=='f32-vmul':v=f32(x*y);rounding_check(v,xx*yy)
   elif k=='f32-vdiv':v=f32(x/y);rounding_check(v,xx/yy)
   elif k=='f32-vmin':v=min(x,y)
   elif k=='f32-vmax':v=max(x,y)
   elif k=='f32-vsqrt':v=f32(math.sqrt(x));rounding_check(v,xx,sqrt=True)
   else:v=f32(x*0.125) if math.copysign(1,x)<0 else x;rounding_check(v,xx*Fraction(1,8) if math.copysign(1,x)<0 else xx)
   gold.append(bits(v))
  f=HERE/'fixtures'/k;f.mkdir(exist_ok=True)
  h='\n'.join('static const float '+name+'[] __attribute__((aligned(64)))={'+','.join(x.hex()+'f' for x in arr)+'};' for name,arr in [('a',a),('b',b)])
  h+='\nstatic const uint32_t gold[] __attribute__((aligned(64)))={'+','.join(hex(x)+'u' for x in gold)+'};\n'
  p=f/'data.h'
  if p.exists():assert p.read_text()==h
  else:p.write_text(h)
  write(f/'manifest.json',dict(sizes=sizes_for(k),bytes=[n*4 for n in sizes_for(k)],alignment=64,padding_elements=1055-max(sizes_for(k)),header_sha256=sha(p),input='deterministic dyadic finite binary32, includes signed zero; divisor strictly positive; sqrt input nonnegative',oracle='float32 RNE; exact Fraction midpoint validation for add/sub/mul/div/lrelu and squared-midpoint validation for sqrt; finite min/max, no signed-zero tie',gold_bitwise=True))
 write(HERE/'sources.json',ledger)
 write(HERE/'protocol.json',dict(user_override='2026-11-03: 不需要管限额; previous account quota stop revoked for this extension',kernels=KERNELS,sizes={'default':SIZES,'f32-vdiv':[128,135],'f32-vsqrt':[128,135]},roles=ROLES,extra_frozen=['f32-vmin','f32-vmax'],compiler='xPack GCC15.2 O3 RV64GCV lp64d ffp-contract=off; independent TU/no LTO',hardware=str(AUDIT/'environment/manifest.json'),simulator_sha256=sha(base.SIM),warm_calls={'default':5,'f32-vdiv':1,'f32-vsqrt':1},timed_calls=3,summary='minimum; retain every sample and median separately',validation='bit-exact per timed call plus two canaries; input/output disjoint,64-byte aligned',timing='real kernel call fenced rdcycle/rdinstret; legal AVL0 reset; preparation/output check/printing outside window',scope='local supplementary protocol, not exact paper reproduction; only finite common-domain fixtures, not full IEEE/NaN correctness or a new formal proof',resources='serial, one simulator,120 host seconds for six families and300s for VDIV/VSQRT;20M target cycle cap per job'))

def harness(k,n):
 warm=1 if k in HEAVY else 5
 begin='printf("BENCH_START\\n");' if k in HEAVY else ''
 done='printf("WARM_DONE\\n");' if k in HEAVY else ''
 call=f'test_rvv({n*4},a,'+('out,&params);' if k in ['f32-vsqrt','f32-vlrelu'] else 'b,out,&params);')
 param='struct xnn_f32_lrelu_params params;params.scalar.slope=0.125f;' if k=='f32-vlrelu' else 'struct xnn_f32_default_params params={0};'
 return base.PREFIX+'#include <stdio.h>\n#include "proto.h"\n#include "'+str(HERE/'fixtures'/k/'data.h')+'"\n'+f'''
#define N {n}
static float storage[N+32] __attribute__((aligned(64)));
#define out (storage+16)
static void clear(void){{size_t j=0;while(j<N){{size_t v=__riscv_vsetvl_e32m8(N-j);__riscv_vse32_v_f32m8(out+j,__riscv_vfmv_v_f_f32m8(0,v),v);j+=v;}}}}
static int correct(void){{
 uint32_t l,r;__builtin_memcpy(&l,out-1,4);__builtin_memcpy(&r,out+N,4);
 if(l!=0x5a5a5a5au || r!=0x5a5a5a5au)return 0;
 size_t j=0;while(j<N){{size_t v=__riscv_vsetvl_e32m8(N-j);
 vuint32m8_t x=__riscv_vreinterpret_v_f32m8_u32m8(__riscv_vle32_v_f32m8(out+j,v));
 vuint32m8_t y=__riscv_vle32_v_u32m8(gold+j,v);
 if(__riscv_vcpop_m_b4(__riscv_vmsne_vv_u32m8_b4(x,y,v),v))return 0;j+=v;}}return 1;
}}
int main(void){{
 {param}
 uint32_t guard=0x5a5a5a5au;__builtin_memcpy(out-1,&guard,4);__builtin_memcpy(out+N,&guard,4);
 {begin}
 clear();for(int z=0;z<{warm};z++){{{call}}}
 if(!correct()){{printf("WARM_FAIL\\n");return 1;}}
 {done}
 unsigned long cyc[3],ins[3];int ok[3];
 for(int rep=0;rep<3;rep++){{clear();unsigned long sc,ec,si,ei;
 __asm__ volatile("fence rw,rw; vsetivli zero,0,e8,m1,ta,ma; rdcycle %0; rdinstret %1":"=r"(sc),"=r"(si)::"memory");
 {call}
 __asm__ volatile("fence rw,rw; vsetivli zero,0,e8,m1,ta,ma; rdinstret %0; rdcycle %1":"=r"(ei),"=r"(ec)::"memory");
 cyc[rep]=ec-sc;ins[rep]=ei-si;ok[rep]=correct();}}
 int all=1;for(int rep=0;rep<3;rep++){{printf("SAMPLE n{n} %d %lu %lu %d\\n",rep,cyc[rep],ins[rep],ok[rep]);all&=ok[rep];}}
 if(all)printf("PASS\\n");return all?0:1;
}}
'''

def build(k,role,n):
 d=run_dir(k,role,n);d.mkdir(parents=True,exist_ok=False)
 src=HERE/'sources'/k/(role+'.c');text=src.read_text();text=re.sub(r'^\s*#\s*include[^\n]*\n','',text,flags=re.M)
 entry=re.search(r'\bvoid\s+(test_rvv|test|xnn_\w+)\s*\(',text).group(1);text=text.replace(entry,'test_rvv')
 proto=re.search(r'\bvoid\s+test_rvv\s*\([^)]*\)',text,re.S).group();(d/'proto.h').write_text(proto+';\n')
 text=text.replace('void test_rvv(', 'void __attribute__((noipa)) test_rvv(',1)
 (d/'kernel.c').write_text(base.PREFIX+text);(d/'main.c').write_text(harness(k,n))
 old=json.loads((AUDIT/'runs/f32-vmulc/A-target/author-ref3-avl0-aligned64/build.json').read_text())
 kc=old['kernel_command'];kc=kc[:kc.index('-c')]+['-c',str(d/'kernel.c'),'-o',str(d/'kernel.o')]
 link=old['link_command'];oldmain=link[link.index('-T')+2];oldobj=next(x for x in link if x.endswith('/kernel.o'));oldelf=link[-1]
 link=[str(d/'main.c') if x==oldmain else str(d/'kernel.o') if x==oldobj else str(d/'test.elf') if x==oldelf else x for x in link]
 rc=base.command(kc,d/'kernel-compile.log');lc=base.command(link,d/'link.log') if rc==0 else None
 write(d/'build.json',dict(kernel=k,role=role,n=n,source=str(src),source_sha256=sha(src),compiled_source_sha256=sha(d/'kernel.c'),harness_sha256=sha(d/'main.c'),kernel_command=kc,link_command=link,kernel_rc=rc,link_rc=lc,compiler_sha256=sha(Path(kc[0])),simulator_sha256=sha(base.SIM),helper_commands=[],repetitions=3,warm_calls=1 if k in HEAVY else 5,validation_scope='every timed call, bitwise and canaries'))
 if rc!=0 or lc!=0:raise RuntimeError('compile failed')
 return d

def campaign(pilot=False,heavy_only=False):
 jobs=[(k,role,n) for k in (HEAVY if heavy_only else KERNELS[:1] if pilot else KERNELS) for n in (SIZES[:1] if pilot else sizes_for(k)) for role in ROLES+(['E-frozen'] if k in ['f32-vmin','f32-vmax'] and not pilot else [])]
 for k,role,n in jobs:
  d=run_dir(k,role,n)
  if (d/'result.json').exists():continue
  first=run_dir(k,role,sizes_for(k)[0])/'result.json'
  if k in HEAVY and n!=sizes_for(k)[0] and first.exists() and not json.loads(first.read_text())['valid']:
   d.mkdir(parents=True,exist_ok=True);write(d/'result.json',dict(valid=False,stage='not_started',reason='first128_element_case_unmeasurable_in_same_protocol; no inference about135 correctness',evidence=str(first)));continue
  write(HERE/'CONTINUE.json',dict(status='running',kernel=k,role=role,n=n,resume=f'python3 {HERE}/bench_simple.py run',quota_stop_revoked_by_user=True))
  print('LAUNCH',k,role,n,flush=True)
  try:
   if not (d/'test.elf').exists():build(k,role,n)
   if base.native_check(d):base.run(d,timeout=300 if k in HEAVY else 120)
   else:write(d/'result.json',dict(valid=False,stage='native_precheck'))
  except Exception as e:
   d.mkdir(parents=True,exist_ok=True);write(d/'result.json',dict(valid=False,stage='driver_error',error=str(e)));(d/'exception.log').write_text(traceback.format_exc())
 else:write(HERE/'CONTINUE.json',dict(status='pilot_finished' if pilot else 'campaign_finished',resume=f'python3 {HERE}/bench_simple.py run',quota_stop_revoked_by_user=True))

if __name__=='__main__':
 mode=sys.argv[1]
 if mode=='prepare':prepare()
 else:campaign(mode=='pilot',mode=='heavy')
