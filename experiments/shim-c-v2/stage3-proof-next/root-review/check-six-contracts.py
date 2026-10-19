"""Review added contracts separately from C-token identity."""
from pathlib import Path
import json,re,sys,hashlib
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as c
run=sys.argv[1];record=json.loads((H/(run+'.json')).read_text());names={'maxpool':'f32-maxpool','gemm':'f32-gemm-minmax','dwconv':'f32-dwconv-minmax','spmm':'f32-spmm-minmax','root-review':'f32-gemm-minmax'};rows=[]
def clauses(s,kind):
 return sorted(re.sub(r'\s+','',x) for m in c.guard.LEX.finditer(s) if m.group().startswith(('/*@','//@')) for x in re.findall(r'\b'+kind+r'\b[^;]*;',m.group()))
for item in record['candidates']:
 candidate=R/item['candidate'];group=candidate.parent.name;oldg=json.loads((R/'experiments/shim-c-v2/stage3-inventory'/('f32-conv-hwc2chw' if group=='dwconv' and candidate.name.startswith('conv-') else 'f32-dwconv2d-chw' if group=='dwconv' and candidate.name.startswith('dwconv2d-') else names[group])/'stream01/guard.json').read_text());old=Path(oldg['annotated']);new=Path(item['source_guard']['annotated']);m=json.loads((candidate/'frozen.json').read_text());req=[];ens=[]
 for n in m['files']:
  if Path(n).suffix not in {'.c','.h'}:continue
  a=(old/n).read_text();b=(new/n).read_text()
  if clauses(a,'requires')!=clauses(b,'requires'):req.append(n)
  if clauses(a,'ensures')!=clauses(b,'ensures'):ens.append(n)
 assert not req,(candidate,req)
 assert (old/'spec.h').read_bytes()==(new/'spec.h').read_bytes()
 rows.append({'candidate':item['candidate'],'requires_unchanged':True,'public_spec_bytes_identical':True,'files_with_changed_ensures':ens,'scope':'Any new ghost/helper ensures still requires actual body verification; this check is not acceptance.'})
(H/(run+'-contracts.json')).write_text(json.dumps({'candidates':rows},indent=2)+'\n');print(len(rows),'candidates; no new requires or public-spec change')
