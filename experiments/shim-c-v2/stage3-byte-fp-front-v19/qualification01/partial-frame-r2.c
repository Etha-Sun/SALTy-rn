#include <stdint.h>
#include <string.h>
/*@ assigns \nothing; ensures \result==1; */
int positive_partial_byte_frame(void) {
  uint32_t words[2]={UINT32_C(0x3f800000),UINT32_C(0x12345678)};
  /*@ assert initial_byte_0: ((unsigned char*)words)[0]==0; */
  /*@ assert initial_byte_1: ((unsigned char*)words)[1]==0; */
  /*@ assert initial_byte_2: ((unsigned char*)words)[2]==128; */
  /*@ assert initial_byte_3: ((unsigned char*)words)[3]==63; */
  /*@ assert initial_byte_4: ((unsigned char*)words)[4]==120; */
  /*@ assert initial_byte_5: ((unsigned char*)words)[5]==86; */
  /*@ assert initial_byte_6: ((unsigned char*)words)[6]==52; */
  /*@ assert initial_byte_7: ((unsigned char*)words)[7]==18; */
  unsigned char byte=1; /*@ ghost CopySnapshot20: ; */
  memcpy((unsigned char*)words+1,&byte,1);
  /*@ assert copy_20_byte_0: ((signed char*)((unsigned char*)words+1))[0] == ((signed char*)(&byte))[0]; */
  
  /*@ assert final_byte_0: ((unsigned char*)words)[0]==0; */
  /*@ assert final_byte_1: ((unsigned char*)words)[1]==1; */
  /*@ assert final_byte_2: ((unsigned char*)words)[2]==128; */
  /*@ assert final_byte_3: ((unsigned char*)words)[3]==63; */
  /*@ assert final_byte_4: ((unsigned char*)words)[4]==120; */
  /*@ assert final_byte_5: ((unsigned char*)words)[5]==86; */
  /*@ assert final_byte_6: ((unsigned char*)words)[6]==52; */
  /*@ assert final_byte_7: ((unsigned char*)words)[7]==18; */
  /*@ assert first_word: words[0]==UINT32_C(0x3f800100); */
  /*@ assert second_word: words[1]==UINT32_C(0x12345678); */
  return words[0]==UINT32_C(0x3f800100) && words[1]==UINT32_C(0x12345678);
}
