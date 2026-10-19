#!/usr/bin/env python3
"""Native differential checks of complete original/repaired kernels, no proof claims."""
from pathlib import Path
import subprocess,json,os,hashlib,re
R=Path(__file__).resolve().parent;B=R/'.build';B.mkdir(exist_ok=True)
COMMON=r'''
static uint32_t bits(float f){uint32_t u;memcpy(&u,&f,4);return u;}
static float frombits(uint32_t u){float f;memcpy(&f,&u,4);return f;}
static int same(float a,float b){return a==b||(a!=a&&b!=b);}
static size_t cases=0,failed=0;
static void compare(const float *a,const float *b,size_t n,size_t dim,unsigned mode){
 cases++;for(size_t i=0;i<n;i++)if(!same(a[i],b[i])){if(failed<8)printf("mismatch dim=%zu mode=%u index=%zu neon=%08x rvv=%08x\n",dim,mode,i,bits(a[i]),bits(b[i]));failed++;break;}}
static void fill(float *p,size_t n,unsigned seed){for(size_t i=0;i<n;i++)p[i]=((float)(int)((i*7+seed)%23)-11.0f)/9.0f;}
static void finish(void){printf("cases=%zu failed=%zu\n",cases,failed);}
'''
MAINS={
'f32-maxpool':r'''
int main(void){for(size_t k=1;k<=20;k++)for(size_t c=1;c<=35;c++)for(unsigned mode=0;mode<5;mode++){
 float *a=calloc(k*(c+3),4),*l=calloc(c+3,4),*r=calloc(c+3,4);const float **tab=malloc(k*sizeof(float*));fill(a,k*(c+3),2);
 for(size_t j=0;j<k;j++)tab[j]=a+j*(c+3);
 struct xnn_f32_minmax_params p={{-INFINITY,INFINITY}};
 if(mode==1)a[(k/2)*(c+3)]=NAN;if(mode==2)p.scalar.min=NAN;if(mode==3)p.scalar.max=NAN;if(mode==4){p.scalar.min=-0.2f;p.scalar.max=0.3f;}
 test_neon(1,k,c,tab,0,0,l,0,0,&p);test_rvv(1,k,c,tab,0,0,r,0,0,&p);compare(l,r,c,c,mode);
 free(a);free(l);free(r);free(tab);}finish();return 0;}
''',
'f32-argmaxpool':r'''
int main(void){for(size_t k=1;k<=20;k++)for(size_t c=1;c<=35;c++)for(unsigned mode=0;mode<5;mode++){
 float *a=calloc(k*(c+3),4),*l=calloc(c+3,4),*r=calloc(c+3,4);uint32_t *li=calloc(c+3,4),*ri=calloc(c+3,4);const float **tab=malloc(k*sizeof(float*));fill(a,k*(c+3),2);
 for(size_t j=0;j<k;j++)tab[j]=a+j*(c+3);
 if(mode==1)a[(k/2)*(c+3)]=NAN;if(mode==2)for(size_t i=0;i<k*(c+3);i++)a[i]=1.0f;if(mode==3)a[0]=NAN;
 test_neon(1,k,c,tab,0,0,l,li,0,0,0);test_rvv(1,k,c,tab,0,0,r,ri,0,0,0);compare(l,r,c,c,mode);
 for(size_t i=0;i<c;i++)if(li[i]!=ri[i]){if(failed<8)printf("index mismatch c=%zu k=%zu mode=%u lane=%zu neon=%u rvv=%u\n",c,k,mode,i,li[i],ri[i]);failed++;break;}
 free(a);free(l);free(r);free(li);free(ri);free(tab);}finish();return 0;}
''',
'f32-igemm-minmax':r'''
int main(void){for(size_t nc=1;nc<=25;nc++)for(size_t k=1;k<=5;k++)for(size_t ks=1;ks<=3;ks++)for(unsigned mode=0;mode<5;mode++){
 size_t wn=((nc+7)/8)*(1+ks*k)*8;float *a=calloc(ks*(k+4),4),*w=calloc(wn,4),*l=calloc(nc+8,4),*r=calloc(nc+8,4);const float **tab=malloc(ks*sizeof(float*));fill(a,ks*(k+4),1);fill(w,wn,4);for(size_t p=0;p<ks;p++)tab[p]=a+p*(k+4);
 struct xnn_f32_minmax_params p={{-INFINITY,INFINITY}};if(mode==1)a[0]=NAN;if(mode==2)p.scalar.min=NAN;if(mode==3)p.scalar.max=NAN;if(mode==4){p.scalar.min=-0.2f;p.scalar.max=0.3f;}
 test_neon(1,nc,k*4,ks*sizeof(void*),tab,w,l,nc*4,32,0,NULL,&p);test_rvv(1,nc,k*4,ks*sizeof(void*),tab,w,r,nc*4,32,0,NULL,&p);compare(l,r,nc,nc,mode);
 free(a);free(w);free(l);free(r);free(tab);}finish();return 0;}
''',
'f32-spmm-minmax':r'''
int main(void){for(size_t m=1;m<=35;m++)for(size_t nc=1;nc<=5;nc++)for(unsigned mode=0;mode<6;mode++){
 float *a=calloc(m*nc+m+128,4),*w=calloc(nc*2,4),*l=calloc(nc*(m+4),4),*r=calloc(nc*(m+4),4);int32_t *dm=calloc(nc,4);uint32_t *nz=calloc(nc,4);
 for(size_t i=0;i<m*nc+m+128;i++)a[i]=frombits(0x3f800001);for(size_t i=0;i<nc;i++){w[2*i]=-1.0f;w[2*i+1]=frombits(0x3f7fffff);nz[i]=1;if(mode==5)dm[i]=4;}
 if(mode==5){for(size_t i=0;i<m*nc+m+128;i++)a[i]=(float)i;for(size_t i=0;i<nc;i++){w[2*i]=0.0f;w[2*i+1]=1.0f;}}
 struct xnn_f32_minmax_params p={{-INFINITY,INFINITY}};if(mode==1)a[0]=NAN;if(mode==2)p.scalar.min=NAN;if(mode==3)p.scalar.max=NAN;if(mode==4){p.scalar.min=-0.2f;p.scalar.max=0.3f;}
 test_neon(m*4,nc,a,w,dm,nz,l,(m+4)*4,&p);test_rvv(m*4,nc,a,w,dm,nz,r,(m+4)*4,&p);for(size_t n=0;n<nc;n++)compare(l+n*(m+4),r+n*(m+4),m,m,mode);
 free(a);free(w);free(l);free(r);free(dm);free(nz);}finish();return 0;}
''',
'f32-dwconv-minmax':r'''
int main(void){for(size_t c=1;c<=35;c++)for(unsigned mode=0;mode<5;mode++){
 size_t wn=((c+3)/4)*16;float *a=calloc(3*(c+3),4),*w=calloc(wn,4),*l=calloc(c+3,4),*r=calloc(c+3,4);fill(a,3*(c+3),1);fill(w,wn,4);const float *tab[]={a,a+c+3,a+2*(c+3)};
 struct xnn_f32_minmax_params p={{-INFINITY,INFINITY}};if(mode==1)a[0]=NAN;if(mode==2)p.scalar.min=NAN;if(mode==3)p.scalar.max=NAN;if(mode==4){p.scalar.min=-0.2f;p.scalar.max=0.3f;}
 test_neon(c,1,tab,w,l,0,0,0,0,NULL,&p);test_rvv(c,1,tab,w,r,0,0,0,0,NULL,&p);compare(l,r,c,c,mode);
 free(a);free(w);free(l);free(r);}finish();return 0;}
''',
'f32-dwconv2d-chw':r'''
int main(void){for(size_t h=1;h<=8;h++)for(size_t w=1;w<=19;w++)for(unsigned mode=0;mode<5;mode++){
 float *a=calloc((h+5)*w+8,4),*z=calloc(w+8,4),*l=calloc(h*w+8,4),*r=calloc(h*w+8,4),weight[10];fill(a,h*w,1);fill(weight,10,4);
 struct xnn_f32_minmax_params p={{-INFINITY,INFINITY}};if(mode==1)a[0]=NAN;if(mode==2)p.scalar.min=NAN;if(mode==3)p.scalar.max=NAN;if(mode==4){p.scalar.min=-0.2f;p.scalar.max=0.3f;}
 test_neon(h,w*4,a,weight,z,l,1,&p);test_rvv(h,w*4,a,weight,z,r,1,&p);compare(l,r,h*w,w,mode);
 free(a);free(z);free(l);free(r);}finish();return 0;}
''',
'f32-conv-hwc2chw':r'''
int main(void){for(size_t h=1;h<=5;h++)for(size_t w=1;w<=11;w++)for(size_t nc=1;nc<=5;nc++)for(unsigned mode=0;mode<6;mode++){
 size_t oh=(h+1)/2,ow=(w+1)/2;float *abase=calloc((h+6)*w*3+32,4),*a=abase+8,*zbase=calloc(w*3+32,4),*z=zbase+8,*wt=calloc(((nc+3)/4)*112,4),*l=calloc((nc+4)*oh*ow+16,4),*r=calloc((nc+4)*oh*ow+16,4);fill(a,h*w*3,1);fill(wt,((nc+3)/4)*112,4);
 struct xnn_f32_minmax_params p={{-INFINITY,INFINITY}};if(mode==1)a[0]=NAN;if(mode==2)p.scalar.min=NAN;if(mode==3)p.scalar.max=NAN;if(mode==4){p.scalar.min=-0.2f;p.scalar.max=0.3f;}
 test_neon(h,w,0,oh,a,z,wt,l,1,nc,ow*4,oh*ow*4,&p);test_rvv(h,w,0,oh,a,z,wt,r,1,nc,ow*4,oh*ow*4,&p);compare(l,r,nc*oh*ow,w,mode);
 free(abase);free(zbase);free(wt);free(l);free(r);}finish();return 0;}
''',
'qd8-f32-qc4w-gemm-minmax':r'''
int main(void){for(size_t nc=1;nc<=35;nc++)for(size_t k=1;k<=19;k++)for(unsigned mode=0;mode<5;mode++){
 size_t kk=(k+1)&~1u,blocks=(nc+15)/16,wb=64+kk/2*16+128;unsigned char *buf=calloc(blocks*wb,1);int8_t *a=calloc(kk+8,1);float *l=calloc(nc+16,4),*r=calloc(nc+16,4);
 for(size_t i=0;i<kk;i++)a[i]=(int8_t)((int)(i%17)-8);for(size_t b=0;b<blocks;b++){for(size_t i=0;i<kk/2*16;i++)buf[b*wb+64+i]=(unsigned char)(i*19+7);for(size_t i=0;i<16;i++){int32_t ks=(int32_t)(i*16);memcpy(buf+b*wb+i*4,&ks,4);float scale=0.125f,bias=0.25f;memcpy(buf+b*wb+64+kk/2*16+i*4,&scale,4);memcpy(buf+b*wb+64+kk/2*16+64+i*4,&bias,4);}}
 struct xnn_f32_qc4w_minmax_params p={{-INFINITY,INFINITY,0}};struct xnn_qd8_quantization_params q={3,0.25f};if(mode==1)q.inv_scale=NAN;if(mode==2)p.scalar.min=NAN;if(mode==3)p.scalar.max=NAN;if(mode==4){p.scalar.min=-0.2f;p.scalar.max=0.3f;}
 test_neon(1,nc,k,a,kk,buf,l,nc*4,64,&p,&q);test_rvv(1,nc,k,a,kk,buf,r,nc*4,64,&p,&q);compare(l,r,nc,nc,mode);
 free(buf);free(a);free(l);free(r);}finish();return 0;}
''',
'f32-raddstoreexpminusmax':r'''
int main(void){for(size_t n=1;n<=131;n++)for(unsigned mode=0;mode<12;mode++){
 float *a=calloc(n+3,4),*l=calloc(n+3,4),*r=calloc(n+3,4),mx=0,sl=0,sr=0;for(size_t i=0;i<n+3;i++)a[i]=-((float)((i*7+mode*13)%83))/9.0f;
 if(mode==8)a[0]=NAN;if(mode==9)mx=NAN;if(mode==10)a[0]=-INFINITY;if(mode==11)a[0]=INFINITY;
 test_neon(n*4,a,&mx,l,&sl,NULL);test_rvv(n*4,a,&mx,r,&sr,NULL);compare(l,r,n,n,mode);
 cases++;if(!same(sl,sr)){if(failed<8)printf("sum mismatch n=%zu mode=%u neon=%08x rvv=%08x\n",n,mode,bits(sl),bits(sr));failed++;}
 free(a);free(l);free(r);}finish();return 0;}
'''}

MAINS['f32-gemm-minmax']='static int one(size_t mr,size_t nc,size_t k,unsigned mode) {\n  size_t tiles=(nc+7)/8, wn=tiles*(k+1)*8;\n  float *a=calloc(4*k+16,sizeof(float)),*w=calloc(wn+16,sizeof(float));\n  float *left=calloc(4*nc+16,sizeof(float)),*right=calloc(4*nc+16,sizeof(float));\n  if(!a||!w||!left||!right)abort();\n  for(size_t i=0;i<4*k;i++)a[i]=(float)((int)(i%9)-4)*0.125f;\n  for(size_t i=0;i<wn;i++)w[i]=(float)((int)(i%13)-6)*0.0625f;\n  struct xnn_f32_minmax_params p={{-0.75f,0.625f}};\n  float qnan=frombits(UINT32_C(0xffc03456));\n  switch(mode) {\n  case 1: a[k/2]=qnan;break;\n  case 2: w[8+(nc>3?3:0)]=qnan;break;\n  case 3: for(size_t t=0;t<tiles;t++)w[t*(k+1)*8]=qnan;break;\n  case 4: p.scalar.min=qnan;break;\n  case 5: p.scalar.max=qnan;break;\n  case 6: p.scalar.min=qnan;p.scalar.max=qnan;break;\n  case 7: for(size_t i=0;i<4*k;i++)a[i]=i%2?-0.0f:0.0f;\n          for(size_t i=0;i<wn;i++)w[i]=i%2?0.0f:-0.0f;\n          p.scalar.min=-0.0f;p.scalar.max=0.0f;break;\n  case 8: a[0]=INFINITY;w[8]=0.0f;break;\n  case 9: a[0]=-INFINITY;p.scalar.min=-INFINITY;p.scalar.max=INFINITY;break;\n  case 10: w[0]=INFINITY;w[8]=-INFINITY;a[0]=1.0f;break;\n  case 11: p.scalar.min=INFINITY;p.scalar.max=-INFINITY;break;\n  }\n  test_neon(mr,nc,k*4,a,k*4,w,left,nc*4,32,&p);\n  test_rvv(mr,nc,k*4,a,k*4,w,right,nc*4,32,&p);\n  int ok=1;\n  for(size_t r=0;r<mr;r++)for(size_t c=0;c<nc;c++) {\n    size_t at=r*nc+c;\n    if(bits(left[at])!=bits(right[at])) {\n      fprintf(stderr,"mismatch mr=%zu nc=%zu k=%zu mode=%u row=%zu col=%zu %08x %08x\\n",mr,nc,k,mode,r,c,bits(left[at]),bits(right[at]));ok=0;\n    }\n  }\n  free(a);free(w);free(left);free(right);return ok;\n}\nint main(void) {size_t columns[]={1,2,3,4,7,8,9,17,23,33},depths[]={1,2,3,7,16};size_t count=0;\nfor(size_t mr=1;mr<=4;mr++)for(size_t j=0;j<10;j++)for(size_t q=0;q<5;q++)for(unsigned mode=0;mode<12;mode++){if(!one(mr,columns[j],depths[q],mode))return 2;count++;}\nprintf("cases=%zu failed=0\\n",count);return 0;}'

def run(names=None,variant='original_rvv.c'):
 results=[]
 for name,main in MAINS.items():
  if names and name not in names:continue
  d=R/'cases'/name;unit=B/(name+'-'+variant+'.c');p=d/variant
  if not p.exists():continue
  unit.write_text('#include <stdio.h>\n#include <stdlib.h>\n#include <fenv.h>\n'+f'#include "{R}/shared/native_fp.h"\n#include "{d}/neon.c"\n#include "{p}"\n'+COMMON+re.sub(r'int main\(void\)\s*\{', 'int main(void){if(fegetround()!=FE_TONEAREST)return 3;',main))
  out=B/(name+'-'+variant);cmd=['gcc','-std=c11','-O0','-g','-fno-fast-math','-ffp-contract=off','-fsanitize=address,undefined','-fno-omit-frame-pointer',str(unit),'-lm','-o',str(out)]
  comp=subprocess.run(cmd,capture_output=True,text=True);rr=None
  if comp.returncode==0:rr=subprocess.run([str(out)],capture_output=True,text=True,timeout=90,env={**os.environ,'ASAN_OPTIONS':'detect_leaks=0'})
  row={'kernel':name,'variant':variant,'compile':comp.returncode,'compile_stderr':comp.stderr,'returncode':None if rr is None else rr.returncode,'stdout':None if rr is None else rr.stdout,'stderr':None if rr is None else rr.stderr,'command':cmd,'hashes':{str(x.relative_to(R)):hashlib.sha256(x.read_bytes()).hexdigest() for x in [R/'shared/native_fp.h',d/'neon.c',p]}};results.append(row);print(name,variant,row['returncode'],row['stdout'],(row['stderr'] or '')[:1000],flush=True)
 (R/('wide-native-'+variant.replace('.c','')+'-results.json')).write_text(json.dumps(results,indent=2)+'\n')
 return results
if __name__=='__main__':
 import sys
 run(sys.argv[2:] or None,sys.argv[1] if len(sys.argv)>1 else 'original_rvv.c')
