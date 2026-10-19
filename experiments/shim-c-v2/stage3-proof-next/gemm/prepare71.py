from pathlib import Path
import sys,json,hashlib,subprocess,tempfile,difflib
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=H/'candidate70';new=H/'candidate71';new.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();m=json.loads((old/'frozen.json').read_text());t=Path(tempfile.mkdtemp(prefix='gemm-fix-',dir='/tmp'));plain={}
for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(t/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=t,capture_output=True,check=True)
p=t/'neon.c';s=p.read_text();insert=[]
for j in (1,2,3):
 frame=f'/*@ assert next_high_bias_frame_{j}: ext_same(vacc0x1.lane[{j}],next_high_bias_word{j}); */'
 assert s.count(frame)==1;s=s.replace(frame,'')
 args=f'vacc0x1.lane[{j}],w[{j}],w[{j}]'
 insert += [f'/*@ assert next_high_bias_postweight_{j}: ext_same(w[{j}],next_high_bias_word{j}); */',f'/*@ ghost next_splat_transport({args}); */',f'/*@ assert next_high_bias_loadjoin_{j}: next_splat_join({args},next_high_bias_word{j}); */',frame]
anchor='/*@ assert next_high_bias_load_3: ext_same(vacc0x1.lane[3],(w)[3]); */'
assert s.count(anchor)==1
s=s.replace(anchor,anchor+'\n    '+'\n    '.join(insert)+'\n    ')
p.write_text(s)

d=[]
for n in m['files']:
 for x in difflib.unified_diff(plain[n].splitlines(True),(t/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):d.append(x if x.endswith('\n') else x+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(d));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3']['proof_sha256']=sha(new/'proof.patch');m['proof_next'].update(previous_candidate_sha256=sha(old/'frozen.json'),revision='Move high bias frame lanes 1..3 to actual load boundary with explicit postweight and grounded transport. All six new cuts and ghost read RTE must close. All new cut/RTE/assigns remain mandatory; no frozen C/spec/model change.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=checker.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
