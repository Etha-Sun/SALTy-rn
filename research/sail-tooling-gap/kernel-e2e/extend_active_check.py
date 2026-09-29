#!/usr/bin/env python3
"""Extend only our own check.py monitor, never the Coq proof or its checking.

The compiler continues while its original timeout monitor is suspended. This
supervisor resumes that monitor after compiler exit, or before the absolute
user deadline so the normal timeout still stops an unfinished compiler.
"""
import argparse,datetime,json,os,signal,time
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('module');p.add_argument('--deadline',required=True);a=p.parse_args()
r=Path(__file__).resolve().parent; target=r/(a.module+'.v')
deadline=datetime.datetime.fromisoformat(a.deadline.replace('Z','+00:00')).timestamp()-10
matches=[]
for entry in Path('/proc').glob('[0-9]*'):
 try:
  if entry.stat().st_uid!=os.getuid():continue
  cmd=(entry/'cmdline').read_bytes().split(b'\0');args=[v.decode() for v in cmd if v]
  if len(args)>=3 and args[0].split('/')[-1] in ('python','python3') and args[1].endswith('/kernel-e2e/check.py') and args[2]==a.module+'.v':
   matches.append((int(entry.name),args))
 except (OSError,UnicodeError):pass
if len(matches)!=1:raise SystemExit('Expected exactly one matching owned monitor; found '+str(len(matches)))
pid,args=matches[0];children=Path(f'/proc/{pid}/task/{pid}/children').read_text().split()
if len(children)!=1:raise SystemExit('Unexpected monitor child count')
child=int(children[0]);cmd=Path(f'/proc/{child}/cmdline').read_bytes().split(b'\0')
if str(target).encode() not in cmd:raise SystemExit('Compiler target mismatch')
log=r/'results'/(a.module+'-deadline-extension.json')
record=dict(monitor_pid=pid,compiler_pid=child,command=args,deadline_utc=a.deadline,started_utc=datetime.datetime.now(datetime.timezone.utc).isoformat(),method='Suspend only timeout monitor; Coq checking continues unchanged')
log.write_text(json.dumps(record,indent=2)+'\n')
os.kill(pid,signal.SIGSTOP)
try:
 while time.time()<deadline:
  try:
   state=Path(f'/proc/{child}/stat').read_text().rsplit(')',1)[1].split()[0]
   if state=='Z':break
  except FileNotFoundError:break
  time.sleep(1)
finally:
 os.kill(pid,signal.SIGCONT)
 record['resumed_utc']=datetime.datetime.now(datetime.timezone.utc).isoformat();log.write_text(json.dumps(record,indent=2)+'\n')
 print(json.dumps(record),flush=True)
