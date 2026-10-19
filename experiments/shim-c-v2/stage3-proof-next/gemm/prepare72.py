from pathlib import Path
import sys,json,hashlib,subprocess,tempfile,difflib
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=H/'candidate71';new=H/'candidate72';new.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();m=json.loads((old/'frozen.json').read_text());t=Path(tempfile.mkdtemp(prefix='gemm-fix-',dir='/tmp'));plain={}
for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(t/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=t,capture_output=True,check=True)
p=t/'neon.c';s=p.read_text()
for step in (0,1):
 cuts=[]
 for j in range(4):
  idx=f'((NC-nc)/8)*(8+8*(KC/4))+8+8*((KC-k)/4+{step})+{4+j}'
  bound=f'/*@ assert next_high_bound{step}_{j}: 0<={idx}<((NC+7)/8)*(8+8*(KC/4)); */'
  assert s.count(bound)==1, bound
  s=s.replace(bound,'')
  cuts.append(bound)
 anchor=f'      const float32x4_t vb4567c{step} = vld1q_f32(w);'
 assert s.count(anchor)==1
 after=[]
 for j in range(4):
  idx=f'((NC-nc)/8)*(8+8*(KC/4))+8+8*((KC-k)/4+{step})+{4+j}'
  after.append(f'/*@ assert next_high_load{step}_{j}: ext_same(vb4567c{step}.lane[{j}],next_read{{Stage3Block}}(W0,{idx})); */')
 s=s.replace(anchor,'      '+'\n      '.join(cuts)+'\n'+anchor+'\n      '+'\n      '.join(after)+'\n      ')
p.write_text(s)

d=[]
for n in m['files']:
 for x in difflib.unified_diff(plain[n].splitlines(True),(t/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):d.append(x if x.endswith('\n') else x+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(d));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3']['proof_sha256']=sha(new/'proof.patch');m['proof_next'].update(previous_candidate_sha256=sha(old/'frozen.json'),revision='Move eight existing high weight bounds to actual load boundaries and add eight fixed high weight read cuts there, retaining all eight original pre-FMA weight frame obligations. No new helper, ghost read, ordinary C, spec or model changes; all new cuts and inventory remain mandatory.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=checker.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
