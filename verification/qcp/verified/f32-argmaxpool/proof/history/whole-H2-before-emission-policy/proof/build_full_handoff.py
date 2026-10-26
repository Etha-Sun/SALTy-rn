#!/usr/bin/env python3
"""Audit live CPP/call/body inputs; freeze only complete current evidence.
--prepare-only never freezes or issues proof credit; missing sources fail closed.
"""
from pathlib import Path
import argparse,gzip,hashlib,json,re,subprocess,tempfile,time,os
from full_inputs import CASE as C,ROOT,NS,SPECS,EXPECTED,sha,read,require,render_unit,construction,retained_goal,module
import coverage,full_call_coverage
OUTPUTS={'proof/frozen-full-handoff.json','proof/full-status.json','proof/full-preflight-status.json','proof/status.json','proof/manifest.json','proof/assumption-audit.json'}
def inventory():
 return dict(sorted((str(p.relative_to(C)),sha(p))for p in C.rglob('*')if p.is_file()and not any(v in{'.build','__pycache__'}for v in p.relative_to(C).parts)and str(p.relative_to(C))not in OUTPUTS and p.suffix not in{'.vo','.vos','.vok','.glob','.aux','.pyc'}))
def source_closure(roots,generated):
 graph={}
 def visit(n):
  if n in graph:return
  p=generated.get(n,C/'proof/coq'/(n+'.v'));require(p.is_file(),'Missing current Coq source '+n);clean=re.sub(r'\(\*.*?\*\)','',p.read_text(),flags=re.S)
  if n not in generated:require(not re.search(r'\b(?:Axiom|Parameter|Admitted|admit|Abort|Declare\s+Module)\b',clean),'Unchecked source '+n)
  graph[n]=[];deps=set()
  for m in re.finditer(r'(?:From\s+([\w.]+)\s+)?Require\s+(?:(?:Import|Export)\s+)?([\w.\s]+?)\.(?=\s|$)',clean):
   for w in m[2].split():
    full=(m[1]+'.'+w)if m[1]else w
    if full.startswith(NS+'.'):
     d=full[len(NS)+1:];require('.'not in d,'Unexpected namespace '+d);deps.add(d)
  graph[n]=sorted(deps)
  for d in graph[n]:visit(d)
 for r in roots:visit(r)
 return graph

def archive_goal(stem,data):
 digest=hashlib.sha256(data).hexdigest();folder=C/'proof/evidence/actual-targets';folder.mkdir(parents=True,exist_ok=True);target=folder/(stem+'_goal.'+digest+'.v.gz')
 if target.exists():require(gzip.decompress(target.read_bytes())==data,'Immutable goal archive differs')
 else:target.write_bytes(gzip.compress(data,mtime=0))
 require(hashlib.sha256(gzip.decompress(target.read_bytes())).hexdigest()==digest,'Goal round-trip differs')
 return target,digest

def component_units():
 rows=[];errors=[]
 for stem,source,count,functions,provider,status in SPECS:
  try:
   data=retained_goal(stem);archive,digest=archive_goal(stem,data);text=data.decode();fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',text[text.index('Module Type VC_Correct.'):],re.M);require(len(fields)==count and len(set(fields))==count,'Actual count differs '+stem)
   cp=C/'proof'/status;ready=cp.exists()and read(cp).get('passed')is True
   if not ready:errors.append('Complete component missing '+stem+'/'+status)
   rows.append(dict(stem=stem,namespace=NS,source=source,source_sha256=sha(C/source),functions_defined=sorted(functions),fields=fields,actual_C_fields=count,goal_archive=str(archive.relative_to(C)),goal_archive_sha256=sha(archive),goal_sha256=digest,typed_instance=NS+'.'+provider,checked_module=NS+'.'+provider,provider_root=provider.rsplit('.',1)[0],component_status='proof/'+status,component_status_sha256=sha(cp)if cp.exists()else None,component_pending=not ready,construction=construction(stem)))
  except Exception as e:errors.append(stem+': '+str(e))
 return rows,errors

def audit_native():
 result=[]
 for name in ['proof/native-status.json','proof/public-native-status.json']:
  s=read(C/name);require(s['passed']is True and s['formal_proof']is False and s['whole_kernel_verified']is False and s['configured_parallel_jobs']==32,'Finite native gate missing '+name);require(all(sha(C/n)==h for n,h in s['input_sha256'].items()),'Native current input drift '+name)
  require(s['shared_wrong_result_rejected']is True and s['input_frame_and_output_canaries_checked']is True,'Independent oracle/common-wrong/frame controls missing')
  expected_labels={mode+'-'+label for mode in ['undefined','address']for label in ['rvv','block-helper','update-helper','read-table','read-previous','neon','original-neon','original-rvv','link','regression','negative-one','negative-both']}
  expected_labels|={'large-original'}if name=='proof/native-status.json'else{mode+'-public-caller'for mode in ['undefined','address']}
  require(len(s['records'])==len(expected_labels)and{r['label']for r in s['records']}==expected_labels,'Native execution inventory differs')
  for mode in ['undefined','address']:
   require(s[mode]['cases']==4320 and s[mode]['lanes_per_side']==197640 and s[mode]['failures']==0 and s[mode]['observation']=='exact output bits and uint32 index','Native corpus/observation differs')
   for variant in ['negative-one','negative-both']:
    found=[r for r in s['records']if r['label']==mode+'-'+variant];require(len(found)==1 and found[0]['expected_exit']==found[0]['exit_code']==2,'Missing actual negative rejection')
  for r in s['records']:
   require(r['expected_exit']==(2 if r['label'].endswith(('-negative-one','-negative-both'))else 0)and r['exit_code']==r['expected_exit'],'Failed/unexpected native command');p=C/'proof/evidence/native'/Path(name).stem/(r['label']+'.log')
   if not p.exists():p=Path(s['run_directory'])/p.name
   require(p.exists()and sha(p)==r['log_sha256'],'Native execution log drift '+name)
   if r['label'].startswith('address-')and r['label'].endswith(('-regression','-negative-one','-negative-both')):
    require(r['command'][:10]==['systemd-run','--user','--wait','--pipe','--quiet','-p','MemoryMax=17179869184','-p','MemorySwapMax=0','python3'],'Finite actual ASan cgroup absent')
   else:
    bound='34359738368'if r['label']=='large-original'else'17179869184';require(r['command'][:3]==['prlimit','--as='+bound+':'+bound,'--'],'Finite native process memory absent')
   if r['label'].endswith(('-regression','-negative-one','-negative-both')):
    lines=p.read_text().strip().splitlines();address=r['label'].startswith('address-');require(len(lines)==(2 if address else 1),'Unexpected native output shape')
    if address:require(json.loads(lines[0])==dict(actual_memory_max='17179869184',actual_memory_swap_max='0'),'Actual address runtime cgroup memory differs')
    if r['label'].endswith('-regression'):require(json.loads(lines[-1])==s['address'if address else'undefined'],'Actual native corpus payload differs')
    else:require(lines[-1]=='negative comparator='+('1'if r['label'].endswith('-negative-both')else'0')+' oracle_rejected=1','Executed negative control differs')
  if name=='proof/native-status.json':
   rows=[r for r in s['records']if r['label']=='large-original'];require(len(rows)==1,'Original counterexample missing');counter=s['large_original_counterexample'];require(counter['pooling_elements']==2147483648 and counter['input_pointer_table_bytes']==17179869184 and counter['all_entries_valid_and_equal']is True and counter['both_equal_but_wrong']is True,'Original counterexample scope differs')
   log=C/'proof/evidence/native'/Path(name).stem/'large-original.log'
   if not log.exists():log=Path(s['run_directory'])/log.name
   require(json.loads(log.read_text())==counter,'Original counterexample execution differs')
  result.append(dict(path=name,sha256=sha(C/name),input_sha256=s['input_sha256']))
 return result

def audit_implementations(work,execute):
 # Root owns promotion/repair ledger; absence/inconsistency is never bypassed.
 repair=read(C/'proof/repair.json');orig=read(C/'proof/originals.json');result={}
 for side,filename in [('neon','testNEON.c'),('rvv','testRVV.c')]:
  source=C/'impl'/filename;patch=C/'proof'/('repair-'+side+'.patch');arch=C/'proof/original'/filename
  require(arch.is_file()and patch.is_file(),'Original/patch missing '+side)
  target=work/('repair-'+side)/'impl';target.mkdir(parents=True);(target/filename).write_bytes(arch.read_bytes())
  strip='-p1'if patch.read_text().splitlines()[1].startswith('+++ b/')else'-p0'
  entry=repair['sides'][side];saved=orig['files'][side];require(sha(arch)==saved['sha256']and len(arch.read_bytes())==saved['bytes'],'Originals archive identity '+side);catalog=ROOT/saved['path'];require(catalog.is_file()and catalog.read_bytes()==arch.read_bytes(),'Catalog original identity '+side);require(sha(source)==entry['actual_sha256']and sha(arch)==entry['original_sha256']and sha(patch)==entry['patch_sha256'],'Repair ledger drift '+side)
  execute(['patch','--batch','--forward','--fuzz=0',strip,'-d',target.parent,'-i',patch],'repair-'+side)
  require((target/filename).read_bytes()==source.read_bytes(),'Exact repair differs '+side)
  execute(['patch','--batch','--reverse','--fuzz=0',strip,'-d',target.parent,'-i',patch],'repair-'+side+'-reverse');require((target/filename).read_bytes()==arch.read_bytes(),'Reverse repair differs '+side)
  result[side]=dict(source=str(source.relative_to(C)),source_sha256=sha(source),original=str(arch.relative_to(C)),original_sha256=sha(arch),patch=str(patch.relative_to(C)),patch_sha256=sha(patch))
 return result

def main():
 require(not(C/'proof/frozen-full-handoff.json').exists(),'Frozen H inputs are read-only; use record_status --preflight')
 p=argparse.ArgumentParser();g=p.add_mutually_exclusive_group(required=True);g.add_argument('--prepare-only',action='store_true');g.add_argument('--freeze',action='store_true');a=p.parse_args();require(__debug__,'Normal Python required');quota=read(ROOT/'.build/memory/quota/state.json');require(not quota['wind_down_requested'],'Quota wrap-up requested')
 run=Path(tempfile.mkdtemp(prefix='argmax-full-prepare-',dir=C/'.build'));records=[];state=dict(passed=False,whole_kernel_verified=False,formal_proof_replayed=False,source_handoff_frozen=False,scope='Live actual TU/CPP/call/body inventory only',run_directory=str(run),records=records,errors=[])
 def execute(cmd,label):
  command=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];log=run/(label+'.log');t=time.monotonic()
  with log.open('w')as f:r=subprocess.run(command,stdout=f,stderr=f,timeout=600)
  records.append(dict(label=label,command=command,exit_code=r.returncode,seconds=time.monotonic()-t,log_sha256=sha(log)));require(r.returncode==0,label+': '+log.read_text()[-1200:])
 try:
  rows,errors=component_units();state['errors']+=errors
  # Archive inventory is a preparation record, never a certificate.
  inv=dict(namespace=NS,unique_ordinary_bodies=14,expected_actual_TUs=10,total_actual_C_fields=2362,units=rows,strategies=[],extra_mathematical_roots=['APPublicModel','APProgramObservation'],scope='Actual generated target identities and ordinary body requirements, not proof credit')
  (C/'proof/component-unit-inventory.json').write_text(json.dumps(inv,indent=2)+'\n')
  cpp={}
  for row in rows:
   stem=row['stem'];folder=run/stem;folder.mkdir()
   try:
    v=render_unit(stem,folder/(stem+'.in.c'));out=folder/(stem+'.c');execute(['gcc','-E','-P','-CC','-nostdinc','-I',C,*v['cpp_flags'],v['private_source_path'],'-o',out],stem+'-cpp');cpp[stem]=out;row['cpp_sha256']=sha(out);row['cpp_flags']=v['cpp_flags']
    if v['private_identity_path']:
     raw=folder/'raw.c';execute(['gcc','-E','-P','-CC','-nostdinc','-I',C,v['private_identity_path'],'-o',raw],stem+'-raw-cpp');from full_inputs import tokens;require(tokens(raw.read_text())==tokens(out.read_text()),'Executable token identity '+stem)
    parsed=sorted(n for n,_,_,body in coverage._functions(out.read_text(),stem)if body is not None);require(parsed==row['functions_defined'],'Actual body inventory '+stem+': '+repr(parsed))
   except Exception as e:state['errors'].append(stem+': '+str(e))
  closure=full_call_coverage.check(cpp);state['call_closure']=closure;state['errors']+=closure['errors'];require(len(rows)==10 and len(cpp)==10,'Every live TU required');require(closure['source_closure_passed']and closure['unique_actual_C_definitions']==14,'Complete ordinary call closure required')
  (C/'proof/component-unit-inventory.json').write_text(json.dumps(inv,indent=2)+'\n')
  state.update(prepared_TUs=len(cpp),actual_ordinary_bodies=14,total_actual_C_fields=2362)
  if a.freeze:
   require(not state['errors'],'Incomplete current components');require(not(C/'proof/frozen-full-handoff.json').exists(),'Existing H is immutable');native=audit_native();implementations=audit_implementations(run,execute)
   from full_inputs import definition_source,goal_source
   generated={}
   for row in rows:
    generated[row['stem']+'_goal']=goal_source(row);text=definition_source(row['stem'])
    if text:
     q=run/(row['stem']+'_def.v');q.write_text(text);generated[row['stem']+'_def']=q;row['definition_source']=text;row['definition_source_sha256']=sha(q)
   (C/'proof/component-unit-inventory.json').write_text(json.dumps(inv,indent=2)+'\n')
   roots=[r['provider_root']for r in rows]+inv['extra_mathematical_roots']+sorted(generated);dag=source_closure(roots,generated);own=sorted(dag);math=[n for n in own if n not in generated]
   config=ROOT/'.build/simple-kernels-bootstrap/coq-flags.json';profile=read(config);require(profile['flags'][:2]==['qcp-env','coqc'],'Unexpected ordinary Coq profile')
   h=dict(schema=1,namespace=NS,inherited_assumption_allowlist=read(C/'proof/ap-block-main-proof-status.json')['canonical_assumptions'],coq_flags=profile['flags'][2:],coq_config_sha256=sha(config),units=rows,strategies=[],own_modules=own,math_modules=math,support_modules=[],source_dag=dag,total_actual_c_vcs=2362,actual_c_function_count=14,call_closure=closure,native_statuses=native,implementations=implementations,frozen_source_sha256=inventory(),limits=dict(configured_jobs=32,ordinary_per_process_GiB=16,heavy_per_process_GiB=32,generation_timeout=21600,ordinary_timeout=7200,heavy_timeout=14400,address_bits=64,endian='little',VLEN=128,SEW=32,LMUL=8,VLMAX=32,all_legal_VL_choices=True,all_binary32_inputs=True,FP_rounding='RNE'),scope='C-shim modular partial correctness under explicit30 native spec views; no ISA/compiler/ABI/termination proof')
   require(read(C/'proof/repair.json').get('ordinary_block32_preparation_ready')is True,'Root preparation-ready identity not set')
   (C/'proof/frozen-full-handoff.json').write_text(json.dumps(h,indent=2)+'\n');state['source_handoff_frozen']=True;state['handoff_sha256']=sha(C/'proof/frozen-full-handoff.json')
  require(not state['errors'],'Preparation incomplete: '+repr(state['errors']));state['passed']=True
 except Exception as e:state['errors'].append(str(e))
 (run/'status.json').write_text(json.dumps(state,indent=2)+'\n');(C/'proof/full-preflight-status.json').write_bytes((run/'status.json').read_bytes());print(json.dumps({k:v for k,v in state.items()if k not in ['records','call_closure']},indent=2));return 0 if state['passed']else 1
if __name__=='__main__':raise SystemExit(main())
