From Coq Require Import ZArith Lia List.
From ArgmaxPool Require Export APProgramFacts APProgramMemoryFacts.
Local Open Scope Z_scope.

Definition app_arguments(D:APProgram)(pixels rows channels input offset stride output index input_inc output_inc index_inc:Z):Prop:=
 pixels=app_pixels D /\ rows=app_rows D /\ channels=app_channels D /\
 input=app_input D /\ offset=app_offset D /\ stride=app_pixel_stride D /\
 output=app_output_base D /\ index=app_index_base D /\
 input_inc=app_input_increment D /\ output_inc=app_output_increment D /\
 index_inc=app_index_increment D.
Definition app_valid(F:APMap)(P:APPtrMap)(W WI:list Z)(D:APProgram):Prop:=
 app_geometry F P W WI D /\ NoDup W /\ NoDup WI.
Definition app_final_output(side:bool)(F:APMap)(P:APPtrMap)(D:APProgram)(O:APOutput)(I:APIndex):APOutput:=
 fst(app_program_result side F P D(O,I)).
Definition app_final_index(side:bool)(F:APMap)(P:APPtrMap)(D:APProgram)(O:APOutput)(I:APIndex):APIndex:=
 snd(app_program_result side F P D(O,I)).
Definition app_neon_output:=app_final_output true.
Definition app_neon_index:=app_final_index true.
Definition app_rvv_output:=app_final_output false.
Definition app_rvv_index:=app_final_index false.
Definition app_before_output(side:bool)(F:APMap)(P:APPtrMap)(D:APProgram)(pixel:Z)(O:APOutput)(I:APIndex):APOutput:=
 fst(app_pixel_before side F P D pixel(O,I)).
Definition app_before_index(side:bool)(F:APMap)(P:APPtrMap)(D:APProgram)(pixel:Z)(O:APOutput)(I:APIndex):APIndex:=
 snd(app_pixel_before side F P D pixel(O,I)).
Definition app_partial_output(side:bool)(F:APMap)(P:APPtrMap)(D:APProgram)(pixel group done:Z)(O:APOutput)(I:APIndex):APOutput:=
 fst(app_pass_partial side F P D pixel group done(app_pixel_before side F P D pixel(O,I))).
Definition app_partial_index(side:bool)(F:APMap)(P:APPtrMap)(D:APProgram)(pixel group done:Z)(O:APOutput)(I:APIndex):APIndex:=
 snd(app_pass_partial side F P D pixel group done(app_pixel_before side F P D pixel(O,I))).
Definition app_rvv_partial_output:=app_partial_output false.
Definition app_rvv_partial_index:=app_partial_index false.
Definition app_neon_partial_output:=app_partial_output true.
Definition app_neon_partial_index:=app_partial_index true.
Definition app_group_cursor(D:APProgram)(remaining:Z):Z:=
 if Z.eqb remaining 0 then app_groups(app_rows D)else(app_rows D-remaining)/9.
Definition app_previous_cursor(group base done:Z):Z:=
 if Z.eqb group 0 then 0 else base+4*done.
Definition app_read_cursor(table rows group count:Z):Z:=
 table+8*(9*group+Z.min(app_remaining rows group)count).
Lemma app_valid_positive:forall F P W WI D,app_valid F P W WI D->
 0<app_pixels D /\ 0<app_rows D /\ 0<app_channels D.
Proof. unfold app_valid,app_geometry;intros;tauto. Qed.
Lemma app_final_same_initial:forall F P D O I,
 app_neon_output F P D O I=app_rvv_output F P D O I /\
 app_neon_index F P D O I=app_rvv_index F P D O I.
Proof.
 intros;unfold app_neon_output,app_rvv_output,app_neon_index,app_rvv_index,
 app_final_output,app_final_index;rewrite app_program_equal_same_initial;auto.
Qed.
Print Assumptions app_valid_positive.
Print Assumptions app_final_same_initial.
