#!/usr/bin/env python3
"""Feed a delayed Coq Load and preserve exactly the supplied source for replay.

The queue contains ordinary Coq text, followed by a #END control line.
The FIFO is replaced with that text after EOF; this changes no proof rule.
"""
import argparse,errno,os,time
from pathlib import Path
p=argparse.ArgumentParser();p.add_argument('source',type=Path);p.add_argument('queue',type=Path);p.add_argument('--timeout',type=int,default=4500);a=p.parse_args()
deadline=time.monotonic()+a.timeout
if not a.source.exists():os.mkfifo(a.source)
a.queue.touch(exist_ok=True)
while True:
 try:
  fd=os.open(a.source,os.O_WRONLY|os.O_NONBLOCK);break
 except OSError as e:
  if e.errno!=errno.ENXIO:raise
  if time.monotonic()>=deadline:raise SystemExit('No Coq reader before deadline')
  time.sleep(.5)
os.set_blocking(fd,True)
print('COQ_PROOF_INPUT_CONNECTED',flush=True)
transcript=[];complete=False
try:
 with os.fdopen(fd,'w') as out,a.queue.open() as incoming:
  while time.monotonic()<deadline:
   line=incoming.readline()
   if not line:time.sleep(.5);continue
   if line.strip()=='#END':complete=True;break
   transcript.append(line);out.write(line);out.flush()
finally:
 tmp=a.source.with_suffix('.source-tmp')
 tmp.write_text(''.join(transcript));os.replace(tmp,a.source)
print('COQ_PROOF_INPUT_FROZEN',str(a.source),flush=True)
raise SystemExit(0 if complete else 1)
