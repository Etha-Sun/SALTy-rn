#!/usr/bin/env python3
"""Move only this fully sealed case; preserve all other verified registry entries."""
from pathlib import Path
import datetime,hashlib,importlib.util,json,re,subprocess,tempfile
ROOT=Path(__file__).resolve().parents[1];QCP=ROOT.parents[1];sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
assert ROOT.parent==QCP/'candidates'
S=json.loads((ROOT/'proof/status.json').read_text());M=json.loads((ROOT/'proof/manifest.json').read_text());F=json.loads((ROOT/'proof/full-status.json').read_text())
assert S['passed'] and S['scope']=='full' and S['whole_kernel_proved'] and S['c_shim_equivalence_checked'] and F['passed']
assert sha(ROOT/'proof/manifest.json')==S['manifest_sha256'] and sha(ROOT/'proof/full-status.json')==S['full_evidence_sha256']
assert len(M['modules'])==S['freshly_compiled_local_modules']==1455 and S['checked_c_vcs']==1914 and S['assumption_reports']==1941
for item in M['files']:assert sha(ROOT/item['path'])==item['sha256'],item['path']
for item in F['evidence_files']:assert sha(ROOT/'proof'/item['path'])==item['sha256'],item['path']
for item in json.loads((ROOT/'proof/source-identity.json').read_text())['sources'].values():assert sha(QCP.parents[1]/item['upstream_path'])==item['original_sha256']
new=QCP/'verified'/ROOT.name;assert not new.exists();ROOT.rename(new)
try:
 spec=importlib.util.spec_from_file_location('relocated_qd8_prepare',new/'proof/prepare.py');module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module)
 cpp=[]
 with tempfile.TemporaryDirectory(dir=new/'.build',prefix='relocation-') as directory:
  for unit,u in module.UNITS.items():
   src=Path(directory)/(unit+'.c');src.write_text(module.source(unit));r=subprocess.run(['gcc','-E','-P','-CC','-nostdinc','-I',str(new),'-I',str(new/'shim'),str(src)],capture_output=True,check=True,timeout=60)
   old=new/'.build'/F['generation_run']/'generation'/unit/(u['base']+'.c');assert r.stdout==old.read_bytes(),unit
   cpp.append({'unit':unit,'cpp_sha256':sha(old)})
 for item in M['files']:assert sha(new/item['path'])==item['sha256']
 audit={'passed':True,'kind':'relocation source/CPP/proof identity audit, not another Coq run','utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'old_directory':str(ROOT),'directory':str(new),'unchanged_manifest_sha256':sha(new/'proof/manifest.json'),'unchanged_status_sha256':sha(new/'proof/status.json'),'unchanged_coq_sources':1455,'identical_CPP_units':cpp,'formal_replay_evidence':'proof/full-status.json'}
 (new/'proof/publication-audit.json').write_text(json.dumps(audit,indent=2)+'\n')
except BaseException:
 new.rename(ROOT);raise
registry=json.loads((QCP/'verified/manifest.json').read_text());assert not any(x['kernel']==new.name for x in registry['kernels'])
registry['kernels'].append({'kernel':new.name,'directory':new.name,'full_status':new.name+'/proof/status.json','status_sha256':sha(new/'proof/status.json'),'spec_sha256':sha(new/'spec.c'),'local_coq_modules':1453,'final_gate_modules':2,'total_fresh_compiled_modules':1455,'checked_c_units':5,'unit_vc_fields':1914,'assumption_reports':1941,'parallel_jobs':32,'variant':'repaired','verification_basis':'source-reviewed-intrinsic-spec','human_semantic_review':'pending'})
registry['kernels'].sort(key=lambda x:x['kernel']);registry['verified_count']=len(registry['kernels']);(QCP/'verified/manifest.json').write_text(json.dumps(registry,indent=2)+'\n')
catalog=json.loads((QCP/'catalog.json').read_text());entry=next(x for x in catalog['kernels'] if x['name']==new.name);entry['qcp']={'whole_kernel_proved':True,'status':'verified_c_shim_partial_correctness','status_scope':'Complete repaired actual kernels, ordinary helpers and caller under exact source-reviewed intrinsic specs; full public memory and numeric-or-both-NaN output contract','case':str(new.relative_to(QCP.parents[1])),'evidence':'proof/status.json','verification_basis':'source-reviewed-intrinsic-spec','variant':'repaired','isa_correspondence_proved':False,'termination_proved':False,'human_semantic_review':'pending'};(QCP/'catalog.json').write_text(json.dumps(catalog,ensure_ascii=False,indent=2)+'\n')
p=QCP/'verified/README.zh-CN.md';s=p.read_text();s=re.sub(r'当前 \*\*\d+/40\*\*',f"当前 **{registry['verified_count']}/40**",s,count=1);s+='\nQD8 F32 QC8W GEMM 本次新增完整修复版：[审核与重放入口](qd8-f32-qc8w-gemm-minmax/README.md)。在公开 intrinsic spec 下，5个实际C单元/1914字段、1455个本地普通Coq模块及1941项最终假设报告通过；32路配置，全合法正K/N、全binary32观察域保留。人工语义复核尚未进行，ISA对应与独立终止性不计入结论。\n';p.write_text(s)
print(json.dumps({'promoted':str(new),'verified_count':registry['verified_count'],'publication_audit_passed':True},indent=2))
