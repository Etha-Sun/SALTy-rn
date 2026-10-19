from pathlib import Path
import sys,json,hashlib,subprocess,tempfile,difflib
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=H/'candidate74';new=H/'candidate76';new.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();m=json.loads((old/'frozen.json').read_text());t=Path(tempfile.mkdtemp(prefix='gemm-fix-',dir='/tmp'));plain={}
for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(t/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=t,capture_output=True,check=True)
p=t/'neon.c';s=p.read_text()
for step in range(2):
 before='';after='';label=f'NextHighWeight{step}'
 if step==1:before+=f'      //@ ghost {label}: ;\n'
 for j in range(4):
  if step==0 and j==0:continue
  idx=f'((NC-nc)/8)*(8+8*(KC/4))+8+8*((KC-k)/4+{step})+{4+j}'
  ref=f'next_read{{Stage3Block}}(W0,{idx})'
  bound=f'/*@ assert next_high_bound{step}_{j}: 0<={idx}<((NC+7)/8)*(8+8*(KC/4)); */'
  assert s.count(bound)==1;s=s.replace(bound,'')
  before+='      '+bound+'\n'
  before+=f'      /*@ assert next_high_source{step}_{j}: ext_same(w[{j}],{ref}); */\n'
  actual=f'vb4567c{step}.lane[{j}]';oldread=f'\\at(w[{j}],{label})'
  after+=f'\n      /*@ assert next_high_actual{step}_{j}: ext_same({actual},{oldread}); */\n'
  after+=f'      /*@ ghost next_weight_transitive({actual}); */\n'
  after+=f'      /*@ assert next_high_weightjoin{step}_{j}: (ext_same({actual},{oldread}) && ext_same({oldread},{ref})) ==> ext_same({actual},{ref}); */\n'
  after+=f'      /*@ assert next_high_load{step}_{j}: ext_same({actual},{ref}); */\n'
 anchor=f'      const float32x4_t vb4567c{step} = vld1q_f32(w);';assert s.count(anchor)==1
 s=s.replace(anchor,before+anchor+after+'      ')
p.write_text(s)

d=[]
for n in m['files']:
 for x in difflib.unified_diff(plain[n].splitlines(True),(t/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):d.append(x if x.endswith('\n') else x+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(d));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3']['proof_sha256']=sha(new/'proof.patch');m['proof_next'].update(previous_candidate_sha256=sha(old/'frozen.json'),revision='Extend the already checked candidate74 high-weight lane method to the other seven lanes; retain both real load labels, scalar-only helper calls and all previous obligations. All 28 new cuts and original eight bounds/pre-weight/FMA conclusions remain mandatory.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=checker.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
