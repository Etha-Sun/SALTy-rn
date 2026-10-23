#!/usr/bin/env python3
"""Check actual selected NEON kernel VC fields; deliberately not a full interface."""
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
import argparse,json,re,hashlib,subprocess,tempfile,time,os,shutil,threading
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
p=argparse.ArgumentParser();p.add_argument('--jobs',type=int,default=16);p.add_argument('--timeout',type=int,default=7200);p.add_argument('--limit',type=int,default=0);a=p.parse_args();assert 1<=a.jobs<=16 and 0<a.timeout<=14400 and a.limit>=0
case=Path(__file__).resolve().parent.parent;root=next(p for p in case.parents if(p/'.git').exists());run=Path(tempfile.mkdtemp(prefix='neon-fields-',dir=case/'.build'));coq=run/'coq';coq.mkdir();records=[];lock=threading.Lock();gen=json.loads((case/'proof/neon-generation-status.json').read_text());assert gen['generation_passed']and gen['raw_c_sha256']==sha(case/'impl/testNEON.c');original_goal=Path(gen['run_directory'])/'neon_unit_goal.v';goaltext=original_goal.read_text();allfields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goaltext,re.M);assert len(allfields)==384 and len(set(allfields))==384;excluded={f'test_neon_entail_wit_{i}'for i in range(1,5)}|{f'test_neon_return_wit_{i}'for i in range(1,9)};selected=[f for f in allfields if f not in excluded];assert len(selected)==372
if a.limit:selected=selected[:a.limit]
flags=json.loads((root/'.build/simple-kernels-bootstrap/coq-flags.json').read_text())['flags'][2:]+['-Q',str(coq),'Qs8Lrelu'];env={**os.environ,'PATH':str(root/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']};state={'passed':False,'whole_kernel_verified':False,'vc_correct_passed':False,'scope':'Selected ordinary typed C VC lemmas only. Complete384-field VC_Correct interface,12 memory/loop-return obligations, all callees and full fresh gate still required.','run_directory':str(run),'records':records,'actual_goal_sha256':sha(original_goal),'required_whole_c_fields':384,'selected_fields':selected,'excluded_fields':sorted(excluded),'parallel_jobs':a.jobs,'per_process_memory_GiB':16,'results':[]}
inputs={str(p.relative_to(case)):sha(p)for p in(case/'shim').iterdir()if p.is_file()};inputs.update({n:sha(case/n)for n in ['spec.c','impl/testNEON.c','proof/repair.json','proof/c/neon.annotations.json','proof/check_neon_fields.py','proof/generate_neon.py']});sources={};order=[];visiting=set()
def deps(n,text):
 out=[];clean=re.sub(r'\(\*.*?\*\)','',text,flags=re.S)
 for m in re.finditer(r'From\s+Qs8Lrelu\s+Require\s+(?:Import|Export)\s+([\w\s]+)\.',clean):out+=m.group(1).split()
 for m in re.finditer(r'Require\s+(?:Import|Export)\s+Qs8Lrelu\.(\w+)\.',clean):out.append(m.group(1))
 return list(dict.fromkeys(out))
def visit(n):
 if n in sources:return
 assert n not in visiting,('cycle',n);visiting.add(n);src=original_goal if n=='neon_unit_goal'else case/'proof/coq'/(n+'.v')
 if not src.exists()and n.endswith('_strategy_goal'):
  stem=n.removesuffix('_strategy_goal');strategy=next((p for p in [case/'proof/c'/(stem+'.strategies'),case/'shim'/(stem+'.strategies')]if p.is_file()),None);assert strategy is not None,n;out=run/'strategy-goals'/stem;out.mkdir(parents=True);tool=Path(shutil.which('qcp',path=env['PATH'])).resolve().parent/'StrategyCheck';cmd=['prlimit','--as=17179869184:17179869184','--',str(tool),'--arch=64','--endian=little','--no-exec-info','--input-file='+str(strategy),'--coq-output-dir='+str(out),'--coq-logic-path=Qs8Lrelu'];log=out/'generation.log'
  with log.open('w')as f:r=subprocess.run(cmd,cwd=out,env=env,stdout=f,stderr=f,timeout=1800)
  records.append({'label':'StrategyCheck-'+stem,'command':cmd,'exit_code':r.returncode,'log_sha256':sha(log)});assert r.returncode==0,log.read_text()[-2000:];src=out/(n+'.v');inputs[str(strategy.relative_to(case))]=sha(strategy)
 assert src.is_file(),src;text=src.read_text()
 for dep in deps(n,text):visit(dep)
 if n!='neon_unit_goal'and not n.endswith('_strategy_goal'):
  assert not re.search(r'\b(?:Axiom|Parameter|Admitted|admit)\b',re.sub(r'\(\*.*?\*\)','',text,flags=re.S)),n
  inputs[str(src.relative_to(case))]=sha(src)
 sources[n]=src;order.append(n);visiting.remove(n)
for n in ['LreluKernelSupport','neon_unit_goal']:visit(n)
def exe(label,cmd):
 cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];folder=run/'jobs'/label;folder.mkdir(parents=True);log=run/(label+'.log');t=time.monotonic()
 with log.open('w')as f:
  try:code=subprocess.run(cmd,cwd=folder,env=env,stdout=f,stderr=f,timeout=a.timeout).returncode
  except subprocess.TimeoutExpired:code=124
 with lock:
  records.append({'label':label,'command':cmd,'cwd':str(folder),'exit_code':code,'seconds':time.monotonic()-t,'log_sha256':sha(log)});(run/'status.json').write_text(json.dumps(state,indent=2)+'\n')
 print(label,code,flush=True);return code
try:
 cpp=run/'live-expanded.c';assert exe('live-cpp',['gcc','-E','-P','-CC','-nostdinc',Path(gen['run_directory'])/'annotated.c','-o',cpp])==0;assert sha(cpp)==sha(Path(gen['run_directory'])/'neon_unit.c')
 for n in order:
  shutil.copyfile(sources[n],coq/(n+'.v'));assert exe(n,['qcp-env','coqc','-time',*flags,coq/(n+'.v')])==0,n
 def field(item):
  index,f=item;name='NeonField'+f'{index:04d}';aux=', Qs8Lrelu.neon_unit_goal.'+f+'_aux'if re.search(r'^Definition '+re.escape(f)+r'_aux\b',goaltext,re.M)else''
  text=f'''From Coq Require Import ZArith Lia String.
From Qs8Lrelu Require Import LreluKernelSupport neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Local Open Scope string_scope.
Local Opaque s8_read_lane qcv_seed qcv_s16 qcv_shl7 qcv_subw qcv_neon_add qcv_neon_qrdmulh qcv_sat8 qcv_sat16 qlr_neon_mask qlr_choose_neon.
Module Checked.
Lemma proof_of_{f} : Qs8Lrelu.neon_unit_goal.{f}.
Proof. unfold Qs8Lrelu.neon_unit_goal.{f}{aux};try left;intros;subst;qlr_kernel_close. Qed.
End Checked.
''';src=coq/(name+'.v');src.write_text(text);shutil.copyfile(src,case/'proof/coq'/src.name);code=exe(name,['qcp-env','coqc','-time',*flags,src]);return {'field':f,'module':name,'exit_code':code,'compiled_source_sha256':sha(src)}
 with ThreadPoolExecutor(max_workers=a.jobs)as pool:results=list(pool.map(field,enumerate(selected)))
 state['results']=results;assert all(x['exit_code']==0 for x in results),'Some selected field proofs failed; inspect individual ordinary logs, no full interface claimed'
 gate=coq/'SelectedNeonFieldsGate.v';gate.write_text(''.join('From Qs8Lrelu Require Import '+x['module']+'.\nCheck Qs8Lrelu.'+x['module']+'.Checked.proof_of_'+x['field']+'.\nPrint Assumptions Qs8Lrelu.'+x['module']+'.Checked.proof_of_'+x['field']+'.\n'for x in results));assert exe('SelectedNeonFieldsGate',['qcp-env','coqc','-time',*flags,gate])==0;assert len(re.findall(r'^(?:Axioms:|Closed under the global context)',(run/'SelectedNeonFieldsGate.log').read_text(),re.M))==len(selected)
 assert all(sha(case/n)==v for n,v in inputs.items())and sha(original_goal)==state['actual_goal_sha256'];assert all((case/'proof/coq'/(x['module']+'.v')).read_bytes()==(coq/(x['module']+'.v')).read_bytes()for x in results);state.update(passed=True,selected_fields_typed=True,selected_c_fields_checked=len(selected),no_component_vo_reused=True,input_sha256=inputs,compiled_source_sha256={p.name:sha(p)for p in coq.glob('*.v')})
except Exception as e:state['error']=str(e);print(e,flush=True)
p=case/'proof/neon-fields-status.json'
if p.exists():
 h=case/'proof/history';h.mkdir(exist_ok=True);shutil.copyfile(p,h/('neon-fields-status-'+sha(p)+'.json'))
for p in [run/'status.json',case/'proof/neon-fields-status.json']:p.write_text(json.dumps(state,indent=2)+'\n')
print('RUN',run,flush=True);raise SystemExit(0 if state['passed']else 1)
