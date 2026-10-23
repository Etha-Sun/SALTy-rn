#!/usr/bin/env python3
"""Fresh wrapper goals/proofs; explicitly reuse checked VMUL helper dependencies."""
from pathlib import Path
import argparse,hashlib,importlib.util,json,re,shutil,subprocess,tempfile,time
HERE=Path(__file__).resolve().parent;CASE=HERE.parent
REPO=next(p for p in CASE.parents if (p/'.git').exists())
BASE=REPO/'verification/qcp/verified/f32-vmul'
parser=argparse.ArgumentParser()
parser.add_argument('--dependency-dir',type=Path,default=Path(json.loads((BASE/'proof/status.json').read_text())['run_directory'])/'coq')
args=parser.parse_args()
OLD=args.dependency_dir.resolve()
assert OLD.is_dir(),'Missing dependency directory: '+str(OLD)
MODEL=Path(json.loads((HERE/'rvv-proof-status.json').read_text())['run_directory'])/'coq'
CFG=json.loads((REPO.parents[1]/'research/qcp-shim-vadd/results/coq-flags.json').read_text())
s=importlib.util.spec_from_file_location('wrapper_prepare',BASE/'proof/prepare.py');p=importlib.util.module_from_spec(s);s.loader.exec_module(p)
RUN=Path(tempfile.mkdtemp(prefix='wrapper-',dir=CASE/'.build'));COQ=RUN/'coq';COQ.mkdir()
flags=['qcp-env','coqc',*CFG['flags'][2:]]
for folder in OLD.iterdir():flags+=['-Q',str(folder),'' if folder.name=='relations' else folder.name]
flags+=['-Q',str(MODEL),'VMulc','-Q',str(COQ),'VMulcWrapper']
sha=lambda q:hashlib.sha256(q.read_bytes()).hexdigest()
records=[];status={'passed':False,'whole_kernel_verified':False,'scope':'Wrapper plus comparison/NaN helpers; conditional on both kernel contracts and explicitly reused VMUL proof dependencies.','run_directory':str(RUN),'reused_verified_vmul_coq':str(OLD),'reused_checked_vmulc_model':str(MODEL),'records':records,'spec_sha256':sha(CASE/'spec.c')}
def execute(command,label):
 start=time.monotonic();log=RUN/(label+'.log')
 with log.open('w')as out:r=subprocess.run(list(map(str,command)),cwd=CFG['cwd'],stdout=out,stderr=out,timeout=120)
 records.append({'label':label,'exit_code':r.returncode,'seconds':time.monotonic()-start,'command':list(map(str,command)),'log_sha256':sha(log)});print(label,r.returncode,flush=True)
 if r.returncode:raise RuntimeError(log.read_text()[-5000:])
try:
 text=(CASE/'spec.c').read_text();first=text.index('void test_neon');extra=text.index('#include "../../verified/')
 preamble=text[:first]+text[extra:text.index('void qcp_vadd_read')]
 declarations={n:p.function(text,n)for n in ['test_neon','test_rvv','qcp_vadd_read','preserve_float','check_observation','same_lane','compare_outputs','equivalent']}
 groups=[('WrapperRead',['qcp_vadd_read'],{'qcp_vadd_read'},['float_array.strategies']),('WrapperNan',['preserve_float','check_observation','same_lane'],{'preserve_float','check_observation','same_lane'},[]),('WrapperCompare',['qcp_vadd_read','same_lane','compare_outputs'],{'compare_outputs'},['comparator.strategies']),('Wrapper',['test_neon','test_rvv','compare_outputs','equivalent'],{'equivalent'},['comparator.strategies','wrapper.strategies'])]
 slp=[]
 for directory in sorted((BASE/'proof/c').iterdir()):slp+=['-slp',str(directory),directory.name]
 for stem,names,bodies,strategies in groups:
  pieces=[preamble]+['/*@ include strategies "'+n+'" */'for n in strategies]
  for n in names:
   original=declarations[n];annotated=original if n in bodies else p.declaration(original)
   if n=='compare_outputs' and n in bodies:
    patch=json.loads((BASE/'proof/c/VaddComparator/comparator.annotations.json').read_text())[n][0];assert annotated.count(patch['before'])==1;annotated=annotated.replace(patch['before'],patch['text']+'\n'+patch['before'],1)
   if n=='equivalent':
    patch=json.loads((BASE/'proof/c/VaddWrapper/wrapper.annotations.json').read_text())[n][0];comment=patch['text'].replace('FloatArray::full(input_b,n+3,B)','store(input_b,float,c)');assert annotated.count(patch['before'])==1;annotated=annotated.replace(patch['before'],comment+'\n'+patch['before'],1)
   assert p.tokens(annotated)==p.tokens(original if n in bodies else p.declaration(original));pieces.append(annotated)
  source=RUN/(stem+'.c');p.write_unit(CASE/'spec.c','\n'.join(pieces),source);expanded=RUN/(stem+'-expanded.c')
  execute(['gcc','-E','-P','-CC','-nostdinc',source,'-o',expanded],stem+'-cpp');source.write_bytes(expanded.read_bytes());generated=RUN/stem;generated.mkdir()
  execute(['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(source),'--coq-output-dir='+str(generated),'--coq-logic-path=VMulcWrapper',*slp],stem+'-qcp')
  goal=generated/(stem+'_goal.v');shutil.copyfile(goal,COQ/goal.name);shutil.copyfile(goal,HERE/'coq'/goal.name)
 for name in ['WrapperHelpers.v','WrapperChecked.v']:
  shutil.copyfile(HERE/'coq'/name,COQ/name)
 for name in ['WrapperRead_goal.v','WrapperNan_goal.v','WrapperCompare_goal.v','WrapperHelpers.v','Wrapper_goal.v','WrapperChecked.v']:execute(flags+[COQ/name],name)
 assert sha(CASE/'spec.c')==status['spec_sha256'],'spec changed during wrapper check'
 status.update(passed=True,checked_wrapper_c_vcs=len(re.findall(r'^Axiom proof_of_', (COQ/'Wrapper_goal.v').read_text(),re.M)),checked_helper_c_vcs=sum(len(re.findall(r'^Axiom proof_of_', (COQ/(stem+'_goal.v')).read_text(),re.M))for stem in ['WrapperRead','WrapperNan','WrapperCompare']),checked_module='VMulcWrapper.WrapperChecked.CheckedWrapper : VMulcWrapper.Wrapper_goal.VC_Correct',helper_modules='VMulcWrapper.WrapperHelpers.Read/Nan/Compare',fresh_local_modules=6,goal_sha256={q.name:sha(q)for q in COQ.glob('*_goal.v')})
 # Audit every fresh declaration, definition, and call against live public spec.
 coverage_spec=importlib.util.spec_from_file_location('wrapper_coverage',BASE/'proof/coverage.py');coverage=importlib.util.module_from_spec(coverage_spec);coverage_spec.loader.exec_module(coverage)
 full_cpp=subprocess.run(['gcc','-E','-P','-CC','-nostdinc',str(CASE/'spec.c')],capture_output=True,text=True,check=True).stdout
 public={name:(signature,contract)for name,signature,contract,calls in coverage._functions(full_cpp,'public spec')}
 aliases={'WrapperRead':'VMulcWrapper.WrapperHelpers.Read','WrapperNan':'VMulcWrapper.WrapperHelpers.Nan','WrapperCompare':'VMulcWrapper.WrapperHelpers.Compare','Wrapper':'VMulcWrapper.WrapperChecked.CheckedWrapper'}
 unit_records=[];definitions={};all_calls=[]
 for stem,names,bodies,strategies in groups:
  rows=[]
  for name,signature,contract,calls in coverage._functions((RUN/(stem+'-expanded.c')).read_text(),stem):
   assert (signature,contract)==public[name],'Public contract/signature drift: '+name
   row={'function':name,'definition':calls is not None,'public_signature_and_contract_match':True,'contract_sha256':hashlib.sha256(contract.encode()).hexdigest(),'calls':sorted(calls or [])};rows.append(row)
   if calls is not None:
    assert name not in definitions,'Duplicate helper body';definitions[name]=stem
    all_calls.extend((name,callee)for callee in calls)
  assert {row['function']for row in rows if row['definition']}==bodies
  unit_records.append({'stem':stem,'actual_c_path':str(RUN/(stem+'.c')),'actual_c_sha256':sha(RUN/(stem+'.c')),'expanded_c_path':str(RUN/(stem+'-expanded.c')),'expected_goal_path':str(HERE/'coq'/(stem+'_goal.v')),'fresh_goal_path':str(COQ/(stem+'_goal.v')),'goal_sha256':sha(COQ/(stem+'_goal.v')),'checked_module_alias':aliases[stem]+' : VMulcWrapper.'+stem+'_goal.VC_Correct','functions':rows})
 call_records=[]
 for caller,callee in sorted(all_calls):
  if callee in definitions:
   source={'kind':'fresh_wrapper_helper_body','unit':definitions[callee],'checked_module_alias':aliases[definitions[callee]]}
  else:
   assert callee in {'test_neon','test_rvv'},'Unbound C callee: '+callee
   filename='testNEON.c'if callee=='test_neon'else'testRVV.c'
   source={'kind':'conditional_kernel_contract','original_body_path':str(CASE/'impl'/filename),'original_body_sha256':sha(CASE/'impl'/filename),'body_not_checked_by_this_runner':True}
  call_records.append({'caller':caller,'callee':callee,'source':source})
 status.update(actual_c_units=unit_records,c_calls=call_records,conditional_kernel_callees=['test_neon','test_rvv'],public_contracts_and_signatures_match=True,kernel_declaration_prefix_sha256=hashlib.sha256((CASE/'spec.c').read_text().split('#include "../../verified/')[0].encode()).hexdigest(),local_source_sha256={str(q.relative_to(CASE)):sha(q)for q in [CASE/'spec.c',HERE/'check_wrapper.py',HERE/'coq/WrapperHelpers.v',HERE/'coq/WrapperChecked.v']})
except (RuntimeError,AssertionError)as error:status['error']=str(error);print(error)
(HERE/'wrapper-proof-status.json').write_text(json.dumps(status,indent=2)+'\n')
raise SystemExit(not status['passed'])
