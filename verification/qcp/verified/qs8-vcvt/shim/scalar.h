#ifndef QCP_QS8_CVT_SCALAR_H
#define QCP_QS8_CVT_SCALAR_H
typedef signed char int8_t;
typedef short int16_t;
typedef int int32_t;
typedef long long int64_t;
typedef unsigned int uint32_t;
typedef unsigned short uint16_t;
typedef unsigned long size_t;
/*@ Import Coq Require Import Qs8I8Cvt.Model */
/*@ Extern Coq (qcv_s16:Z -> Z) (qcv_seed:Z -> Z)
 (qcv_asr15:Z -> Z) (qcv_asr16:Z -> Z) (qcv_subw:Z -> Z -> Z) (qcv_shl7:Z -> Z)
 (qcv_sat16:Z -> Z) (qcv_sat8:Z -> Z)
 (qcv_neon_qrdmulh:Z -> Z -> Z) (qcv_rvv_mul:Z -> Z -> Z)
 (qcv_rvv_rnu15:Z -> Z) (qcv_rvv_clip15:Z -> Z)
 (qcv_neon_add:Z -> Z -> Z) (qcv_rvv_add:Z -> Z -> Z) */
int16_t qcp_qcv_narrow16(int32_t x)
/*@ Require -2147483648<=x && x<=2147483647 && emp Ensure __return==qcv_s16(x) && -32768<=__return && __return<=32767 && emp */;
int64_t qcp_qcv_asr15(int64_t x)
/*@ Require -4294967296<=x && x<=4294967296 && emp Ensure __return==qcv_asr15(x) && -131072<=__return && __return<=131072 && emp */;
int64_t qcp_qcv_asr16(int64_t x)
/*@ Require -4294967296<=x && x<=4294967296 && emp Ensure __return==qcv_asr16(x) && -65536<=__return && __return<=65536 && emp */;
int16_t qcp_qcv_sat16(int64_t x)
/*@ Require -9223372036854775807-1<=x && x<=9223372036854775807 && emp Ensure __return==qcv_sat16(x) && -32768<=__return && __return<=32767 && emp */;
int8_t qcp_qcv_sat8(int16_t x)
/*@ Require -32768<=x && x<=32767 && emp Ensure __return==qcv_sat8(x) && -128<=__return && __return<=127 && emp */;
int16_t qcp_qcv_seed(int32_t x)
/*@ Require -2147483648<=x && x<=2147483647 && emp Ensure __return==qcv_seed(x) && -32768<=__return && __return<=32767 && emp */;
int16_t qcp_qcv_subw(int16_t z,int8_t x)
/*@ Require -32768<=z && z<=32767 && -128<=x && x<=127 && emp Ensure __return==qcv_subw(z,x) && -32768<=__return && __return<=32767 && emp */;
int16_t qcp_qcv_shl7(int16_t x)
/*@ Require -32768<=x && x<=32767 && emp Ensure __return==qcv_shl7(x) && -32768<=__return && __return<=32767 && emp */;
int16_t qcp_qcv_neon_qrdmulh(int16_t a,int16_t b)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && emp Ensure __return==qcv_neon_qrdmulh(a,b) && -32768<=__return && __return<=32767 && emp */;
int32_t qcp_qcv_rvv_mul(int16_t a,int16_t b)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && emp Ensure __return==qcv_rvv_mul(a,b) && emp */;
int16_t qcp_qcv_rvv_clip15(int32_t p)
/*@ Require -2147483648<=p && p<=2147483647 && emp Ensure __return==qcv_rvv_clip15(p) && -32768<=__return && __return<=32767 && emp */;
int16_t qcp_qcv_neon_add(int16_t a,int16_t b)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && emp Ensure __return==qcv_neon_add(a,b) && -32768<=__return && __return<=32767 && emp */;
int16_t qcp_qcv_rvv_add(int16_t a,int16_t b)
/*@ Require -32768<=a && a<=32767 && -32768<=b && b<=32767 && emp Ensure __return==qcv_rvv_add(a,b) && -32768<=__return && __return<=32767 && emp */;
#endif
