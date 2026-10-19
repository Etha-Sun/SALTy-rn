from pathlib import Path
import json,hashlib,subprocess,tempfile,difflib,sys
R=Path(__file__).resolve().parents[3];H=Path(__file__).resolve().parent;sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as c
for name in ['f32-gemm-minmax','f32-igemm-minmax']:
 old=H/(name+'-r3');new=H/(name+'-r4');new.mkdir();m=json.loads((old/'frozen.json').read_text());tmp=Path(tempfile.mkdtemp(prefix='stage3-fma-',dir='/tmp'));plain={}
 for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(tmp/n).write_text(plain[n])
 subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=tmp,capture_output=True,check=True)
 p=tmp/'fp_primitives.h';s=p.read_text();pos=s.rfind('#endif');assert pos>=0
 addition=r'''/*@ lemma stage3_fma_congruence: \forall float a,b,c,x,y,z;
 ext_same(a,x) && ext_same(b,y) && ext_same(c,z) ==> ext_same(shim_fma32(a,b,c),shim_fma32(x,y,z)); */
'''
 s=s[:pos]+addition+s[pos:];p.write_text(s);diff=[]
 for n in m['files']:
  for line in difflib.unified_diff(plain[n].splitlines(True),(tmp/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):diff.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
 (new/'proof.patch').write_text(''.join(diff));m['previous_version']=str(old.relative_to(R));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3'].update(previous_candidate_frozen_sha256=sha(old/'frozen.json'),proof_sha256=sha(new/'proof.patch'),fix='Add actual proof obligation for all-argument ext_same FMA congruence, no model change or axiom.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=c.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
s=(H/'run-refinement.py').read_text().replace('f32-gemm-minmax-r3','f32-gemm-minmax-r4').replace('f32-igemm-minmax-r3','f32-igemm-minmax-r4').replace('stage3_gacc_seed,stage3_gacc_step','stage3_gacc_seed,stage3_gacc_step,stage3_fma_congruence').replace('stage3_iacc_seed,stage3_iacc_step','stage3_iacc_seed,stage3_iacc_step,stage3_fma_congruence');(H/'run-r4.py').write_text(s)
