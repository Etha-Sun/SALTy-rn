#!/usr/bin/env python3
"""Freeze the exact current RSUM C/Coq closure; preparation is not a proof."""
import argparse,hashlib,importlib.util,json,os,re,shutil,subprocess,sys,tempfile
from pathlib import Path
sys.dont_write_bytecode=True
CASE=Path(__file__).resolve().parent.parent
ROOT=next(p for p in CASE.parents if(p/'.git').exists())
NS=json.loads((CASE/'proof/originals.json').read_text())['namespace']
EXPECTED=(21,890,34,2)
BASE=ROOT/'verification/qcp/verified/f32-vadd'
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def read(p):return json.loads(Path(p).read_text())
def require(b,m):
 if not b:raise ValueError(m)
def module(n,p):
 s=importlib.util.spec_from_file_location(n,p);m=importlib.util.module_from_spec(s);s.loader.exec_module(m);return m
def locate(p):
 p=Path(p)
 if p.exists():return p
 for i,x in enumerate(p.parts):
  if x==CASE.name:
   q=CASE.joinpath(*p.parts[i+1:])
   if q.exists():return q
 return p
def tokens(t):return re.findall(r'\w+|[^\s\w]',re.sub(r'/\*.*?\*/|//[^\n]*','',t,flags=re.S))
def coverage():
 m=module('rsum_c_coverage',BASE/'proof/coverage.py');m.C_KEYWORDS.add('return');return m
def closure(texts):
 cov=coverage();decl={};defs={};edges=[];body_tokens={}
 for label,text in texts.items():
  for n,sig,contract,calls in cov._functions(text,label):
   pair=sig,contract;require(n not in decl or decl[n]==pair,'C declaration/body signature or contract mismatch: '+n);decl[n]=pair
   if calls is not None:defs.setdefault(n,[]).append(label);edges += [(n,x)for x in calls]
 require(all(len(labels)==1 for labels in defs.values()),'Duplicate actual C body provider')
 require(not set(decl)-set(defs),'Declarations without bodies: '+str(sorted(set(decl)-set(defs))))
 require(not {b for a,b in edges}-set(defs),'Unbound actual C callee')
 require(len(defs)==34 and {'test_neon','test_rvv','equivalent'}<=set(defs),'Actual C closure count')
 return {'definitions':defs,'calls':sorted(set(edges)),'unbound_callees':[],'declarations_without_checked_body':[],'unique_c_functions_with_bodies':len(defs),'exact_contract_and_signature_match':True}
def unit_text(row):
 source=CASE/row['actual_source'];stem=row['stem']
 if stem not in ['neon_unit','rvv_unit']:return '#include "'+str(source)+'"\n'
 side=stem.split('_')[0];raw=source.read_text();ann=read(CASE/'proof/c'/(side+'.annotations.json'));s=raw.replace('\n{','\n'+ann['contract']+'\n{',1)
 if side=='rvv':
  anchor='  for (; batch > 0; )';require(s.count(anchor)==1,'RVV loop anchor');s=s.replace(anchor,ann['invariant']+'\n'+anchor,1)
 else:
  for anchor,key in [('  for (; batch >= 2048;','outer_invariant'),('    for (size_t current_batch = 2048;','inner_invariant'),('    for (; batch >= 16;','remainder_invariant')]:
   require(s.count(anchor)==1,'NEON anchor '+key);s=s.replace(anchor,ann[key]+'\n'+anchor,1)
 for call,binding in ann['where'].items():require(call in s,'Missing live call '+call);s=s.replace(call,call+' /*@ where '+binding+' */')
 require(tokens(s)==tokens(raw),'Executable kernel tokens changed by annotation')
 return '#include "'+str(CASE/'shim'/(side+'_frontend.h'))+'"\n'+s
def cpp_source(row,folder):
 if row['stem'] not in ['neon_unit','rvv_unit']:
  return CASE/row['actual_source']
 p=folder/(row['stem']+'.input.c');p.write_text(unit_text(row));return p
def template(row):
 folder=CASE/'proof/c/full';folder.mkdir(exist_ok=True);dest=folder/(row['stem']+'.c');text=unit_text(row)
 def fix(m):return '#include "'+os.path.relpath(Path(m[1]),dest.parent)+'"'
 dest.write_text(re.sub(r'#include "([^"]+)"',fix,text));return str(dest.relative_to(CASE))
def native_check():
 p=CASE/'proof/formal-native-status.json';d=read(p);require(d.get('passed')and d.get('source_identity_stable')and d['actual_c_units']==21,'Current native closure incomplete')
 for key in ['ubsan_output','asan_output']:
  o=d[key];require(o['cases']==990 and o['lanes_per_side']==1075860 and o['failures']==0 and o['input_and_params_preserved']and o['canaries_checked'],'Native acceptance '+key)
 require(d['asan_cgroup']=={'actual_memory_max':'17179869184','actual_memory_swap_max':'0'},'Actual ASAN cgroup bound')
 for r in d['records']:require((r['exit_code']==0)==r.get('expected_zero',True),'Native execution result '+r['label'])
 require(d['input_sha256']==d['input_sha256_before']and len(d['input_sha256'])>=35,'Native source inventory')
 for n,v in d['input_sha256'].items():require(sha(CASE/n)==v,'Native source changed '+n)
 return d
def implementations(work):
 orig=read(CASE/'proof/originals.json');repair=read(CASE/'proof/repair.json');out={}
 for side,label in [('neon','NEON'),('rvv','RVV')]:
  o=orig['files'][side];repo=o.get('path',o.get('source_path'));retained='proof/original/test'+label+'.c';actual='impl/test'+label+'.c';require(sha(ROOT/repo)==sha(CASE/retained)==o['sha256'],'Original lock '+side)
  item=dict(actual=actual,actual_sha256=sha(CASE/actual),original=repo,original_copy=retained,original_sha256=o['sha256'],variant='original')
  if item['actual_sha256']!=o['sha256']:
   r=repair['sides'][side];require(r['actual_sha256']==item['actual_sha256'],'Repair identity '+side);patch=r['patch'];require(sha(CASE/patch)==r['patch_sha256'],'Repair patch hash')
   d=work/('repair-'+side);d.mkdir();headers=re.findall(r'^\+\+\+ b/(\S+)',(CASE/patch).read_text(),re.M);require(len(headers)==1,'Single-file repair required');relative=Path(headers[0]);require(not relative.is_absolute()and '..'not in relative.parts,'Repair target');target=d/relative;target.parent.mkdir(parents=True,exist_ok=True);shutil.copyfile(CASE/retained,target)
   result=subprocess.run(['patch','--batch','--fuzz=0','-p1','-d',str(d),'-i',str(CASE/patch)],capture_output=True,text=True,timeout=60);(work/('repair-'+side+'.log')).write_text(result.stdout+result.stderr);require(result.returncode==0 and target.read_bytes()==(CASE/actual).read_bytes(),'Zero-fuzz repair replay '+side)
   item.update(variant='repaired',patch=patch,patch_sha256=sha(CASE/patch),patch_target=str(target.relative_to(d)))
  out[side]=item
 return out
def required_modules(units,strategy_goal):
 sources={p.stem:p for p in (CASE/'proof/coq').glob('*.v')};generated={u['stem']+'_goal':locate(u['goal'])for u in units};generated['byte_arrays_strategy_goal']=strategy_goal
 roots={u['typed_instance'].split('.')[1]for u in units}|{'ByteStrategy','byte_arrays_strategy_proof'}|set(generated);needed=set();pending=list(roots)
 while pending:
  name=pending.pop()
  if name in needed:continue
  require(name in sources or name in generated,'Missing actual typed-root dependency '+name);needed.add(name);p=generated.get(name,sources.get(name));clean=re.sub(r'\(\*.*?\*\)','',p.read_text(),flags=re.S)
  if name not in generated:require(not re.search(r'\b(?:Axiom|Parameter|Admitted|admit|Declare\s+Module)\b',clean),'Unchecked project declaration '+name)
  for m in re.finditer(r'(?:From\s+([\w.]+)\s+)?Require\s+(?:(?:Import|Export)\s+)?([\w.\s]+?)\.(?=\s|$)',clean):
   pre,body=m.groups()
   for word in body.split():
    q=(pre+'.'+word)if pre else word
    if q.startswith(NS+'.'):
     local=q[len(NS)+1:];require('.'not in local,'Unexpected case subnamespace');pending.append(local)
 return sorted(needed)
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--freeze',action='store_true');p.add_argument('--prepare-only',action='store_true');a=p.parse_args();require(not(a.freeze and a.prepare_only),'Conflicting modes');run=Path(tempfile.mkdtemp(prefix='full-handoff-',dir=CASE/'.build'));records=[];s={'passed':False,'formal_proof':False,'whole_kernel_verified':False,'run_directory':str(run),'records':records}
 def execute(cmd,label):
  log=run/(label+'.log');command=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)]
  with log.open('w')as f:r=subprocess.run(command,cwd=run,stdout=f,stderr=f,timeout=600)
  records.append({'label':label,'command':command,'exit_code':r.returncode,'log_sha256':sha(log)});require(r.returncode==0,label+': '+log.read_text()[-2500:])
 try:
  pre=read(CASE/'proof/component-unit-preflight.json');require(pre['preflight_passed']and(pre['actual_c_units'],pre['actual_c_vcs'],pre['unique_actual_c_bodies'])==(21,890,34),'Actual unit preflight');units=[];texts={};components={};drift=[]
  for original in pre['units']:
   u=dict(original);stem=u['stem'];require(u['namespace']==NS and sha(CASE/u['actual_source'])==u['actual_source_sha256'],'Live source drift '+stem);goal=locate(u['goal']);require(sha(goal)==u['goal_sha256'],'Retained actual goal drift '+stem);u['translation_unit']=template(u)
   src=cpp_source(u,run);out=run/(stem+'.expanded.c');execute(['gcc','-E','-P','-CC','-nostdinc',src,'-o',out],stem+'-cpp');require(sha(out)==u['current_cpp_sha256']==u['historical_cpp_sha256'],'Current CPP identity '+stem);texts[stem]=out.read_text()
   if stem in ['neon_unit','rvv_unit']:
    side=stem.split('_')[0];raw=run/(stem+'.raw.c');raw.write_text('#include "'+str(CASE/'shim'/(side+'_frontend.h'))+'"\n#include "'+str(CASE/u['actual_source'])+'"\n');expanded=run/(stem+'.raw.expanded.c');execute(['gcc','-E','-P','-CC','-nostdinc',raw,'-o',expanded],stem+'-raw-cpp');require(tokens(expanded.read_text())==tokens(out.read_text()),'Raw/live frontend token identity '+stem)
   certificate='proof/'+u['status'];certificate=certificate if not stem.endswith('_unit')else'proof/'+stem.split('_')[0]+'-proof-status.json'
   if not a.prepare_only:
    d=read(CASE/certificate);require(d.get('passed')and d.get('vc_correct_passed'),'Incomplete typed component '+certificate);require(all(r.get('exit_code',0)==0 for r in d.get('records',[])),'Failed component record '+certificate);components[certificate]={'path':certificate,'sha256':sha(CASE/certificate)}
    for key in ['input_sha256','proof_source_sha256','source_sha256','dependency_sha256']:
     for name,oldsha in d.get(key,{}).items():
      q=CASE/name
      if not q.exists()and'/'not in name:q=CASE/'proof/coq'/name
      if q.exists()and sha(q)!=oldsha:drift.append({'certificate':certificate,'input':name,'historical_sha256':oldsha,'current_sha256':sha(q),'admission':'No old object is reused; current source is checked by the final fresh gate.'})
   u.update(cpp_sha256=sha(out),functions_defined=u['actual_bodies']);units.append(u)
  c=closure(texts);cov=coverage();public=run/'public.expanded.c';execute(['gcc','-E','-P','-CC','-nostdinc',CASE/'spec.c','-o',public],'public-cpp');require(cov._functions(public.read_text(),'public spec'),'Public contracts absent')
  s.update(actual_c_units=21,actual_c_vcs=890,actual_c_bodies=34,call_closure=c)
  if a.prepare_only:s['passed']=True
  else:
   tool=Path(shutil.which('qcp')).resolve().parent/'StrategyCheck';out=run/'strategy';out.mkdir();execute([tool,'--arch=64','--endian=little','--no-exec-info','--input-file='+str(CASE/'proof/c/byte_arrays.strategies'),'--coq-output-dir='+str(out),'--coq-logic-path='+NS],'byte_arrays-strategy');goal=out/'byte_arrays_strategy_goal.v';fields=re.findall(r'^\s*Axiom (\w+)\s*:',goal.read_text(),re.M);require(len(fields)==2,'Actual strategy fields');strategies=[dict(file='proof/c/byte_arrays.strategies',namespace=NS,fields=fields,goal_sha256=sha(goal),typed_instance=NS+'.ByteStrategy.CheckedByteArrays')]
   own=required_modules(units,goal);native=native_check();impl=implementations(run);files={CASE/'spec.c',CASE/'proof/originals.json',CASE/'proof/repair.json',CASE/'proof/formal-native-status.json',CASE/'proof/component-unit-preflight.json',Path(__file__),CASE/'proof/check_full.py',BASE/'proof/coverage.py',BASE/'proof/parallel.py'}
   for directory,suffixes in [('impl',{'.c'}),('shim',{'.c','.h'}),('proof/c',{'.c','.h','.json','.strategies'}),('proof/original',{'.c'})]:files|={p for p in(CASE/directory).rglob('*')if p.is_file()and p.suffix in suffixes}
   files|={CASE/p for p in components};files|={CASE/p for p in native['input_sha256']};files|={CASE/'proof/coq'/(n+'.v')for n in own if not n.endswith('_goal')};files|=set((CASE/'proof').glob('repair*.patch'));files|={ROOT/i['original']for i in impl.values()}
   if(CASE/'proof/frontend-scope.json').exists():files.add(CASE/'proof/frontend-scope.json');files.add(CASE/'proof/check_frontend_scope.py')
   frozen={os.path.relpath(p.resolve(),CASE):sha(p)for p in sorted(files)}
   h=dict(namespace=NS,scope='Checked declared RSUM C-shim partial correctness; fixed VLEN128; not ISA/physical-ABI refinement or a termination theorem',total_actual_c_vcs=890,actual_c_function_count=34,whole_kernel_bodies_required=['test_neon','test_rvv','equivalent'],units=units,strategies=strategies,own_modules=own,components=list(components.values()),component_historical_input_drift=drift,implementations=impl,native_status='proof/formal-native-status.json',native_status_sha256=sha(CASE/'proof/formal-native-status.json'),native_input_sha256=native['input_sha256'],frozen_source_sha256=frozen,limits={'pointer_bits':64,'endian':'little','vlen_bits':128,'rvv_configurations':['e8m2','e32m8','e32m1'],'vlmax':32,'red_vlmax':4,'selected_vl':'min(AVL,32)','input_padding_bytes':15,'batch_domain':'0<n<=18446744073709551600','initial_output_domain':'all int32'if NS=='Qs8Rsum'else'all uint32','input_domain':'all int8'if NS=='Qs8Rsum'else'all uint8','observation':'exact canonical32 output value; input/params/frame preserved','isa_refinement':'not claimed','physical_struct_abi_refinement':'not claimed','termination_theorem':'not claimed'},planning_run_directory=str(run),external_coq_libraries_rebuilt=False,unused_BASE87_included=False)
   (run/'handoff.json').write_text(json.dumps(h,indent=2)+'\n')
   if a.freeze:require(not(CASE/'proof/frozen-full-handoff.json').exists(),'Existing H must be explicitly preserved before refreeze');(CASE/'proof/frozen-full-handoff.json').write_text(json.dumps(h,indent=2)+'\n')
   s.update(passed=True,own_modules=len(own),frozen_inputs=len(frozen),component_historical_input_drift=drift)
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');print(json.dumps({k:v for k,v in s.items()if k!='records'},indent=2));return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
