"""Summarize saved proof evidence; never launches WP or admits a kernel."""
import hashlib,json,pathlib,re
R=pathlib.Path.cwd(); O=R/'experiments/integration-wave2/conv-pool'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
for d in sorted(O.iterdir()):
 if not d.is_dir() or not (d/'task.json').exists():continue
 tasks=[d]+[p for p in sorted(d.iterdir()) if p.is_dir() and (p/'task.json').exists()]
 checks=[];artifacts=[]
 for task in tasks:
  cfg=json.loads((task/'task.json').read_text());f=json.loads((R/cfg['case']/'frozen.json').read_text());checks.append({'profile':str(task.relative_to(d)),'frozen_manifest_unchanged':sha(R/cfg['case']/'frozen.json')==cfg['frozen_sha256'],'all_frozen_inputs_unchanged':all(sha(R/v['path'])==v['sha256'] for v in f['files'].values()),'model':f.get('wp_model_variant',f['model']),'wp_timeout':f.get('wp_timeout'),'wp_budget':f.get('wp_budget')})
  for a in sorted((task/'attempts').glob('*')):
   lp=a/'launch.json'
   if not lp.exists():continue
   launch=json.loads(lp.read_text());status=json.loads((a/'status.json').read_text()) if (a/'status.json').exists() else {'state':'running_or_queued'}
   entry={'path':str(a.relative_to(R)),'proof_sha256':launch['proof_sha256'],'matches_current_profile_draft':sha(task/'draft/proof.patch')==launch['proof_sha256'],'mode':launch['mode'],'state':status,'sourceguard_passed':False}
   gp=a/'.build/guard01/guard.json'
   if gp.exists():entry['sourceguard_passed']=json.loads(gp.read_text()).get('passed',False)
   for rn in ['main-report.json','logs/verify01-lemmas.json']:
    p=a/rn
    if p.exists():
     rows=json.loads(p.read_text());entry[rn]={'sha256':sha(p),'passed':sum(bool(x.get('passed')) for x in rows),'total':len(rows),'pending':[x['goal'] for x in rows if not x.get('passed')]}
   sp=a/'logs/verify01-summary.json'
   if sp.exists():
    s=json.loads(sp.read_text());entry['full_complete']=bool(launch['mode']=='full' and s.get('complete'));entry['model_control_accepted']=bool(s.get('model_control',{}).get('accepted'));entry['missing_body_ensures']=s.get('missing_body_ensures');entry['missing_global_lemmas']=s.get('missing_global_lemmas')
   log=a/'logs/verify01.log'
   if log.exists():
    text=log.read_text();entry['why3_type_error_count']=text.count('[Why3 Error]');entry['incomplete_log_pending_signals']=sorted(set(re.findall(r'\[wp\] \[(?:Timeout|Failure|Unknown)\] (\S+)',text)));entry['has_main_raw']=(a/'main-report.json').exists()
   artifacts.append(entry)
 report={'kernel':d.name,'admitted':False,'new_full_kernel_pass':any(x.get('full_complete') for x in artifacts),'current_proof_sha256':sha(d/'draft/proof.patch'),'profiles':checks,'attempts':artifacts,'policy':'Only proof changed. Original sources preserved. A partial diagnostic, globals-only report, old different-proof full or missing raw is not a full-kernel proof.'}
 (d/'review.json').write_text(json.dumps(report,indent=2,ensure_ascii=False)+'\n')
 text='# '+d.name+' 整合与复验\n\n公开 spec、普通 C、shim、driver 和模型保持冻结。Argmax 使用独立保留且预先审计的安全 tail 修复 target；旧版未覆盖。\n\n'
 seed=json.loads((d/'seed.json').read_text());text+='本轮 proof 种子：\n\n'+''.join('- '+s+'\n' for s in seed['changes'])
 for n in ['helper-update.json','frame-update.json']:
  p=d/n
  if p.exists():
   detail=json.loads(p.read_text());text+='\n新增改动（是否通过以实际 raw 为准）：'+json.dumps(detail.get('changes'),ensure_ascii=False)+'\n'
   if detail.get('scope_note'):text+='\n范围纠正：'+detail['scope_note']+'\n'
 text+='\n详细报告：[review.json](review.json)。原 v3 profile 保留；closure-v4 仅加强全局引理与调用闭包检查，普通输入不变。所有 early guard/parse 失败保留，不能解释成 kernel 功能反例。\n\n|Profile / attempt|状态|主报告|\n|---|---|---|\n'
 for x in artifacts:
  raw=x.get('main-report.json');count=(str(raw['passed'])+'/'+str(raw['total'])) if raw else '尚无主报告';text+='|'+x['path'].split('/'+d.name+'/')[1]+'|'+x['state']['state']+'|'+count+'|\n'
 text+='\n当前新增完整收录：'+('待 root 独立审计' if report['new_full_kernel_pass'] else '0')+'。非空 raw、全部 body/global/caller/control/冻结检查和 root 独立复验均完成后才可收录。\n'
 (d/'README.zh-CN.md').write_text(text)
 print(d.name,'attempts',len(artifacts),'full',report['new_full_kernel_pass'])
