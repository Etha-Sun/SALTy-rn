from pathlib import Path
import sys,json,hashlib,shutil,difflib
D=Path(__file__).resolve().parent;R=D.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();old=D/'argmax-index-r1';data=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());case=D/'argmax-index-r2';case.mkdir();work=case/'.build/edit';shutil.copytree(g['annotated'],work)
p=work/'quantized.c';s=p.read_text()
for name,inv in [
 ('__riscv_vle32_v_u32m8',r'\forall integer j; 0<=j<i ==> r.lane[j]==p[j]'),
 ('__riscv_vmv_v_x_u32m8',r'\forall integer j; 0<=j<i ==> r.lane[j]==x'),
 ('__riscv_vse32_v_u32m8',r'\forall integer j; 0<=j<i ==> p[j]==a.lane[j]')]:
 lines=s.splitlines(True);matches=[i for i,l in enumerate(lines) if name+'(' in l];assert len(matches)==1;i=matches[0];line=lines[i];assert 'for(size_t i=0;i<vl;i++)' in line
 frame='i,p[0..vl-1]' if name=='__riscv_vse32_v_u32m8' else 'i,r'
 annotation='/*@ loop invariant next_arg_u32_range: 0<=i<=vl; loop invariant next_arg_u32_prefix: '+inv+'; loop assigns '+frame+'; loop variant vl-i; */\n'
 lines[i]=line.replace('for(size_t i=0;i<vl;i++)',annotation+'for(size_t i=0;i<vl;i++)');s=''.join(lines)
p.write_text(s)
p=work/'fp_masks.c';s=p.read_text();lines=s.splitlines(True);matches=[i for i,l in enumerate(lines) if '__riscv_vmerge_vxm_u32m8(' in l];assert len(matches)==1;i=matches[0];annotation=r'''/*@ loop invariant next_arg_u32_merge_range: 0<=i<=vl;
 loop invariant next_arg_u32_merge_prefix: \forall integer j; 0<=j<i ==> a.lane[j]==(m.lane[j]?x:\at(a.lane[j],Pre));
 loop invariant next_arg_u32_merge_suffix: \forall integer j; i<=j<vl ==> a.lane[j]==\at(a.lane[j],Pre);
 loop assigns i,a; loop variant vl-i; */
''';lines[i]=lines[i].replace('for(size_t i=0;i<vl;i++)',annotation+'for(size_t i=0;i<vl;i++)');p.write_text(''.join(lines))
plain=Path(g['plain']);patch=''.join(''.join(difflib.unified_diff((plain/n).read_text().splitlines(True),(work/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n)) for n in data['files'] if (plain/n).read_bytes()!=(work/n).read_bytes());(case/'proof.patch').write_text(patch);data.update(proof_patches=[str((case/'proof.patch').relative_to(R))],previous_version=str(old.relative_to(R)),proof_stage='Argmax index r2: same unary model and r1 cuts; actual u32 load/broadcast/store/merge loops gain range/frame/prefix annotations; no function requires or assigns added; separate real-body inline execution diagnosis')
data['proof_sha256']=sha(case/'proof.patch');(case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n');_,guard=checker.prepare(case,sha(case/'frozen.json'),'guard01');(case/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n');(case/'freeze.json').write_text(json.dumps({'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch'),'old_frozen_sha256':sha(old/'frozen.json'),'old_proof_sha256':sha(old/'proof.patch')},indent=2)+'\n');print(guard['passed'])
