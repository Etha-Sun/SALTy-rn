#!/usr/bin/env python3
"""Generate RVV kernel VCs from the live public contract; no loop proof claim."""
from pathlib import Path
import hashlib,json,re,subprocess,tempfile,time
HERE=Path(__file__).resolve().parent;CASE=HERE.parent
REPO=next(p for p in CASE.parents if (p/'.git').exists())
BASE=REPO/'verification/qcp/verified/f32-vmul'
BUILD=CASE/'.build';BUILD.mkdir(exist_ok=True)
RUN=Path(tempfile.mkdtemp(prefix='rvv-vcs-',dir=BUILD))
def prototype(text,name):
 start=text.index(' '+name+'(');start=text.rfind('\n',0,start)+1
 end=text.index('*/',start)+2
 return text[start:end]+';\n'
load=prototype((BASE/'shim/proof/ByvalueRvv/shim.h').read_text(),'qcp_byvalue_load')
store=prototype((BASE/'shim/proof/QcpRvv32/rvv_store.c').read_text(),'__riscv_vse32_v_f32m8')
scalar=prototype((CASE/'shim/primitives.c').read_text(),'__riscv_vfmul_vf_f32m8')
header='#include "types.h"\n#include "model_def.h"\n'
for name in ['rvv_array_def.h','rvv_store_def.h','rvv_loop_def.h']:
 header+='#include "'+str(BASE/'shim/proof/QcpRvv32'/name)+'"\n'
for name in ['rvv_arrays','rvv_store','rvv_loop']:header+='/*@ include strategies "'+name+'.strategies" */\n'
header+='/*@ include strategies "vmulc.strategies" */\n'
header+='''/*@ Extern Coq (vmulc_values : Z -> list fp32 -> fp32 -> list fp32)
 (vmulc_active_mul : Z -> Z -> fp32 -> fp32 -> fp32) */
typedef unsigned long long size_t;
struct xnn_f32_default_params { char unused; };
#define NULL ((void *)0)
#define XNN_OOB_READS
#define assert(x) qcp_assert(x)
void qcp_assert(int condition)
/*@ Require condition != 0 && emp Ensure emp */
{ return; }
size_t __riscv_vsetvl_e32m8(size_t n)
/*@ Require emp Ensure __return == vadd_vl(n) && emp */
{ return n < 32 ? n : 32; }
'''+load+store+scalar+'''
#define __riscv_vle32_v_f32m8 qcp_byvalue_load
#define __riscv_vse32_v_f32m8(p,a,vl) __riscv_vse32_v_f32m8((p),&(a),(vl))
'''
(CASE/'shim/rvv_frontend.h').write_text(header)
original=(CASE/'impl/testRVV.c').read_text();public=(CASE/'spec.c').read_text()
signature=prototype(public,'test_rvv');contract=re.search(r'/\*@.*?\*/',signature,re.S).group()
N='(batch@pre/4)';k=f'({N}-n)';end=f'({k}+vl)'
off=lambda p,i:f'pointer_offset({p},{i},float)'
seg=lambda p,l,h,x:f'FloatArray::seg({p},{l},{h},{x})'
full=lambda p,n,x:f'FloatArray::full({p},{n},{x})'
sl=lambda l,h,x:f'rvv_slice({l},{h},{x})'
a,b,o='input_a@pre','input_b@pre','output@pre'
pure=f'''batch == batch@pre && params == params@pre && input_b == input_b@pre && fp32_bits_equal(b,c) &&
 0 < {N} && {N} <= 4611686018427387900 && 0 <= n && n <= {N} && rvv_length(A) == {N}+3 &&
 input_a == {off(a,k)} && output == {off(o,k)}'''
resources=f'''{full(a,N+'+3','A')} * store({b},float,c) *
 {seg(o,'0',k,f'vmulc_values({k},A,c)')} * FloatArray::undef_seg({o},{k},{N})'''
initial=f'''/*@ Assert batch == batch@pre && params == params@pre && input_b == input_b@pre && fp32_bits_equal(b,c) &&
 0 < {N} && {N} <= 4611686018427387900 && input_a == input_a@pre && output == output@pre &&
 n == {N} && rvv_length(A) == {N}+3 &&
 {full(a,N+'+3','A')} * store({b},float,c) * FloatArray::undef_full(output,{N}) */'''
chunks=[seg(a,'0',k,sl('0',k,'A')),full('input_a','vl',sl(k,end,'A')),seg(a,end,N+'+3',sl(end,N+'+3','A')),f'store({b},float,c)',seg(o,'0',k,f'vmulc_values({k},A,c)'),'FloatArray::undef_full(output,vl)',f'FloatArray::undef_seg({o},{end},{N})']
cut='/*@ Assert '+pure+' && 0 < n && 0 < vl && vl <= 32 && vl <= n && vl == vadd_vl(n) &&\n '+' *\n '.join(chunks)+' */'
patches=[{'before':'\n{','text':contract},{'before':'  while (n > 0)', 'text':initial+'\n/*@ Inv '+pure+' &&\n '+resources+' */'},{'before':'    vfloat32m8_t va =','text':cut}]
source=original.replace('\n{','\n'+contract+'\n{',1)
source=source.replace('  while (n > 0)',initial+'\n/*@ Inv '+pure+' &&\n '+resources+' */\n  while (n > 0)',1)
source=source.replace('    vfloat32m8_t va =',cut+'\n    vfloat32m8_t va =',1)
source=source.replace('__riscv_vfmul_vf_f32m8(va, b, vl)','__riscv_vfmul_vf_f32m8(va, b, vl) /*@ where a = &va */')
source=source.replace('__riscv_vse32_v_f32m8(output, vacc, vl)','__riscv_vse32_v_f32m8(output, vacc, vl) /*@ where a = &vacc */')
tokens=lambda x:re.findall(r'\w+|[^\s\w]',re.sub(r'/\*.*?\*/|//[^\n]*','',x,flags=re.S))
assert tokens(source)==tokens(original),'Executable kernel C changed'
(HERE/'c/rvv.annotations.json').write_text(json.dumps({'patches':patches,'where':{'__riscv_vfmul_vf_f32m8':'a = &va','__riscv_vse32_v_f32m8':'a = &vacc'}},indent=2)+'\n')
unit=RUN/'rvv_unit.c';unit.write_text('#include "'+str(CASE/'shim/rvv_frontend.h')+'"\n'+source)
expanded=RUN/'expanded.c'
r=subprocess.run(['gcc','-E','-P','-CC','-nostdinc',str(unit),'-o',str(expanded)],capture_output=True,text=True,timeout=30)
assert r.returncode==0,r.stderr
unit.write_bytes(expanded.read_bytes())
command=['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(unit),'--coq-output-dir='+str(RUN),'--coq-logic-path=VMulc']
for d in sorted((BASE/'proof/c').iterdir()):command+=['-slp',str(d),d.name]
command+=['-slp',str(CASE/'shim'),'VMulc','-slp',str(HERE/'c'),'VMulc']
start=time.monotonic()
with (RUN/'qcp.log').open('w') as out:r=subprocess.run(command,stdout=out,stderr=out,timeout=120)
goal=RUN/'rvv_unit_goal.v'
status={'generation_passed':r.returncode==0,'generated_c_vcs':len(re.findall(r'^Axiom proof_of_',goal.read_text(),re.M)) if goal.exists() else 0,'loop_vcs_proved':False,'whole_kernel_verified':False,'public_spec_is_draft':True,'original_c_tokens_preserved':True,'run_directory':str(RUN),'seconds':time.monotonic()-start,'command':command,'dependencies':'Existing verified VMUL load/store contracts and strategies; new scalar primitive contract. Full binding/replay remains open.'}
(HERE/'rvv-generation-status.json').write_text(json.dumps(status,indent=2)+'\n')
print(json.dumps(status,indent=2))
if r.returncode:print((RUN/'qcp.log').read_text()[-3000:])
raise SystemExit(r.returncode!=0)
