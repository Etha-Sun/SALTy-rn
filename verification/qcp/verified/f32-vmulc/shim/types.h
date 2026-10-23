/*@ Import Coq Require Import VMulc.Model */
/*@ Extern Coq (fp32_bits_equal : fp32 -> fp32 -> Prop)
 (vmulc_active_mul : Z -> Z -> fp32 -> fp32 -> fp32) */
typedef struct float32x4_t { float s0; float s1; float s2; float s3; } float32x4_t;
typedef struct vfloat32m8_t { float s0; float s1; float s2; float s3; float s4; float s5; float s6; float s7; float s8; float s9; float s10; float s11; float s12; float s13; float s14; float s15; float s16; float s17; float s18; float s19; float s20; float s21; float s22; float s23; float s24; float s25; float s26; float s27; float s28; float s29; float s30; float s31; } vfloat32m8_t;
