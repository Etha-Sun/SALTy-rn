from pathlib import Path
import sys,json,hashlib,shutil,difflib
C=Path(__file__).resolve().parent;R=C.parents[4];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=C.parent/'root39';m=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());work=C/'.build/edit';shutil.copytree(g['annotated'],work)
p=work/'quantized.c';s=p.read_text();marker='uint32x4_t vaddq_u32(uint32x4_t a,uint32x4_t b) { for(int i=0;i<4;i++)';assert s.count(marker)==1
s=s.replace(marker,r'''/*@ assigns \nothing;
 ensures root40_add: \forall integer j; 0<=j<4 ==> \result.lane[j]==(\at(a.lane[j],Pre)+b.lane[j])%4294967296; */
uint32x4_t vaddq_u32(uint32x4_t a,uint32x4_t b) { /*@ loop invariant root40_add_bounds: 0<=i<=4;
 loop invariant root40_add_prefix: \forall integer j; 0<=j<i ==> a.lane[j]==(\at(a.lane[j],Pre)+b.lane[j])%4294967296;
 loop invariant root40_add_suffix: \forall integer j; i<=j<4 ==> a.lane[j]==\at(a.lane[j],Pre);
 loop assigns i,a.lane[0..3]; loop variant 4-i; */
for(int i=0;i<4;i++)''');p.write_text(s)
p=work/'fp_masks.c';s=p.read_text();marker='uint32x4_t vbslq_u32(uint32x4_t m,uint32x4_t a,uint32x4_t b) { for(int i=0;i<4;i++)';assert s.count(marker)==1
s=s.replace(marker,r'''/*@ assigns \nothing;
 ensures root40_select: \forall integer j; 0<=j<4 ==> \result.lane[j]==((m.lane[j]&\at(a.lane[j],Pre))|(~m.lane[j]&b.lane[j])); */
uint32x4_t vbslq_u32(uint32x4_t m,uint32x4_t a,uint32x4_t b) { /*@ loop invariant root40_select_bounds: 0<=i<=4;
 loop invariant root40_select_prefix: \forall integer j; 0<=j<i ==> a.lane[j]==((m.lane[j]&\at(a.lane[j],Pre))|(~m.lane[j]&b.lane[j]));
 loop invariant root40_select_suffix: \forall integer j; i<=j<4 ==> a.lane[j]==\at(a.lane[j],Pre);
 loop assigns i,a.lane[0..3]; loop variant 4-i; */
for(int i=0;i<4;i++)''');p.write_text(s)
plain=Path(g['plain']);patch=[]
for n in m['files']:
 if (plain/n).read_bytes()!=(work/n).read_bytes():
  for l in difflib.unified_diff((plain/n).read_text().splitlines(True),(work/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):patch.append(l if l.endswith('\n') else l+'\n\\ No newline at end of file\n')
(C/'proof.patch').write_text(''.join(patch));sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
m.update(proof_patches=[str((C/'proof.patch').relative_to(R))],proof_sha256=sha(C/'proof.patch'),previous_version=str(old.relative_to(R)),proof_stage='root40 supplies bounds, prefix/suffix, variants and body-checked result/frame contracts for two real uint32 callees. No new requires, public wrapper/spec or ordinary C change. All new body and call obligations mandatory.')
(C/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,guard=checker.prepare(C,sha(C/'frozen.json'),'guard01');(C/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n');print(guard['passed'])
