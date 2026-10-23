#!/usr/bin/env python3
"""Review current live C translation units; freeze only completed component evidence."""
import argparse,hashlib,importlib.util,json,os,re,subprocess,tempfile
from pathlib import Path
CASE=Path(__file__).resolve().parent.parent
ROOT=next(p for p in CASE.parents if(p/'.git').exists())
UNITS=[('scalar_primitives','scalar-status','S8Clamp.ScalarChecked.CheckedScalar'),('neon_primitives','neon-vector-status','S8Clamp.NeonPrimitivesChecked.CheckedNeonPrimitives'),('neon_ext','ext-vector-status','S8Clamp.NeonExtChecked.CheckedNeonExt'),('neon_load','load-status','S8Clamp.NeonLoadChecked.CheckedNeonLoad'),('neon_store','store-status','S8Clamp.NeonStoreChecked.CheckedNeonStore'),('signed_tail','signed-tail-status','S8Clamp.SignedTailChecked.CheckedSignedTail'),('rvv_arithmetic','rvv-arithmetic-status','S8Clamp.RvvArithmeticChecked.CheckedRvvArithmetic'),('rvv_load','rvv-load-status','S8Clamp.RvvLoadChecked.CheckedRvvLoad'),('rvv_store','rvv-store-status','S8Clamp.RvvStoreChecked.CheckedRvvStore'),('neon_unit','neon-proof-status','S8Clamp.NeonKernelChecked.CheckedNeonKernel'),('rvv_unit','rvv-kernel-status','S8Clamp.RvvKernelChecked.CheckedRvvKernel'),('wrapper','wrapper-proof-status','S8Clamp.WrapperChecked.CheckedWrapper')]
STRATEGIES=[('s8_arrays','proof/c/s8_arrays.strategies','S8Clamp.S8ArraysStrategy.CheckedS8Arrays',2),('signed_tail','shim/signed_tail.strategies','S8Clamp.signed_tail_strategy_proof.CheckedSignedTailStrategy',2),('s8_neon_memory','proof/c/s8_neon_memory.strategies','S8Clamp.NeonMemoryStrategy.CheckedNeonMemoryStrategy',5),('rvv_vectors','proof/c/rvv_vectors.strategies','S8Clamp.rvv_vectors_strategy_proof.CheckedRvvVectorsStrategy',1),('rvv_store','proof/c/rvv_store.strategies','S8Clamp.rvv_store_strategy_proof.CheckedRvvStoreStrategy',5),('rvv_kernel','proof/c/rvv_kernel.strategies','S8Clamp.rvv_kernel_strategy_proof.CheckedRvvKernelStrategy',1)]
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def module(name,path):
 s=importlib.util.spec_from_file_location(name,path);m=importlib.util.module_from_spec(s);s.loader.exec_module(m);return m
def relative_includes(text,destination,origin):
 def fix(m):
  q=Path(m[1]);q=q if q.is_absolute()else origin/q
  return '#include "'+os.path.relpath(q.resolve(),destination.parent)+'"'
 return re.sub(r'^\s*#\s*include\s*"([^\"]+)"',fix,text,flags=re.M)
def include(path,destination):return '#include "'+os.path.relpath(CASE/path,destination.parent)+'"\n'
def goal_for(stem,status,freeze):
 expected=status.get('goal_sha256');roots=[]
 for key in ['run_directory','generation_run_directory']:
  if status.get(key):roots.append(Path(status[key]))
 if stem=='neon_unit':
  g=json.loads((CASE/'proof/neon-generation-status.json').read_text());expected=expected or g['goal_sha256'];roots.append(Path(g['run_directory']))
 if stem=='wrapper':
  g=json.loads((CASE/'proof/wrapper-generation-status.json').read_text());roots.append(Path(g['run_directory']))
 candidates=[r/sub/(stem+'_goal.v') for r in roots for sub in ['coq','generated','']]
 for p in candidates:
  if p.is_file()and(expected is None or sha(p)==expected):return p
 raise ValueError('Cannot locate exact actual checked goal for '+stem)
def main():
 ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--freeze',action='store_true');args=ap.parse_args();run=Path(tempfile.mkdtemp(prefix='full-handoff-',dir=CASE/'.build'));folder=CASE/'proof/c/full';folder.mkdir(exist_ok=True);records=[]
 def execute(cmd,label):
  cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];log=run/(label+'.log')
  with log.open('w')as out:a=subprocess.run(cmd,cwd=run,stdout=out,stderr=out,timeout=600)
  records.append(dict(label=label,command=cmd,exit_code=a.returncode,log_sha256=sha(log)))
  if a.returncode:raise RuntimeError(label+': '+log.read_text()[-2500:])
 try:
  full=module('s8_full',CASE/'proof/check_full.py');cov=module('s8_coverage',ROOT/'verification/qcp/verified/f32-vadd/proof/coverage.py');cov.C_KEYWORDS.add('return');ng=module('s8_neon_materializer',CASE/'proof/generate_neon.py');rg=module('s8_rvv_materializer',CASE/'proof/generate_rvv_kernel.py')
  units=[];components=[];definitions={};declarations={};calls=[];statuses={};templates={}
  for stem,status_name,checked in UNITS:
   path='proof/'+status_name+'.json';status=json.loads((CASE/path).read_text())if(CASE/path).exists()else{};statuses[path]=status
   if args.freeze and not(status.get('passed')and status.get('vc_correct_passed')):raise ValueError('Incomplete component '+path)
   if args.freeze:
    for key in ['input_sha256','live_source_sha256','source_sha256']:
     for name,h in status.get(key,{}).items():
      p=CASE/name
      if not p.is_file():
       if key=='source_sha256'and '/'not in name:continue
       raise ValueError('Missing component input '+name)
      if sha(p)!=h:raise ValueError('Stale component '+path+' input '+name)
   tu=folder/(stem+'.c');flags=[];raw=None;identity=None
   if stem=='neon_unit':
    text,_=ng.text();text=relative_includes(text,tu,CASE);raw=folder/(stem+'.raw.c');raw.write_text(include('shim/neon_frontend.h',raw)+include('impl/testNEON.c',raw));identity='impl/testNEON.c'
   elif stem=='rvv_unit':
    text=include('shim/rvv_frontend.c',tu)+rg.kernel_text();raw=folder/(stem+'.raw.c');raw.write_text(include('shim/rvv_frontend.c',raw)+include('impl/testRVV.c',raw));identity='impl/testRVV.c'
   elif stem=='wrapper':
    original=(CASE/'spec.c').read_text();text=original
    for rule in json.loads((CASE/'proof/c/wrapper.annotations.json').read_text())['compare_outputs']:
     if text.count(rule['before'])!=1:raise ValueError('Wrapper annotation anchor drift')
     text=text.replace(rule['before'],rule['text']+'\n  '+rule['before'],1)
    if full.tokens(original)!=full.tokens(text):raise ValueError('Wrapper executable tokens changed')
    text=include('shim/control.c',tu)+relative_includes(text,tu,CASE);flags=['-DQCP_FORMAL'];raw=folder/(stem+'.raw.c');raw.write_text(include('shim/control.c',raw)+include('spec.c',raw));identity='spec.c'
   else:text=include('shim/'+stem+'.c',tu)
   tu.write_text(text);src=run/(stem+'.c');src.write_text(full.render_unit_text(CASE,dict(translation_unit=str(tu.relative_to(CASE)))));cpp=run/(stem+'.expanded.c');execute(['gcc','-E','-P','-CC','-nostdinc',*flags,src,'-I',CASE,'-o',cpp],stem+'-cpp')
   if raw:
    raw_cpp=run/(stem+'.raw.expanded.c');execute(['gcc','-E','-P','-CC','-nostdinc',*flags,raw,'-I',CASE,'-o',raw_cpp],stem+'-raw-cpp')
    if full.tokens(cpp.read_text())!=full.tokens(raw_cpp.read_text()):raise ValueError('Authoritative live raw C token mismatch: '+stem)
   goal=goal_for(stem,status,args.freeze);fields=re.findall(r'^Axiom proof_of_(\w+) :',goal.read_text(),re.M)
   if len(fields)!=full.EXPECTED_UNITS[stem]or len(fields)!=len(set(fields)):raise ValueError('Actual field count changed '+stem)
   bodies=[]
   for n,sig,contract,edges in cov._functions(cpp.read_text(),stem):
    pair=(sig,contract)
    if n in declarations and declarations[n]!=pair:raise ValueError('C signature/contract mismatch '+n)
    declarations[n]=pair
    if edges is not None:definitions.setdefault(n,[]).append(stem);bodies.append(n);calls.extend((n,e)for e in edges)
   u=dict(stem=stem,translation_unit=str(tu.relative_to(CASE)),cpp_flags=flags,cpp_sha256=sha(cpp),goal_sha256=sha(goal),fields=fields,functions_defined=sorted(bodies),typed_instance=checked,strategy_application_limit=(1024 if stem=='neon_unit' else 2048 if stem=='rvv_unit' else 4096))
   if raw:u.update(raw_translation_unit=str(raw.relative_to(CASE)),identity_source=identity)
   units.append(u);components.append(dict(path=path,sha256=sha(CASE/path)))
  missing=sorted(set(declarations)-set(definitions));unbound=sorted({n for _,n in calls}-set(definitions))
  if missing or unbound or len(definitions)!=41:raise ValueError('C closure mismatch: '+str((missing,unbound,len(definitions))))
  public=run/'public.expanded.c';execute(['gcc','-E','-P','-CC','-nostdinc','-DQCP_FORMAL',CASE/'spec.c','-I',CASE,'-o',public],'public-cpp')
  for n,sig,contract,_ in cov._functions(public.read_text(),'public'):
   if n in declarations and declarations[n]!=(sig,contract):raise ValueError('Public contract/signature mismatch '+n)
  strategies=[]
  for stem,path,typed,count in STRATEGIES:
   tool=Path(__import__('shutil').which('qcp')).resolve().parent/'StrategyCheck';out=run/('strategy-'+stem);out.mkdir();execute([tool,'--arch=64','--endian=little','--no-exec-info','--input-file='+str(CASE/path),'--coq-output-dir='+str(out),'--coq-logic-path=S8Clamp'],'strategy-'+stem);goal=out/(stem+'_strategy_goal.v');fields=re.findall(r'^\s*Axiom (\w+) :',goal.read_text(),re.M)
   if len(fields)!=count:raise ValueError('Strategy field count drift '+stem)
   strategies.append(dict(file=path,namespace='S8Clamp',fields=fields,goal_sha256=sha(goal),typed_instance=typed))
  orig=json.loads((CASE/'proof/originals.json').read_text());repair=json.loads((CASE/'proof/repair.json').read_text());native_path='proof/repaired-native-status.json';native=json.loads((CASE/native_path).read_text());aux=[]
  for path in ['proof/original-native-status.json','proof/rvv-native-status.json']:
   d=json.loads((CASE/path).read_text());required={'checks':d['checks']}if'checks'in d else{k:d[k]for k in ['arithmetic_vector_cases','memory_vector_cases','repaired_rvv_calls','no_alignment_condition']};aux.append(dict(path=path,sha256=sha(CASE/path),required_values=required))
  if not native.get('passed')or native['checks']['disagreements']!=0 or native['checks']['cases']!=19044 or not native['checks']['wrong_result_rejected']or not native['checks']['frames_checked']:raise ValueError('Repaired native acceptance failed')
  own=sorted(p.stem for p in(CASE/'proof/coq').glob('*.v'));own+=sorted([u['stem']+'_goal'for u in units]+[Path(s['file']).stem+'_strategy_goal'for s in strategies])
  if len(own)!=len(set(own)):raise ValueError('Duplicate local module inventory')
  files={CASE/'spec.c',Path(__file__),CASE/'proof/check_full.py',CASE/'proof/originals.json',CASE/'proof/repair.json',CASE/'proof/repair.patch',CASE/native_path,CASE/'proof/neon-generation-status.json',CASE/'proof/wrapper-generation-status.json'}
  files|={CASE/c['path']for c in components};files|={CASE/a['path']for a in aux};files|={CASE/repair['original_counterexample_evidence']['path']}
  for directory,extensions in [('impl',{'.c'}),('shim',{'.c','.h','.strategies'}),('proof/c',{'.c','.h','.json','.strategies'}),('proof/coq',{'.v'})]:files|={p for p in(CASE/directory).rglob('*')if p.is_file()and p.suffix in extensions}
  files|={p for p in(CASE/'proof').glob('*.py')if p.name not in ['record_status.py','audit_relocation.py']}
  frozen={str(p.relative_to(CASE)):sha(p)for p in sorted(files)};implementations={}
  for side in ['neon','rvv']:
   item=orig['files'][side];row=dict(actual=item['copy'],actual_sha256=sha(CASE/item['copy']),original=item['path'],original_sha256=item['sha256'],variant='original'if side=='neon'else'repaired')
   if side=='rvv':row.update(patch='proof/repair.patch',patch_sha256=sha(CASE/'proof/repair.patch'),patch_target='impl/testRVV.c',counterexample_sha256={repair['original_counterexample_evidence']['path']:repair['original_counterexample_evidence']['sha256'],'proof/repair.json':sha(CASE/'proof/repair.json'),'proof/original-native-status.json':sha(CASE/'proof/original-native-status.json')})
   implementations[side]=row
  h=dict(namespace='S8Clamp',scope='Fixed byte C-shim partial correctness; all signed byte inputs and all valid int32 RawLo/RawHi, without ordered-bounds premise',total_actual_c_vcs=2060,actual_c_function_count=41,whole_kernel_bodies_required=['test_neon','test_rvv','compare_outputs','equivalent'],units=units,strategies=strategies,own_modules=own,components=components,implementations=implementations,native_status=native_path,native_status_sha256=sha(CASE/native_path),native_success_field='passed',native_required_values={'checks':native['checks']},native_input_sha256=native['input_sha256'],auxiliary_native_statuses=aux,frozen_source_sha256=frozen,limits=dict(pointer_bits=64,endian='little',vlen_bits=128,sew_bits=8,lmul=8,vlmax=128,selected_vl='min(AVL,128)',input_padding_bytes=7,output_padding_bytes=0,batch_domain='0<n<=18446744073709551608',parameter_domain='All int32 RawLo and RawHi; their low signed bytes are used',ordered_bounds_required=False,isa_refinement='open',termination_theorem='not claimed'),planning_run_directory=str(run))
  (run/'handoff.json').write_text(json.dumps(h,indent=2)+'\n');status=dict(passed=True,freeze_requested=args.freeze,formal_proof=False,run_directory=str(run),units=len(units),actual_c_fields=sum(len(u['fields'])for u in units),actual_c_bodies=len(definitions),strategy_fields=sum(len(s['fields'])for s in strategies),own_modules=len(own),records=records)
  if args.freeze:(CASE/'proof/frozen-full-handoff.json').write_text(json.dumps(h,indent=2)+'\n')
 except Exception as e:status=dict(passed=False,formal_proof=False,error=str(e),run_directory=str(run),records=records)
 (run/'status.json').write_text(json.dumps(status,indent=2)+'\n');print(json.dumps({k:status.get(k)for k in ['passed','freeze_requested','run_directory','units','actual_c_fields','actual_c_bodies','strategy_fields','own_modules','error']},indent=2));return 0 if status['passed']else 1
if __name__=='__main__':raise SystemExit(main())
