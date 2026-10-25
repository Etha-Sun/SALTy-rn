/*@ Import Coq Require Import SpmmSpec.TupleMemory */
struct float32x4_t {float s0;float s1;float s2;float s3;};
typedef struct float32x4_t float32x4_t;
struct float32x4x2_t {float32x4_t val[2];};
typedef struct float32x4x2_t float32x4x2_t;
/*@ Extern Coq Record Recordfloat32x4_t { f0:fp32; f1:fp32; f2:fp32; f3:fp32; } */
/*@ Extern Coq Record Recordfloat32x4x2_t { tuple_values:list Recordfloat32x4_t; } */
/*@ Extern Coq
 (tuple_record:list Recordfloat32x4_t -> Recordfloat32x4x2_t)
 (tuple_values:Recordfloat32x4x2_t -> list Recordfloat32x4_t)
 (vec4: fp32 -> fp32 -> fp32 -> fp32 -> Recordfloat32x4_t)
 (f0: Recordfloat32x4_t -> fp32) (f1: Recordfloat32x4_t -> fp32)
 (f2: Recordfloat32x4_t -> fp32) (f3: Recordfloat32x4_t -> fp32)
 (veczero:Recordfloat32x4_t)
 (StructPredfloat32x4x2_t:Z -> Recordfloat32x4x2_t -> Assertion)
 (UndefStructPredfloat32x4_t: Z -> Assertion)
 (UndefStructPredfloat32x4x2_t: Z -> Assertion)
 (Structfloat32x4_tArray::full: Z -> Z -> list Recordfloat32x4_t -> Assertion)
 (Structfloat32x4_tArray::undef_full: Z -> Z -> Assertion)
 (cons:{A} -> A -> list A -> list A) (nil:{A} -> list A)
 (tuple_at: Z -> list Recordfloat32x4_t -> Recordfloat32x4_t)
*/
/*@ include strategies "tuple.strategies" */
