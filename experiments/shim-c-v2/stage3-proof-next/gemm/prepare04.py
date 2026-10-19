from pathlib import Path
import sys,json,hashlib,subprocess,tempfile,difflib
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=H/'candidate03';new=H/'candidate04';new.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();m=json.loads((old/'frozen.json').read_text());t=Path(tempfile.mkdtemp(prefix='gemm-fix-',dir='/tmp'));plain={}
for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(t/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=t,capture_output=True,check=True)
p=t/'neon.c';s=p.read_text()
for tag,anchor in [('next_a_load','      const float32x2_t va0 = vld1_f32(a0); a0 += 2;'),('next_b0_load','      const float32x4_t vb0123c0 = vld1q_f32(w); w += 4;'),('next_b1_load','      const float32x4_t vb0123c1 = vld1q_f32(w); w += 4;')]:
 start=s.index('      /*@ assert '+tag+':');end=s.index('*/',start)+2;annotation=s[start:end];s=s[:start]+s[end:];assert s.count(anchor)==1;s=s.replace(anchor,anchor+'\n'+annotation)
p.write_text(s);
d=[]
for n in m['files']:
 for x in difflib.unified_diff(plain[n].splitlines(True),(t/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):d.append(x if x.endswith('\n') else x+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(d));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3']['proof_sha256']=sha(new/'proof.patch');m['proof_next'].update(previous_candidate_sha256=sha(old/'frozen.json'),revision='Move input/b0/b1 snapshot assertions immediately after their corresponding original loads; same 12 selected WPOs,减少后续临时struct复制frame负担.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=checker.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
