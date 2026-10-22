#!/usr/bin/env python3
"""Generate actual body VCs, compare reviewed goals, and compile all proofs."""
import hashlib,json,re,subprocess,sys
from datetime import datetime,timezone
from pathlib import Path
HERE=Path(__file__).resolve().parent
ROOT=HERE.parents[1]
SHARED=ROOT/'shared/vadd'
sys.path.insert(0, str(HERE.parents[1] / 'tools'))
from environment import load_environment
ENV = load_environment()
STRATEGY=ENV['strategy']
records=[]
def sha(path):return hashlib.sha256(path.read_bytes()).hexdigest()
def run(cmd,stem):
 result=subprocess.run([str(x) for x in cmd],cwd=ROOT.parents[1],text=True,capture_output=True,timeout=240)
 log=HERE/(stem+'.log');log.write_text(result.stdout+result.stderr)
 records.append({'command':[str(x) for x in cmd],'exit_code':result.returncode,'log':str(log.relative_to(ROOT)),'log_sha256':sha(log)})
 if result.returncode or 'fatal error:' in result.stderr:raise RuntimeError(stem+' failed; see '+str(log))
def same_goal(output,name):
 if (output/name).read_bytes()!=(SHARED/name).read_bytes():raise RuntimeError('Fresh goal differs from reviewed '+name)
try:
 run([sys.executable,HERE/'generate_intrinsics.py'],'generate')
 for source,out in [('intrinsics.c','generated'),('array_read.c','array-generated')]:
  dest=HERE/out;dest.mkdir(exist_ok=True)
  run([ENV['qcp'],'--arch=64','--endian=little','--no-float-finite-vc','--input-file='+str(SHARED/source),'--coq-output-dir='+str(dest),'--coq-logic-path=QcpVadd','-slp',SHARED,'QcpVadd','--no-exec-info'],'qcp-'+source)
  same_goal(dest,Path(source).stem+'_goal.v')
 dest=HERE/'strategy-generated';dest.mkdir(exist_ok=True)
 run([STRATEGY,'--arch=64','--endian=little','--input-file='+str(SHARED/'float_array.strategies'),'--coq-output-dir='+str(dest),'--coq-logic-path=QcpVadd','--no-exec-info'],'strategy-check')
 same_goal(dest,'float_array_strategy_goal.v')
 checked=['VaddBits.v','intrinsics_checked.v','float_array_strategy_proof.v','array_read_checked.v']
 for name in checked:
  code=re.sub(r'\(\*.*?\*\)','',(SHARED/name).read_text(),flags=re.S)
  if re.search(r'\b(?:Admitted|admit|Axiom|Parameter)\b',code):raise RuntimeError('Unproved declaration in '+name)
 run([sys.executable,HERE/'check.py'],'check-proofs')
 coq=json.loads((HERE/'coqc-result.json').read_text())
 expected=['VaddBits.v','intrinsics_goal.v','intrinsics_checked.v','float_array_strategy_goal.v','float_array_strategy_proof.v','array_read_goal.v','array_read_checked.v']
 if [Path(x['file']).name for x in coq]!=expected or any(x['exit_code'] for x in coq):raise RuntimeError('Missing proof compilation')
 run([sys.executable,HERE/'attempt_kernel.py'],'attempt-kernel')
 kernel=json.loads((HERE/'kernel-attempt/result.json').read_text())
 result={'passed':True,'timestamp_utc':datetime.now(timezone.utc).isoformat(),'commands':records,'coqc':coq,'body_functions':['f32_add','vld1q_f32','vaddq_f32','vst1q_f32','vst1_f32','vget_low_f32','vget_high_f32','vst1_lane_f32','qcp_vadd_block4','__riscv_vsetvl_e32m8','qcp_rvv_add_lane32','qcp_vadd_read','qcp_assert'],'intrinsic_and_block_vcs':len(re.findall(r'Axiom proof_of_', (SHARED/'intrinsics_goal.v').read_text())),'array_read_vcs':2,'array_strategy_proofs':2,'complete_intrinsics':['vld1q_f32','vaddq_f32','vst1q_f32','vst1_f32','vget_low_f32','vget_high_f32','vst1_lane_f32','__riscv_vsetvl_e32m8'],'checked_helpers':['f32_add','qcp_assert','qcp_rvv_add_lane32','qcp_vadd_read'],'checked_composition':['qcp_vadd_block4'],'rvv_coverage':{'complete':['__riscv_vsetvl_e32m8'],'lane_helper_only':['qcp_rvv_add_lane32'],'pending':['__riscv_vle32_v_f32m8','__riscv_vfadd_vv_f32m8','__riscv_vse32_v_f32m8']},'kernel_attempt':kernel,'input_domain':'All QCP fp32 values, including NaN, infinities and signed zeros; separation contracts require disjoint owned cells. RVV helper has 0<=i<32, 0<=vl<=32.','limits':['This is a C/shim proof development, not an ISA correspondence proof.','qcp_vadd_block4 uses explicit caller-owned scratch vectors; kernel local struct allocation predicates and loop invariants remain pending.','Full 32-lane RVV load/add/store and original kernel bodies are not proved.','Print Assumptions logs retain QCP layout parameters and standard Coq/Flocq classical-real/extensionality assumptions.','Generated automatic files with Admitted are not compiled or accepted.']}
except Exception as exc:
 result={'passed':False,'timestamp_utc':datetime.now(timezone.utc).isoformat(),'commands':records,'error':str(exc)}
result['files']={str(p.relative_to(ROOT)):sha(p) for p in sorted(SHARED.iterdir()) if p.suffix in ['.c','.h','.v','.strategies']}
(HERE/'status.json').write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:result[k] for k in ['passed','intrinsic_and_block_vcs','array_read_vcs','array_strategy_proofs','error'] if k in result},indent=2))
raise SystemExit(0 if result['passed'] else 1)
