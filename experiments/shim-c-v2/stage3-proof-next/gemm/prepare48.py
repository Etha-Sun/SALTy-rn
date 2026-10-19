from pathlib import Path
import sys,json,hashlib,subprocess,tempfile,difflib
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=H/'candidate47';new=H/'candidate48';new.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();m=json.loads((old/'frozen.json').read_text());t=Path(tempfile.mkdtemp(prefix='gemm-fix-',dir='/tmp'));plain={}
for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(t/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=t,capture_output=True,check=True)
p=t/'fp_primitives.h';s=p.read_text();assert 'next_fma_instance' not in s
oldheader=(H/'candidate13/.build/diagnostic01/annotated/fp_primitives.h').read_text();start=oldheader.index('/*@ predicate next_fma_instance(');stop=oldheader.index('#endif',start);helper=oldheader[start:stop]
close=s.rfind('#endif');assert close>=0;s=s[:close]+helper+s[close:];p.write_text(s)
p=t/'neon.c';s=p.read_text();needle='      vacc0x0 = vfmaq_f32(vacc0x0, va0c0, vb0123c0);';assert s.count(needle)==1
ann=''
for j in range(4):
 actual=f'va0c0.lane[{j}],vb0123c0.lane[{j}],vacc0x0.lane[{j}]'
 refs=f'next_read{{Stage3Block}}(A0,(KC-k)/4),next_read{{Stage3Block}}(W0,((NC-nc)/8)*(8+8*(KC/4))+8+8*((KC-k)/4)+{j}),stage3_gacc{{Stage3Block}}(A0,W0,0,(NC-nc)/8,{j},(KC-k)/4,KC/4),stage3_gacc{{Stage3Block}}(A0,W0,0,(NC-nc)/8,{j},(KC-k)/4+1,KC/4)'
 ann+=f'      /*@ ghost next_fma_actual({actual}); */\n      /*@ assert next_fma_ground_{j}: next_fma_instance({actual},{refs}); */\n'
s=s.replace(needle,ann+needle);p.write_text(s)

d=[]
for n in m['files']:
 for x in difflib.unified_diff(plain[n].splitlines(True),(t/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):d.append(x if x.endswith('\n') else x+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(d));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3']['proof_sha256']=sha(new/'proof.patch');m['proof_next'].update(previous_candidate_sha256=sha(old/'frozen.json'),revision='Reuse candidate13 fully defined native-RNE FMA congruence instance predicate and no-requires real-body helper, independently reprove here. Instantiate four actual first-FMA lanes with four new mandatory instance assertions. No scalar seed or weakened domain.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=checker.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
