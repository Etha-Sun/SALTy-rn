#!/usr/bin/env python3
"""Generate current RVV C goals with exact operand ghosts and original C tokens.

All 16 lanes remain owned; active-result predicates preserve arbitrary tails.
The repaired program requests AVL4, while the original ISA legal-VL predicate
continues to describe every choice for every AVL.
"""
from pathlib import Path
import argparse,hashlib,json,os,re,subprocess,tempfile,time
import generate_neon as N
C=N.C;R=N.R;sha=N.sha;tokens=N.tokens
CONSTS={v:k for v,k in N.consts}
def permanent():
 return '*'.join('store(&'+v+',float,'+k+')'for v,k in N.consts)+'*store(&vi_max,float,em_get(F,M))*store(&vlmax,size_t,16)'
def common():return 'max==M&&sum==S&&params==params@pre&&em_valid(F,W,P,M,Q,S,N)&&sizeof(float)==4'
def state(g='G',a='A',vl=False):
 pure='0<='+g+'&&4*'+g+'<=N&&input==P+16*'+g+'&&output==Q+16*'+g+'&&'+common()+'&&em_rvv_acc_prefix(F,P,M,'+g+','+a+')'
 heap='em_data(F)*em_output(W,em_rvv_output_prefix(F,P,M,Q,4*'+g+',O))*'+permanent()+'*StructPredvfloat32m4_t(&vacc,'+a+')*store(&n,size_t,N-4*'+g+')'
 # Scalar vl is read in the cut's pure clause; QCP retains that cell automatically.
 return pure+'&&'+heap
PAT=re.compile(r'(?m)^(?P<indent>[ \t]*)(?:(?:const\s+)?(?:vfloat32m4_t|vint32m4_t|vbool8_t|float)\s+)?(?P<var>\w+)\s*=\s*(?P<fn>__riscv_\w+)\((?P<args>[^();]*)\)\s*;')
def render():
 raw=(C/'impl/testRVV.c').read_text();s=raw
 spec=(C/'spec.c').read_text();m=re.search(r'void test_rvv\([^;]+?(/\*@.*?\*/);',spec,re.S);assert m
 at=s.index('{',s.index('void test_rvv'));entry='batch==4*N&&input==P&&output==Q&&max==M&&sum==S&&params==params@pre&&0<N&&N<=4611686018427387903&&P!=0&&M!=0&&Q!=0&&S!=0&&sizeof(float)==4&&batch%sizeof(float)==0&&em_valid(F,W,P,M,Q,S,N)&&em_data(F)*em_output(W,O)'
 s=s[:at]+m[1]+'\n'+s[at:at+1]+'\n/*@ Assert '+entry+' */\n'+s[at+1:]
 anchor='  const float vi_max = *max;';assert s.count(anchor)==1
 s=s.replace(anchor,'/*@ em_data(F) which implies store(M,float,em_get(F,M))*em_data(em_pop(F,M)) */\n'+anchor+'\n/*@ store(M,float,em_get(F,M))*em_data(em_pop(F,M)) which implies em_data(F) */')
 anchor='  while (n >= 4) {';assert s.count(anchor)==1
 s=s.replace(anchor,'/*@ Inv Assert exists(G:Z)(A:Recordvfloat32m4_t),'+state()+' */\n'+anchor+'\n/*@ Given G A */')
 anchor='    const size_t vl = __riscv_vsetvl_e32m4(4);';assert s.count(anchor)==1
 s=s.replace(anchor,anchor+'\n/*@ Assert vl==4&&4*G+4<=N&&em_rvv_readable(F,P+16*G,4)&&em_rvv_writable(W,Q+16*G,4)&&'+state(vl=True)+' */')
 anchor='  /* Preserve the original NEON pairwise tree, then its 2+1 tail order. */';assert s.count(anchor)==1
 s=s.replace(anchor,'/*@ Assert exists(A:Recordvfloat32m4_t),0<=N%4&&N%4<4&&n==N%4&&'+state('(N/4)').replace('*store(&n,size_t,N-4*(N/4))','')+' */\n/*@ Given A */\n'+anchor)
 anchor='    const size_t vl = __riscv_vsetvl_e32m4(n);';assert s.count(anchor)==1
 s=s.replace(anchor,anchor+'\n/*@ emp which implies em_rvv_readable(F,P+16*(N/4),N%4)&&em_rvv_writable(W,Q+16*(N/4),N%4)&&emp */')
 # Each existential returned by a call is bound immediately.  Current QCP
 # struct-return transport does not preserve the optional named-call mark.
 env={};count=0;out=[];start=0;tail=s.index('  if (n != 0)');postloop=s.index('  /* Preserve the original');reset=False;metadata=[]
 for m in PAT.finditer(s):
  if m.start()>postloop and not reset:env['vacc']='A';reset=True
  fn,var=m['fn'],m['var'];args=[x.strip()for x in m['args'].split(',')];bind={};exist=True
  if fn=='__riscv_vfmv_v_f_f32m4':bind['X']=CONSTS.get(args[0],'fp32_zero'if args[0]=='0.0f'else args[0])
  elif fn=='__riscv_vle32_v_f32m4':bind['F']='F'
  elif fn in ['__riscv_vfsub_vf_f32m4','__riscv_vmflt_vf_f32m4_b8','__riscv_vfmerge_vfm_f32m4']:
   bind['A']=env.get(args[0],'A');bind['X']=CONSTS.get(args[1],'em_get(F,M)'if args[1]=='vi_max'else'fp32_zero'if args[1]=='0.0f'else args[1])
   if fn=='__riscv_vfmerge_vfm_f32m4':bind['M']=env[args[2]]
  elif fn in ['__riscv_vfmacc_vf_f32m4','__riscv_vfmadd_vf_f32m4']:
   bind={'A':env[args[0]],'B':env[args[2]],'X':CONSTS[args[1]]}
  elif fn in ['__riscv_vfmacc_vv_f32m4','__riscv_vfmul_vv_f32m4']:
   bind={chr(65+i):env[x]for i,x in enumerate(args[:-1])}
  elif fn=='__riscv_vslidedown_vx_f32m4':bind={'A':env.get(args[0],'A')}
  elif fn=='__riscv_vfmv_f_s_f32m4_f32':bind={'A':env.get(args[0],'A')};exist=False
  elif fn=='__riscv_vsll_vx_i32m4':bind={'A':env[args[0]]}
  elif fn=='__riscv_vreinterpret_v_f32m4_i32m4':
   bind={'A':env[args[0]]};exist=False
  elif fn=='__riscv_vreinterpret_v_i32m4_f32m4':
   bind={'A':env[args[0]]};exist=False
  elif fn=='__riscv_vfadd_vv_f32m4_tu':
   bind={'A':env.get(args[1],'A'),'B':env[args[2]]};exist=False
  else:raise AssertionError((fn,args))
  original=m.group(0).rstrip().removesuffix(';')+' /*@ where '+','.join(k+'='+v for k,v in bind.items())+' */;'
  if exist:
   count+=1;ghost='EMRV'+str(count);original+='\n/*@ Given '+ghost+' from R */';env[var]=ghost
  elif fn=='__riscv_vfmv_f_s_f32m4_f32':env[var]='em_get_vfloat32m4_t('+bind['A']+',0)'
  elif fn=='__riscv_vreinterpret_v_f32m4_i32m4':env[var]='em_rvv_reint_f_i('+bind['A']+')'
  elif fn=='__riscv_vreinterpret_v_i32m4_f32m4':env[var]='em_rvv_reint_i_f('+bind['A']+')'
  else:env[var]='em_rvv_add_tu('+bind['A']+','+bind['B']+','+args[-1]+')'
  # At the start of each C loop body its accumulator is the invariant A.
  if var=='vacc' and fn=='__riscv_vfmv_v_f_f32m4':env[var]='A'
  metadata.append(dict(variable=var,function=fn,where=bind,ghost=env[var],phase='tail'if m.start()>tail else'bulk'))
  out.extend([s[start:m.start()],original]);start=m.end()
 out.append(s[start:]);s=''.join(out)
 # The loop's accumulator is renamed by its invariant, not the previous
 # syntactic iteration's expression.  Explicit read-only loads retain F.
 stores=iter(x['ghost']for x in metadata if x['variable']=='vf'and x['function']=='__riscv_vfmerge_vfm_f32m4')
 s=re.sub(r'(__riscv_vse32_v_f32m4\(output, vf, vl\))\s*;',lambda m:m[1]+' /*@ where W=W,A='+next(stores)+' */;',s)
 # Exposing exactly the final sum cell preserves the single mutable owner;
 # its previous value may be None or overlap any earlier output position.
 anchor='  *sum = sum_value;';assert s.count(anchor)==1
 locals_heap='*'.join('store(&a'+str(i)+',float,X'+str(i)+')'for i in range(4))+'*'+'*'.join('StructPredvfloat32m4_t(&a'+str(i)+'_vector,B'+str(i)+')'for i in range(1,4))
 final='exists(A:Recordvfloat32m4_t)(B1:Recordvfloat32m4_t)(B2:Recordvfloat32m4_t)(B3:Recordvfloat32m4_t)(X0:fp32)(X1:fp32)(X2:fp32)(X3:fp32)(Y:fp32),'+common()+'&&em_same(Y,em_rvv_sum(N,em_input(F,P),em_get(F,M)))&&em_data(F)*undef_data_at(S,float)*em_output(em_removed(W,S),em_rvv_output_prefix(F,P,M,Q,N,O))*'+permanent()+'*StructPredvfloat32m4_t(&vacc,A)*store(&n,size_t,N%4)*store(&sum_value,float,Y)*'+locals_heap
 s=s.replace(anchor,'/*@ Assert '+final+' */\n'+anchor)
 assert tokens(s)==tokens(raw),'RVV annotation renderer changed current C tokens'
 return raw,s,metadata
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--prepare-only',action='store_true');ap.add_argument('--timeout',type=int,default=600);a=ap.parse_args();assert 0<a.timeout<=21600
 assert not json.loads((R/'.build/memory/quota/state.json').read_text())['wind_down_requested']
 run=Path(tempfile.mkdtemp(prefix='rvv-kernel-',dir=C/'.build'));gen=run/'generated';gen.mkdir();raw,body,meta=render();prefix='#include "'+str(C/'shim/rvv_program_model.h')+'"\n';(run/'rvv_unit.c').write_text(prefix+body);(run/'raw.c').write_text(prefix+raw)
 paths=[Path(__file__),C/'proof/generate_neon.py',C/'impl/testRVV.c',C/'spec.c',*sorted((C/'shim').glob('*.h')),*sorted((C/'proof/coq').glob('*.v'))];inputs={str(p.relative_to(C)):sha(p)for p in paths};records=[]
 s=dict(passed=False,whole_kernel_verified=False,scope='actual current repaired RVV C generation only',run_directory=str(run),input_sha256=inputs,records=records,configured_jobs=32,max_live_processes=1,per_process_memory_GiB=32,timeout_seconds=a.timeout,operand_bindings=meta)
 try:
  cmds=[('cpp',['gcc','-E','-P','-CC','-nostdinc',str(run/'rvv_unit.c'),'-o',str(run/'rvv_unit.i')]),('raw-cpp',['gcc','-E','-P','-CC','-nostdinc',str(run/'raw.c'),'-o',str(run/'raw.i')])]
  if not a.prepare_only:cmds.append(('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit=8192','--input-file='+str(run/'rvv_unit.i'),'--coq-output-dir='+str(gen),'--coq-logic-path=ExpMinusMax','-slp',str(C/'shim'),'ExpMinusMax']))
  for label,cmd in cmds:
   if label=='qcp':assert tokens((run/'rvv_unit.i').read_text())==tokens((run/'raw.i').read_text())
   cmd=['prlimit','--as=34359738368:34359738368','--',*cmd];log=run/(label+'.log');t=time.monotonic()
   try:
    with log.open('w')as f:ec=subprocess.run(cmd,cwd=run,env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']},stdout=f,stderr=f,timeout=a.timeout).returncode
   except subprocess.TimeoutExpired:ec=124
   records.append(dict(label=label,command=cmd,exit_code=ec,seconds=time.monotonic()-t,log_sha256=sha(log)));assert ec==0,log.read_text()[-4000:]
  assert inputs=={n:sha(C/n)for n in inputs},'generation input drift';assert tokens((run/'rvv_unit.i').read_text())==tokens((run/'raw.i').read_text())
  s.update(passed=True,prepare_only=a.prepare_only,CPP_sha256=sha(run/'rvv_unit.i'),current_C_CPP_tokens_identical=True)
  if not a.prepare_only:
   gp=gen/'rvv_unit_goal.v';s.update(goal_path=str(gp),goal_sha256=sha(gp),actual_C_fields=len(re.findall(r'^Axiom proof_of_',gp.read_text(),re.M)))
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');out=C/'proof/rvv-generation-status.json'
 if out.exists():(C/'proof/history'/('rvv-generation-'+sha(out)+'.json')).write_bytes(out.read_bytes())
 out.write_bytes((run/'status.json').read_bytes());print(json.dumps({k:s.get(k)for k in ['passed','run_directory','actual_C_fields','error']}),flush=True);return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
