#!/usr/bin/env python3
"""Finite native checks of the actual scalar-field RVV C shim and repaired RVV."""
import hashlib,json,subprocess,tempfile,time
from pathlib import Path
CASE=Path(__file__).resolve().parent.parent
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def includes(names):return ''.join('#include "'+str(CASE/'shim'/n)+'"\n' for n in names)
def arithmetic():
    s=includes(['scalar_primitives.c','rvv_arithmetic.c'])
    s+='extern int printf(const char*,...);\nint main(void){unsigned long cases=0;for(unsigned base=0;base<256;base++)for(unsigned raw=0;raw<256;raw++)for(size_t vl=0;vl<=128;vl++){int8_t b=(signed char)raw;vint8m8_t a;\n'
    s+=''.join('a.s'+str(i)+'=(signed char)(base+'+str(i*17)+');\n' for i in range(128))
    s+='vint8m8_t mn=__riscv_vmin_vx_i8m8(a,b,vl),mx=__riscv_vmax_vx_i8m8(a,b,vl);\n'
    for i in range(128):
        x='a.s'+str(i)
        s+='if('+x+'!=(signed char)(base+'+str(i*17)+'))return 130;\n'
        s+='if(mn.s'+str(i)+'!=('+str(i)+'<vl?('+x+'<b?'+x+':b):'+x+')||mx.s'+str(i)+'!=('+str(i)+'<vl?('+x+'>b?'+x+':b):'+x+'))return '+str(i+1)+';\n'
    return s+'cases++;}printf("passed %lu arithmetic cases\\n",cases);return cases==8454144?0:131;}\n'
def memory():
    s=includes(['neon_load.c','rvv_load.c','rvv_store.c'])
    s+='extern int printf(const char*,...);\nint main(void){unsigned long cases=0; signed char input[263];unsigned char out[263];for(unsigned seed=0;seed<256;seed++){for(unsigned j=0;j<263;j++){input[j]=(signed char)(seed+17*j);}for(unsigned off=1;off<=3;off++)for(size_t vl=0;vl<=128;vl++){vint8m8_t a=__riscv_vle8_v_i8m8(input+off,vl);\n'
    s+=''.join('if(a.s'+str(i)+'!=('+str(i)+'<vl?input[off+'+str(i)+']:0))return 1;\n' for i in range(128))
    s+='for(size_t i=0;i<128;i++){if(qcp_s8_rvv_get128(&a,i)!=(i<vl?input[off+i]:0))return 2;}for(unsigned j=0;j<263;j++){out[j]=165;}__riscv_vse8_v_i8m8((int8_t*)(out+off),a,vl);for(unsigned j=0;j<263;j++){if(out[j]!=(j>=off&&j<off+vl?(unsigned char)input[j]:165))return 3;}\n'
    s+=''.join('if(a.s'+str(i)+'!=('+str(i)+'<vl?input[off+'+str(i)+']:0))return 4;\n' for i in range(128))
    return s+'cases++;}}printf("passed %lu memory cases\\n",cases);return cases==99072?0:5;}\n'
def kernel():
    s=includes(['scalar_primitives.c','neon_load.c','rvv_arithmetic.c','rvv_load.c','rvv_store.c','control.c','rvv_frontend.h'])
    s+='#include "'+str(CASE/'impl/testRVV.c')+'"\nextern int printf(const char*,...);\n'
    s+='''_Static_assert(sizeof(int8_t)==1 && sizeof(int32_t)==4 && sizeof(size_t)==8,"native target widths");
_Static_assert((signed char)128==-128 && (unsigned char)256==0,"native byte narrowing");
static int narrow(int x){unsigned u=((unsigned)x)&255U;return u<128?(int)u:(int)u-256;}
int main(void){
 const int raw[16]={-2147483647-1,2147483647,-65537,-65536,-32769,-32768,-257,-256,-129,-128,-1,0,1,127,128,255};
 signed char input[4112];unsigned char output[4112];unsigned long cases=0;
 for(unsigned ni=1;ni<=266;ni++){
  const unsigned big[9]={511,512,513,1023,1024,1025,4095,4096,4097};
  unsigned n=ni<=257?ni:big[ni-258];
  for(unsigned l=0;l<16;l++)for(unsigned h=0;h<16;h++)for(unsigned seed=0;seed<2;seed++){
   struct xnn_s8_minmax_params p={{raw[l],raw[h]}};int lo=narrow(raw[l]),hi=narrow(raw[h]);
   for(unsigned i=0;i<4112;i++){input[i]=(signed char)(i*17+seed*73+l*11+h*29);output[i]=165;}
   test_rvv(n,input+1,(signed char*)(output+3),&p);
   if(p.scalar.min!=raw[l]||p.scalar.max!=raw[h])return 10;
   for(unsigned j=0;j<4112;j++){
    if(input[j]!=(signed char)(j*17+seed*73+l*11+h*29))return 11;
    int expected=165;
    if(j>=3 && j<3+n){unsigned i=j-3;int x=input[1+i];
     if(i<n-(n%64)){if(x<lo)x=lo;if(x>hi)x=hi;}
     else {if(x>hi)x=hi;if(x<lo)x=lo;}
     expected=(unsigned char)x;
    }
    if(output[j]!=expected)return 12;
   }
   cases++;
  }
 }
 printf("passed %lu repaired RVV calls\\n",cases);return cases==136192?0:13;
}
'''
    return s

def main():
    (CASE/'.build').mkdir(exist_ok=True);run=Path(tempfile.mkdtemp(prefix='rvv-native-',dir=CASE/'.build'));records=[]
    status={'passed':False,'formal_proof':False,'whole_kernel_verified':False,'scope':'finite host tests of actual scalar-field C shim and repaired RVV body; no ISA/ABI refinement theorem','run_directory':str(run),'records':records}
    paths=[CASE/'impl/testRVV.c',CASE/'proof/check_rvv_native.py',*sorted((CASE/'shim').glob('*.h')),*[CASE/'shim'/n for n in ['scalar_primitives.c','neon_load.c','rvv_arithmetic.c','rvv_load.c','rvv_store.c','control.c']]]
    inputs={str(p.relative_to(CASE)):sha(p) for p in paths}
    def execute(cmd,label):
        cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];t=time.monotonic();log=run/(label+'.log')
        with log.open('w') as f:r=subprocess.run(cmd,cwd=run,stdout=f,stderr=f,timeout=1200)
        records.append({'label':label,'command':cmd,'exit_code':r.returncode,'seconds':time.monotonic()-t,'log_sha256':sha(log)})
        if r.returncode:raise RuntimeError(label+': '+log.read_text()[-3000:])
    try:
        for name,source in [('arithmetic',arithmetic()),('memory',memory()),('kernel',kernel())]:
            src=run/(name+'.c');src.write_text(source);execute(['gcc','-std=c11','-O2','-Wall','-Wextra','-Werror','-Wno-unused-parameter',src,'-o',run/name],name+'-build');execute([run/name],name)
        if inputs!={str(p.relative_to(CASE)):sha(p) for p in paths}:raise ValueError('Native source changed during replay')
        status.update(passed=True,input_sha256=inputs,arithmetic_vector_cases=8454144,memory_vector_cases=99072,repaired_rvv_calls=136192,
          observation='all 128 field values, VL0..128, signed byte/bound combinations, inactive preservation, active stores, canaries, input/parameter frame, full repaired schedule',native_target='LP64 with 8-bit two-complement signed char; checked by private C static assertions',no_alignment_condition=True)
    except Exception as e:status['error']=str(e)
    (run/'status.json').write_text(json.dumps(status,indent=2)+'\n');dest=CASE/'proof/rvv-native-status.json';history=CASE/'proof/history';history.mkdir(exist_ok=True)
    if dest.exists():
        old=dest.read_bytes();(history/(dest.stem+'-'+hashlib.sha256(old).hexdigest()+'.json')).write_bytes(old)
    dest.write_text(json.dumps(status,indent=2)+'\n');print(json.dumps({'passed':status['passed'],'run_directory':str(run),'error':status.get('error')},indent=2));return 0 if status['passed']else 1
if __name__=='__main__':raise SystemExit(main())
