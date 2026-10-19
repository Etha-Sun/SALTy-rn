"""Run controls for the root-approved conservative pointer-range removal."""
from pathlib import Path
import hashlib,json,os,shutil,subprocess
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2];MODEL=HERE/'model-integer-byte-v4-no-pointer-range';OUT=MODEL/'controls'
config=ROOT/'experiments/shim-c-v2/model-front/why3.conf'
env=dict(os.environ);env['PATH']=str(ROOT.parents[1]/'research/agent-qs8-rsum/provers/bin')+':'+env['PATH']
# The repository is a worktree inside build; the audited prover path is fixed.
env['PATH']='/zp_vegeta/scratch_sb/ycsun/verus/research/agent-qs8-rsum/provers/bin:'+os.environ['PATH']
common=['-machdep','gcc_x86_64','-wp','-wp-rte','-wp-par','2','-wp-prover','tip,z3,cvc5','-wp-timeout','3','-wp-memlimit','1024','-wp-cache','none','-wp-model','Bytes','-wp-share',str(MODEL/'wp-share'),'-wp-why3-config',str(config),'-wp-no-why3-detect']
reports=[]
for name,source,functions,negative in [('bookkeeping01',OUT/'bookkeeping-controls.c','mask_good,mask_bad,bookkeeping_true,bookkeeping_false',{'mask_bad_ensures_mask_bad','bookkeeping_false_ensures'}),('mask16-01',HERE/'mask16-probe03.c','mask16_normalize,mask16_false',{'mask16_false_ensures'})]:
 command=[str(MODEL/'frama-c.py'),*common,'-wp-report-json',str(OUT/(name+'.json')),'-wp-session',str(MODEL/'.build'/name),'-wp-fct',functions,'-wp-print',str(source)]
 (OUT/(name+'-command.json')).write_text(json.dumps(command,indent=2)+'\n')
 with (OUT/(name+'.log')).open('w') as f:r=subprocess.run(command,stdout=f,stderr=subprocess.STDOUT,env=env,timeout=180)
 rows=json.loads((OUT/(name+'.json')).read_text());bad=[x['property'] for x in rows if not x['passed']];reports.append({'name':name,'source_sha256':hashlib.sha256(source.read_bytes()).hexdigest(),'exit':r.returncode,'raw':{'passed':sum(x['passed'] for x in rows),'total':len(rows)},'not_proved':bad,'expected_negative_properties':sorted(negative),'accepted':r.returncode==0 and set(bad)==negative})
# These checks deliberately bypass the wrapper for the direct binary control.
blocked=ROOT/'experiments/shim-c-v2/model-integer-byte-v2/blocked-codec.c'
extra={'wrapper-float-option':[str(MODEL/'frama-c.py'),'-wp-model','Bytes+float',str(blocked)],'wrapper-driver':[str(MODEL/'frama-c.py'),'-wp-driver','unqualified.driver',str(blocked)],'direct-float-codec':[str(MODEL/'.build/install/bin/frama-c'),*common,str(blocked),'-cpp-command','gcc -E -C -I'+str(MODEL/'libc')+' -I.','-cpp-frama-c-compliant']}
for name,command in extra.items():
 (OUT/(name+'-command.json')).write_text(json.dumps(command,indent=2)+'\n');e=dict(env,OCAMLPATH=str(MODEL/'.build/install/lib'));r=subprocess.run(command,stdout=subprocess.PIPE,stderr=subprocess.STDOUT,env=e,text=True,timeout=90);(OUT/(name+'.log')).write_text(r.stdout);reports.append({'name':name,'exit':r.returncode,'accepted_rejection':r.returncode!=0,'message_tail':r.stdout[-1200:]})
(OUT/'qualification-results.json').write_text(json.dumps({'model_lock_sha256':hashlib.sha256((MODEL/'model_lock.json').read_bytes()).hexdigest(),'qualification':'Controls only; root independent source/semantic audit required before candidate use.','results':reports},indent=2)+'\n');print(json.dumps(reports,indent=2))
