from pathlib import Path
import sys,json,hashlib,subprocess,tempfile,difflib
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=H/'candidate73';new=H/'candidate74';new.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();m=json.loads((old/'frozen.json').read_text());t=Path(tempfile.mkdtemp(prefix='gemm-fix-',dir='/tmp'));plain={}
for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(t/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=t,capture_output=True,check=True)
p=t/'fp_primitives.h';s=p.read_text();anchor='/*@ predicate next_splat_join(';assert s.count(anchor)==1
helper=r'''/*@ ghost
 /@ assigns \nothing;
    ensures next_weight_transitive_post: \forall float y,z;
      (ext_same(x,y) && ext_same(y,z)) ==> ext_same(x,z);
 @/
 static void next_weight_transitive(float x) {}
*/

'''
s=s.replace(anchor,helper+anchor);p.write_text(s)
p=t/'neon.c';s=p.read_text()
idx='((NC-nc)/8)*(8+8*(KC/4))+8+8*((KC-k)/4+0)+4'
ref=f'next_read{{Stage3Block}}(W0,{idx})'
bound=f'/*@ assert next_high_bound0_0: 0<={idx}<((NC+7)/8)*(8+8*(KC/4)); */'
assert s.count(bound)==1;s=s.replace(bound,'')
anchor='      const float32x4_t vb4567c0 = vld1q_f32(w);';assert s.count(anchor)==1
before='      '+bound+'\n      //@ ghost NextHighWeight0: ;\n'
before+=f'      /*@ assert next_high_source0_0: ext_same(w[0],{ref}); */\n'
actual='vb4567c0.lane[0]';oldread=r'\at(w[0],NextHighWeight0)'
after=f'\n      /*@ assert next_high_actual0_0: ext_same({actual},{oldread}); */\n'
after+=f'      /*@ ghost next_weight_transitive({actual}); */\n'
after+=f'      /*@ assert next_high_weightjoin0_0: (ext_same({actual},{oldread}) && ext_same({oldread},{ref})) ==> ext_same({actual},{ref}); */\n'
after+=f'      /*@ assert next_high_load0_0: ext_same({actual},{ref}); */\n      '
s=s.replace(anchor,before+anchor+after);p.write_text(s)

d=[]
for n in m['files']:
 for x in difflib.unified_diff(plain[n].splitlines(True),(t/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):d.append(x if x.endswith('\n') else x+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(d));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3']['proof_sha256']=sha(new/'proof.patch');m['proof_next'].update(previous_candidate_sha256=sha(old/'frozen.json'),revision='Single high-weight lane proof: instantiate frozen read before the real load, retain its memory label, check actual result projection, and instantiate a body-proved all-float transitivity helper. No new ghost pointer reads or domain assumptions. All four cuts and helper VC remain mandatory.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=checker.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
