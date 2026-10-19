from pathlib import Path
import json,hashlib,tempfile,importlib.util,difflib
r=Path(__file__).resolve().parents[3]
s=importlib.util.spec_from_file_location('campaign',r/'tools/shim_c_campaign.py');m=importlib.util.module_from_spec(s);s.loader.exec_module(m)
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();original=r/'experiments/shared-extension/unsigned/u8-vclamp-v2';baseline=json.loads((original/'frozen.json').read_text())
results={}
(r/'experiments/shared-extension/.build').mkdir(parents=True,exist_ok=True)
mutations={'positive':None,'implementation':'impl','spec':'spec','manifest':'manifest','ordinary_C':'int audit_added;\n','public_requires_false':'/*@ requires \\false; */\n','ghost_external':'/*@ ghost /@ ensures \\false; @/ void audit_external(void); */\n','axiom':'/*@ axiomatic Audit { axiom audit_false: \\false; } */\n'}
for name,change in mutations.items():
 with tempfile.TemporaryDirectory(dir=r/'experiments/shared-extension/.build',prefix='guard-') as tmp:
  c=Path(tmp);files={}
  for n,item in baseline['files'].items():
   p=c/n;p.write_bytes((r/item['path']).read_bytes());files[n]={'path':str(p.relative_to(r)),'sha256':sha(p)}
  patch=c/'proof.patch';patch.write_text('');data={'files':files,'proof_patches':[str(patch.relative_to(r))]};(c/'frozen.json').write_text(json.dumps(data));digest=sha(c/'frozen.json')
  if change=='impl':(c/'rvv.c').write_text((c/'rvv.c').read_text()+'\nint tamper;\n')
  elif change=='spec':(c/'spec.h').write_text((c/'spec.h').read_text()+'\n/* modified */\n')
  elif change=='manifest':(c/'frozen.json').write_text(json.dumps(data)+'\n')
  elif change:
   p=c/'unit.c';before=p.read_text();after=change+before
   patch.write_text(''.join(difflib.unified_diff(before.splitlines(keepends=True),after.splitlines(keepends=True),fromfile='a/unit.c',tofile='b/unit.c')))
  try:m.prepare(c,digest,'check');accepted=True;error=None
  except RuntimeError as e:accepted=False;error=str(e)
  assert accepted==(name=='positive'),(name,accepted,error)
  results[name]={'accepted':accepted,'expected':name=='positive','reason':error}
output={'passed':True,'checker_sha256':sha(r/'tools/shim_c_campaign.py'),'scope':'One positive plus seven negative guard tests; no proof/solver validity test','records':results}
(r/'experiments/shared-extension/guard-results.json').write_text(json.dumps(output,indent=2)+'\n');print(json.dumps(output,indent=2))
