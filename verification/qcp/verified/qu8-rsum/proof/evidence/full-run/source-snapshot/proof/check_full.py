#!/usr/bin/env python3
"""Fresh21 actual C targets, byte strategies, whole source DAG and final typed gate."""
import argparse,hashlib,importlib.util,json,re,shutil,subprocess,sys,tempfile,threading,time,os
from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
sys.dont_write_bytecode=True
HERE=Path(__file__).resolve().parent;CASE=HERE.parent;ROOT=next(p for p in CASE.parents if(p/'.git').exists())
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def load(n,p):
 s=importlib.util.spec_from_file_location(n,p);m=importlib.util.module_from_spec(s);s.loader.exec_module(m);return m
def final_source(units,strategies):
 out=[]
 for i,u in enumerate(units):
  goal=u['namespace']+'.'+u['stem']+'_goal';proof=u['checked_module'];out+=['Require Import '+goal+' '+proof.rsplit('.',1)[0]+'.',f'Module ActualUnit{i} : {goal}.VC_Correct := {proof}.'];out+=['Print Assumptions ActualUnit'+str(i)+'.proof_of_'+n+'.'for n in u['fields']]
 for i,u in enumerate(strategies):
  goal=u['namespace']+'.'+u['stem']+'_strategy_goal';proof=u['checked_module'];out+=['Require Import '+goal+' '+proof.rsplit('.',1)[0]+'.',f'Module ActualStrategy{i} : {goal}.{u["module_type"]} := {proof}.'];out+=['Print Assumptions ActualStrategy'+str(i)+'.'+n+'.'for n in u['fields']]
 return '\n'.join(out)+'\n'
ALLOWED_ASSUMPTIONS={
'CNotation.LE_arrow_field_congr','CNotation.RE_addr_of_congr','CNotation.eval_addr_expr','CNotation.eval_addr_expr_congr','CNotation.sizeof_alias_type','CNotation.sizeof_enum_type','CNotation.sizeof_struct_type','CNotation.sizeof_union_type','ClassicalDedekindReals.sig_forall_dec','ClassicalDedekindReals.sig_not_dec','Classical_Prop.classic','FunctionalExtensionality.functional_extensionality_dep','PropExtensionality.propositional_extensionality','SeparationLogic.Snaive_C_Rules64.eval_addr'}
def assumption_audit(text,count):
 names=set();unknown=set();basenames={}
 for n in ALLOWED_ASSUMPTIONS:basenames.setdefault(n.rsplit('.',1)[-1],set()).add(n)
 raw=set(re.findall(r'^([A-Za-z_]\w*(?:\.\w+)*)\s*:',text,re.M))-{'Axioms'}
 for n in raw:
  if n in ALLOWED_ASSUMPTIONS:names.add(n)
  elif n in {'Snaive_C_Rules64.eval_addr','SimpleC.SL.SeparationLogic.Snaive_C_Rules64.eval_addr'}:names.add('SeparationLogic.Snaive_C_Rules64.eval_addr')
  elif '.'not in n and len(basenames.get(n,set()))==1:names.update(basenames[n])
  else:unknown.add(n)
 assert not unknown,'Unknown assumptions '+repr(sorted(unknown))
 assert len(re.findall(r'^(?:Axioms:|Closed under the global context)',text,re.M))==count,'Print Assumptions output count'
 return dict(print_commands=count,inherited_assumption_names=sorted(names),unknown_assumptions=[],new_project_axioms_observed=False)
def external_imports(paths,ns):
 result=set()
 for path in paths:
  clean=re.sub(r'\(\*.*?\*\)','',Path(path).read_text(),flags=re.S)
  for m in re.finditer(r'(?:From\s+([\w.]+)\s+)?Require\s+(?:(?:Import|Export)\s+)?([\w.\s]+?)\.(?=\s|$)',clean):
   pre,body=m.groups()
   for word in body.split():
    name=(pre+'.'+word)if pre else word
    if not name.startswith(ns+'.'):result.add(('From '+pre+' 'if pre else '')+'Require Import '+word+'.')
 return sorted(result)
def external_snapshot(run,imports,flags,execute,label):
 # Print Libraries enumerates transitively loaded .vo files, including implicit
 # Prelude imports. Locate Library resolves their real files in these load paths.
 src=run/(label+'.v');src.write_text(''.join((n if n.endswith('.')else 'Require Import '+n+'.')+'\n'for n in imports)+'Print Libraries.\n')
 execute(['coqtop','-batch',*flags,'-l',src],label+'-libraries',7200)
 text=(run/(label+'-libraries.log')).read_text();assert 'Loaded library files:'in text
 names=re.findall(r'^  ([A-Za-z_]\w*(?:\.\w+)*)\s*$',text,re.M);assert names and len(names)==len(set(names))
 loc=run/(label+'-locations.v');loc.write_text(''.join((n if n.endswith('.')else 'Require Import '+n+'.')+'\n'for n in imports)+''.join('Locate Library '+n+'.\n'for n in names))
 execute(['coqtop','-batch',*flags,'-l',loc],label+'-locations',7200)
 text=(run/(label+'-locations.log')).read_text();rows=re.findall(r'([A-Za-z_]\w*(?:\.\w+)*)\s+has\s+been\s+loaded\s+from\s+file\s+(\S+\.vo)',text)
 assert set(n for n,p in rows)==set(names),'Incomplete physical .vo resolution'
 return {n:dict(path=str(Path(p).resolve()),sha256=sha(Path(p)))for n,p in rows}
def iter_current_unit_texts():
 b=load('rsum_builder_views',HERE/'build_full_handoff.py');h=b.read(HERE/'frozen-full-handoff.json')
 for u in h['units']:yield {'stem':u['stem'],'namespace':h['namespace'],'text':b.unit_text(u),'cpp_flags':[]}
def main():
 if not __debug__:raise RuntimeError('Optimized Python is forbidden')
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--config',type=Path,required=True);p.add_argument('--jobs',type=int,default=16);p.add_argument('--timeout',type=int,default=7200);p.add_argument('--dependency-dir',type=Path);a=p.parse_args();assert 1<=a.jobs<=16 and 0<a.timeout<=14400
 b=load('rsum_full_builder',HERE/'build_full_handoff.py');hpath=HERE/'frozen-full-handoff.json';h=b.read(hpath);ns=h['namespace'];run=Path(tempfile.mkdtemp(prefix='full-',dir=CASE/'.build'));coq=run/'coq';local=coq/ns;local.mkdir(parents=True);units=[];strategies=[];modules=[];records=[];lock=threading.Lock();s={'passed':False,'whole_kernel_verified':False,'scope':'full','run_directory':str(run),'parallel_jobs':a.jobs,'per_process_memory_GiB':16,'records':records,'actual_c_units':units,'strategies':strategies,'limits':h['limits'],'handoff_sha256':sha(hpath),'unused_BASE87_included':False,'external_libraries_rebuilt':False}
 env={**os.environ,'PATH':str(ROOT/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
 def save():(run/'status.json').write_text(json.dumps(s,indent=2)+'\n')
 def execute(cmd,label,timeout=None):
  command=list(map(str,cmd));is_coqc=command[:2]==['qcp-env','coqc']
  if is_coqc and'-time'not in command:command.insert(2,'-time')
  command=['prlimit','--as=17179869184:17179869184','--',*command];work=run/'jobs'/label;work.mkdir(parents=True,exist_ok=True);log=run/(label+'.log');t=time.monotonic()
  with log.open('w')as f:
   try:r=subprocess.run(command,cwd=work,env=env,stdout=f,stderr=f,timeout=a.timeout if is_coqc else(timeout or a.timeout));code=r.returncode
   except subprocess.TimeoutExpired:code=124
  with lock:records.append({'label':label,'command':command,'cwd':str(work),'exit_code':code,'seconds':time.monotonic()-t,'log_sha256':sha(log)});save()
  print(label,code,flush=True)
  if code:raise RuntimeError(label+': '+log.read_text()[-3500:])
 try:
  assert ns in ['Qs8Rsum','Qu8Rsum']and len(h['units'])==21 and h['total_actual_c_vcs']==890 and h['actual_c_function_count']==34 and len(h['strategies'])==1 and len(h['strategies'][0]['fields'])==2
  frozen=h['frozen_source_sha256'];assert frozen
  for n,v in frozen.items():assert not Path(n).is_absolute()and(CASE/n).resolve().is_relative_to(ROOT.resolve())and sha(CASE/n)==v,'Frozen source changed '+n
  assert b.native_check()['input_sha256']==h['native_input_sha256'];assert b.implementations(run)==h['implementations']
  for item in h['components']:d=b.read(CASE/item['path']);assert sha(CASE/item['path'])==item['sha256']and d.get('passed')and d.get('vc_correct_passed')
  config_sha=sha(a.config);flags=json.loads(a.config.read_text())['flags'][2:];position=0
  while position<len(flags):
   if flags[position]in ['-Q','-R']:assert flags[position+2]!=ns and not flags[position+2].startswith(ns+'.'),'Old case load path';position+=3
   else:position+=1
  flags+=['-Q',str(local),ns];tool_sha={n:sha(Path(shutil.which(n,path=env['PATH'])).resolve())for n in ['qcp','qcp-env','coqc','coqtop','gcc','prlimit','patch']};strategy_tool=Path(shutil.which('qcp',path=env['PATH'])).resolve().parent/'StrategyCheck';strategy_sha=sha(strategy_tool)
  for name in h['own_modules']:
   if name.endswith('_goal'):continue
   src=HERE/'coq'/(name+'.v');assert str(src.relative_to(CASE))in frozen;clean=re.sub(r'\(\*.*?\*\)','',src.read_text(),flags=re.S);assert not re.search(r'\b(?:Axiom|Parameter|Admitted|admit|Declare\s+Module)\b',clean),'Unchecked source '+name;shutil.copyfile(src,local/src.name);modules.append({'namespace':ns,'name':src.name,'path':str((local/src.name).relative_to(run))})
  slp=['-slp',str(CASE/'shim'),ns,'-slp',str(HERE/'c'),ns]
  def generate(u):
   stem=u['stem'];folder=run/'units'/stem;folder.mkdir(parents=True);src=b.cpp_source(u,folder);expanded=folder/'expanded.c';execute(['gcc','-E','-P','-CC','-nostdinc',src,'-o',expanded],stem+'-cpp',600);assert sha(expanded)==u['cpp_sha256'],stem+' CPP'
   if stem in ['neon_unit','rvv_unit']:
    side=stem.split('_')[0];raw=folder/'raw.c';raw.write_text('#include "'+str(CASE/'shim'/(side+'_frontend.h'))+'"\n#include "'+str(CASE/u['actual_source'])+'"\n');rawcpp=folder/'raw-expanded.c';execute(['gcc','-E','-P','-CC','-nostdinc',raw,'-o',rawcpp],stem+'-raw-cpp',600);assert b.tokens(rawcpp.read_text())==b.tokens(expanded.read_text()),stem+' executable tokens'
   target=folder/(stem+'.c');target.write_bytes(expanded.read_bytes());out=folder/'generated';out.mkdir();execute(['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit=1024','--input-file='+str(target),'--coq-output-dir='+str(out),'--coq-logic-path='+ns,*slp],stem+'-qcp');goal=out/(stem+'_goal.v');assert sha(goal)==u['goal_sha256'],stem+' actual goal identity';fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',goal.read_text(),re.M);assert fields==u['fields'];shutil.copyfile(goal,local/goal.name)
   return {'label':ns+'/'+stem,'namespace':ns,'stem':stem,'fields':fields,'c_vcs':len(fields),'goal_sha256':sha(goal),'cpp_sha256':sha(expanded),'checked_module':u['typed_instance'],'functions_defined':u['functions_defined']},{'namespace':ns,'name':goal.name,'path':str((local/goal.name).relative_to(run))},expanded.read_text()
  with ThreadPoolExecutor(max_workers=a.jobs)as pool:generated=list(pool.map(generate,h['units']))
  texts={}
  for u,m,text in generated:units.append(u);modules.append(m);texts[u['stem']]=text
  s['call_closure']=b.closure(texts);assert len(units)==21 and sum(u['c_vcs']for u in units)==890
  for item in h['strategies']:
   stem=Path(item['file']).stem;folder=run/('strategy-'+stem);folder.mkdir();execute([strategy_tool,'--arch=64','--endian=little','--no-exec-info','--input-file='+str(CASE/item['file']),'--coq-output-dir='+str(folder),'--coq-logic-path='+ns],stem+'-strategy',600);goal=folder/(stem+'_strategy_goal.v');assert sha(goal)==item['goal_sha256'];fields=re.findall(r'^\s*Axiom (\w+)\s*:',goal.read_text(),re.M);types=re.findall(r'^Module Type (\w+)\.',goal.read_text(),re.M);assert fields==item['fields']and len(types)==1;shutil.copyfile(goal,local/goal.name);modules.append({'namespace':ns,'name':goal.name,'path':str((local/goal.name).relative_to(run))});strategies.append({'label':ns+'/'+stem,'namespace':ns,'stem':stem,'module_type':types[0],'fields':fields,'checked_module':item['typed_instance'],'goal_sha256':sha(goal)})
  assert len(modules)==len(h['own_modules'])and not list(coq.rglob('*.vo'));s.update(input_sha256=frozen,config_sha256=config_sha,tool_sha256=tool_sha,strategy_tool_sha256=strategy_sha);external=external_snapshot(run,external_imports([run/m['path']for m in modules],ns),flags,execute,'external-before');s['external_recursive_vo_closure']=external;save();parallel=load('rsum_parallel',b.BASE/'proof/parallel.py');parallel.compile_modules(modules,run,flags,execute,a.jobs)
  final=run/'FinalCaseCheck.v';final.write_text(final_source(units,strategies));execute(['qcp-env','coqc',*flags,final],'FinalCaseCheck')
  s['assumption_audit']=assumption_audit((run/'FinalCaseCheck.log').read_text(),892)
  after=external_snapshot(run,[ns+'.'+Path(m['name']).stem for m in modules],flags,execute,'external-after');after={n:r for n,r in after.items()if not n.startswith(ns+'.')};assert external==after,'Loaded external recursive .vo closure changed'
  for n,row in external.items():assert sha(Path(row['path']))==row['sha256'],'External object drift '+n
  for n,v in frozen.items():assert sha(CASE/n)==v,'End-of-run input drift '+n
  assert sha(hpath)==s['handoff_sha256']and sha(a.config)==config_sha and sha(strategy_tool)==strategy_sha
  for n,v in tool_sha.items():assert sha(Path(shutil.which(n,path=env['PATH'])).resolve())==v
  s.update(passed=True,whole_kernel_verified=True,verification_state='checked_repaired_c_shim_partial_correctness',checked_c_units=21,checked_c_vcs=890,checked_strategy_fields=2,fresh_compiled_local_modules=len(modules)+1,no_component_vo_reused=True,final_gate_sha256=sha(final),final_assumptions_log_sha256=sha(run/'FinalCaseCheck.log'),compiled_source_sha256={m['namespace']+'.'+Path(m['name']).stem:sha(run/m['path'])for m in modules})
 except Exception as e:s['error']=str(e);print(str(e),flush=True)
 finally:
  save();dest=HERE/'full-status.json'
  if dest.exists():hist=HERE/'history';hist.mkdir(exist_ok=True);(hist/('full-status-'+sha(dest)+'.json')).write_bytes(dest.read_bytes())
  dest.write_text(json.dumps(s,indent=2)+'\n');print('RUN',run,flush=True)
 return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
