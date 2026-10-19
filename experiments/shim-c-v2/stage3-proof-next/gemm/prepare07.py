from pathlib import Path
import sys,json,hashlib,subprocess,tempfile,difflib
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=H/'candidate05';new=H/'candidate07';new.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();m=json.loads((old/'frozen.json').read_text());t=Path(tempfile.mkdtemp(prefix='gemm-fix-',dir='/tmp'));plain={}
for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(t/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=t,capture_output=True,check=True)
p=t/'neon.c';s=p.read_text()
anchor='      const float32x2_t va0 = vld1_f32(a0); a0 += 2;'
ann='      /*@ assert next_t_range: 0<=(KC-k)/4 && (KC-k)/4+1<KC/4; */\n'
assert s.count(anchor)==1;s=s.replace(anchor,ann+anchor)
for n in [0,1]:
 anchor=f'      /*@ assert next_b{n}_load:'
 pos=s.index(anchor)
 ann=''
 for j in range(4):
  ix=f'((NC-nc)/8)*(8+8*(KC/4))+8+8*((KC-k)/4+{n})+{j}'
  ann+=f'      /*@ assert next_bound_{n}_{j}: 0<={ix}<((NC+7)/8)*(8+8*(KC/4)); */\n'
  ann+=f'      /*@ assert next_lane_{n}_{j}: ext_same(vb0123c{n}.lane[{j}],next_read{{Stage3Block}}(W0,{ix})); */\n'
 s=s[:pos]+ann+s[pos:]
p.write_text(s);
d=[]
for n in m['files']:
 for x in difflib.unified_diff(plain[n].splitlines(True),(t/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):d.append(x if x.endswith('\n') else x+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(d));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3']['proof_sha256']=sha(new/'proof.patch');m['proof_next'].update(previous_candidate_sha256=sha(old/'frozen.json'),revision='Split scalar t bounds and four fixed vector lanes at both weight-load checkpoints. Every new bound/lane assertion is proof debt; no input-length restriction and no premise changes.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=checker.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
