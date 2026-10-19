from pathlib import Path
import json,hashlib,difflib,sys,shutil
C=Path(__file__).resolve().parent;R=C.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=R/'experiments/shim-c-v2/stage3-proof-next/maxpool/root41';m=json.loads((old/'frozen.json').read_text());g=json.loads((old/'source-guard.json').read_text());sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
needle='          vmax = vld1q_f32(ab);\n          vidx = vld1q_u32(ib);'
replacement='''          vmax = vld1q_f32(ab);
          /* Only c live index lanes remain; the public domain gives no index padding. */
          const uint32_t tail_index[4] = {
            ib[0], c >= 2 ? ib[1] : 0, c >= 3 ? ib[2] : 0, 0
          };
          vidx = vld1q_u32(tail_index);'''
# Freeze a new implementation version before porting annotations. Old files untouched.
original={n:dict(m['files'][n]) for n in ['neon.c','rvv.c','spec.h','harness.c']}
for n in original:
 source=R/original[n]['path'];assert sha(source)==original[n]['sha256'];s=source.read_text()
 if n=='neon.c':assert s.count(needle)==1;s=s.replace(needle,replacement)
 (C/n).write_text(s);m['files'][n]={'path':str((C/n).relative_to(R)),'sha256':sha(C/n)}
(C/'target-inputs.json').write_text(json.dumps({'reason':'Actual legal-domain NEON index tail overread, ASan reproduced with pixels=1,k=10,channels=1. Independent target repair; no spec change.','original':original,'new':{n:m['files'][n] for n in original},'all_other_frozen_files':{n:v for n,v in m['files'].items() if n not in original},'evidence':'experiments/shim-c-v2/stage3-proof-next/root-review/argmax-tail-runtime01/result.json'},indent=2)+'\n')
work=C/'.build/edit';shutil.copytree(g['annotated'],work)
p=work/'neon.c';s=p.read_text();assert s.count(needle)==1;p.write_text(s.replace(needle,replacement))
pieces=[]
for n,v in m['files'].items():
 a=(R/v['path']).read_text();b=(work/n).read_text()
 if a!=b:
  for x in difflib.unified_diff(a.splitlines(True),b.splitlines(True),fromfile='a/'+n,tofile='b/'+n):pieces.append(x if x.endswith('\n') else x+'\n\\ No newline at end of file\n')
(C/'proof.patch').write_text(''.join(pieces));m.update(name='f32-argmaxpool-tail-v1',proof_patches=[str((C/'proof.patch').relative_to(R))],proof_sha256=sha(C/'proof.patch'),previous_version=str(old.relative_to(R)),proof_stage='Port prior annotations to independently repaired NEON index-tail target. Not proven. No old source/lock/checker/spec changes.',stage3_revision='Independent target fix with public spec and wrapper bytes unchanged. All existing proof debts and newly introduced local-array obligations require verification.')
(C/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,guard=checker.prepare(C,sha(C/'frozen.json'),'guard01');(C/'source-guard.json').write_text(json.dumps(guard,indent=2)+'\n')
assert all(sha(R/v['path'])==v['sha256'] for v in original.values())
print('guard',guard['passed'],'new target',sha(C/'frozen.json'),'neon',sha(C/'neon.c'))
