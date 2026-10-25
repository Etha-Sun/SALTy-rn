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
/*@ Import Coq Require Import X32Packw.MainModel */
/*@ Extern Coq (PWCall :: *) */
/*@ Extern Coq (pw_program_storage:PWMap->list Z->PWCall->Prop) (pw_program:PWMap->PWCall->PWOutput->PWOutput) */
/*@ Extern Coq (pw_groups:PWCall->Z) (pw_channels:PWCall->Z) (pw_depth:PWCall->Z) (pw_extra_bytes:PWCall->Z) (pw_weights:PWCall->Z) (pw_bias:PWCall->Z) (pw_output_base:PWCall->Z) (pw_tiles:PWCall->Z) */
/*@ Extern Coq (pw_group_weight:PWCall->Z->Z) (pw_bias_at:PWCall->Z->Z->Z) (pw_tile_weight:PWCall->Z->Z->Z) (pw_tile_output:PWCall->Z->Z->Z) (pw_group_state:PWMap->PWCall->PWOutput->Z->PWOutput) (pw_tile_state:PWMap->PWCall->PWOutput->Z->Z->PWOutput) */
void pw_assert(int ok) /*@ Require ok!=0 && emp Ensure emp */;
void test_neon(size_t g,size_t nc,size_t kc,size_t nr,size_t kr,size_t sr,
 const uint32_t*weights,const uint32_t*bias,const void*scale,
 uint32_t*packed_weights,size_t extra_bytes,const void*params)
/*@ With(F:PWMap)(W:list Z)(G:PWCall)(O:PWOutput) Require g>0 && nc>0 && kc>0 && weights>0 && packed_weights>0 && g==pw_groups(G) && nc==pw_channels(G) && kc==pw_depth(G) && extra_bytes==pw_extra_bytes(G) && nr==2 && kr==1 && sr==1 && pw_program_storage(F,W,G) && weights==pw_weights(G) && bias==pw_bias(G) && packed_weights==pw_output_base(G) && pw_data(F) * pw_output(W,O) Ensure pw_data(F) * pw_output(W,pw_program(F,G,O)) */;
void test_rvv(size_t g,size_t nc,size_t kc,size_t nr,size_t kr,size_t sr,
 const uint32_t*weights,const uint32_t*bias,const void*scale,
 uint32_t*packed_weights,size_t extra_bytes,const void*params)
/*@ With(F:PWMap)(W:list Z)(G:PWCall)(O:PWOutput) Require g>0 && nc>0 && kc>0 && weights>0 && packed_weights>0 && g==pw_groups(G) && nc==pw_channels(G) && kc==pw_depth(G) && extra_bytes==pw_extra_bytes(G) && nr==2 && kr==1 && sr==1 && pw_program_storage(F,W,G) && weights==pw_weights(G) && bias==pw_bias(G) && packed_weights==pw_output_base(G) && pw_data(F) * pw_output(W,O) Ensure pw_data(F) * pw_output(W,pw_program(F,G,O)) */;
/*@ Import Coq Require Import X32Packw.ObservationModel */
/*@ Extern Coq (PWCall :: *) */
/*@ Extern Coq (pw_exact:PWOutput->Z->Z->Prop) (pw_observation:PWMap->PWCall->PWOutput->Z->Z->Prop) */
uint32_t pw_read_output(const uint32_t*p)
/*@ With(W:list Z)(O:PWOutput)(x:Z)
 Require p>0 && NoDup(W) && In(p,W) && pw_exact(O,p,x) && pw_output(W,O)
 Ensure __return==x && pw_output(W,O) */;
/* Both real kernels execute on the same live output buffer. The first
   observed UInt32 is held in an actual C local across the second call.
   Unwritten None cells are retained by the full state theorem; observation
   itself requires an initialized word, rather than assigning a default. */
int test_equivalence(size_t g,size_t nc,size_t kc,size_t nr,size_t kr,size_t sr,
 const uint32_t*weights,const uint32_t*bias,const void*scale,
 uint32_t*packed_weights,size_t extra_bytes,const void*params,const uint32_t*address)
/*@ With(F:PWMap)(W:list Z)(G:PWCall)(O:PWOutput)(x:Z)
 Require g>0 && nc>0 && kc>0 && weights>0 && packed_weights>0 && g==pw_groups(G) && nc==pw_channels(G) && kc==pw_depth(G) && extra_bytes==pw_extra_bytes(G) && nr==2 && kr==1 && sr==1 && pw_program_storage(F,W,G) && weights==pw_weights(G) && bias==pw_bias(G) && packed_weights==pw_output_base(G) && address>0 && In(address,W) && pw_observation(F,G,O,address,x) && pw_data(F) * pw_output(W,O)
 Ensure __return==1 && pw_data(F) * pw_output(W,pw_program(F,G,O)) */
{
 test_neon(g,nc,kc,nr,kr,sr,weights,bias,scale,packed_weights,extra_bytes,params) /*@ where F=F,W=W,G=G */;
 const uint32_t left=pw_read_output(address) /*@ where W=W,x=x */;
 test_rvv(g,nc,kc,nr,kr,sr,weights,bias,scale,packed_weights,extra_bytes,params) /*@ where F=F,W=W,G=G */;
 const uint32_t right=pw_read_output(address) /*@ where W=W,x=x */;
 return left==right;
}
