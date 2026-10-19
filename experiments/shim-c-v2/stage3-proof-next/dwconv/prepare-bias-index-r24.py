from pathlib import Path
import json,sys,hashlib,shutil,difflib
D=Path(__file__).resolve().parent;R=D.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();old=D/'bias-cases-r23c';case=D/'bias-index-r24';case.mkdir();data=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());work=case/'.build/edit';shutil.copytree(g['annotated'],work)
p=work/'rvv.c';s=p.read_text();needle='loop invariant next_lane_bound:';assert s.count(needle)==1;s=s.replace(needle,'loop invariant next_lane_vl_range: 0<vl<=4;\n           '+needle)
s=s.replace('while (next_lane_index < vl) {','while (next_lane_index < vl) {\n          next_lane_step: ;\n          /@ assert next_lane_before_step: next_lane_index<4; @/',1)
s=s.replace('          ++next_lane_index;','          ++next_lane_index;\n          /@ assert next_lane_after_step: next_lane_index==\\at(next_lane_index,next_lane_step)+1; @/',1)
needle='      /*@ assert next_prestate_loaded_all:';assert s.count(needle)==1;s=s.replace(needle,'      /*@ assert next_lane_exit: next_lane_index==vl; */\n'+needle);p.write_text(s)
plain=Path(g['plain']);pieces=[]
for n in data['files']:
 a=(plain/n).read_text();b=(work/n).read_text()
 if a!=b:
  for line in difflib.unified_diff(a.splitlines(True),b.splitlines(True),fromfile='a/'+n,tofile='b/'+n):pieces.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(case/'proof.patch').write_text(''.join(pieces));data.update(proof_patches=[str((case/'proof.patch').relative_to(R))],previous_version=str(old.relative_to(R)),proof_stage='r24 expose actual ghost-loop vl bound and exact uint64 step and exit equality. Each invariant/assert proved by body; unchanged prestate relation and no new separation/domain assumptions.')
(case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n');_,guard=checker.prepare(case,sha(case/'frozen.json'),'guard24');(case/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n');(case/'freeze.json').write_text(json.dumps({'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch')},indent=2)+'\n')
print(guard['passed'])
