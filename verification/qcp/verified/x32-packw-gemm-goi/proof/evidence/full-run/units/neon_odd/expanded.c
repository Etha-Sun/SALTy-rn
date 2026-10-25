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
/*@ Import Coq Require Import X32Packw.AccessModel */
/*@ Extern Coq (pw_odd_pre:PWMap->list Z->Z->Z->Z->Prop) (pw_odd_run:Z->PWMap->Z->Z->PWOutput->PWOutput) (pw_offset:Z->Z->Z) */
void pw_neon_odd(size_t kc,const uint32_t*a,uint32_t*p)
/*@ With(F:PWMap)(W:list Z)(O:PWOutput)
 Require pw_map_nodup(F) && pw_odd_pre(F,W,a,p,kc) && pw_data(F) * pw_output(W,O)
 Ensure pw_data(F) * pw_output(W,pw_odd_run(kc,F,a,p,O)) */;
void pw_neon_odd(size_t kc,const uint32_t*a,uint32_t*p)
/*@ With(F:PWMap)(W:list Z)(O:PWOutput)
 Require pw_map_nodup(F) && pw_odd_pre(F,W,a,p,kc) && pw_data(F) * pw_output(W,O)
 Ensure pw_data(F) * pw_output(W,pw_odd_run(kc,F,a,p,O)) */
{
 size_t k=kc;
 /*@ Inv Assert kc==kc@pre && pw_map_nodup(F) && pw_odd_pre(F,W,a@pre,p@pre,kc@pre) && a==pw_offset(a@pre,4*(kc@pre-k)) && p==pw_offset(p@pre,8*(kc@pre-k)) && 0<=k && k<=kc@pre && pw_data(F) * pw_output(W,pw_odd_run(kc@pre-k,F,a@pre,p@pre,O)) */
 while(k!=0){
  uint32_t x=pw_read_word(a);
  a+=1;
  pw_write_word(p,x);
  p+=2;
  k-=1;
 }
}
