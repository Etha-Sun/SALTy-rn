#!/usr/bin/env python3
"""Public contracts for the actual repaired kernels; no output initialization."""
from pathlib import Path
C=Path(__file__).resolve().parents[1]
def main():
 params='size_t output_pixels,size_t pooling_elements,size_t channels,const float**input,size_t input_offset,size_t input_pixel_stride,float*output,uint32_t*index,size_t input_increment,size_t output_increment,size_t index_increment'
 args='output_pixels,pooling_elements,channels,input,input_offset,input_pixel_stride,output,index,input_increment,output_increment,index_increment'
 s='#include "shim/program_model.h"\n'
 for name,side in [('test_neon','neon'),('test_rvv','rvv')]:
  s+='void '+name+'('+params+')\n/*@ With(D:APProgram)(F:APMap)(P:APPtrMap)(W:list Z)(WI:list Z)(O:APOutput)(I:APIndex)\n'
  s+='Require app_arguments(D,'+args+') && app_valid(F,P,W,WI,D) && ap_data(F) * ap_ptr_data(P) * ap_output(W,O) * ap_index(WI,I)\n'
  s+='Ensure ap_data(F) * ap_ptr_data(P) * ap_output(W,app_'+side+'_output(F,P,D,O,I)) * ap_index(WI,app_'+side+'_index(F,P,D,O,I)) */;\n'
 (C/'spec.c').write_text(s)
if __name__=='__main__':main()
