from pathlib import Path
import sys,json,hashlib,shutil,difflib
C=Path(__file__).resolve().parent;R=C.parents[4];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=C.parent/'root31';m=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());work=C/'.build/edit';shutil.copytree(g['annotated'],work)
p=work/'neon.c';s=p.read_text();s=r'''/*@ ghost
 /@ assigns \nothing;
    ensures root32_shift: v<=c<=n && p==base+(n-c) ==>
      p+v==base+(n-c)+v;
    ensures root32_sub: v<=c<=n ==> (size_t)(c-v)==c-v && (size_t)(c-v)<=n; @/
 static void root32_index_step(uint32_t *p,uint32_t *base,size_t n,size_t c,size_t v) {}
*/
'''+s;p.write_text(s)
p=work/'rvv.c';s=p.read_text();anchor='        vfloat32m8_t vi1 = __riscv_vle32_v_f32m8(i1, vl);';assert s.count(anchor)==1
s=s.replace(anchor,'        /*@ assert root32_before_merges: i==index+(channels-c) && vl<=c<=channels; */\n'+anchor)
anchor='        /*@ assert root31_index_after_store: i==index+(channels-c); */';assert s.count(anchor)==1
s=s.replace(anchor,anchor+'''\n        /*@ assert root32_after_store_range: vl<=c<=channels; */
        /*@ ghost root32_index_step(i,index,channels,c,vl); */''');p.write_text(s)
plain=Path(g['plain']);patch=[]
for n in m['files']:
 if (plain/n).read_bytes()!=(work/n).read_bytes():
  for l in difflib.unified_diff((plain/n).read_text().splitlines(True),(work/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):patch.append(l if l.endswith('\n') else l+'\n\\ No newline at end of file\n')
(C/'proof.patch').write_text(''.join(patch));sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
m.update(proof_patches=[str((C/'proof.patch').relative_to(R))],proof_sha256=sha(C/'proof.patch'),previous_version=str(old.relative_to(R)),proof_stage='root32 argmax: preserve all root31 obligations; explicit pre-merge cursor/range, post-store range and no-requires conditional body helper for exact pointer advance and unsigned subtraction. Frozen source/model unchanged.')
(C/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,guard=checker.prepare(C,sha(C/'frozen.json'),'guard01');(C/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n');print(guard['passed'])
