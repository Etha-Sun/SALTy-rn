From Coq Require Import ZArith.
From ExpMinusMax Require Export ProgramModel IntrinsicModel.
Local Open Scope Z_scope.
Definition em_load_record4(F:EMMap)(p:Z):Recordfloat32x4_t:=em_make_float32x4_t(fun j=>em_get F(p+4*j)).
Definition em_write_record4(O:EMOutput)(p:Z)(A:Recordfloat32x4_t):EMOutput:=em_output_write O p 4(em_get_float32x4_t A).
Definition em_write_record2(O:EMOutput)(p:Z)(A:Recordfloat32x2_t):EMOutput:=em_output_write O p 2(em_get_float32x2_t A).
