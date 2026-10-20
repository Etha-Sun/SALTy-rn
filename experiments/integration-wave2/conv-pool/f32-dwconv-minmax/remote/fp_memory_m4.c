#include "fp_primitives.h"
/*@
 logic float next_m4_lane(vfloat32m4_t v,integer j) = v.lane[j];
 predicate next_m4_bias(vfloat32m4_t v,integer j,float x) = ext_same(next_m4_lane(v,j),x);
 logic float next_m4_lane0(vfloat32m4_t v) = v.lane[0];
 predicate next_m4_bias0(vfloat32m4_t v,float x) = ext_same(next_m4_lane0(v),x);
*/
/*@ ghost
 /@ assigns \nothing;
    ensures next_m4_projection0: ext_same(p->lane[0],next_m4_lane0(*p)); @/
 static void next_m4_project(const vfloat32m4_t *p) {}
 /@ assigns \nothing;
    ensures next_weight_block_separated:
      \base_addr(p)!=\base_addr(q) ==> \separated(p+(0..n-1),q);
    ensures dw45_point_separated: \base_addr(p)!=\base_addr(q) ==>
      (\forall integer j; \separated(p+j,q)); @/
 static void next_dw_disjoint(const float *p,const vfloat32m4_t *q,size_t n) {}

 /@ assigns \nothing;
    ensures next_m4_project_lane0: \forall float x; next_m4_bias(*p,0,x) ==> ext_same(p->lane[0],x);
    ensures next_m4_project_lane1: \forall float x; next_m4_bias(*p,1,x) ==> ext_same(p->lane[1],x);
    ensures next_m4_project_lane2: \forall float x; next_m4_bias(*p,2,x) ==> ext_same(p->lane[2],x);
    ensures next_m4_project_lane3: \forall float x; next_m4_bias(*p,3,x) ==> ext_same(p->lane[3],x);
    ensures next_m4_project_all: \forall integer j; \forall float x;
      0<=j<16 && next_m4_bias(*p,j,x) ==> ext_same(p->lane[j],x); @/
 static void next_m4_project_lanes(const vfloat32m4_t *p) {}

 /@ assigns \nothing;
    ensures next_m4_transitive0: \forall float x;
      next_m4_bias0(v,x) && ext_same(y,next_m4_lane0(v)) ==> ext_same(y,x); @/
 static void next_m4_transitive(vfloat32m4_t v,float y) {}

*/


/*@ requires vl<=16; requires \valid_read(p+(0..vl-1)); assigns \nothing; ensures \forall integer j; 0<=j<vl ==> (ext_same(\result.lane[j],p[j]));  ensures next_m4_loaded_lane0: 0<vl ==> next_m4_bias(\result,0,p[0]); ensures next_m4_loaded_lane1: 1<vl ==> next_m4_bias(\result,1,p[1]); ensures next_m4_loaded_lane2: 2<vl ==> next_m4_bias(\result,2,p[2]); ensures next_m4_loaded_lane3: 3<vl ==> next_m4_bias(\result,3,p[3]); ensures next_m4_loaded_all: \forall integer j; 0<=j<vl ==> next_m4_bias(\result,j,p[j]); ensures next_m4_loaded0: 0<vl ==> next_m4_bias0(\result,p[0]); */
vfloat32m4_t __riscv_vle32_v_f32m4(const float *p,size_t vl) {
  vfloat32m4_t r={{0}}; /*@ loop invariant 0<=i<=vl; loop invariant \forall integer j; 0<=j<i ==> (ext_same(r.lane[j],p[j]));  loop assigns i,r; loop variant vl-i; */
for(size_t i=0;i<vl;i++)r.lane[i]=p[i];return r;
}

/*@ requires vl<=16; requires \valid(p+(0..vl-1)); assigns p[0..vl-1]; ensures \forall integer j; 0<=j<vl ==> (ext_same(p[j],v.lane[j])); */
void __riscv_vse32_v_f32m4(float *p,vfloat32m4_t v,size_t vl) {
  /*@ loop invariant 0<=i<=vl; loop invariant \forall integer j; 0<=j<i ==> (ext_same(p[j],v.lane[j]));  loop assigns i,p[0..vl-1]; loop variant vl-i; */
for(size_t i=0;i<vl;i++)p[i]=v.lane[i];
}

/*@ requires vl<=16; assigns \nothing; ensures \forall integer j; 0<=j<vl ==> (ext_same(\result.lane[j],value)); */
vfloat32m4_t __riscv_vfmv_v_f_f32m4(float value,size_t vl) {
  vfloat32m4_t r={{0}}; /*@ loop invariant 0<=i<=vl; loop invariant \forall integer j; 0<=j<i ==> (ext_same(r.lane[j],value));  loop assigns i,r; loop variant vl-i; */
for(size_t i=0;i<vl;i++)r.lane[i]=value; return r;
}

vfloat32m1_t __riscv_vfredusum_vs_f32m4_f32m1(vfloat32m4_t a,vfloat32m1_t z,size_t vl) { for(size_t i=0;i<vl;i++)z.lane[0]+=a.lane[i];return z; }
