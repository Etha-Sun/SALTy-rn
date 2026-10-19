from pathlib import Path
import sys,json,hashlib,shutil,difflib
D=Path(__file__).resolve().parent;R=D.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();old=D/'conv-cursor-r2';case=D/'conv-cursor-inline-r3';case.mkdir();data=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());work=case/'.build/edit';shutil.copytree(g['annotated'],work)
p=work/'fp_index.c';s=p.read_text()
for op in ['add','sub']:
 needle=f'vint32m1_t __riscv_v{op}_vx_i32m1(vint32m1_t a,int32_t x,size_t vl) {{ for(size_t i=0;i<vl;i++)'
 assert s.count(needle)==1
 s=s.replace(needle,f'vint32m1_t __riscv_v{op}_vx_i32m1(vint32m1_t a,int32_t x,size_t vl) {{ /*@ loop invariant next_signed_{op}_index: 0<=i<=vl; loop assigns i,a; loop variant vl-i; */ for(size_t i=0;i<vl;i++)')
p.write_text(s)
plain=Path(g['plain']);pieces=[]
for n in data['files']:
 a=(plain/n).read_text();b=(work/n).read_text()
 if a!=b:
  for line in difflib.unified_diff(a.splitlines(True),b.splitlines(True),fromfile='a/'+n,tofile='b/'+n):pieces.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(case/'proof.patch').write_text(''.join(pieces));data.update(proof_patches=[str((case/'proof.patch').relative_to(R))],previous_version=str(old.relative_to(R)),proof_stage='Conv inline r3: real signed add/sub loop index/frame, inline actual signed add/sub and uint-to-int reinterpret bodies; no new function requires/assigns; execution diagnostic, not old checker acceptance')
(case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n');_,guard=checker.prepare(case,sha(case/'frozen.json'),'guard03');(case/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n')
runner=D/'run30-inline-conv-index.py';previous=D/'run30-single.py';text=previous.read_text();needle="'-inline-calls','test_neon,test_rvv'";assert text.count(needle)==1;text=text.replace(needle,"'-inline-calls','test_neon,test_rvv,__riscv_vreinterpret_v_u32m1_i32m1,__riscv_vadd_vx_i32m1,__riscv_vsub_vx_i32m1'");runner.write_text(text)
(case/'execution-config.json').write_text(json.dumps({'runner':str(runner.relative_to(R)),'runner_sha256':sha(runner),'base_runner_sha256':sha(previous),'extra_inline_calls':['__riscv_vreinterpret_v_u32m1_i32m1','__riscv_vadd_vx_i32m1','__riscv_vsub_vx_i32m1'],'removed_definitions':['test_neon','test_rvv'],'boundary':'Execution diagnostic only; inline memcpy/RTE and loop goals must be covered independently. Cursor group passing does not prove representations or complete kernel.'},indent=2)+'\n')
(case/'freeze.json').write_text(json.dumps({'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch'),'old_frozen_sha256':sha(old/'frozen.json'),'old_proof_sha256':sha(old/'proof.patch')},indent=2)+'\n');print(guard['passed'])
