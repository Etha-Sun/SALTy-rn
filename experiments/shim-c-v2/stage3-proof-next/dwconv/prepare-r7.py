"""Freeze RVV lane-value cuts; no implementation, contract, or model change."""
from pathlib import Path
import sys,json,hashlib,shutil,difflib
D=Path(__file__).resolve().parent;R=D.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
old=D/'r6';case=D/'r7';case.mkdir();data=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());work=case/'.build/edit';shutil.copytree(g['annotated'],work)
p=work/'rvv.c';s=p.read_text()
# CH-c is aligned at block entry, and remains unchanged until after the store.
w=lambda k:f'W0[16*((CH-c)/4)+{k}+j]'
x=lambda k:f'Row{k}[CH-c+j]'
bias=w(0);fma0=f'shim_fma32({x(0)},{w(4)},{bias})';mul=f'complex_mul32({x(1)},{w(8)})';fma2=f'shim_fma32({x(2)},{w(12)},{fma0})';add=f'complex_add32({fma2},{mul})';clamp=f'ext_neon_min32(ext_neon_max32({add},params->scalar.min),params->scalar.max)'
def after(anchor,name,left,right):
 global s
 assert s.count(anchor)==1,(anchor,s.count(anchor))
 s=s.replace(anchor,anchor+f'\n      /*@ assert {name}: \\forall integer j;0<=j<vl ==> ext_same({left},{right}); */')
after('vfloat32m4_t vacc = __riscv_vle32_v_f32m4(w, vl); w += 4;','next_value_bias','vacc.lane[j]',bias)
after('vacc = __riscv_vfmacc_vv_f32m4(vacc, vi0, vk0, vl);','next_value_fma0','vacc.lane[j]',fma0)
after('vfloat32m4_t vacc1 = __riscv_vfmul_vv_f32m4(vi1, vk1, vl);','next_value_mul1','vacc1.lane[j]',mul)
after('vacc = __riscv_vfmacc_vv_f32m4(vacc, vi2, vk2, vl);','next_value_fma2','vacc.lane[j]',fma2)
after('vacc = __riscv_vfadd_vv_f32m4(vacc, vacc1, vl);','next_value_add','vacc.lane[j]',add)
after('vacc = salty_min_vf_m4(vacc, params->scalar.max, vl);','next_value_clamp','vacc.lane[j]',clamp)
anchor='      __riscv_vse32_v_f32m4(output, vacc, vl); output += vl;'
assert s.count(anchor)==1
s=s.replace(anchor,'''      /*@ assert next_value_spec: \\forall integer j;0<=j<vl ==> ext_same(vacc.lane[j],dwv_rvv32{Pre}(T0,W0,P-output_width,CH-c+j,params->scalar.min,params->scalar.max)); */
'''+anchor+'''
      /*@ assert next_value_stored: \\forall integer j;0<=j<vl ==> ext_same(O0[(P-output_width)*CH+(CH-c)+j],dwv_rvv32{Pre}(T0,W0,P-output_width,CH-c+j,params->scalar.min,params->scalar.max)); */''')
p.write_text(s)
plain=Path(g['plain']);pieces=[]
for n in data['files']:
 a=(plain/n).read_text();b=(work/n).read_text()
 if a!=b:
  diff=list(difflib.unified_diff(a.splitlines(True),b.splitlines(True),fromfile='a/'+n,tofile='b/'+n))
  pieces.extend(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n' for line in diff)
(case/'proof.patch').write_text(''.join(pieces));data.update(proof_patches=[str((case/'proof.patch').relative_to(R))],previous_version=str(old.relative_to(R)),proof_stage='DW r7: eight RVV lane-value cuts, bias/FMA0/mul1/FMA2/add/clamp/frozen-spec/stored; each cut remains its own proof obligation; no helper or global axiom added')
(case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n');_,guard=checker.prepare(case,sha(case/'frozen.json'),'guard07');(case/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n');(case/'freeze.json').write_text(json.dumps({'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch'),'old_frozen_sha256':sha(old/'frozen.json'),'old_proof_sha256':sha(old/'proof.patch')},indent=2)+'\n')
(case/'README.zh-CN.md').write_text('r7 从 r6 仅增加 RVV 内循环八个 lane 值断言，按真实 FMA 次序逐步连接 bias、第一 FMA、独立乘法、第二 FMA、加法、clamp、Pre 规格与 store。没有把 FMA 拆成乘加。所有新增切分点均需自身证明；未执行前不能计为通过。局部计算先引用当前 Row/W0，再单独承担连接冻结 Pre 内存的义务。旧 r6 完整尝试仍为 408 valid / 16 timeout / 416 无结果（840），不是整核完成。\n')
print(guard['passed'])
