#!/usr/bin/env python3
"""Replay checked NEON memory bridges; report the full-kernel gap separately."""
import hashlib,json,re,subprocess,sys
from pathlib import Path
HERE=Path(__file__).resolve().parent
QCP=HERE.parents[1]
ROOT=QCP.parents[1]
PROOFS=HERE/'proofs'
OUT=HERE/'results'
TOOL=Path('/zp_vegeta/scratch_sb/ycsun/verus/.local/qcp/QCP-V2.1.4/linux-binary/StrategyCheck')
records=[]
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def run(cmd,name,timeout=180):
 r=subprocess.run([str(x) for x in cmd],cwd=ROOT,capture_output=True,text=True,timeout=timeout)
 log=OUT/(name+'.log');log.write_text(r.stdout+r.stderr)
 records.append({'command':[str(x) for x in cmd],'exit_code':r.returncode,'log':str(log.relative_to(HERE)),'log_sha256':sha(log)})
 if r.returncode or 'fatal error:' in r.stderr:raise RuntimeError(name+' failed')
def reviewed(name):
 if (OUT/name).read_bytes()!=(PROOFS/name).read_bytes():raise RuntimeError('Goal changed: '+name)
try:
 OUT.mkdir(exist_ok=True)
 run([TOOL,'--arch=64','--endian=little','--input-file='+str(HERE/'neon_bridge.strategies'),'--coq-output-dir='+str(OUT),'--coq-logic-path=QcpNeon','--no-exec-info'],'strategy-generation')
 reviewed('neon_bridge_strategy_goal.v')
 run(['gcc','-E','-P','-CC','-nostdinc',HERE/'load_call.c','-o',OUT/'load_call_unit.c'],'preprocess-load-call')
 run(['qcp','--arch=64','--endian=little','--no-float-finite-vc','--input-file='+str(OUT/'load_call_unit.c'),'--coq-output-dir='+str(OUT),'--coq-logic-path=QcpNeon','-slp',HERE,'QcpNeon','--no-exec-info'],'qcp-load-call')
 reviewed('load_call_unit_goal.v')
 for name in ['NeonBridge.v','neon_bridge_strategy_proof.v','load_call_checked.v']:
  code=re.sub(r'\(\*.*?\*\)','',(PROOFS/name).read_text(),flags=re.S)
  if re.search(r'\b(?:Admitted|admit|Axiom|Parameter)\b',code):raise RuntimeError('Unproved declaration: '+name)
 run([sys.executable,HERE/'check.py','NeonBridge.v','neon_bridge_strategy_goal.v','neon_bridge_strategy_proof.v','load_call_unit_goal.v','load_call_checked.v'],'coqc-all')
 run([sys.executable,HERE/'attempt.py'],'full-kernel-attempt')
 result={'bridge_checks_passed':True,'full_kernel_proof':False,'checked_generic_lemmas':4,'checked_strategy_lemmas':4,'checked_body_vcs':6,'checked_bodies':['load_call','load_local','store_call'],'input_domain':'Full QCP fp32, with separation ownership, arbitrary legal array n >= 4; no finite-only restriction.','kernel_attempt':json.loads((OUT/'kernel-result.json').read_text()),'limits':['Only added proof annotations and memory strategies; original kernel/spec/mapper are unchanged.','Full loop invariant preservation, input-prefix/suffix joining, output-prefix values, and tail composition remain pending.','The two arithmetic cut facts are independently proved; the complete generated kernel VC set is not yet available.','Print Assumptions logs include standard QCP layout/address interpretation and Coq/Flocq assumptions, including csimpl address congruence assumptions.']}
except Exception as exc:
 result={'bridge_checks_passed':False,'full_kernel_proof':False,'error':str(exc)}
result['commands']=records
result['files']={str(p.relative_to(HERE)):sha(p) for p in sorted(HERE.rglob('*')) if p.is_file() and p.suffix in ['.py','.c','.h','.v','.strategies'] and 'results' not in p.parts and not p.name.startswith('debug')}
(HERE/'status.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:result[k] for k in ['bridge_checks_passed','full_kernel_proof','checked_generic_lemmas','checked_strategy_lemmas','checked_body_vcs','error'] if k in result},indent=2))
raise SystemExit(0 if result['bridge_checks_passed'] else 1)
