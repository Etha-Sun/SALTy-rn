#include <stdint.h>
#include <string.h>
/*@ terminates \true; assigns \nothing; ensures \result==1; */
int offset_positive(void){
uint8_t src[8]={11,22,33,44,55,66,77,88};uint8_t dst[8]={1,2,3,4,5,6,7,8};
memcpy(dst+2,src+3,2);
return dst[2]==44 && dst[3]==55;
}
/*@ terminates \true; assigns \nothing; ensures \false; */
int offset_false(void){
uint8_t src[8]={11,22,33,44,55,66,77,88};uint8_t dst[8]={1,2,3,4,5,6,7,8};
memcpy(dst+2,src+3,2);
return dst[2]==44 && dst[3]==55;
}
/*@ terminates \true; assigns \nothing; ensures \result==1; */
int frame_positive(void){
uint8_t src[8]={11,22,33,44,55,66,77,88};uint8_t dst[8]={1,2,3,4,5,6,7,8};
memcpy(dst+2,src,2);
return dst[0]==1 && dst[1]==2 && dst[4]==5 && dst[7]==8;
}
/*@ terminates \true; assigns \nothing; ensures \false; */
int frame_false(void){
uint8_t src[8]={11,22,33,44,55,66,77,88};uint8_t dst[8]={1,2,3,4,5,6,7,8};
memcpy(dst+2,src,2);
return dst[0]==1 && dst[1]==2 && dst[4]==5 && dst[7]==8;
}
/*@ terminates \true; assigns \nothing; ensures \result==1; */
int alias_positive(void){
uint8_t dst[8]={11,22,33,44,55,66,77,88};
memcpy(dst+4,dst+1,2);
return dst[0]==11 && dst[4]==22 && dst[5]==33 && dst[7]==88;
}
/*@ terminates \true; assigns \nothing; ensures \false; */
int alias_false(void){
uint8_t dst[8]={11,22,33,44,55,66,77,88};
memcpy(dst+4,dst+1,2);
return dst[0]==11 && dst[4]==22 && dst[5]==33 && dst[7]==88;
}
int main(void) { return !(offset_positive() && frame_positive() && alias_positive()); }
