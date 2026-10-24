#include "observation.h"
float preserve_float(float x)
/*@ Require emp Ensure bit_same(__return,x) && emp */
{ return x; }

int check_observation(float x,float y)
/*@ Require same_value(x,y) && emp Ensure returned_one(__return) && emp */
{
  float xc=preserve_float(x);
  float yc=preserve_float(y);
  if(x==y) return 1;
  if(x!=xc && y!=yc) return 1;
  return 0;
}

int same_lane(float x,float y)
/*@ Require same_value(x,y) && emp Ensure __return == 1 && emp */
{ return check_observation(x,y); }

