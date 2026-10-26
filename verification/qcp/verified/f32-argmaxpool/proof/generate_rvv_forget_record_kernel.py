#!/usr/bin/env python3
"""Forget dead iteration-local vector values, preserving every field owner.

All C tokens, the public contract, and live vector values are unchanged.
Each selective `which implies` is a real generated Coq obligation. Liveness
is checked within the declaration's lexical scope, inside the channel loop.
"""
from pathlib import Path
import argparse,json,os,re,subprocess,tempfile,time
import generate_rvv_record_borrowed_kernel as N
import generate_kernels as G
C=N.C;R=N.R;sha=N.sha
TOKEN=re.compile(r'[A-Za-z_]\w*|(?:\d+(?:\.\d*)?)|>>=|<<=|==|!=|<=|>=|\+\+|--|&&|\|\||->|\+=|-=|\S')
def masked(t):
 return re.sub(r'/\*.*?\*/|//[^\n]*',lambda m:''.join('\n'if c=='\n'else' 'for c in m[0]),t,flags=re.S)
def render():
 raw,t=N.render();code=masked(raw);annotated=masked(t)
 source_tokens=list(TOKEN.finditer(code));target_tokens=list(TOKEN.finditer(annotated));assert [m[0]for m in source_tokens]==[m[0]for m in target_tokens]==G.tokens(raw)
 scopes=[];stack=[]
 for i,c in enumerate(code):
  if c=='{':stack.append(i)
  elif c=='}':scopes.append((stack.pop(),i))
 assert not stack
 channel=code.index('while (c > 0)');channel_open=code.index('{',channel);channel_close=next(b for a,b in scopes if a==channel_open)
 cuts=[];metadata=[]
 for decl in re.finditer(r'(?m)^[ \t]*(?:const\s+)?(vfloat32m8_t|vbool4_t)\s+(\w+)\s*(?:=|;)',code):
  ty,var=decl.groups();scope=min(((a,b)for a,b in scopes if a<decl.start()<b),key=lambda x:x[1]-x[0]);assert channel_open<=scope[0]<scope[1]<=channel_close
  uses=list(re.finditer(r'\b'+re.escape(var)+r'\b',code[decl.start():scope[1]]));assert len(uses)>1
  last=decl.start()+uses[-1].start();semi=code.index(';',last);assert semi<scope[1]and'}'not in code[last:semi]
  after=sum(m.end()<=semi+1 for m in source_tokens);assert source_tokens[after-1][0]==';';at=target_tokens[after-1].end()
  ct='float'if ty=='vfloat32m8_t'else'unsigned int'
  pre=' * '.join('store(&('+var+'.s'+str(j)+'),'+ct+','+var+'.s'+str(j)+')'for j in range(32))
  comment='\n/*@ '+pre+' which implies UndefStructPred'+ty+'(&'+var+') */\n'
  cuts.append((at,comment));metadata.append(dict(variable=var,C_type=ty,cell_type=ct,permission_cells_retained=32,declaration_source_offset=decl.start(),scope_source_offsets=scope,last_original_identifier_offset=last,insertion_after_original_semicolon=semi,no_later_original_read_in_scope=True))
 assert len(cuts)==19,len(cuts)
 for at,comment in sorted(cuts,reverse=True):t=t[:at]+comment+t[at:]
 assert G.tokens(raw)==G.tokens(t),'C tokens changed during forgetting'
 return raw,t,metadata
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--timeout',type=int,default=600);ap.add_argument('--prepare-only',action='store_true');ap.add_argument('--strategy-limit',type=int,default=8192);a=ap.parse_args();assert 0<a.timeout<=21600 and 64<=a.strategy_limit<=8192
 assert not json.loads((R/'.build/memory/quota/state.json').read_text())['wind_down_requested']
 s0=json.loads((C/'proof/record-forgetting-status.json').read_text());assert s0['passed']
 for n,h in s0['source_sha256'].items():assert sha(C/'proof/coq'/(n+'.v'))==h,n
 assert json.loads((C/'proof/rvv-record-consumers-status.json').read_text())['passed']
 run=Path(tempfile.mkdtemp(prefix='rvv-forget-record-',dir=C/'.build'));gen=run/'generated';gen.mkdir();records=[]
 paths=[Path(__file__),Path(N.__file__),C/'proof/generate_compact_borrowed_kernels.py',C/'proof/generate_borrowed_kernels.py',C/'proof/generate_kernels.py',C/'impl/testRVV.c',C/'spec.c',C/'proof/coq/RecordForgetting.v',C/'proof/coq/RvvVectorRecords.v',*sorted((C/'shim').glob('*.h'))]
 inputs={str(p.relative_to(C)):sha(p)for p in paths};s=dict(passed=False,whole_kernel_verified=False,scope='actual_C_kernel_comment_only_dead_value_forgetting_generation_diagnostic',run_directory=str(run),records=records,input_sha256=inputs,configured_jobs=32,max_live_processes=1,per_process_memory_GiB=32,timeout_seconds=a.timeout,tokens_changed=False,strategy_application_limit=a.strategy_limit)
 env={**os.environ,'PATH':str(R/'.build/simple-kernels-bootstrap/bin')+':/tmp/qcp-coq820-install/bin:'+os.environ['PATH']}
 try:
  raw,t,metadata=render();s['dead_vector_liveness']=metadata;(run/'rvv_unit.c').write_text(N.prefix()+t);(run/'raw.c').write_text(N.prefix()+raw)
  for label,cmd in [('cpp',['gcc','-E','-P','-CC','-nostdinc',str(run/'rvv_unit.c'),'-o',str(run/'rvv_unit.i')]),('raw-cpp',['gcc','-E','-P','-CC','-nostdinc',str(run/'raw.c'),'-o',str(run/'raw.i')])]+([]if a.prepare_only else[('qcp',['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--strategy-application-limit='+str(a.strategy_limit),'--input-file='+str(run/'rvv_unit.i'),'--coq-output-dir='+str(gen),'--coq-logic-path=ArgmaxPool','-slp',str(C/'shim'),'ArgmaxPool'])]):
   if label=='qcp':assert G.tokens((run/'rvv_unit.i').read_text())==G.tokens((run/'raw.i').read_text())
   cmd=['prlimit','--as=34359738368:34359738368','--']+cmd;log=run/(label+'.log');start=time.monotonic()
   try:
    with log.open('w')as f:ec=subprocess.run(cmd,cwd=run,env=env,stdout=f,stderr=f,timeout=a.timeout).returncode
   except subprocess.TimeoutExpired:ec=124
   records.append(dict(label=label,command=cmd,exit_code=ec,seconds=time.monotonic()-start,log_sha256=sha(log)));(run/'status.json').write_text(json.dumps(s,indent=2)+'\n');assert ec==0,log.read_text()[-2000:]
  assert inputs=={n:sha(C/n)for n in inputs};s.update(passed=True,original_same_frontend_CPP_tokens_identical=True,prepare_only=a.prepare_only)
  if not a.prepare_only:
   goal=gen/'rvv_unit_goal.v';wrapper=run/'rvv_unit_def.v';wrapper.write_text('From ArgmaxPool Require Export RvvVectorRecords.\n')
   s.update(goal_path=str(goal),goal_sha256=sha(goal),actual_C_fields=len(re.findall(r'^Axiom proof_of_',goal.read_text(),re.M)),raw_emitted_definition_rejected=True,definition_export_path=str(wrapper),definition_export_sha256=sha(wrapper))
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');print(json.dumps({k:s.get(k)for k in ['passed','run_directory','actual_C_fields','error']}),flush=True);return 0 if s['passed']else 1
if __name__=='__main__':raise SystemExit(main())
