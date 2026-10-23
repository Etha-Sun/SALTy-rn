#!/usr/bin/env python3
"""Add proof annotations to the exact original RVV kernel; reject unknown source shape."""
from pathlib import Path
import hashlib,json,os,re,subprocess,tempfile,resource,sys,time
resource.setrlimit(resource.RLIMIT_AS,(16*1024**3,16*1024**3))
HERE=Path(__file__).resolve().parent;CASE=HERE.parent
ROOT=next(p for p in CASE.parents if (p/'.git').exists())
BASE=ROOT/'verification/qcp/verified/f32-vmul'
RUN=Path(tempfile.mkdtemp(prefix='rvv-kernel-',dir=CASE/'.build'))
def prototype(text,name):
 start=text.index(' '+name+'(');start=text.rfind('\n',0,start)+1
 end=text.index('*/',start)+2
 return text[start:end]+';\n'
header='#include "rvv_types.h"\n#include "rvv_model_def.h"\n'
for name in ['rvv_array_def.h','rvv_store_def.h','rvv_loop_def.h']:
 header+='#include "'+os.path.relpath(BASE/'shim/proof/QcpRvv32'/name,CASE/'shim')+'"\n'
for name in ['rvv_arrays','rvv_store','rvv_loop','rvv_vlrelu']:header+='/*@ include strategies "'+name+'.strategies" */\n'
header+='#define NULL ((void *)0)\n#define XNN_OOB_READS\n#define assert(x) qcp_assert(x)\nvoid qcp_assert(int condition)\n/*@ Require condition != 0 && emp Ensure emp */\n{ return; }\nsize_t __riscv_vsetvl_e32m8(size_t n)\n/*@ Require emp Ensure __return == vadd_vl(n) && emp */\n{ return n < 32 ? n : 32; }\n'
header+=prototype((BASE/'shim/proof/ByvalueRvv/shim.h').read_text(),'qcp_byvalue_load')
header+=prototype((BASE/'shim/proof/QcpRvv32/rvv_store.c').read_text(),'__riscv_vse32_v_f32m8')
for name in ['__riscv_vfmul_vf_f32m8','__riscv_vreinterpret_v_f32m8_i32m8','__riscv_vmslt_vx_i32m8_b4','__riscv_vmerge_vvm_f32m8']:
 header+=prototype((CASE/'shim/rvv_primitives.c').read_text(),name)
header+='#define __riscv_vle32_v_f32m8 qcp_byvalue_load\n#define __riscv_vse32_v_f32m8(p,a,vl) __riscv_vse32_v_f32m8((p),&(a),(vl))\n'
frontend=CASE/'shim/rvv_frontend.h'
if frontend.exists():
 assert frontend.read_text()==header,'Existing frontend differs; coordinate interface update before regeneration'
else:frontend.write_text(header)
original=(CASE/'impl/testRVV.c').read_text();public=(CASE/'spec.c').read_text()
expected=next(x['sha256'] for x in json.loads((HERE/'originals.json').read_text())['files'] if x['copy']=='impl/testRVV.c')
assert hashlib.sha256((CASE/'impl/testRVV.c').read_bytes()).hexdigest()==expected,'Original RVV source hash changed'
contract=re.search(r'/\*@.*?\*/',prototype(public,'test_rvv'),re.S).group()
N='(batch@pre/4)';k=f'({N}-n)';end=f'({k}+vl)'
off=lambda p,i:f'pointer_offset({p},{i},float)'
seg=lambda p,l,h,x:f'FloatArray::seg({p},{l},{h},{x})'
full=lambda p,n,x:f'FloatArray::full({p},{n},{x})'
sl=lambda l,h,x:f'rvv_slice({l},{h},{x})'
a,o='input@pre','output@pre';param='store(&(params->scalar.slope),float,c)'
pure=f"batch == batch@pre && params == params@pre && fp32_bits_equal(slope,c) && 0 < {N} && {N} <= 4611686018427387900 && 0 <= n && n <= {N} && rvv_length(A) == {N}+3 && input == {off(a,k)} && output == {off(o,k)}"
resources=f"{full(a,N+'+3','A')} * {param} * {seg(o,'0',k,f'vlrelu_values({k},A,c)')} * FloatArray::undef_seg({o},{k},{N})"
initial=f"/*@ Assert batch == batch@pre && params == params@pre && fp32_bits_equal(slope,c) && 0 < {N} && {N} <= 4611686018427387900 && input == input@pre && output == output@pre && n == {N} && rvv_length(A) == {N}+3 && {full(a,N+'+3','A')} * {param} * FloatArray::undef_full(output,{N}) */"
chunks=[seg(a,'0',k,sl('0',k,'A')),full('input','vl',sl(k,end,'A')),seg(a,end,N+'+3',sl(end,N+'+3','A')),param,seg(o,'0',k,f'vlrelu_values({k},A,c)'),'FloatArray::undef_full(output,vl)',f'FloatArray::undef_seg({o},{end},{N})']
cut='/*@ Assert '+pure+' && 0 < n && 0 < vl && vl <= 32 && vl <= n && vl == vadd_vl(n) &&\n '+' *\n '.join(chunks)+' */'
patches=[{'before':'\n{','text':contract},{'before':'  while (n > 0)','text':initial+'\n/*@ Inv '+pure+' &&\n '+resources+' */'},{'before':'    vfloat32m8_t vx =','text':cut}]
source=original
for patch in patches:
 assert source.count(patch['before'])==1,patch['before']
 source=source.replace(patch['before'],patch['text']+'\n'+patch['before'],1)
where={'__riscv_vfmul_vf_f32m8(vx, slope, vl)':'a = &vx','__riscv_vreinterpret_v_f32m8_i32m8(vx)':'a = &vx','__riscv_vmslt_vx_i32m8_b4(vx_i, 0, vl)':'a = &vx_i','__riscv_vmerge_vvm_f32m8(vx, vacc, mask, vl)':'a = &vx, b = &vacc, m = &mask','__riscv_vse32_v_f32m8(output, vout, vl)':'a = &vout'}
if '--explicit-lanes' in sys.argv:
 chunk=f'rvv_slice({k},{end},A)'
 reads=[f'rvv_read_value({i},vl,{chunk})' for i in range(32)]
 # Bind the actual scalar value. Replacing it by c here would ask QCP's
 # numerical fp32_eq matcher to equate NaN products. The loop proof later
 # uses the public bit-exact slope=c fact, which remains valid for NaNs.
 muls=[f'vlrelu_active_mul({i},vl,{reads[i]},slope)' for i in range(32)]
 signed=[f'rvv_signed_bits({x})' for x in reads]
 masks=[f'rvv_mask({i},vl,{signed[i]},0)' for i in range(32)]
 outs=[f'rvv_merge({i},vl,{reads[i]},{muls[i]},{masks[i]})' for i in range(32)]
 assigns=lambda prefix,values:', '.join(f'{prefix}{i} = {x}' for i,x in enumerate(values))
 where['__riscv_vle32_v_f32m8(input, vl)']='L = '+chunk
 for call in ['__riscv_vfmul_vf_f32m8(vx, slope, vl)','__riscv_vreinterpret_v_f32m8_i32m8(vx)']:
  where[call]+=', '+assigns('x',reads)
 where['__riscv_vmslt_vx_i32m8_b4(vx_i, 0, vl)']+=', '+assigns('x',signed)
 where['__riscv_vmerge_vvm_f32m8(vx, vacc, mask, vl)']+=', '+assigns('x',reads)+', '+assigns('y',muls)+', '+assigns('m',masks)
 where['__riscv_vse32_v_f32m8(output, vout, vl)']+=', L = rvv_pack32('+','.join(outs)+'), '+assigns('x',outs)
for call,annotation in where.items():
 assert source.count(call)==1,call
 source=source.replace(call,call+' /*@ where '+annotation+' */')
tokens=lambda x:re.findall(r'\w+|[^\s\w]',re.sub(r'/\*.*?\*/|//[^\n]*','',x,flags=re.S))
assert tokens(source)==tokens(original),'Executable C changed'
(HERE/'c/rvv.annotations.json').write_text(json.dumps({'patches':patches,'where':where},indent=2)+'\n')
unit=RUN/'rvv_unit.c';unit.write_text('#include "'+str(CASE/'shim/rvv_frontend.h')+'"\n'+source)
r=subprocess.run(['gcc','-E','-P','-CC','-nostdinc',str(unit)],capture_output=True,text=True,timeout=30)
assert r.returncode==0,r.stderr
unit.write_text(r.stdout)
raw=RUN/'rvv_raw.c';raw.write_text('#include \"'+str(CASE/'shim/rvv_frontend.h')+'\"\n'+original)
raw_cpp=subprocess.run(['gcc','-E','-P','-CC','-nostdinc',str(raw)],capture_output=True,text=True,timeout=30)
assert raw_cpp.returncode==0,raw_cpp.stderr
(RUN/'rvv_raw.expanded.c').write_text(raw_cpp.stdout)
assert tokens(raw_cpp.stdout)==tokens(r.stdout),'Executable CPP tokens changed under the same frontend'
command=['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(unit),'--coq-output-dir='+str(RUN),'--coq-logic-path=VLRelu']
if '--diagnose' in sys.argv:
 command.remove('--no-exec-info')
 command+=['--Auto-VC-Checking',str(RUN/'solver.log')]
if '--no-record-strategies' in sys.argv:command+=['--no-record-strategies']
if '--strategy-limit' in sys.argv:
 limit=int(sys.argv[sys.argv.index('--strategy-limit')+1])
 assert 0<limit<=4096
 command+=['--strategy-application-limit',str(limit)]
for d in sorted((BASE/'proof/c').iterdir()):command+=['-slp',str(d),d.name]
command+=['-slp',str(CASE/'shim'),'VLRelu','-slp',str(HERE/'c'),'VLRelu']
budget=int(sys.argv[sys.argv.index('--timeout')+1]) if '--timeout' in sys.argv else 600
assert 0<budget<=3600
start=time.monotonic();timed_out=False
pending={'generation_passed':False,'execution_state':'running','run_directory':str(RUN),'original_c_tokens_preserved':True,'same_frontend_cpp_tokens_preserved':True,'command':command,'whole_kernel_verified':False,'budget_seconds':budget,'executed_c_sha256':hashlib.sha256(unit.read_bytes()).hexdigest()}
(RUN/'generation-status.json').write_text(json.dumps(pending,indent=2)+'\n')
try:
 with (RUN/'qcp.log').open('w') as out:r=subprocess.run(command,cwd=RUN,stdout=out,stderr=out,timeout=budget)
 code=r.returncode
except subprocess.TimeoutExpired:
 timed_out=True;code=124
status={**pending,'generation_passed':code==0,'execution_state':'finished','timed_out':timed_out,'seconds':time.monotonic()-start,'exit_code':code,'log_sha256':hashlib.sha256((RUN/'qcp.log').read_bytes()).hexdigest()}
(RUN/'generation-status.json').write_text(json.dumps(status,indent=2)+'\n')
(HERE/'rvv-generation-status.json').write_text(json.dumps(status,indent=2)+'\n')
print(json.dumps(status,indent=2))
if code:print((RUN/'qcp.log').read_text()[-5000:])
raise SystemExit(code!=0)
