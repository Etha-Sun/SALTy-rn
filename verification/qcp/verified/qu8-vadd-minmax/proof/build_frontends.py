#!/usr/bin/env python3
"""Copy actual checked provider declarations into selected source frontends."""
from pathlib import Path
import sys
C=Path(__file__).resolve().parent.parent
sys.path.insert(0,str(C/'proof'))
from coverage import _mask_comments,FUNCTION

def declarations(source):
 text=Path(source).read_text();masked=_mask_comments(text);end=0;out=[]
 for m in FUNCTION.finditer(masked):
  if m.start()<end:continue
  pos=m.end()
  while pos<len(masked)and masked[pos].isspace():pos+=1
  assert masked[pos]=='{',(source,m[1]);out.append(text[m.start():pos]+';\n');depth=1;j=pos+1
  while depth:
   depth+=(masked[j]=='{')-(masked[j]=='}');j+=1
  end=j
 return ''.join(out)
def main():
 t='#ifndef QU_NEON_API_H\n#define QU_NEON_API_H\n#include "neon_arithmetic.h"\n#include "neon_store.h"\n#include "unsigned_tail.h"\n#include "neon_ext.h"\n'
 for n in ['neon_load','neon_store','unsigned_tail']:t+=declarations(C/'shim'/(n+'.c'))
 t+='\n#define vld1_u8(p) qcp_u8_load8((p))\n#define vst1q_u8(p,a) qcp_u8_store16((p),&(a))\n#define vst1_u8(p,a) qcp_u8_store8((p),&(a))\n#define vst1_lane_u8(p,a,lane) qcp_u8_store_lane##lane((p),&(a))\n#endif\n';(C/'shim/neon_api.h').write_text(t)
if __name__=='__main__':main()
