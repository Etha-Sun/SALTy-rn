from pathlib import Path
import sys,json,hashlib,shutil,difflib,re
D=Path(__file__).resolve().parent;R=D.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();old=D/'r1';data=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());case=D/'r2';case.mkdir();work=case/'.build/edit';shutil.copytree(g['annotated'],work)
# Split the fixed NEON four-lane prefix/suffix into explicit lane facts.
# Retain every existing universal invariant and the exact C loop body.
for filename, names in [('fp_memory.c',['vld1q_f32','vdupq_n_f32']),('fp_arithmetic.c',['vfmaq_f32','vmulq_f32','vaddq_f32'])]:
 p=work/filename;s=p.read_text()
 for name in names:
  pos=s.index(name+'(');start=s.index('/*@ loop invariant',pos);end=s.index('*/',start);block=s[start:end]
  extra=[]
  for suffix in [False,True]:
   pat=r'loop invariant \\forall integer j; '+(r'i<=j<4' if suffix else r'0<=j<i')+r' ==> (.*?);'
   m=re.search(pat,block)
   if m:
    for j in range(4):
     term=re.sub(r'\bj\b',str(j),m.group(1));cond=f'i<={j}' if suffix else f'{j}<i'
     extra.append(f'loop invariant next_{name}_{"suffix" if suffix else "prefix"}{j}: {cond} ==> {term};')
  assert extra,name
  s=s[:end]+' '+' '.join(extra)+' '+s[end:]
 p.write_text(s)
plain=Path(g['plain']);patch=''.join(''.join(difflib.unified_diff((plain/n).read_text().splitlines(True),(work/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n)) for n in data['files'] if (plain/n).read_bytes()!=(work/n).read_bytes());(case/'proof.patch').write_text(patch);data.update(proof_patches=[str((case/'proof.patch').relative_to(R))],previous_version=str(old.relative_to(R)),proof_stage='Dwconv r2 retains r1; explicit 4-lane prefix/suffix facts in actual NEON load/broadcast/FMA/mul/add loops, no contract or C change')
(case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n');_,guard=checker.prepare(case,sha(case/'frozen.json'),'guard02');(case/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n');(case/'freeze.json').write_text(json.dumps({'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch'),'old_frozen_sha256':sha(old/'frozen.json'),'old_proof_sha256':sha(old/'proof.patch')},indent=2)+'\n');print(guard['passed'])
