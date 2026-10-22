#!/usr/bin/env python3
"""Reproduce QCP struct lifetime behavior; this does not check generated proofs."""
from pathlib import Path
import hashlib,json,shutil,subprocess,time
HERE=Path(__file__).resolve().parent

def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()

records=[]
for name in ['drop','keep']:
    source=HERE/(name+'.c')
    output=HERE/'.build'/name
    output.mkdir(parents=True,exist_ok=True)
    command=['qcp','--arch=64','--endian=little','--no-float-finite-vc',
             '--input-file='+str(source),'--coq-output-dir='+str(output),
             '--coq-logic-path=QcpStructRepro','-slp',str(HERE.parents[2]/'shared/vadd'),'QcpVadd']
    started=time.monotonic()
    try:
        result=subprocess.run(command,capture_output=True,timeout=30)
        code,log=result.returncode,result.stdout+result.stderr
    except subprocess.TimeoutExpired as error:
        code,log='timeout',(error.stdout or b'')+(error.stderr or b'')
    logfile=HERE/(name+'.log')
    logfile.write_bytes(log)
    records.append({'name':name,'command':command,'exit_code':code,
                    'elapsed_seconds':time.monotonic()-started,
                    'source_sha256':sha(source),'log_sha256':sha(logfile)})
    print(name,code,flush=True)
qcp=Path(shutil.which('qcp')).resolve()
status={'scope':'QCP generation compatibility only; generated VCs unproved',
        'full_kernel_proved':False,'qcp_binary':str(qcp),'qcp_sha256':sha(qcp),
        'expected_pair_observed':[r['exit_code'] for r in records]==[-11,0],
        'records':records}
(HERE/'status.json').write_text(json.dumps(status,indent=2)+'\n')
if not status['expected_pair_observed']:
    raise SystemExit('Observed behavior differs from the recorded reproduction')
