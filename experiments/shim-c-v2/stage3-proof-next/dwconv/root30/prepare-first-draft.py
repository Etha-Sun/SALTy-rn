from pathlib import Path
import sys,json,hashlib,shutil,difflib
D=Path(__file__).resolve().parent.parent;R=D.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();old=D/'dwconv2d-height-inline-r3';case=D/'root30';data=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());work=case/'.build/edit';shutil.copytree(g['annotated'],work)
for name in ['neon.c','rvv.c']:
 p=work/name;s=p.read_text();needle='    output_height = doz(output_height, 3);';assert s.count(needle)==1
 s=s.replace(needle,r"""    /*@ ghost next_height_doz_pre: ; */
"""+needle+r"""
    /*@ assert next_height_doz_exact:
      output_height==(\at(output_height,next_height_doz_pre)>3?
         \at(output_height,next_height_doz_pre)-3:0); */""");p.write_text(s)
plain=Path(g['plain']);pieces=[]
for n in data['files']:
 a=(plain/n).read_text();b=(work/n).read_text()
 if a!=b:
  for line in difflib.unified_diff(a.splitlines(True),b.splitlines(True),fromfile='a/'+n,tofile='b/'+n):pieces.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(case/'proof.patch').write_text(''.join(pieces));data.update(proof_patches=[str((case/'proof.patch').relative_to(R))],previous_version=str(old.relative_to(R)),proof_stage='root30 DW2d expose exact real doz caller writeback using pre-step label on both sides; original height and row arithmetic and all callee bodies retained.')
(case/'frozen.json').write_text(json.dumps(data,indent=2)+'\n');_,guard=checker.prepare(case,sha(case/'frozen.json'),'guard30');(case/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n')
runner=D/'run30-inline-height-mask.py'
(case/'execution-config.json').write_text(json.dumps({'runner':str(runner.relative_to(R)),'runner_sha256':sha(runner),'configuration':'Same real body inline as r3; no model or checker change; diagnostic only.'},indent=2)+'\n')
(case/'freeze.json').write_text(json.dumps({'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(case/'proof.patch'),'old_frozen_sha256':sha(old/'frozen.json'),'old_proof_sha256':sha(old/'proof.patch')},indent=2)+'\n');print(guard['passed'])
