from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
import os,json,re,subprocess,tempfile,time,hashlib,shutil,threading,argparse
pa=argparse.ArgumentParser();pa.add_argument("--jobs",type=int,default=16);args=pa.parse_args()
P=Path(__file__).resolve().parent;c=P.parent;root=next(p for p in c.parents if(p/'.git').exists());gen=json.loads((P/'rvv-generation-status.json').read_text());assert gen['generation_passed']and gen['same_frontend_cpp_tokens_identical']and gen['generated_c_vcs']==46;assert hashlib.sha256((c/'impl/testRVV.c').read_bytes()).hexdigest()==gen['raw_c_sha256'];source=Path(gen['run_directory'])/'rvv_unit_goal.v';run=Path(tempfile.mkdtemp(prefix='rvv-calls-',dir=c/'.build'));coq=run/'coq';coq.mkdir();flags=json.loads((root/'.build/simple-kernels-bootstrap/coq-flags.json').read_text())['flags'][2:]+['-Q',str(coq),'Qs8Rsum'];env={**os.environ,'PATH':str(root/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']};sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();lock=threading.Lock();records=[];status={'passed':False,'whole_kernel_verified':False,'scope':'Complete actual RVV safety/callee fields, excluding loop/return memory fields','run_directory':str(run),'records':records,'input_sha256':{},'fields':[],'generation_status_sha256':sha(P/'rvv-generation-status.json'),'parallel_jobs':args.jobs,'per_process_memory_GiB':16}
def cc(n):
 log=run/(n+'.log');w=run/'jobs'/n;w.mkdir(parents=True);t=time.monotonic();cmd=['prlimit','--as=17179869184:17179869184','--','qcp-env','coqc','-time',*flags,str(coq/(n+'.v'))]
 with log.open('w')as f:
  try:r=subprocess.run(['prlimit','--as=17179869184:17179869184','--','qcp-env','coqc','-time',*flags,str(coq/(n+'.v'))],cwd=w,env=env,stdout=f,stderr=f,timeout=3600);code=r.returncode
  except subprocess.TimeoutExpired:code=124
 with lock:records.append({'module':n,'command':cmd,'exit_code':code,'seconds':time.monotonic()-t,'log_sha256':sha(log)});(run/'records.json').write_text(json.dumps(records,indent=2)+'\n')
 print(n,code,flush=True);return code
try:
 for n in ['Model','Types','MemoryModel','IntegerFacts','VectorModel','VectorFacts','VlModel','PrefixFacts','RvvProgramModel','FastFrame']:
  src=P/'coq'/(n+'.v');status['input_sha256'][str(src.relative_to(c))]=sha(src);shutil.copyfile(src,coq/src.name);assert cc(n)==0,n
 for n in ['ByteWindow']:
  src=P/'coq'/(n+'.v');status['input_sha256'][str(src.relative_to(c))]=sha(src);shutil.copyfile(src,coq/src.name);assert cc(n)==0,n
 memory=Path(json.loads((P/'byte-memory-status.json').read_text())['run_directory'])/'coq'
 for n in ['byte_arrays_strategy_goal','ByteStrategy','byte_arrays_strategy_proof','RvvBounds','RvvCallTactics']:
  src=memory/(n+'.v') if n.endswith('goal') else P/'coq'/(n+'.v');shutil.copyfile(src,coq/src.name);assert cc(n)==0,n
 shutil.copyfile(source,coq/'rvv_unit_goal.v');status['goal_sha256']=sha(source);assert cc('rvv_unit_goal')==0
 g=source.read_text();fields=[n for n in re.findall(r'^Axiom proof_of_(\w+) :',g,re.M)if '_entail_'not in n and '_return_'not in n];types=re.findall(r'^Definition (UndefStructPred\w+)',(coq/'Types.v').read_text(),re.M)
 common='From Coq Require Import ZArith Lia List.\nFrom Qs8Rsum Require Import RvvCallTactics rvv_unit_goal.\nImport Snaive_C_Rules64.\nLocal Open Scope Z_scope.\nLocal Open Scope sac.\n'

 def prove(n):
  name='RvvCall_'+n;aux=', Qs8Rsum.rvv_unit_goal.'+n+'_aux'if re.search(r'^Definition '+n+r'_aux\b',g,re.M)else''
  body=common+'Lemma proof_of_'+n+' : Qs8Rsum.rvv_unit_goal.'+n+'.\nProof. unfold Qs8Rsum.rvv_unit_goal.'+n+aux+';try left;intros;subst;unfold '+','.join(types)+';rewrite ?local_field_address;rewrite ?sizeof_char,?sizeof_short,?sizeof_int in *;repeat rewrite Z.quot_1_r in *;rs_limits;repeat progress rewrite <-logic_equiv_andp_assoc;rs_frame. Qed.\nPrint Assumptions proof_of_'+n+'.\n';(coq/(name+'.v')).write_text(body);code=cc(name)
  if code==0:shutil.copyfile(coq/(name+'.v'),P/'coq'/(name+'.v'))
  return {'field':n,'module':name,'exit_code':code}
 with ThreadPoolExecutor(max_workers=args.jobs)as pool:status['fields']=list(pool.map(prove,fields))
 status['passed']=all(r['exit_code']==0 for r in status['fields']);status['actual_c_vcs']=len(fields);status['passed_fields']=sum(r['exit_code']==0 for r in status['fields'])
except Exception as e:status['error']=str(e);print(str(e),flush=True)
status['proof_source_sha256']={p.name:sha(p)for p in coq.glob('*.v')}
for p in [run/'status.json',P/'rvv-calls-status.json']:p.write_text(json.dumps(status,indent=2)+'\n')
print(json.dumps({k:status.get(k)for k in ['passed','passed_fields','actual_c_vcs','run_directory','error']}),flush=True)
raise SystemExit(0 if status['passed']else 1)
