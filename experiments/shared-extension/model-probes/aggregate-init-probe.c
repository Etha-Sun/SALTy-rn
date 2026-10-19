#include <stdint.h>
typedef struct { uint32_t lane[2]; } V;
/*@ terminates \true; assigns \nothing; ensures \result.lane[0]==x && \result.lane[1]==x; */
V init(uint32_t x) {V r={{x,x}};return r;}
/*@ terminates \true; assigns \nothing; ensures \result.lane[0]==x && \result.lane[1]==x; */
V writes(uint32_t x) {V r;r.lane[0]=x;r.lane[1]=x;return r;}
