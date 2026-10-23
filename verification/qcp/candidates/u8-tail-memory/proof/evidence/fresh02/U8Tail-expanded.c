/*@ Import Coq Require Import U8Tail.LEModel */
/*@ Extern Coq (le_byte0 : Z -> Z) (le_byte1 : Z -> Z)
               (le_byte2 : Z -> Z) (le_byte3 : Z -> Z) */
void qcp_u8_store_word32(unsigned char *out,unsigned int word)
/*@ Require 0 <= word && word <= 4294967295 &&
    undef_data_at(out+0,unsigned char) *
    undef_data_at(out+1,unsigned char) *
    undef_data_at(out+2,unsigned char) *
    undef_data_at(out+3,unsigned char)
 Ensure data_at(out+0,unsigned char,le_byte0(word)) *
data_at(out+1,unsigned char,le_byte1(word)) *
data_at(out+2,unsigned char,le_byte2(word)) *
data_at(out+3,unsigned char,le_byte3(word)) */
{
 out[0]=(unsigned char)(word);
 out[1]=(unsigned char)(word/256U);
 out[2]=(unsigned char)(word/65536U);
 out[3]=(unsigned char)(word/16777216U);
}
void qcp_u8_store_word16(unsigned char *out,unsigned short word)
/*@ Require 0 <= word && word <= 65535 &&
    undef_data_at(out+0,unsigned char) *
    undef_data_at(out+1,unsigned char)
 Ensure data_at(out+0,unsigned char,le_byte0(word)) *
data_at(out+1,unsigned char,le_byte1(word)) */
{
 out[0]=(unsigned char)(word);
 out[1]=(unsigned char)(word/256U);
}
void qcp_u8_store_byte(unsigned char *out,unsigned char value)
/*@ Require 0 <= value && value <= 255 &&
    undef_data_at(out+0,unsigned char)
 Ensure data_at(out+0,unsigned char,value) */
{
 out[0]=(unsigned char)(value);
}
