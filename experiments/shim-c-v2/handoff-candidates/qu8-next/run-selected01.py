from pathlib import Path
import subprocess,json,time
r=Path(__file__).resolve().parents[4];o=Path(__file__).resolve().parent
cmd=json.loads((o/'logs/helper04-command.json').read_text());i=cmd.index('-wp-fct');cmd[i:i+2]=[]
cmd=[x.replace('helper04','selected01').replace('helper-diagnostic','selected-diagnostic') for x in cmd]
cmd[1:1]=['-inline-calls','test_neon,test_rvv','-inline-stmt-contracts','-remove-inlined','test_neon,test_rvv']
cmd[-1:-1]=['-wp-prop','hi_prefix,tail4_rebase,rvv_center_prefix,rvv_center,rvv_mul_prefix']
(o/'logs/selected01-command.json').write_text(json.dumps(cmd,indent=2)+'\n');t=time.monotonic()
with (o/'logs/selected01.log').open('x') as f:
 try:p=subprocess.run(cmd,cwd=o/'.build/selected-diagnostic',stdout=f,stderr=subprocess.STDOUT,timeout=180);code=p.returncode
 except subprocess.TimeoutExpired:code=124
(o/'logs/selected01-exit.json').write_text(json.dumps(dict(exit=code,seconds=time.monotonic()-t))+'\n')
print(code)
