from pathlib import Path
import json,subprocess,os,signal,time
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[3]
base=json.loads((HERE/'raw/command.json').read_text())['command']
for label,model in [('minimal3-raw','Typed+raw+float'),('minimal3-typed','Typed+float')]:
 out=HERE/label;out.mkdir(exist_ok=False);cmd=base[:]
 cmd[cmd.index(str(ROOT/'experiments/shim-c-v2/stage3-pool-spmm/f32-argmaxpool/.build/diagnostic-01/annotated/unit.c'))]=str(HERE/'minimal3.c')
 for key in ['-inline-calls','-inline-stmt-contracts','-remove-inlined','-wp-prop','-wp-driver']:
  i=cmd.index(key);del cmd[i:i+(1 if key=='-inline-stmt-contracts' else 2)]
 for key,value in [('-wp-model',model),('-wp-report-json',str(out/'raw.json')),('-wp-session',str(out/'.build/session')),('-wp-out',str(out/'.build/generated'))]:cmd[cmd.index(key)+1]=value
 (out/'command.json').write_text(json.dumps(cmd,indent=2)+'\n');start=time.monotonic()
 with (out/'run.log').open('x') as f:
  p=subprocess.Popen(cmd,cwd=HERE,stdout=f,stderr=subprocess.STDOUT,start_new_session=True,env={**os.environ,'PATH':str(ROOT/'experiments/shim-c-v2/handoff-solvers/.build/bin')+':'+os.environ['PATH']})
  try:code=p.wait(timeout=90)
  except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();code=124
 (out/'result.json').write_text(json.dumps({'exit':code,'seconds':time.monotonic()-start})+'\n');print(label,code,flush=True)
