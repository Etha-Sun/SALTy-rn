#!/usr/bin/env python3
"""Compile the actual copied kernels and shared C modules, then regress interfaces."""
from pathlib import Path
import subprocess,json,hashlib,os,time
R=Path(__file__).resolve().parent; B=R/'.build'; B.mkdir(exist_ok=True)
MAINS={
'x32-transposec':r'''
int main(void) { size_t count=0;
 for(size_t w=1;w<=35;w++)for(size_t h=1;h<=19;h++)for(size_t gap=0;gap<3;gap++) {
  size_t is=w+gap,os=h+gap; uint32_t *a=malloc((h*is+1)*4),*l=malloc(w*os*4),*r=malloc(w*os*4);
  for(size_t i=0;i<h*is+1;i++)a[i]=(uint32_t)(i*2654435761u+w);
  for(size_t i=0;i<w*os;i++)l[i]=r[i]=0x12345678;
  if(!equivalent(w,h,is,os,a,l,r))return 1;
  for(size_t y=0;y<h;y++)for(size_t x=0;x<w;x++)if(l[x*os+y]!=a[y*is+x])return 2;
  free(a);free(l);free(r);count++;
 } printf("%zu\n",count); return 0; }
''',
'x32-packw-gemm-goi':r'''
int main(void) { size_t count=0;
 for(size_t g=1;g<=3;g++)for(size_t nc=1;nc<=19;nc++)for(size_t kc=1;kc<=19;kc++)for(size_t extra=0;extra<3;extra++)for(int usebias=0;usebias<2;usebias++) {
  size_t sz=g*((nc+1)/2)*(2+2*kc+extra); uint32_t *a=malloc(g*nc*kc*4),*bias=malloc(g*nc*4),*l=malloc(sz*4),*r=malloc(sz*4);
  for(size_t i=0;i<g*nc*kc;i++)a[i]=(uint32_t)(i*2654435761u+kc);
  for(size_t i=0;i<g*nc;i++)bias[i]=(uint32_t)(i*2246822519u+nc);
  for(size_t i=0;i<sz;i++)l[i]=r[i]=0x12345678;
  if(!equivalent(g,nc,kc,extra,a,usebias?bias:NULL,l,r))return 1;
  size_t pos=0;
  for(size_t gg=0;gg<g;gg++)for(size_t ch=0;ch<nc;ch+=2) {
   if(l[pos]!=(usebias?bias[gg*nc+ch]:0))return 2;
   if(ch+1<nc && l[pos+1]!=(usebias?bias[gg*nc+ch+1]:0))return 3;
   pos+=2;
   for(size_t k=0;k<kc;k++) { if(l[pos]!=a[(gg*nc+ch)*kc+k])return 4;
    if(ch+1<nc && l[pos+1]!=a[(gg*nc+ch+1)*kc+k])return 5;pos+=2; }
   pos+=extra;
  }
  free(a);free(bias);free(l);free(r);count++;
 } printf("%zu\n",count);return 0; }
''',
'f32-vcmul':r'''
static float frombits(uint32_t u) { float f;memcpy(&f,&u,4);return f; }
int main(void) { size_t count=0;uint32_t pat[]={0,0x80000000,0x7fc00000,0x7f800000,0xff800000,1,0x7f7fffff,0x3f800000,0xbf800000};
 for(size_t n=1;n<=131;n++)for(size_t kind=0;kind<12;kind++) {
  float *a=malloc((2*n+3)*4),*b=malloc((2*n+3)*4),*l=malloc(2*n*4),*r=malloc(2*n*4);
  for(size_t i=0;i<2*n+3;i++) { a[i]=kind<3 ? ((float)(int)(i%21)-10.0f)/7.0f : frombits(pat[(i+kind)%9]);b[i]=kind<3 ? ((float)(int)(i%19)-9.0f)/3.0f : frombits(pat[(i*3+kind)%9]); }
  if(!equivalent(n,a,b,l,r))return 1;
  for(size_t i=0;i<n;i++) { float rr=complex_sub(complex_mul(a[i],b[i]),complex_mul(a[n+i],b[n+i]));float ii=complex_add(complex_mul(a[i],b[n+i]),complex_mul(a[n+i],b[i]));
   if(!(l[i]==rr || (l[i]!=l[i] && rr!=rr)))return 2;
   if(!(l[n+i]==ii || (l[n+i]!=l[n+i] && ii!=ii)))return 3;
  }free(a);free(b);free(l);free(r);count++;
 }printf("%zu\n",count);return 0; }
'''}
results=[]
for name,main in MAINS.items():
 d=R/'cases'/name; module='complex_fp' if name=='f32-vcmul' else 'u32_shim'
 files=[R/'shared'/(module+'.h'),R/'shared'/(module+'.c'),*[d/x for x in ['neon.c','rvv.c','spec.h','harness.c']]]
 unit=B/(name+'.c'); unit.write_text('#include <stdio.h>\n#include <stdlib.h>\n#include <string.h>\n'+f'#include "{files[0]}"\n'+''.join(f'#include "{p}"\n' for p in files[1:])+main)
 out=B/name;cmd=['gcc','-std=c11','-O1','-g','-ffp-contract=off','-fno-fast-math','-fsanitize=address,undefined','-fno-omit-frame-pointer','-I'+str(d),'-I'+str(R/'shared'),str(unit),'-o',str(out)]
 compile=subprocess.run(cmd,capture_output=True,text=True); run=None
 if compile.returncode==0: run=subprocess.run([str(out)],capture_output=True,text=True,env={**os.environ,'ASAN_OPTIONS':'detect_leaks=0'},timeout=90)
 results.append({'kernel':name,'compile':compile.returncode,'compile_stderr':compile.stderr,'run':None if run is None else run.returncode,'stdout':None if run is None else run.stdout,'stderr':None if run is None else run.stderr,'command':cmd,'hashes':{str(p.relative_to(R)):hashlib.sha256(p.read_bytes()).hexdigest() for p in files}})
 print(name,results[-1]['run'],results[-1]['stdout'],results[-1]['stderr'])
(R/'small-native-results.json').write_text(json.dumps(results,indent=2)+'\n')
assert all(r['compile']==0 and r['run']==0 for r in results)
