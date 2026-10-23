from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
import os,json,re,subprocess,tempfile,time,hashlib,shutil,threading,argparse
pa=argparse.ArgumentParser();pa.add_argument("--jobs",type=int,default=16);args=pa.parse_args()
P=Path(__file__).resolve().parent;c=P.parent;root=next(p for p in c.parents if(p/'.git').exists());gen=json.loads((P/'neon-generation-status.json').read_text());assert gen['generation_passed'];source=Path(gen['run_directory'])/'neon_unit_goal.v';run=Path(tempfile.mkdtemp(prefix='neon-calls-',dir=c/'.build'));coq=run/'coq';coq.mkdir();flags=json.loads((root/'.build/simple-kernels-bootstrap/coq-flags.json').read_text())['flags'][2:]+['-Q',str(coq),'Qu8Rsum'];env={**os.environ,'PATH':str(root/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']};sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();lock=threading.Lock();records=[];status={'passed':False,'whole_kernel_verified':False,'scope':'Complete actual NEON safety/callee fields, excluding loop/return memory fields','run_directory':str(run),'records':records,'input_sha256':{},'fields':[]}
def cc(n):
 log=run/(n+'.log');w=run/'jobs'/n;w.mkdir(parents=True);t=time.monotonic()
 with log.open('w')as f:
  try:r=subprocess.run(['prlimit','--as=17179869184:17179869184','--','qcp-env','coqc','-time',*flags,str(coq/(n+'.v'))],cwd=w,env=env,stdout=f,stderr=f,timeout=3600);code=r.returncode
  except subprocess.TimeoutExpired:code=124
 with lock:records.append({'module':n,'exit_code':code,'seconds':time.monotonic()-t,'log_sha256':sha(log)});(run/'records.json').write_text(json.dumps(records,indent=2)+'\n')
 print(n,code,flush=True);return code
try:
 for n in ['Model','Types','MemoryModel','IntegerFacts','VectorModel','VectorFacts','VlModel','PrefixFacts','RvvProgramModel','FastFrame']:
  src=P/'coq'/(n+'.v');status['input_sha256'][str(src.relative_to(c))]=sha(src);shutil.copyfile(src,coq/src.name);assert cc(n)==0,n
 for n in ['ByteWindow']:
  src=P/'coq'/(n+'.v');status['input_sha256'][str(src.relative_to(c))]=sha(src);shutil.copyfile(src,coq/src.name);assert cc(n)==0,n
 memory=Path(json.loads((P/'byte-memory-status.json').read_text())['run_directory'])/'coq'
 for n in ['byte_arrays_strategy_goal','ByteStrategy','byte_arrays_strategy_proof','RvvBounds','ProgramFacts','RvvFacts','NeonProgramModel','NeonFacts','ByteFrame','NeonSupport','NeonBounds']:
  src=memory/(n+'.v') if n.endswith('goal') else P/'coq'/(n+'.v');shutil.copyfile(src,coq/src.name);assert cc(n)==0,n
 shutil.copyfile(source,coq/'neon_unit_goal.v');status['goal_sha256']=sha(source);assert cc('neon_unit_goal')==0
 g=source.read_text();fields=[n for n in re.findall(r'^Axiom proof_of_(\w+) :',g,re.M)if '_entail_'not in n and '_return_'not in n];types=re.findall(r'^Definition (UndefStructPred\w+)',(coq/'Types.v').read_text(),re.M)
 common='''From Coq Require Import ZArith Lia List.
From Qu8Rsum Require Import Types MemoryModel IntegerFacts VectorFacts VlModel RvvProgramModel NeonBounds NeonSupport FastFrame neon_unit_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac rs_limits :=
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int.max_unsigned with 4294967295 in *;
 try change Int64.max_unsigned with 18446744073709551615 in *.
Ltac rs_kernel_term_bound t :=
 lazymatch t with
 | rs_active_u32 ?a ?b ?i ?vl=>apply rs_active_u32_bound;[rs_kernel_term_bound a|rs_kernel_term_bound b]
 | rs_splat_u32 ?x ?i ?vl=>apply rs_splat_u32_bound;rs_kernel_term_bound x
 | rs_pair_u8 ?a ?x ?y=>pose proof(rs_pair_u8_bound a x y);lia
 | rs_mul_u8 ?a ?b=>pose proof(rs_mul_u8_bound a b);lia
 | rs_pair_u16 ?a ?x ?y=>apply rs_pair_u16_bound;lia
 | rs_add_u32 ?a ?b=>apply rs_add_u32_bound;[rs_kernel_term_bound a|rs_kernel_term_bound b]
 | _=>lia
 end.
Ltac rs_kernel_bound := first[assumption|reflexivity|lia|
 match goal with |-context[rs_active_u32 ?a ?b ?i ?vl]=>let t:=constr:(rs_active_u32 a b i vl)in let H:=fresh in assert(H:0<=t<=4294967295)by(rs_kernel_term_bound t);lia end|
 match goal with |-context[rs_splat_u32 ?a ?i ?vl]=>let t:=constr:(rs_splat_u32 a i vl)in let H:=fresh in assert(H:0<=t<=4294967295)by(rs_kernel_term_bound t);lia end].
Ltac rs_count_context :=
 repeat match goal with H:context[rs_rem2048 ?n]|-_=>
   progress (tryif match goal with H0:0<=rs_rem2048 n<2048|-_=>idtac end then idtac else pose proof(rs_rem2048_bound n)) end;
 repeat match goal with H:context[rs_count16 ?x]|-_=>
   progress (tryif match goal with H0:0<=rs_count16 x<=128|-_=>idtac end then idtac else let Hc:=fresh in assert(Hc:0<=rs_count16 x<=128)by(apply rs_count16_bound;lia)) end.
Ltac rs_simple_pure := rs_limits;rs_count_context; first[solve[entailer!;rs_kernel_bound]|solve[unfold store_uchar,store_uint,store_ushort;entailer!;rs_limits;try change Byte.max_unsigned with 255 in *;rs_kernel_bound]|solve[unfold rs_vl in *;repeat first[match goal with H:context[Z.ltb ?x ?y]|-_=>destruct(Z.ltb_spec x y) end|match goal with |-context[Z.ltb ?x ?y]=>destruct(Z.ltb_spec x y) end];entailer!;rs_kernel_bound]].
Ltac rs_all_pure q := lazymatch q with
 | coq_prop _=>idtac
 | andp ?a ?b=>rs_all_pure a;rs_all_pure b
 end.
Ltac rs_frame :=
 lazymatch goal with |-?P|--?Q=>
 tryif rs_all_pure Q then rs_simple_pure else
 lazymatch Q with
 | andp ?A ?B=>apply _derivable1_andp_intros;[rs_frame|rs_frame]
 | _=>first[solve[opaque_leaves;sepcon_assoc_change;fast_cancel]|solve[rs_simple_pure]]
 end end.
'''
 def prove(n):
  name='NeonCall_'+n;aux=', Qu8Rsum.neon_unit_goal.'+n+'_aux'if re.search(r'^Definition '+n+r'_aux\b',g,re.M)else''
  special=any(n=='test_neon_partial_solve_wit_'+str(i)+tail for i in [9,18,22,24]for tail in ['', '_pure'])
  tactic='rs_neon_simple'if special else 'intros;subst;unfold '+','.join(types)+';rewrite ?local_field_address;rs_limits;repeat progress rewrite <-logic_equiv_andp_assoc;rs_frame'
  body=common+'Lemma proof_of_'+n+' : Qu8Rsum.neon_unit_goal.'+n+'.\nProof. unfold Qu8Rsum.neon_unit_goal.'+n+aux+';try left;'+tactic+'. Qed.\nPrint Assumptions proof_of_'+n+'.\n';(coq/(name+'.v')).write_text(body);code=cc(name)
  if code==0:shutil.copyfile(coq/(name+'.v'),P/'coq'/(name+'.v'))
  return {'field':n,'module':name,'exit_code':code}
 with ThreadPoolExecutor(max_workers=args.jobs)as pool:status['fields']=list(pool.map(prove,fields))
 status['passed']=all(r['exit_code']==0 for r in status['fields']);status['actual_c_vcs']=len(fields);status['passed_fields']=sum(r['exit_code']==0 for r in status['fields'])
except Exception as e:status['error']=str(e);print(str(e),flush=True)
status['proof_source_sha256']={p.name:sha(p)for p in coq.glob('*.v')}
for p in [run/'status.json',P/'neon-calls-status.json']:p.write_text(json.dumps(status,indent=2)+'\n')
print(json.dumps({k:status.get(k)for k in ['passed','passed_fields','actual_c_vcs','run_directory','error']}),flush=True)
raise SystemExit(0 if status['passed']else 1)
