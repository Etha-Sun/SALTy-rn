from pathlib import Path
import sys,json,hashlib,shutil,difflib
D=Path(__file__).resolve().parent;R=D.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();old=D/'dwconv2d-height-inline-r2';case=D/'dwconv2d-height-inline-r3';case.mkdir();data=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());work=case/'.build/edit';shutil.copytree(g['annotated'],work)
p=work/'fp_repr.c';s=p.read_text();needle='uint32x4_t vandq_u32(uint32x4_t a,uint32x4_t b) { for(int i=0;i<4;i++)';assert s.count(needle)==1;s=s.replace(needle,r'''uint32x4_t vandq_u32(uint32x4_t a,uint32x4_t b) {
 /*@ loop invariant next_mask_index: 0<=i<=4;
     loop assigns i,a;
     loop variant 4-i;
 */
 for(int i=0;i<4;i++)''');p.write_text(s)
plain=Path(g['plain']);pieces=[]
for n in data['files']:
 a=(plain/n).read_text();b=(work/n).read_text()
 if a!=b:
  for line in difflib.unified_diff(a.splitlines(True),b.splitlines(True),fromfile='a/'+n,tofile='b/'+n):pieces.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(case/'proof.patch').write_text(''.join(pieces));data.update(proof_patches=[str((case/'proof.patch').relative_to(R))],previous_version=str(old.relative_to(R)),proof_stage='Height inline r3: real vandq loop index/frame, inline actual bit-reinterpret and vand bodies plus doz; no new function requires/assigns; execution diagnostic, not old checker acceptance')
(case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n');_,guard=checker.prepare(case,sha(case/'frozen.json'),'guard03');(case/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n')
runner=D/'run30-inline-height-mask.py';previous=D/'run30-inline-doz.py';text=previous.read_text();needle="'test_neon,test_rvv,doz'";assert text.count(needle)==1;text=text.replace(needle,"'test_neon,test_rvv,doz,vandq_u32,vreinterpretq_u32_f32,vreinterpretq_f32_u32'");runner.write_text(text)
(case/'execution-config.json').write_text(json.dumps({'runner':str(runner.relative_to(R)),'runner_sha256':sha(runner),'base_runner_sha256':sha(previous),'extra_inline_calls':['vandq_u32','vreinterpretq_u32_f32','vreinterpretq_f32_u32'],'removed_definitions':['test_neon','test_rvv'],'boundary':'Execution diagnostic only; inline memcpy/RTE and loop goals must be covered independently. Height group passing does not prove representations or complete kernel.'},indent=2)+'\n')
(case/'freeze.json').write_text(json.dumps({'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch'),'old_frozen_sha256':sha(old/'frozen.json'),'old_proof_sha256':sha(old/'proof.patch')},indent=2)+'\n');print(guard['passed'])
