from pathlib import Path
import sys,json,hashlib,shutil,difflib
C=Path(__file__).resolve().parent;R=C.parents[4];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=R/'experiments/shim-c-v2/stage3-proof-next/dwconv/argmax-index-r2';m=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());work=C/'.build/edit';shutil.copytree(g['annotated'],work)
p=work/'rvv.c';s=p.read_text();anchor='        __riscv_vse32_v_u32m8(i, vidx, vl); i += vl;';assert s.count(anchor)==1
s=s.replace(anchor,'''        /*@ assert root31_index_before_store: i==index+(channels-c); */
        __riscv_vse32_v_u32m8(i, vidx, vl);
        /*@ assert root31_index_after_store: i==index+(channels-c); */
        i += vl;''');p.write_text(s)
plain=Path(g['plain']);patch=[]
for n in m['files']:
 if (plain/n).read_bytes()!=(work/n).read_bytes():
  for l in difflib.unified_diff((plain/n).read_text().splitlines(True),(work/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):patch.append(l if l.endswith('\n') else l+'\n\\ No newline at end of file\n')
(C/'proof.patch').write_text(''.join(patch))
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
m.update(proof_patches=[str((C/'proof.patch').relative_to(R))],proof_sha256=sha(C/'proof.patch'),previous_version=str(old.relative_to(R)),proof_stage='root31 argmax: index cursor immediately before and after actual u32 store; retain all parent obligations and qualified unary model. Diagnostic actual-body inline configuration inherited from r2.')
(C/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,guard=checker.prepare(C,sha(C/'frozen.json'),'guard01');(C/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n');print(guard['passed'])
