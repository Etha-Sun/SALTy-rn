#!/usr/bin/env python3
"""Regenerate all live scalar-field vector C providers, then typed ordinary Coq closure."""
from pathlib import Path
import json,hashlib,subprocess,tempfile,time,shutil,re,concurrent.futures,argparse
HERE=Path(__file__).resolve().parent;CASE=HERE.parent;ROOT=next(p for p in CASE.parents if (p/'.git').exists())
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 ap=argparse.ArgumentParser();ap.add_argument('--jobs',type=int,default=16);ap.add_argument('--generate-only',action='store_true');a=ap.parse_args();run=Path(tempfile.mkdtemp(prefix='vector-proof-',dir=CASE/'.build'));coq=run/'coq';coq.mkdir();records=[]
 cfg=json.loads((ROOT/'.build/simple-kernels-bootstrap/coq-flags.json').read_text());dep=ROOT/'verification/qcp/verified/f32-vadd/.build/full-1f5wequq/coq';flags=list(cfg['flags'])+sum((['-Q',str(p),'' if p.name=='relations' else p.name] for p in sorted(dep.iterdir()) if p.is_dir()),[])+['-Q',str(coq),'F32F16']
 units=json.loads((HERE/'vector-units.json').read_text());units.insert(0,{'name':'active','source':'shim/active.c'});s={'passed':False,'whole_kernel_verified':False,'scope':'actual_vector_helpers_only','run_directory':str(run),'records':records,'units':[]}
 sources=sorted((CASE/'shim').glob('*.h'))+[CASE/u['source'] for u in units]+[HERE/'coq'/n for n in ['Bits.v','Model.v','Types.v','IntegerModel.v','VectorModel.v','VectorSupport.v']]+[Path(__file__),HERE/'vector-units.json'];s['input_sha256']={str(p.relative_to(CASE)):sha(p) for p in sources}
 def execute(cmd,label,timeout=1800):
  cmd=list(map(str,cmd));log=run/(label+'.log');cwd=run/'jobs'/label;cwd.mkdir(parents=True,exist_ok=True);start=time.monotonic()
  try:
   with log.open('w') as out:r=subprocess.run(['prlimit','--as='+str(16*1024**3),'--']+cmd,cwd=cwd,stdout=out,stderr=out,timeout=timeout)
   ec=r.returncode
  except subprocess.TimeoutExpired:ec=124
  rec={'label':label,'command':cmd,'exit_code':ec,'seconds':time.monotonic()-start,'log':str(log),'log_sha256':sha(log)};records.append(rec);print(label,ec,flush=True);return ec
 def generate(u):
  out=run/'generated'/u['name'];out.mkdir(parents=True);ec=execute(['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info','--input-file='+str(CASE/u['source']),'--coq-output-dir='+str(out),'--coq-logic-path=F32F16','-slp',CASE/'shim','F32F16'],'qcp-'+u['name']);return u,out,ec
 try:
  rows=list(concurrent.futures.ThreadPoolExecutor(max_workers=a.jobs).map(generate,units));assert all(ec==0 for _,_,ec in rows),'QCP generation failed'
  fields=[]
  for u,out,ec in rows:
   goals=list(out.glob('*_goal.v'));assert len(goals)==1,(u,goals);p=goals[0];stem=p.stem;shutil.copyfile(p,coq/p.name);fs=re.findall(r'^Axiom proof_of_(\w+)\s*:',p.read_text(),re.M);assert fs
   fields.extend((stem,f) for f in fs);s['units'].append({**u,'stem':stem,'goal_sha256':sha(p),'checked_c_vcs':len(fs),'fields':fs,'generation_directory':str(out)})
  s['qcp_generated']=True;s['checked_c_vcs']=len(fields)
  if a.generate_only:raise RuntimeError('generation-only: proof not attempted')
  for name in ['Bits','Model','Types','IntegerModel','VectorModel','VectorSupport']:shutil.copyfile(HERE/'coq'/f'{name}.v',coq/f'{name}.v')
  for name in ['Bits','Model','Types','IntegerModel','VectorModel','VectorSupport']:
   assert execute(flags+[coq/f'{name}.v'],name)==0,name
  assert all(x==0 for x in concurrent.futures.ThreadPoolExecutor(max_workers=a.jobs).map(lambda u:execute(flags+[coq/(u['stem']+'.v')],u['stem']),s['units'])),'goal compilation failed'
  stems=[u['stem'] for u in s['units']];names=[]
  for i in range(min(a.jobs,len(fields))):
   name='VectorPart'+str(i);names.append(name);text='From F32F16 Require Import VectorSupport '+' '.join(stems)+'.\nImport Snaive_C_Rules64.\nLocal Open Scope Z_scope.\nLocal Open Scope sac.\nModule Checked'+name+'.\n'
   for stem,f in fields[i::a.jobs]:
    tactic='f16_active_finish' if stem=='active_goal' else 'f16_vector_finish'
    extra='' 
    aux=', F32F16.'+stem+'.'+f+'_aux' if re.search(r'Definition '+re.escape(f)+r'_aux\s*:=',(coq/(stem+'.v')).read_text()) else ''
    text+=f'Lemma proof_of_{f} : F32F16.{stem}.{f}.\nProof. unfold F32F16.{stem}.{f}{aux}; {extra}{tactic}. Qed.\n'
   (coq/(name+'.v')).write_text(text+'End Checked'+name+'.\n')
  results=list(concurrent.futures.ThreadPoolExecutor(max_workers=a.jobs).map(lambda n:execute(flags+[coq/(n+'.v')],n,3600),names));assert all(ec==0 for ec in results),'vector proof group failed'
  text='From F32F16 Require Import '+' '.join(stems+names)+'.\n'
  for u in s['units']:
   label='Checked_'+u['name'];text+=f'Module {label} : F32F16.{u["stem"]}.VC_Correct.\n'
   for f in u['fields']:
    part=names[next(i for i,(_,ff) in enumerate(fields) if ff==f)%a.jobs];text+=f'Definition proof_of_{f} := {part}.Checked{part}.proof_of_{f}.\n'
   text+='End '+label+'.\n';text+='\n'.join('Print Assumptions '+label+'.proof_of_'+f+'.' for f in u['fields'])+'\n'
  (coq/'VectorChecked.v').write_text(text);assert execute(flags+[coq/'VectorChecked.v'],'VectorChecked',3600)==0,'typed gate failed'
  for name in names+['VectorChecked']+stems:shutil.copyfile(coq/(name+'.v'),HERE/'coq'/(name+'.v'))
  assert all(sha(CASE/p)==h for p,h in s['input_sha256'].items());s.update(passed=True,vc_correct_passed=True,source_sha256={str(p.relative_to(CASE)):sha(p) for p in sources+[HERE/'coq'/(n+'.v') for n in names+['VectorChecked']]})
 except Exception as e:s['error']=str(e)
 (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');(HERE/'vector-status.json').write_text(json.dumps(s,indent=2)+'\n');print(run,flush=True);raise SystemExit(0 if s['passed'] else 1)
if __name__=='__main__':main()
