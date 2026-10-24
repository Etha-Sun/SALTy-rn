import argparse,hashlib,json,os,re,shutil,subprocess,tempfile,time
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('--probe',action='store_true');args=p.parse_args()
case=Path(__file__).resolve().parent.parent;root=next(p for p in case.parents if(p/'.git').exists());ns=json.loads((case/'proof/originals.json').read_text())['namespace'];stem='scalar_probe'if args.probe else'scalar_primitives';source=case/'.build/scalar-wrap-probe.c'if args.probe else case/'shim/scalar_primitives.c';run=Path(tempfile.mkdtemp(prefix=stem+'-proof-',dir=case/'.build'));coq=run/'coq';coq.mkdir();flags=json.loads((root/'.build/simple-kernels-bootstrap/coq-flags.json').read_text())['flags'][2:]+['-Q',str(coq),ns];env={**os.environ,'PATH':str(root/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']};records=[]
sha=lambda p:hashlib.sha256(Path(p).read_bytes()).hexdigest()
def execute(command,label,timeout=3600):
 command=['prlimit','--as=17179869184:17179869184','--',*map(str,command)];work=run/label;work.mkdir();log=run/(label+'.log');start=time.monotonic()
 with log.open('w')as f:
  try:code=subprocess.run(command,cwd=work,env=env,stdout=f,stderr=f,timeout=timeout).returncode
  except subprocess.TimeoutExpired:code=124
 records.append({'label':label,'command':command,'exit_code':code,'seconds':time.monotonic()-start,'log_sha256':sha(log)});(run/'records.json').write_text(json.dumps(records,indent=2)+'\n');print(label,code,flush=True)
 if code:raise RuntimeError(log.read_text()[-5000:])
def cc(stem):execute(['qcp-env','coqc','-time',*flags,coq/(stem+'.v')],stem)
status={'passed':False,'whole_kernel_verified':False,'scope':'translator diagnostic only, not actual body admission'if args.probe else'Actual scalar wrapping/pairwise helper bodies only; not wholekernel','run_directory':str(run),'records':records}
try:
 shutil.copyfile(case/'proof/coq/Model.v',coq/'Model.v');cc('Model')
 execute(['gcc','-E','-P','-CC','-nostdinc',source,'-o',run/(stem+'.c')],'cpp')
 execute(['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(run/(stem+'.c')),'--coq-output-dir='+str(coq),'--coq-logic-path='+ns],'qcp')
 cc(stem+'_goal');goal=(coq/(stem+'_goal.v')).read_text();names=re.findall(r'^Axiom proof_of_(\w+) :',goal,re.M);assert names and len(names)==len(set(names))
 tactic='''From Coq Require Import ZArith Lia List.
From SimpleC.SL Require Import Mem SeparationLogic.
From NS Require Import Model STEM_goal.
Import Snaive_C_Rules64.
Local Open Scope Z_scope.
Local Open Scope sac.
Ltac scalar_bound :=
 try change Int.max_signed with 2147483647 in *;
 try change Int.min_signed with (-2147483648) in *;
 try change Int.max_unsigned with 4294967295 in *;
 try change Int64.max_signed with 9223372036854775807 in *;
 try change Int64.min_signed with (-9223372036854775808) in *;
 try change Int64.max_unsigned with 18446744073709551615 in *.
Ltac scalar_range :=
 repeat match goal with
 | |- context[signed_last_nbits ?x ?n] =>
   let H:=fresh "Hrange"in pose proof(signed_Lastnbits_range x n ltac:(lia))as H;
   change(-2^(n-1)<=signed_last_nbits x n<2^(n-1))in H;
   first[solve[entailer!;lia]|fail 1]
 | |- context[unsigned_last_nbits ?x ?n] =>
   let H:=fresh "Hrange"in pose proof(unsigned_Lastnbits_range x n ltac:(lia))as H;
   first[solve[entailer!;lia]|fail 1]
 end.
Ltac scalar_cases :=
 repeat match goal with
 | |- context[Z.gtb ?a ?b] => destruct(Z.gtb_spec a b)
 | |- context[Z.ltb ?a ?b] => destruct(Z.ltb_spec a b)
 end.
Ltac scalar_finish :=
 scalar_bound;
 unfold rs_s16,rs_u16,rs_s32,rs_u32,rs_pair_s8,rs_pair_u8,
 rs_pair_s16,rs_pair_u16,rs_add_s32,rs_add_u32 in *;
 scalar_cases;scalar_bound;
 try rewrite signed_unsigned_revolutive_less by lia;
 repeat first[progress rewrite signed_unsigned_add_l by lia|progress rewrite signed_unsigned_add_r by lia];
 try rewrite unsigned_last_nbits_eq by (cbn;lia);
 try rewrite signed_last_nbits_eq by (cbn;lia);
 first[solve[entailer!;lia]|solve[scalar_range]].
Module CheckedScalar : NS.STEM_goal.VC_Correct.
'''.replace('NS',ns).replace('STEM',stem)
 for name in names:
  aux=', '+ns+'.'+stem+'_goal.'+name+'_aux'if re.search(r'^Definition '+name+r'_aux\b',goal,re.M)else''
  tactic+=f'Lemma proof_of_{name} : {ns}.{stem}_goal.{name}.\nProof. unfold {ns}.{stem}_goal.{name}{aux};try left;intros;scalar_finish. Qed.\n'
 tactic+='End CheckedScalar.\n';(coq/'ScalarChecked.v').write_text(tactic);cc('ScalarChecked')
 (coq/'FinalScalarCheck.v').write_text(f'From {ns} Require Import {stem}_goal ScalarChecked.\nModule Checked : {ns}.{stem}_goal.VC_Correct := {ns}.ScalarChecked.CheckedScalar.\n'+''.join('Print Assumptions Checked.proof_of_'+name+'.\n'for name in names));cc('FinalScalarCheck');status.update(passed=True,vc_correct_passed=True,actual_c_vcs=len(names),goal_sha256=sha(coq/(stem+'_goal.v')))
 if not args.probe:shutil.copyfile(coq/'ScalarChecked.v',case/'proof/coq/ScalarChecked.v')
except Exception as error:status['error']=str(error);print(status['error'],flush=True)
status['input_sha256']={str(p.relative_to(case)):sha(p)for p in [source,case/'proof/coq/Model.v',case/'shim/formal_model.h']};status['proof_source_sha256']={p.name:sha(p)for p in coq.glob('*.v')};(run/'status.json').write_text(json.dumps(status,indent=2)+'\n')
if not args.probe:(case/'proof/scalar-status.json').write_text(json.dumps(status,indent=2)+'\n')
print(json.dumps({'passed':status['passed'],'run':str(run),'error':status.get('error')}),flush=True)
raise SystemExit(0 if status['passed'] else 1)
