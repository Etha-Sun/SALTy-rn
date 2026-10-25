typedef unsigned int uint32_t;
typedef unsigned long long size_t;
typedef unsigned long long uintptr_t;
/*@ Import Coq Require Import X32Packw.ScalarMemory */
/*@ Extern Coq (PWMap :: *) (PWOutput :: *) */
/*@ Extern Coq (pw_map_nodup:PWMap->Prop) (pw_data:PWMap->Assertion) (pw_present:PWMap->Z->Prop) (pw_get:PWMap->Z->Z) (pw_data_rest:PWMap->Z->Assertion) (NoDup:{A}->list A->Prop) */
/*@ Extern Coq (pw_output:list Z->PWOutput->Assertion) (pw_output_rest:list Z->PWOutput->Z->Assertion) (pw_output_put:PWOutput->Z->Z->PWOutput) (In:{A}->A->list A->Prop) */
uint32_t pw_read_word(const uint32_t*p)
/*@ With(F:PWMap)
 Require p>0 && pw_map_nodup(F) && pw_present(F,p) && pw_data(F)
 Ensure __return==pw_get(F,p) && 0<=__return && __return<=4294967295 && pw_data(F) */;
void pw_write_word(uint32_t*p,uint32_t x)
/*@ With(W:list Z)(O:PWOutput)
 Require p>0 && NoDup(W) && In(p,W) && pw_output(W,O)
 Ensure pw_output(W,pw_output_put(O,p,x)) */;
/*@ Import Coq Require Import X32Packw.ObservationModel */
/*@ Extern Coq (PWCall :: *) */
/*@ Extern Coq (pw_exact:PWOutput->Z->Z->Prop) (pw_observation:PWMap->PWCall->PWOutput->Z->Z->Prop) */
uint32_t pw_read_output(const uint32_t*p)
/*@ With(W:list Z)(O:PWOutput)(x:Z)
 Require p>0 && NoDup(W) && In(p,W) && pw_exact(O,p,x) && pw_output(W,O)
 Ensure __return==x && pw_output(W,O) */;
uint32_t pw_read_output(const uint32_t*p)
/*@ With(W:list Z)(O:PWOutput)(x:Z)
 Require p>0 && NoDup(W) && In(p,W) && pw_exact(O,p,x) && pw_output(W,O)
 Ensure __return==x && pw_output(W,O) */
{
 /*@ Assert p==p@pre && p>0 && NoDup(W) && In(p,W) && pw_exact(O,p,x) && store(p,unsigned int,x) * pw_output_rest(W,O,p) */
 return *p;
}
