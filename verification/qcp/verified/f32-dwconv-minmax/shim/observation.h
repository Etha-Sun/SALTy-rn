#ifndef DWCONV_OBSERVATION_H
#define DWCONV_OBSERVATION_H
/*@ Import Coq Require Import NanBridge.BridgeLogic */
/*@ Extern Coq (bit_same:fp32->fp32->Prop)
 (same_value:fp32->fp32->Prop) (returned_one:Z->Prop) */
float preserve_float(float x)
/*@ Require emp Ensure bit_same(__return,x) && emp */;
int check_observation(float x,float y)
/*@ Require same_value(x,y) && emp Ensure returned_one(__return) && emp */;
int same_lane(float x,float y)
/*@ Require same_value(x,y) && emp Ensure __return==1 && emp */;
#endif
