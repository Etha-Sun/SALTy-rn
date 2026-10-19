from pathlib import Path
import json,subprocess,os,signal,time,hashlib
R=Path(__file__).resolve().parents[3];H=Path(__file__).resolve().parent;C=H/'qd8-f32-qc4w-gemm-minmax-r3';A=C/'.build/diagnostic02/annotated';L=C/'logs';L.mkdir(exist_ok=True)
fcts='bits_i8,__riscv_vle8_v_i8m2,__riscv_vsll_vx_i8m2,__riscv_vand_vx_i8m2,__riscv_vsext_vf2_i16m4'
cmd=[str(R/'experiments/shim-c-v2/handoff-model-plus/frama-c.py'),'-machdep','gcc_x86_64','-wp','-wp-rte','-wp-model','Typed+raw+float','-warn-special-float','none','-wp-share',str(R/'experiments/shim-c-v2/handoff-model-plus/wp-share'),'-wp-why3-config',str(R/'experiments/shim-c-v2/handoff-model-front/why3.conf'),'-wp-no-why3-detect','-wp-prover','tip,z3,cvc5','-wp-par','1','-wp-timeout','10','-wp-memlimit','1024','-wp-cache','none','-wp-fct',fcts,'-wp-driver',str(A/'complex_fp.driver'),'-wp-session',str(C/'.build/components02-session'),'-wp-report-json',str(L/'components02.json'),str(A/'unit.c')]
record={'command':cmd,'scope':'Complete selected helper bodies and RTE only; not full kernel. No implementations skipped within these selected bodies.','proof_sha256':hashlib.sha256((C/'proof.patch').read_bytes()).hexdigest(),'budget_seconds':180};(L/'components02-command.json').write_text(json.dumps(record,indent=2)+'\n');start=time.monotonic()
with (L/'components02.log').open('x') as f:
 p=subprocess.Popen(cmd,cwd=A,stdout=f,stderr=subprocess.STDOUT,start_new_session=True)
 try:code=p.wait(timeout=180)
 except subprocess.TimeoutExpired:
  os.killpg(p.pid,signal.SIGTERM)
  try:p.wait(timeout=5)
  except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait()
  code=124
record.update(exit=code,seconds=time.monotonic()-start,complete=False)
raw=L/'components02.json'
if raw.exists():
 goals=json.loads(raw.read_text());record.update(raw_total=len(goals),raw_passed=sum(g['passed'] for g in goals),pending=[g for g in goals if not g['passed']])
else:record.update(raw_total=None,raw_passed=None,pending=None)
(L/'components02-execution.json').write_text(json.dumps(record,indent=2)+'\n');print(code,record['raw_passed'],record['raw_total'],flush=True)
