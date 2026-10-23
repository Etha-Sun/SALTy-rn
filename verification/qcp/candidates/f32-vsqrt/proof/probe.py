"""Reproduce sqrt primitive gap; generated VCs are conditional, not proofs."""
from pathlib import Path
import hashlib,json,subprocess,time
HERE=Path(__file__).resolve().parent
records=[]
for source in sorted((HERE/'probes').glob('*.c')):
 output=HERE/'goals'/source.stem;output.mkdir(parents=True,exist_ok=True)
 command=['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(source),'--coq-output-dir='+str(output),'--coq-logic-path=SqrtProbe']
 started=time.monotonic();r=subprocess.run(command,capture_output=True,text=True,timeout=30)
 log=HERE/(source.stem+'-qcp.log');log.write_text(r.stdout+r.stderr)
 records.append({'source':str(source.relative_to(HERE)),'source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'command':command,'exit_code':r.returncode,'seconds':time.monotonic()-started,'log_sha256':hashlib.sha256(log.read_bytes()).hexdigest()})
status={'full_kernel_checked':False,'checked_c_vcs':0,'primitive_builtin_available':False,'unproved_callee':'sqrtf','records':records,'limits':['vector_sqrt goals assume an external sqrtf contract; there is no sqrtf C implementation proof.','The named-field vector representation is a prototype; no adapter or original kernel loop theorem is claimed.']}
(HERE/'probe-status.json').write_text(json.dumps(status,indent=2)+'\n')
for record in records:print(record['source'],record['exit_code'])
