from pathlib import Path
import sys,json,hashlib,subprocess,tempfile,difflib
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=H/'candidate71';new=H/'candidate73';new.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();m=json.loads((old/'frozen.json').read_text());t=Path(tempfile.mkdtemp(prefix='gemm-fix-',dir='/tmp'));plain={}
for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(t/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=t,capture_output=True,check=True)
p=t/'fp_primitives.h';s=p.read_text()
anchor='/*@ predicate next_splat_join('
assert s.count(anchor)==1
helper=r'''/*@ ghost
 /@ assigns \nothing;
    ensures next_bias_transitive_post: \forall float y;
      (ext_same(x,y) && ext_same(y,z)) ==> ext_same(x,z);
 @/
 static void next_bias_transitive(float x,float z) {}
*/

'''
s=s.replace(anchor,helper+anchor);p.write_text(s)
p=t/'neon.c';s=p.read_text()
for j in (1,2,3):
 oldcall=f'/*@ ghost next_splat_transport(vacc0x1.lane[{j}],w[{j}],w[{j}]); */'
 newcall=f'/*@ ghost next_bias_transitive(vacc0x1.lane[{j}],next_high_bias_word{j}); */'
 oldcut=f'/*@ assert next_high_bias_loadjoin_{j}: next_splat_join(vacc0x1.lane[{j}],w[{j}],w[{j}],next_high_bias_word{j}); */'
 newcut=f'/*@ assert next_high_bias_loadjoin_{j}: (ext_same(vacc0x1.lane[{j}],w[{j}]) && ext_same(w[{j}],next_high_bias_word{j})) ==> ext_same(vacc0x1.lane[{j}],next_high_bias_word{j}); */'
 assert s.count(oldcall)==s.count(oldcut)==1
 s=s.replace(oldcall,newcall).replace(oldcut,newcut)
p.write_text(s)

d=[]
for n in m['files']:
 for x in difflib.unified_diff(plain[n].splitlines(True),(t/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):d.append(x if x.endswith('\n') else x+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(d));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3']['proof_sha256']=sha(new/'proof.patch');m['proof_next'].update(previous_candidate_sha256=sha(old/'frozen.json'),revision='Replace three auxiliary ghost pointer-reading transports with a real body unconditional scalar transitivity helper and three concrete logical implications. Preserve all original implementation safety and 38 bias obligations; helper body and inventory must be checked.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=checker.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
