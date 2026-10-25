#!/usr/bin/env python3
from pathlib import Path
import hashlib,json,subprocess,tempfile,shutil
C=Path(__file__).resolve().parent.parent;sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest();run=Path(tempfile.mkdtemp(prefix='support-native-',dir=C/'.build'));inc=run/'input';inc.mkdir();files=['shim/support.c','shim/support.h','shim/types.h','shim/types_def.h'];pins={f:sha(C/f)for f in files}
for f in files:shutil.copy2(C/f,inc/Path(f).name)
t=(C/'shim/types.h').read_text();a=t.index('struct xnn_f32_minmax_params');projection='#include <stdint.h>\n#include <stddef.h>\n'+t[a:t.rfind('#endif')];(inc/'types.h').write_text(projection)
# Preserve every actual support body; the host projection only replaces fixed
# scalar typedef spellings with the corresponding stdint/stddef types.
h=run/'harness.c';h.write_text('''#include <stdint.h>
#include <stddef.h>
#include <stdio.h>
#include <limits.h>
#include "input/support.c"
_Static_assert(sizeof(size_t)==8&&sizeof(uint32_t)==4&&sizeof(int32_t)==4,"width64");
static uint64_t seed=UINT64_C(0x9173c002a7b15e43),cases;
static uint64_t rnd(void){seed^=seed<<13;seed^=seed>>7;seed^=seed<<17;return seed;}
static int test(uint64_t n){
 uint64_t m=n>UINT64_MAX-15?n-15:n;
 uint64_t expected=(m+15)&UINT64_C(0xfffffffffffffff0);
 if(dw_round_up_po2(m,16)!=expected)return 1;
 if(dw_doz(n,3)!=(n>=3?n-3:0))return 2;
 int32_t a[4];for(int i=0;i<4;i++){uint32_t u=(uint32_t)rnd();a[i]=u<UINT32_C(0x80000000)?(int32_t)u:(int32_t)((int64_t)u-INT64_C(0x100000000));}
 uint32x4_t r=dw_mask_words(a);uint32_t got[4]={r.s0,r.s1,r.s2,r.s3};
 for(int i=0;i<4;i++){uint64_t expected_word=a[i]<0?(uint64_t)((int64_t)a[i]+INT64_C(0x100000000)):(uint64_t)a[i];if(got[i]!=expected_word)return 3;}
 cases++;return 0;
}
int main(void){
 const uint64_t edge[]={0,1,2,3,4,7,8,15,16,17,INT32_MAX,UINT32_MAX,UINT64_C(0x8000000000000000),UINT64_MAX-16,UINT64_MAX-15,UINT64_MAX-1,UINT64_MAX};
 for(size_t i=0;i<sizeof(edge)/sizeof(edge[0]);i++)if(test(edge[i]))return 1;
 for(uint64_t i=0;i<65536;i++)if(test(i)||test(rnd()))return 2;
 int32_t masks[7]={-1,-1,-1,-1,0,0,0};for(int k=0;k<4;k++){uint32x4_t r=dw_mask_words(masks+k);uint32_t g[4]={r.s0,r.s1,r.s2,r.s3};for(int i=0;i<4;i++)if(g[i]!=(uint32_t)masks[k+i])return 3;}
 dw_assert(1);dw_assert(-1);printf("passed cases=%llu mask_windows=4\\n",(unsigned long long)cases);return 0;
}
''');flags=['gcc-12','-std=c11','-O1','-g','-fsanitize=undefined','-fno-sanitize-recover=all',str(h),'-o',str(run/'harness')];records=[]
for label,cmd in [('compile',flags),('run',[str(run/'harness')])]:
 full=['prlimit','--as=17179869184:17179869184','--',*cmd]
 with(run/(label+'.log')).open('w')as f:r=subprocess.run(full,stdout=f,stderr=f,timeout=600,cwd=run)
 records.append({'label':label,'command':full,'exit_code':r.returncode,'log_sha256':sha(run/(label+'.log'))});assert r.returncode==0,(label,(run/(label+'.log')).read_text())
assert pins=={f:sha(C/f)for f in files};s={'passed':True,'whole_kernel_verified':False,'scope':'Finite native UBSan of every actual ordinary support C body with independently defined uint32 conversion, uint64 round-up/doz oracles; not ISA/formal whole proof','run_directory':str(run),'input_sha256':pins,'native_types_projection_sha256':sha(inc/'types.h'),'native_type_projection':'Fixed scalar typedef spellings replaced by corresponding host stdint/stddef types; vector field declarations copied exactly, widths actual static-asserted.','records':records,'result':(run/'run.log').read_text()};(run/'status.json').write_text(json.dumps(s,indent=2)+'\n');(C/'proof/support-native-status.json').write_bytes((run/'status.json').read_bytes());print(s['result'])
