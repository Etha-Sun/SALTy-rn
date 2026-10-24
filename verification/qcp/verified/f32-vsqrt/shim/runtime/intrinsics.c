/* Finite host execution of the separately reviewed intrinsic contracts.
 * No ISA proof or native implementation-body credit is claimed here. */
#include "../intrinsics.h"
#include <stdint.h>
#include <string.h>
#include <math.h>
unsigned sqrt_vl_mode;
static uint32_t bits(float x){uint32_t u;memcpy(&u,&x,4);return u;}
static float value(uint32_t u){float x;memcpy(&x,&u,4);return x;}
static float arm(float x){uint32_t u=bits(x),a=u&0x7fffffffU;
 if(a>0x7f800000U)return value(u|0x00400000U);
 if((u>>31)&&a)return value(0x7fc00000U);
 return sqrtf(x);}
static float rvv(float x){uint32_t u=bits(x),a=u&0x7fffffffU;
 if(a>0x7f800000U||((u>>31)&&a))return value(0x7fc00000U);
 return sqrtf(x);}
float32x4_t vld1q_f32(const float*p){float32x4_t r;r.s0=p[0];r.s1=p[1];r.s2=p[2];r.s3=p[3];return r;}
float32x4_t vsqrtq_f32(float32x4_t a){float32x4_t r;r.s0=arm(a.s0);r.s1=arm(a.s1);r.s2=arm(a.s2);r.s3=arm(a.s3);return r;}
float32x2_t vget_low_f32(float32x4_t a){return(float32x2_t){a.s0,a.s1};}
float32x2_t vget_high_f32(float32x4_t a){return(float32x2_t){a.s2,a.s3};}
size_t __riscv_vsetvl_e32m8(size_t n){if(n<=32)return n;if(n>=64)return 32;size_t low=(n+1)/2;return low+sqrt_vl_mode%(33-low);}
vfloat32m8_t __riscv_vle32_v_f32m8(const float*p,size_t vl){vfloat32m8_t r;r.s0=(0<vl)?p[0]:value(0x7fa12345U+0);r.s1=(1<vl)?p[1]:value(0x7fa12345U+1);r.s2=(2<vl)?p[2]:value(0x7fa12345U+2);r.s3=(3<vl)?p[3]:value(0x7fa12345U+3);r.s4=(4<vl)?p[4]:value(0x7fa12345U+4);r.s5=(5<vl)?p[5]:value(0x7fa12345U+5);r.s6=(6<vl)?p[6]:value(0x7fa12345U+6);r.s7=(7<vl)?p[7]:value(0x7fa12345U+7);r.s8=(8<vl)?p[8]:value(0x7fa12345U+8);r.s9=(9<vl)?p[9]:value(0x7fa12345U+9);r.s10=(10<vl)?p[10]:value(0x7fa12345U+10);r.s11=(11<vl)?p[11]:value(0x7fa12345U+11);r.s12=(12<vl)?p[12]:value(0x7fa12345U+12);r.s13=(13<vl)?p[13]:value(0x7fa12345U+13);r.s14=(14<vl)?p[14]:value(0x7fa12345U+14);r.s15=(15<vl)?p[15]:value(0x7fa12345U+15);r.s16=(16<vl)?p[16]:value(0x7fa12345U+16);r.s17=(17<vl)?p[17]:value(0x7fa12345U+17);r.s18=(18<vl)?p[18]:value(0x7fa12345U+18);r.s19=(19<vl)?p[19]:value(0x7fa12345U+19);r.s20=(20<vl)?p[20]:value(0x7fa12345U+20);r.s21=(21<vl)?p[21]:value(0x7fa12345U+21);r.s22=(22<vl)?p[22]:value(0x7fa12345U+22);r.s23=(23<vl)?p[23]:value(0x7fa12345U+23);r.s24=(24<vl)?p[24]:value(0x7fa12345U+24);r.s25=(25<vl)?p[25]:value(0x7fa12345U+25);r.s26=(26<vl)?p[26]:value(0x7fa12345U+26);r.s27=(27<vl)?p[27]:value(0x7fa12345U+27);r.s28=(28<vl)?p[28]:value(0x7fa12345U+28);r.s29=(29<vl)?p[29]:value(0x7fa12345U+29);r.s30=(30<vl)?p[30]:value(0x7fa12345U+30);r.s31=(31<vl)?p[31]:value(0x7fa12345U+31);return r;}
vfloat32m8_t __riscv_vfsqrt_v_f32m8(vfloat32m8_t a,size_t vl){vfloat32m8_t r;r.s0=(0<vl)?rvv(a.s0):value(0xff812345U+0);r.s1=(1<vl)?rvv(a.s1):value(0xff812345U+1);r.s2=(2<vl)?rvv(a.s2):value(0xff812345U+2);r.s3=(3<vl)?rvv(a.s3):value(0xff812345U+3);r.s4=(4<vl)?rvv(a.s4):value(0xff812345U+4);r.s5=(5<vl)?rvv(a.s5):value(0xff812345U+5);r.s6=(6<vl)?rvv(a.s6):value(0xff812345U+6);r.s7=(7<vl)?rvv(a.s7):value(0xff812345U+7);r.s8=(8<vl)?rvv(a.s8):value(0xff812345U+8);r.s9=(9<vl)?rvv(a.s9):value(0xff812345U+9);r.s10=(10<vl)?rvv(a.s10):value(0xff812345U+10);r.s11=(11<vl)?rvv(a.s11):value(0xff812345U+11);r.s12=(12<vl)?rvv(a.s12):value(0xff812345U+12);r.s13=(13<vl)?rvv(a.s13):value(0xff812345U+13);r.s14=(14<vl)?rvv(a.s14):value(0xff812345U+14);r.s15=(15<vl)?rvv(a.s15):value(0xff812345U+15);r.s16=(16<vl)?rvv(a.s16):value(0xff812345U+16);r.s17=(17<vl)?rvv(a.s17):value(0xff812345U+17);r.s18=(18<vl)?rvv(a.s18):value(0xff812345U+18);r.s19=(19<vl)?rvv(a.s19):value(0xff812345U+19);r.s20=(20<vl)?rvv(a.s20):value(0xff812345U+20);r.s21=(21<vl)?rvv(a.s21):value(0xff812345U+21);r.s22=(22<vl)?rvv(a.s22):value(0xff812345U+22);r.s23=(23<vl)?rvv(a.s23):value(0xff812345U+23);r.s24=(24<vl)?rvv(a.s24):value(0xff812345U+24);r.s25=(25<vl)?rvv(a.s25):value(0xff812345U+25);r.s26=(26<vl)?rvv(a.s26):value(0xff812345U+26);r.s27=(27<vl)?rvv(a.s27):value(0xff812345U+27);r.s28=(28<vl)?rvv(a.s28):value(0xff812345U+28);r.s29=(29<vl)?rvv(a.s29):value(0xff812345U+29);r.s30=(30<vl)?rvv(a.s30):value(0xff812345U+30);r.s31=(31<vl)?rvv(a.s31):value(0xff812345U+31);return r;}
