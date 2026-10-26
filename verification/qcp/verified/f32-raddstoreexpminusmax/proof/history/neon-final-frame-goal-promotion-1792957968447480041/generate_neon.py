#!/usr/bin/env python3
"""Render current compatibility C with proof annotations into private .build.
The input body comes directly from current impl; proof/c contains no copied C.
No C token changes are allowed during annotation construction.
"""
from pathlib import Path
import argparse,hashlib,json,re,os,subprocess,tempfile,time
C=Path(__file__).resolve().parents[1];R=C.parents[3]
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
EXTRA_INPUTS=[]
consts=[('vlog2e','em_log2e'),('vmagic_bias','em_magic_bias'),('vc5','em_c5'),('vc4','em_c4'),('vc3','em_c3'),('vc2','em_c2'),('vc1','em_c1'),('vdenorm_cutoff','em_denorm_cutoff'),('vminus_ln2','em_minus_ln2')]
def tokens(s):return re.findall(r'\w+|(?:==|!=|<=|>=|\+=|-=|&&|\|\|)|[^\s]',re.sub(r'/\*.*?\*/|//[^\n]*','',s,flags=re.S))
def contract():
 s=(C/'spec.c').read_text();m=re.search(r'void test_neon\([^;]+?(/\*@.*?\*/);',s,re.S);assert m;return m[1]
def permanent():
 return '*'.join('StructPredfloat32x4_t(&'+v+',em_neon_dup('+k+'))'for v,k in consts)+'*StructPredfloat32x4_t(&vi_max,em_neon_dup(em_get(F,M)))'
def prefix():return '#include "'+str(C/'shim/program_model.h')+'"\n'
def base_pure():return 'max==M&&sum==S&&params==params@pre&&em_valid(F,W,P,M,Q,S,N)&&sizeof(float)==4'
def render():
 raw=(C/'impl/testNEON.c').read_text();s=raw;at=s.index('{',s.index('void test_neon'))
 entry='batch==4*N&&input==P&&output==Q&&max==M&&sum==S&&params==params@pre&&0<N&&N<=4611686018427387903&&P!=0&&M!=0&&Q!=0&&S!=0&&sizeof(float)==4&&batch%sizeof(float)==0&&em_valid(F,W,P,M,Q,S,N)&&em_data(F)*em_output(W,O)'
 s=s[:at]+contract()+'\n'+s[at:at+1]+'\n/*@ Assert '+entry+' */\n'+s[at+1:]
 # Scalar float ghosts use exact equality; no IEEE NaN-self-comparison.
 for v,k in consts:
  pat=r'('+re.escape(v)+r'\s*=\s*vmovq_n_f32\([^;]*?\))\s*;';s,n=re.subn(pat,r'\1 /*@ where X='+k+' */;',s);assert n==1,(v,n)
 s,n=re.subn(r'(vacc\s*=\s*vmovq_n_f32\(0\.0f\))\s*;',r'\1 /*@ where X=fp32_zero */;',s);assert n==1
 s=re.sub(r'(vld1q(?:_dup)?_f32\([^)]*\))',r'\1 /*@ where F=F */',s)
 for name in ['vst1q_f32','vst1_f32','vst1_lane_f32']:
  s=re.sub(r'('+name+r'\([^;]*?\))\s*;',r'\1 /*@ where W=W,O=em_arm_output_prefix(F,P,M,Q,(output-Q)/4,O) */;',s)
 pp=permanent();common=base_pure()
 invariant='exists (G:Z)(A:Recordfloat32x4_t),0<=G&&4*G<=N&&batch==4*(N-4*G)&&input==P+16*G&&output==Q+16*G&&'+common+'&&em_same_record4(A,em_arm_acc_record(F,P,M,G))&&em_data(F)*em_output(W,em_arm_output_prefix(F,P,M,Q,4*G,O))*'+pp+'*StructPredfloat32x4_t(&vacc,A)'
 anchor='  for (; batch >= 4 * sizeof(float); batch -= 4 * sizeof(float)) {';assert s.count(anchor)==1;s=s.replace(anchor,'  /*@ Inv Assert '+invariant+' */\n'+anchor)
 # After the counted loop G=N/4 follows from its C exit condition.
 anchor='#if XNN_ARCH_ARM64\n  float vacc_lo';assert s.count(anchor)==1
 cut='exists (A:Recordfloat32x4_t),0<=N%4&&N%4<4&&(batch==0||1*sizeof(float)<=batch)&&batch<=3*sizeof(float)&&batch==4*(N%4)&&input==P+16*(N/4)&&output==Q+16*(N/4)&&'+common+'&&em_same_record4(A,em_arm_acc_record(F,P,M,N/4))&&em_data(F)*em_output(W,em_arm_output_prefix(F,P,M,Q,4*(N/4),O))*'+pp+'*StructPredfloat32x4_t(&vacc,A)'
 s=s.replace(anchor,'/*@ Assert '+cut+' */\n'+anchor)
 # Keep every still-live local record and the accumulator scalar; only the
 # old sum cell value is forgotten before its real final C write.
 anchor='  *sum = vacc_lo;';assert s.count(anchor)==1
 final='exists (A:Recordfloat32x4_t)(Y:fp32),max==M&&sum==S&&params==params@pre&&em_valid(F,W,P,M,Q,S,N)&&em_same(Y,em_arm_sum(N,em_input(F,P),em_get(F,M)))&&em_data(F)*undef_data_at(S,float)*em_output(em_removed(W,S),em_arm_output_prefix(F,P,M,Q,N,O))*'+pp+'*StructPredfloat32x4_t(&vacc,A)*store(&vacc_lo,float,Y)'
 s=s.replace(anchor,'/*@ Assert '+final+' */\n'+anchor)
 assert tokens(s)==tokens(raw),'annotation renderer changed C tokens'
 return raw,s

def main():
 ap=argparse.ArgumentParser();ap.add_argument('--prepare-only',action='store_true');ap.add_argument('--memory-gib',type=int,choices=[16,32],default=32);ap.add_argument('--timeout',type=int,default=21600);a=ap.parse_args();assert 0<a.timeout<=21600
 assert not json.loads((R/'.build/memory/quota/state.json').read_text())['wind_down_requested']
 run=Path(tempfile.mkdtemp(prefix='neon-kernel-',dir=C/'.build'));gen=run/'generated';gen.mkdir();source=run/'neon_unit.c';orig=run/'raw.c';raw,s=render();source.write_text(prefix()+s);orig.write_text(prefix()+raw)
 paths=[Path(__file__),*EXTRA_INPUTS,C/'impl/testNEON.c',C/'spec.c',*sorted((C/'shim').glob('*.h')),*sorted((C/'proof/coq').glob('*.v'))];inputs={str(p.relative_to(C)):sha(p)for p in paths};recs=[];st=dict(passed=False,whole_kernel_verified=False,scope='actual current compatibility C kernel goal generation; not a proof',run_directory=str(run),input_sha256=inputs,records=recs,configured_jobs=32,max_live_processes=1,per_process_memory_GiB=a.memory_gib,timeout_seconds=a.timeout)
 env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
 try:
  cmds=[('cpp',['gcc','-E','-P','-CC','-nostdinc',str(source),'-o',str(run/'neon_unit.i')]),('raw-cpp',['gcc','-E','-P','-CC','-nostdinc',str(orig),'-o',str(run/'raw.i')])]
  if not a.prepare_only:cmds.append(('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit=8192','--input-file='+str(run/'neon_unit.i'),'--coq-output-dir='+str(gen),'--coq-logic-path=ExpMinusMax','-slp',str(C/'shim'),'ExpMinusMax']))
  for label,cmd in cmds:
   if label=='qcp':assert tokens((run/'neon_unit.i').read_text())==tokens((run/'raw.i').read_text())
   cmd=['prlimit','--as='+str(a.memory_gib*1024**3)+':'+str(a.memory_gib*1024**3),'--']+cmd;log=run/(label+'.log');t=time.monotonic()
   try:
    with log.open('w')as f:ec=subprocess.run(cmd,cwd=run,env=env,stdout=f,stderr=f,timeout=a.timeout).returncode
   except subprocess.TimeoutExpired:ec=124
   recs.append(dict(label=label,command=cmd,exit_code=ec,seconds=time.monotonic()-t,log_sha256=sha(log)));(run/'status.json').write_text(json.dumps(st,indent=2)+'\n');assert ec==0,log.read_text()[-4000:]
  assert inputs=={n:sha(C/n)for n in inputs};assert tokens((run/'neon_unit.i').read_text())==tokens((run/'raw.i').read_text());st.update(passed=True,prepare_only=a.prepare_only,original_compatibility_CPP_tokens_identical=True,CPP_sha256=sha(run/'neon_unit.i'))
  if not a.prepare_only:
   gp=gen/'neon_unit_goal.v';st.update(goal_path=str(gp),goal_sha256=sha(gp),actual_C_fields=len(re.findall(r'^Axiom proof_of_',gp.read_text(),re.M)))
 except Exception as e:st['error']=str(e)
 (run/'status.json').write_text(json.dumps(st,indent=2)+'\n');out=C/'proof/neon-generation-status.json'
 if out.exists():
  history=C/'proof/history';history.mkdir(exist_ok=True);(history/('neon-generation-'+sha(out)+'.json')).write_bytes(out.read_bytes())
 out.write_bytes((run/'status.json').read_bytes());print(json.dumps({k:st.get(k)for k in ['passed','run_directory','actual_C_fields','error']}),flush=True);return 0 if st['passed']else 1
if __name__=='__main__':raise SystemExit(main())
