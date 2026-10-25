#!/usr/bin/env python3
from pathlib import Path
import hashlib,json,shutil,subprocess,tempfile
C=Path(__file__).resolve().parent.parent;P=C/'proof';sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest();hist=P/'history';hist.mkdir(exist_ok=True)
for n in ['repair.json','repair-rvv.patch','repair-neon.patch','repair.patch']:
 p=P/n
 if p.exists():shutil.copy2(p,hist/(p.stem+'-before-borrow-'+sha(p)+p.suffix))
parts=[]
for name,old in [('impl/testRVV.c',P/'original/testRVV.c'),('shim/propagating.c',Path('/dev/null')),('shim/propagating_api.h',Path('/dev/null'))]:
 r=subprocess.run(['diff','-u','--label',name,'--label',name,str(old),str(C/name)],stdout=subprocess.PIPE);assert r.returncode==1;parts.append(r.stdout)
(P/'repair-rvv-main.patch').write_bytes(parts[0]);(P/'repair-rvv.patch').write_bytes(b''.join(parts))
rn=subprocess.run(['diff','-u','--label','impl/testNEON.c','--label','impl/testNEON.c',str(P/'original/testNEON.c'),str(C/'impl/testNEON.c')],stdout=subprocess.PIPE);assert rn.returncode==1
(P/'repair-neon.patch').write_bytes(rn.stdout);(P/'repair.patch').write_bytes(rn.stdout+b''.join(parts))
run=Path(tempfile.mkdtemp(prefix='repair-current-exact-',dir=C/'.build'));(run/'impl').mkdir();shutil.copy2(P/'original/testRVV.c',run/'impl/testRVV.c');shutil.copy2(P/'original/testNEON.c',run/'impl/testNEON.c');(run/'shim').mkdir()
with(run/'patch.log').open('w')as f:r=subprocess.run(['patch','--batch','--fuzz=0','-p0','-i',str(P/'repair.patch')],cwd=run,stdout=f,stderr=f)
assert r.returncode==0
for name in ['impl/testNEON.c','impl/testRVV.c','shim/propagating.c','shim/propagating_api.h']:assert(run/name).read_bytes()==(C/name).read_bytes()
s=json.loads((P/'repair.json').read_text());s.update(repaired_rvv_sha256=sha(C/'impl/testRVV.c'),patch_sha256=sha(P/'repair-rvv.patch'),patch_file_count=3,main_patch='proof/repair-rvv-main.patch',main_patch_sha256=sha(P/'repair-rvv-main.patch'),ordinary_helper_source_sha256={p:sha(C/p)for p in ['shim/propagating.c','shim/propagating_api.h']},exact_patch_run=str(run),actual_C_fields_checked=0,native_repaired_validation_pending=True)
s.update(neon_changed=True,neon_variant='compatibility-repaired',repaired_neon_sha256=sha(C/'impl/testNEON.c'),neon_patch='proof/repair-neon.patch',neon_patch_sha256=sha(P/'repair-neon.patch'),combined_patch='proof/repair.patch',combined_patch_sha256=sha(P/'repair.patch'))
s['neon_compatibility']={'reason':'QCP rejects local static storage (actual fatal/zero VC preserved). Only static removed from never-escaping read-only 7-int constant table; identical initializer/use sites, no new branch/domain restriction.','diagnostic':'proof/static-local-tool-gap.json','semantic_counterexample':False}
s['changes']=list(dict.fromkeys(s['changes']))
s['changes'].append('Move the two actual ordinary C helpers into shim/propagating.c behind a public typed API; formal-only pointer borrow adapters preserve all input cells. Main C arithmetic/loop/store tokens retained after the NaN repair.')
s['neon_compatibility']['nested_vector_refactor']='proof/neon-nested-normalization.json'
s['neon_compatibility']['nested_vector_refactor_sha256']=sha(P/'neon-nested-normalization.json')
s['changes'].append('Hoist exactly58 nested pure local-vector calls to named const temporaries at the original statement. Intrinsic call counts and all FMA/store/control order retained; lvalue-only borrow frontend is buildable. This is an explicit compatibility implementation variant, with original-C equivalence not asserted as a whole theorem.')
s['changes']=list(dict.fromkeys(s['changes']));s.pop('native_evidence',None);(P/'repair.json').write_text(json.dumps(s,indent=2)+'\n');print(run)
