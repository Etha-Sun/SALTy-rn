from pathlib import Path
import sys,json,hashlib,subprocess,os,signal
R=Path('/srv/home/yuechunsun/tools/lean/build/shim-c');H=Path(__file__).resolve().parent;B=R/'experiments/shim-c-v2';case=H/sys.argv[1]
base=json.loads((case/'selected01/command.json').read_text());a=Path(base['cwd']);cmd=base['command'];i=cmd.index('-wp-prop');del cmd[i:i+2];cmd[cmd.index('-wp-prover')+1]='none';cmd+=['-wp-no-qed','-wp-no-clean'];sys.path.insert(0,str(R/'tools'));import shim_c_call_closure as cc
cl=cc.closure(a/'unit.c',{'spmm_u32_decrement'})
for phase in ['body','lemmas']:
 out=case/('inventory-'+phase);out.mkdir();v=list(cmd);v[v.index('-wp-report-json')+1]=str(out/'raw.json');v[v.index('-wp-session')+1]=str(out/'.build/session');v+=['-wp-prop','@lemma'] if phase=='lemmas' else ['-wp-skip-fct',','.join(cl['unreachable_definitions'])];(out/'command.json').write_text(json.dumps(v,indent=2))
 with (out/'run.log').open('x') as log:
  p=subprocess.Popen(v,cwd=a,stdout=log,stderr=subprocess.STDOUT,start_new_session=True,env={**os.environ,'WP_OBSERVER_JSONL':str(out/'events.jsonl')})
  try:code=p.wait(timeout=180)
  except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();code=124
 ev=[json.loads(l) for l in (out/'events.jsonl').read_text().splitlines()];r=dict(exit=code,normal_exit_marker=ev[-1]['event']=='normal_exit',goal_count=ev[-1].get('goal_count'));(out/'result.json').write_text(json.dumps(r,indent=2));print(phase,r,flush=True)
