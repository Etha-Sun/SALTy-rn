import argparse,hashlib,json,os,re,shutil,subprocess,tempfile,time,threading
from concurrent.futures import ThreadPoolExecutor
from pathlib import Path
args=argparse.Namespace(kernel='qu8-rdsum',reuse_generation=None);case=Path(__file__).resolve().parent.parent;root=next(p for p in case.parents if(p/'.git').exists());ns='Qu8Rdsum';run=Path(tempfile.mkdtemp(prefix='vector-proof-',dir=case/'.build'));coq=run/'coq';coq.mkdir();flags=json.loads((root/'.build/simple-kernels-bootstrap/coq-flags.json').read_text())['flags'][2:]+['-Q',str(coq),ns];env={**os.environ,'PATH':str(root/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']};records=[];lock=threading.Lock();sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
status={'passed':False,'whole_kernel_verified':False,'scope':'Actual vector helper C bodies only; no whole-kernel claim','run_directory':str(run),'records':records,'parallel_jobs':16,'per_process_memory_GiB':16};sources={}
def execute(command,label,timeout=3600):
 command=['prlimit','--as=17179869184:17179869184','--',*map(str,command)];work=run/'jobs'/label;work.mkdir(parents=True);log=run/(label+'.log');start=time.monotonic()
 with log.open('w')as f:
  try:code=subprocess.run(command,cwd=work,env=env,stdout=f,stderr=f,timeout=timeout).returncode
  except subprocess.TimeoutExpired:code=124
 with lock:
  records.append({'label':label,'command':command,'exit_code':code,'seconds':time.monotonic()-start,'log_sha256':sha(log)});(run/'records.json').write_text(json.dumps(records,indent=2)+'\n')
 print(label,code,flush=True)
 if code:raise RuntimeError(label+': '+log.read_text()[-6000:])
def cc(stem):execute(['qcp-env','coqc','-time',*flags,coq/(stem+'.v')],stem)
def copy(name):
 src=case/'proof/coq'/(name+'.v');shutil.copyfile(src,coq/src.name);sources[str(src.relative_to(case))]=sha(src)
try:
 for name in ['Model','Types','VectorModel','FastFrame']:copy(name);cc(name)
 src=case/'shim/vector_scalar.c';sources[str(src.relative_to(case))]=sha(src)
 execute(['gcc','-E','-P','-CC','-nostdinc',src,'-o',run/'vector_scalar.c'],'vector_scalar-cpp')
 execute(['qcp','--arch=64','--endian=little','--no-exec-info','--input-file='+str(run/'vector_scalar.c'),'--coq-output-dir='+str(coq),'--coq-logic-path='+ns],'vector_scalar-qcp')
 cc('vector_scalar_goal');goal=(coq/'vector_scalar_goal.v').read_text();scalarfields=re.findall(r'^Axiom proof_of_(\w+) :',goal,re.M)
 scalar='From Coq Require Import ZArith Lia.\nFrom SimpleC.SL Require Import Mem SeparationLogic.\nFrom '+ns+' Require Import VectorModel vector_scalar_goal.\nImport Snaive_C_Rules64.\nLocal Open Scope Z_scope.\nLocal Open Scope sac.\nModule Checked : '+ns+'.vector_scalar_goal.VC_Correct.\n'
 for n in scalarfields:
  aux=', '+ns+'.vector_scalar_goal.'+n+'_aux'if re.search(r'^Definition '+n+r'_aux\b',goal,re.M)else''
  scalar+=f'Lemma proof_of_{n} : {ns}.vector_scalar_goal.{n}.\nProof. unfold {ns}.vector_scalar_goal.{n}{aux};try left;intros;subst;unfold rs_active_s32,rs_splat_s32,rs_mul_s8 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.\n' if args.kernel=='qs8-rsum' else f'Lemma proof_of_{n} : {ns}.vector_scalar_goal.{n}.\nProof. unfold {ns}.vector_scalar_goal.{n}{aux};try left;intros;subst;unfold rd_active_wadd16,rd_active_wadd32,rd_splat,rd_wadd16 in *;repeat match goal with |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b) end;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;entailer!;nia. Qed.\n'
 scalar+='End Checked.\n'+''.join('Print Assumptions Checked.proof_of_'+n+'.\n'for n in scalarfields);(coq/'VectorScalarChecked.v').write_text(scalar);cc('VectorScalarChecked');shutil.copyfile(coq/'VectorScalarChecked.v',case/'proof/coq/VectorScalarChecked.v')
 headers=(case/'shim/vector_primitives.h').read_text();stems=re.findall(r'^\w+ (\w+)\(',headers,re.M);assert len(stems)==15
 def generate(stem):
  src=case/'shim'/(stem+'.c');sources[str(src.relative_to(case))]=sha(src);dest=run/(stem+'.c');execute(['gcc','-E','-P','-CC','-nostdinc',src,'-o',dest],stem+'-cpp');
  if args.reuse_generation:
   old=args.reuse_generation.resolve();previous=json.loads((old/'status.json').read_text());assert previous['proof_source_sha256'][stem+'_goal.v']==sha(old/'coq'/(stem+'_goal.v'));assert sha(dest)==sha(old/(stem+'.c')),'Current CPP differs from previous actual target';shutil.copyfile(old/'coq'/(stem+'_goal.v'),coq/(stem+'_goal.v'))
   with lock:records.append({'label':stem+'-existing-actual-target-identity','exit_code':0,'current_cpp_sha256':sha(dest),'previous_run':str(old),'goal_sha256':sha(coq/(stem+'_goal.v')),'new_qcp_run':False})
  else:execute(['qcp','--arch=64','--endian=little','--no-exec-info','--input-file='+str(dest),'--coq-output-dir='+str(coq),'--coq-logic-path='+ns],stem+'-qcp')
  cc(stem+'_goal');g=(coq/(stem+'_goal.v')).read_text();return stem,re.findall(r'^Axiom proof_of_(\w+) :',g,re.M),g
 with ThreadPoolExecutor(max_workers=16)as pool:units=list(pool.map(generate,stems))
 types=re.findall(r'^Definition (UndefStructPred\w+)',(coq/'Types.v').read_text(),re.M)
 fieldrows=[(stem,n,g)for stem,names,g in units for n in names];parts=[fieldrows[i::16]for i in range(16)];modeldefs='rs_pair_s8,rs_pair_s16'if args.kernel=='qs8-rsum'else'rd_wadd16'
 common='From Coq Require Import ZArith Lia.\nFrom '+ns+' Require Import Types VectorModel FastFrame '+ ' '.join(stem+'_goal'for stem in stems)+'.\nImport Snaive_C_Rules64.\nLocal Open Scope Z_scope.\nLocal Open Scope sac.\n'
 def prove(pair):
  i,rows=pair;name='VectorPart'+str(i).zfill(2);body=common
  for stem,n,g in rows:
   aux=', '+ns+'.'+stem+'_goal.'+n+'_aux'if re.search(r'^Definition '+n+r'_aux\b',g,re.M)else''
   # Pair specifications are actual scalar callee results; no arithmetic model
   # needs unfolding to cancel their exact returned cells.
   body+=f'Lemma proof_of_{n} : {ns}.{stem}_goal.{n}.\nProof. unfold {ns}.{stem}_goal.{n}{aux};try left;intros;subst;unfold '+','.join(types)+';rewrite ?local_field_address;try change Int.max_signed with 2147483647 in *;try change Int.min_signed with (-2147483648) in *;try change Int.max_unsigned with 4294967295 in *;try change Int64.max_unsigned with 18446744073709551615 in *;repeat progress rewrite <-logic_equiv_andp_assoc;first[solve[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia]|solve[apply _derivable1_andp_intros;[unfold derivable1,andp,coq_prop;intros;repeat first[assumption|split|reflexivity];lia|opaque_leaves;sepcon_assoc_change;fast_cancel]]|solve[opaque_leaves;sepcon_assoc_change;fast_cancel]|solve[entailer!;try congruence;try lia;try(opaque_leaves;sepcon_assoc_change;fast_cancel)]]. Qed.\n'
  (coq/(name+'.v')).write_text(body);cc(name);shutil.copyfile(coq/(name+'.v'),case/'proof/coq'/(name+'.v'));return name
 with ThreadPoolExecutor(max_workers=16)as pool:partnames=list(pool.map(prove,enumerate(parts)))
 checked=common+'From '+ns+' Require Import '+' '.join(partnames)+'.\n';printlines=[]
 for idx,(stem,names,g)in enumerate(units):
  checked+=f'Module Unit{idx} : {ns}.{stem}_goal.VC_Correct.\n'
  for n in names:
   owner=next(i for i,rows in enumerate(parts)if any(t==stem and x==n for t,x,_ in rows));checked+=f'Definition proof_of_{n} : {ns}.{stem}_goal.{n} := {ns}.{partnames[owner]}.proof_of_{n}.\n';printlines.append(f'Print Assumptions Unit{idx}.proof_of_{n}.\n')
  checked+=f'End Unit{idx}.\n'
 checked+=''.join(printlines);(coq/'VectorChecked.v').write_text(checked);cc('VectorChecked');shutil.copyfile(coq/'VectorChecked.v',case/'proof/coq/VectorChecked.v');status.update(passed=True,vc_correct_passed=True,actual_c_vcs=len(fieldrows)+len(scalarfields),units=[{'stem':stem,'fields':names,'goal_sha256':sha(coq/(stem+'_goal.v'))}for stem,names,_ in units])
except Exception as e:status['error']=str(e);print(status['error'],flush=True)
for f in ['formal_model.h','formal_types.h','scalar_primitives.h','vector_scalar.h','vector_primitives.h']:sources['shim/'+f]=sha(case/'shim'/f)
status['input_sha256']=sources;status['proof_source_sha256']={p.name:sha(p)for p in coq.glob('*.v')};(run/'status.json').write_text(json.dumps(status,indent=2)+'\n');(case/'proof/vector-status.json').write_text(json.dumps(status,indent=2)+'\n');print(json.dumps({'passed':status['passed'],'run':str(run),'error':status.get('error')}),flush=True);raise SystemExit(0 if status['passed']else 1)
