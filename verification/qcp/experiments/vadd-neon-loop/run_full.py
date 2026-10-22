#!/usr/bin/env python3
"""Replay the reviewed full NEON VC implementation; shared parents must be built."""
import hashlib,json,re,subprocess,sys
from pathlib import Path
from provenance import verify
HERE=Path(__file__).resolve().parent
FILES=['NeonLoopBridge.v','neon_tail_strategy_goal.v','neon_tail_strategy_proof.v','InvariantFacts.v','lane0_goal.v','lane0_checked.v','LoopMemory.v','neon_init_lemmas.v','neon_tail_models.v','TailMemory.v','neon_loop_unit_goal.v','neon_simple_checked.v','neon_safety_extra_checked.v','neon_init_checked.v','neon_call_checked.v','neon_call_more_checked.v','neon_call_mid_checked.v','neon_call_struct_checked.v','neon_call_tail_checked.v','neon_call_reassign_checked.v','neon_branch_checked.v','neon_branch_more_checked.v','neon_branch_impossible_checked.v','neon_return_tail_checked.v','neon_return_zero_checked.v','neon_full_checked.v']
def sha(path):return hashlib.sha256(path.read_bytes()).hexdigest()
def contract(s):return re.search(r'void test_neon\(.*?(/\*@ With.*?\*/)',s,re.S).group(1)
def body(s,name):
 s=re.sub(r'/\*.*?\*/|//[^\n]*','',s,flags=re.S)
 start=s.index('{',s.index('void '+name+'('));level=0
 for end in range(start,len(s)):
  level+=(s[end]=='{')-(s[end]=='}')
  if level==0:return re.sub(r'\s+','',s[start:end+1])
def guards():
 manifest_path=HERE/'results-bound-inputs/generation.json'
 manifest=json.loads(manifest_path.read_text())
 assert manifest['exit_code']==0 and manifest['inputs_stable'],'Generation did not complete with stable inputs'
 verify(manifest)
 assert manifest['generated_goal_sha256']==sha(HERE/'proofs/neon_loop_unit_goal.v'),'Reviewed goal differs from bound generated goal'
 lowered=(HERE/'neon_loop_lengths.c').read_text()
 baseline=(HERE.parent/'vadd-proof/neon_kernel.c').read_text()
 intrinsics=(HERE.parents[1]/'shared/vadd/intrinsics.c').read_text()
 lane=(HERE/'lane0.c').read_text()
 assert contract(lowered)==contract(baseline),'Public kernel contract changed'
 assert contract(lowered)==contract((HERE.parent/'vadd-wrapper/wrapper.c').read_text()),'Wrapper declaration contract differs'
 assert body(lowered,'test_neon').replace('qcp_vst1_lane0_f32','vst1_lane_f32')==body(baseline,'test_neon'),'Lowered body changed beyond literal-lane routing'
 assert body(lane,'qcp_vst1_lane0_f32')==body(intrinsics,'vst1_lane_f32'),'Lane specialization body changed'
 for name in FILES:
  if name.endswith('_goal.v'):continue
  assert not re.search(r'\b(Admitted|admit|Abort|Axiom|Parameter)\b',(HERE/'proofs'/name).read_text()),name
 return {'generation_manifest_sha256':sha(manifest_path),'wrapper_contract_identical':True,'public_contract_identical':True,'lowered_body_preserved':True,'lane_body_identical':True,'goal_sha256':sha(HERE/'proofs/neon_loop_unit_goal.v'),'files':{name:sha(HERE/'proofs'/name) for name in FILES}}
if __name__=='__main__':
 evidence=guards()
 if '--guards-only' not in sys.argv:
  subprocess.run([sys.executable,str(HERE/'check.py'),*FILES],check=True)
  evidence['coqc_passed']=True
 else:evidence['coqc_passed']=None
 (HERE/'results-full').mkdir(exist_ok=True)
 output='guards.json' if '--guards-only' in sys.argv else 'replay.json'
 (HERE/'results-full'/output).write_text(json.dumps(evidence,indent=2)+'\n')
 print(json.dumps({k:v for k,v in evidence.items() if k!='files'}))
