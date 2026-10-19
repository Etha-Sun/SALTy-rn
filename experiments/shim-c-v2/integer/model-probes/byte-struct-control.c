#include <stdint.h>
#include <string.h>
typedef struct {int8_t lane[8];} S8;
typedef struct {uint16_t lane[4];} U16;
typedef struct {uint32_t lane[2];} U32;
/*@ terminates \true; assigns \nothing;
 ensures \forall integer j;0<=j<4 ==> \result.lane[j]==(uint8_t)a.lane[2*j]+256*(uint8_t)a.lane[2*j+1]; */
U16 pack16(S8 a) {U16 r;memcpy(&r,&a,sizeof r);return r;}
/*@ terminates \true; assigns \nothing;
 ensures \forall integer j;0<=j<2 ==> \result.lane[j]==(uint32_t)((uint8_t)a.lane[4*j]+256*(uint8_t)a.lane[4*j+1]+65536*(uint8_t)a.lane[4*j+2]+16777216*(uint8_t)a.lane[4*j+3]); */
U32 pack32(S8 a) {U32 r;memcpy(&r,&a,sizeof r);return r;}
