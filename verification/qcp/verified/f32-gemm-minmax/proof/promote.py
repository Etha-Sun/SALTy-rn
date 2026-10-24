#!/usr/bin/env python3
"""Promote only a complete sealed case, then verify all source/CPP identities."""
from pathlib import Path
import json,hashlib,datetime,subprocess,tempfile,importlib.util,re
ROOT=Path(__file__).resolve().parents[1];QCP=ROOT.parents[1];REPO=QCP.parents[1];sha=lambda f:hashlib.sha256(f.read_bytes()).hexdigest()
assert ROOT.parent==QCP/'candidates'
S=json.loads((ROOT/'proof/status.json').read_text());M=json.loads((ROOT/'proof/manifest.json').read_text());F=json.loads((ROOT/'proof/full-status.json').read_text())
assert S['passed'] and S['whole_kernel_proved'] and S['c_shim_equivalence_checked'] and F['passed']
assert S['freshly_compiled_local_modules']==len(M['modules'])==1063 and S['checked_c_vcs']==895 and S['assumption_reports']==923
assert sha(ROOT/'proof/manifest.json')==S['manifest_sha256'] and sha(ROOT/'proof/full-status.json')==S['full_evidence_sha256']
for x in M['files']:assert sha(ROOT/x['path'])==x['sha256'],x['path']
for x in F['evidence_files']:assert sha(ROOT/'proof'/x['path'])==x['sha256'],x['path']
identity=json.loads((ROOT/'proof/source-identity.json').read_text())
for side,group in [('neon','source'),('rvv','target')]:assert sha(REPO/'kernels'/group/'f32-gemm-minmax.c')==identity[side]['original_sha256']
new=QCP/'verified'/ROOT.name;assert not new.exists();ROOT.rename(new)
try:
 spec=importlib.util.spec_from_file_location('relocated_f32_prepare',new/'proof/prepare.py');module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module);cpp=[]
 with tempfile.TemporaryDirectory(dir=new/'.build',prefix='relocation-') as temp:
  for unit,u in module.UNITS.items():
   src=Path(temp)/(unit+'.c');src.write_text(module.source(unit));r=subprocess.run(['gcc','-E','-P','-CC','-nostdinc','-I',str(new),'-I',str(new/'shim'),str(src)],capture_output=True,check=True,timeout=60)
   old=new/'.build'/F['generation_run']/'generation'/unit/(u['base']+'.c');assert r.stdout==old.read_bytes(),unit;cpp.append({'unit':unit,'cpp_sha256':sha(old)})
 for x in M['files']:assert sha(new/x['path'])==x['sha256'],x['path']
 audit={'passed':True,'kind':'relocation source/CPP/proof identity audit; not another proof run','utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'old_directory':str(ROOT),'directory':str(new),'unchanged_manifest_sha256':sha(new/'proof/manifest.json'),'unchanged_status_sha256':sha(new/'proof/status.json'),'unchanged_coq_sources':1063,'identical_CPP_units':cpp,'ordinary_source_sha256':sha(new/'shim/ordinary.c'),'formal_replay_evidence':'proof/full-status.json'};(new/'proof/publication-audit.json').write_text(json.dumps(audit,indent=2)+'\n')
except BaseException:new.rename(ROOT);raise
p=QCP/'verified/manifest.json';registry=json.loads(p.read_text());assert not any(x['kernel']==new.name for x in registry['kernels'])
registry['kernels'].append({'kernel':new.name,'directory':new.name,'full_status':new.name+'/proof/status.json','status_sha256':sha(new/'proof/status.json'),'spec_sha256':sha(new/'spec.c'),'local_coq_modules':1059,'final_gate_modules':4,'total_fresh_compiled_modules':1063,'checked_c_units':4,'unit_vc_fields':895,'assumption_reports':923,'parallel_jobs':32,'variant':'repaired','verification_basis':'source-reviewed-intrinsic-spec','human_semantic_review':'pending'});registry['kernels'].sort(key=lambda x:x['kernel']);registry['verified_count']=len(registry['kernels']);p.write_text(json.dumps(registry,indent=2)+'\n')
p=QCP/'catalog.json';catalog=json.loads(p.read_text());entry=next(x for x in catalog['kernels'] if x['name']==new.name);entry['qcp']={'whole_kernel_proved':True,'status':'verified_c_shim_partial_correctness','status_scope':'Complete repaired current C kernels, ordinary helpers and actual caller under source-reviewed intrinsic specs; full legal K/N,mr1..4,allbinary32 public contract','case':str(new.relative_to(REPO)),'evidence':'proof/status.json','verification_basis':'source-reviewed-intrinsic-spec','variant':'repaired','isa_correspondence_proved':False,'termination_proved':False,'human_semantic_review':'pending'};p.write_text(json.dumps(catalog,ensure_ascii=False,indent=2)+'\n')
p=QCP/'verified/README.zh-CN.md';s=p.read_text();s=re.sub(r'当前 \*\*\d+/40\*\*',f"当前 **{registry['verified_count']}/40**",s,count=1);s+='\nF32 GEMM 完整修复版：[审核入口](f32-gemm-minmax/README.md)。4实际C单元/895字段、1063个本地普通Coq模块及923项最终假设报告通过；32路配置，完整合法正K/N、mr1..4、全binary32。intrinsic采用公开来源审查spec，最终人工语义复核pending；不声称ISA或独立终止性。\n';p.write_text(s)
p=new/'README.md';s=p.read_text().replace('完整修复版候选','完整修复版验证包').replace('尚未通过最后门禁时不计为 verified。','本包已通过完整准入与迁移身份审计；其精确证据由 status 引用。');p.write_text(s)
print(json.dumps({'promoted':str(new),'verified_count':registry['verified_count'],'publication_audit_passed':True},indent=2))
