#!/usr/bin/env python3
from pathlib import Path
import hashlib,json,os,re,signal,subprocess,sys,time
H=Path(__file__).resolve().parent
R=H.parents[4]
F=R/'experiments/shim-c-v2/stage3-byte-fp-front-v27'
W=R/'experiments/shim-c-v2/environment-recovery-local/.build/opam/shim-local/bin/why3'
S=F/'wp-share/why3/frama_c_wp/membytes_le.mlw'
REC=H.parent.parent/'root-review/byte-dependency-replay01/record-solver.py'
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def snapshot():
 files={H/'frame.mlw',H/'run.py',H/'why3.conf',H/'cvc5-independent.drv',H/'z3-independent.drv',H/'removed-propositions.json',REC,W,Path(sys.executable).resolve(),F.parent/'handoff-solvers/.build/bin/cvc5'}
 for root in [F/'wp-share',W.parent.parent/'share/why3',F.parent/'handoff-model-front']:
  files.update(p for p in root.rglob('*') if p.is_file() and p.suffix in {'.mlw','.why','.drv','.gen','.driver','.conf'} and '.build' not in p.relative_to(root).parts)
 files.update(F.glob('*.drv'))
 return {str(p):sha(p) for p in sorted(files)}
def check(locked):return [p for p,v in locked.items() if not Path(p).is_file() or sha(p)!=v]
def cmd(group):
 a=[str(W),'prove','-L',str(F/'wp-share/why3'),'-L',str(H),'-a','split_vc']
 if group=='main':a +=[str(H/'frame.mlw')]
 elif group=='recursive':a +=[str(S),'-T','RWBytes','-G',"bread_32bits_bwrite_seq_sep'vc"]
 elif group=='sequence':a +=[str(S),'-T','MemBytes','-G',"to_seq'vc"]
 else:raise ValueError(group)
 return a
if sys.argv[1]=='prepare':
 assert not (H/'inputs.json').exists()
 conf=(H/'why3.conf').read_text();original=re.search(r'command = "([^"]+)"',conf).group(1)
 conf=conf.replace('command = "'+original+'"','command = "'+str(Path(sys.executable).resolve())+' '+str(REC)+' '+original+'"')
 (H/'why3.conf').write_text(conf)
 (H/'inputs.json').write_text(json.dumps(snapshot(),indent=2)+'\n')
 print('prepared',len(json.loads((H/'inputs.json').read_text())));sys.exit(0)
mode,group,name=sys.argv[1:];assert mode in ['export','prove']
out=H/name;out.mkdir(exist_ok=False)
locked=json.loads((H/'inputs.json').read_text());before=check(locked);assert not before,before
args=cmd(group)
if mode=='export':
 (out/'tasks').mkdir();args+=['-D',str(H/'cvc5-independent.drv'),'-o',str(out/'tasks')];wall=90
else:args+=['-C',str(H/'why3.conf'),'-P','CVC5,1.2.1','-t','30','-m','2048'];wall=300 if group=='main' else 180
env=os.environ.copy();env['DEPENDENCY_REPLAY_DIR']=str(out)
request={'command':args,'mode':mode,'group':group,'wall_seconds':wall,'inputs_manifest_sha256':sha(H/'inputs.json'),'before_mismatches':before}
(out/'command.json').write_text(json.dumps(request,indent=2)+'\n');start=time.monotonic()
with (out/'run.log').open('wb') as log:
 p=subprocess.Popen(args,stdout=log,stderr=subprocess.STDOUT,env=env,start_new_session=True)
 try:code=p.wait(timeout=wall)
 except subprocess.TimeoutExpired:os.killpg(p.pid,signal.SIGKILL);p.wait();code=124
text=(out/'run.log').read_text(errors='replace');after=check(locked)
results=re.findall(r'Prover result is:\s*([^\n]+)',text)
forbidden=[x for names in json.loads((H/'removed-propositions.json').read_text()).values() for x in names]
inputs=list((out/'tasks').glob('*')) if mode=='export' else list(out.glob('call-*/input.smt2'))
leaks={str(f):[x for x in forbidden if ';; "'+x+'"' in f.read_text()] for f in inputs if f.is_file()}
leaks={k:v for k,v in leaks.items() if v}
r={**request,'exit':code,'seconds':time.monotonic()-start,'after_mismatches':after,'verdicts':results,'valid':sum(x.startswith('Valid ') for x in results),'total_solver_leaves':len(results),'forbidden_assumption_leaks':leaks,'actual_tasks':len(inputs),'solver_invoked':mode=='prove','complete':code==0 and not after and not leaks and bool(results) and all(x.startswith('Valid ') for x in results)}
(out/'result.json').write_text(json.dumps(r,indent=2)+'\n');print(json.dumps(r,indent=2))
