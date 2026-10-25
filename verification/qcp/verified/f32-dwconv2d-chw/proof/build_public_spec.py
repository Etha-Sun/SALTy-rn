#!/usr/bin/env python3
"""Extract both frozen actual-kernel contracts and add the real public caller."""
from pathlib import Path
import hashlib,importlib.util,json,re,sys
C=Path(__file__).resolve().parents[1]
sys.path.insert(0,str(C/'proof'))
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def load(name,path):
 s=importlib.util.spec_from_file_location(name,path);m=importlib.util.module_from_spec(s);s.loader.exec_module(m);return m
def rename(text,mapping):return re.sub(r'\b('+'|'.join(map(re.escape,mapping))+r')\b',lambda m:mapping[m[0]],text)
def main():
 result='#define restrict\n#include "shim/public_model.h"\n'
 pure=[];bindings={}
 for side,script in [('neon','prepare_neon.py'),('rvv','prepare_kernels.py')]:
  engine=load('public_source_'+side,C/'proof'/script);raw,annotated,prefix,info=engine.construct(side)
  require=info['contract'];signature=re.search(r'void\s+test_'+side+r'\s*\([^{};]*?\)\s*XNN_OOB_READS',raw,re.S)
  assert signature is not None
  declaration=signature[0].removesuffix('XNN_OOB_READS').strip()
  result+=declaration+'\n'+require.strip()+';\n'
  body=require.split('Require ',1)[1].split(' Ensure ',1)[0]
  before,heap=body.rsplit(' && ',1);assert heap=='dw_data(F) * dw_output(W,O)'
  suffix='N'if side=='neon'else'R';pure.append(rename(before,{'W':'W'+suffix,'Output':'Out'+suffix,'output':'out'+suffix}))
  bindings[side]=dict(implementation_sha256=sha(C/'impl'/('testNEON.c'if side=='neon'else'testRVV.c')),constructor=script,constructor_sha256=sha(C/'proof'/script),contract_sha256=hashlib.sha256(require.encode()).hexdigest())
 result+='''
/* Public caller. return1 has the proved output postcondition. Runtime checks
 * use the independent native oracle; this is not a runtime comparator. */
int dwchw_public_pair(size_t input_height,size_t input_width,const float*input,
 const float*weights,const float*zero,float*outN,float*outR,uint32_t padding_top,
 const struct xnn_f32_minmax_params*params)
/*@ With(F:DwROMap)(ON:DwOutput)(OR:DwOutput)(WN:list Z)(WR:list Z)
 (H:Z)(N:Z)(Input:Z)(Zero:Z)(Weights:Z)(OutN:Z)(OutR:Z)(Params:Z)(Lo:fp32)(Hi:fp32)
Require '''+' && '.join(pure)+''' && dw_data(F) * dw_output(WN,ON) * dw_output(WR,OR)
Ensure __return==1 && dw_public_observed(dw_progress(dw_neon_results(F,Input,Zero,Weights,H,N,Lo,Hi),ON,OutN,H,N,H,0),dw_progress(dw_rvv_results(F,Input,Zero,Weights,H,N,Lo,Hi),OR,OutR,H,N,H,0),OutN,OutR,H,N) && dw_data(F) * dw_output(WN,dw_progress(dw_neon_results(F,Input,Zero,Weights,H,N,Lo,Hi),ON,OutN,H,N,H,0)) * dw_output(WR,dw_progress(dw_rvv_results(F,Input,Zero,Weights,H,N,Lo,Hi),OR,OutR,H,N,H,0)) */
{
 test_neon(input_height,input_width,input,weights,zero,outN,padding_top,params) /*@ where F=F,O=ON,W=WN,H=H,N=N,Input=Input,Zero=Zero,Weights=Weights,Output=OutN,Params=Params,Lo=Lo,Hi=Hi */;
 test_rvv(input_height,input_width,input,weights,zero,outR,padding_top,params) /*@ where F=F,O=OR,W=WR,H=H,N=N,Input=Input,Zero=Zero,Weights=Weights,Output=OutR,Params=Params,Lo=Lo,Hi=Hi */;
 return 1;
}
'''
 out=C/'spec.c';assert not out.exists()or out.read_text()==result,'Refuse to overwrite changed public source';out.write_text(result)
 (C/'proof/public-source-binding.json').write_text(json.dumps(dict(scope='Exact original current kernel declaration contracts; no body proof credit',kernel_sources_modified=False,bindings=bindings,spec_sha256=sha(out),builder_sha256=sha(__file__)),indent=2)+'\n');print(sha(out))
if __name__=='__main__':main()
