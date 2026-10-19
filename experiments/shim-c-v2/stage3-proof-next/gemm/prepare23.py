from pathlib import Path
import sys,json,hashlib,subprocess,tempfile,difflib
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=H/'candidate19';new=H/'candidate23';new.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();m=json.loads((old/'frozen.json').read_text());t=Path(tempfile.mkdtemp(prefix='gemm-fix-',dir='/tmp'));plain={}
for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(t/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=t,capture_output=True,check=True)
p=t/'fp_primitives.h';s=p.read_text();anchor=' logic float complex_add32';pred=' predicate next_vec_same(float32x4_t a,float32x4_t b) =\n  '+' && '.join(f'ext_same(a.lane[{i}],b.lane[{i}])' for i in range(4))+';\n';assert s.count(anchor)==1;s=s.replace(anchor,pred+anchor);p.write_text(s)
p=t/'neon.c';s=p.read_text();lines=s.splitlines(True);idx=next(i for i,l in enumerate(lines) if 'assert next_a_aggregate:' in l);line=lines.pop(idx);j=next(i for i,l in enumerate(lines) if 'assert next_a_load:' in l);lines.insert(j+1,line);s=''.join(lines)
anchor='      /*@ assert next_acc_entry:';assert s.count(anchor)==1;s=s.replace(anchor,'      //@ ghost NextAccEntry: ;\n'+anchor)
lines=s.splitlines(True);out=[];count=0
names=['va0','va1','va2','va3','vb0123c0','vb4567c0','vb0123c1','vb4567c1','va0c0','va1c0','va2c0','va3c0']
for line in lines:
 out.append(line)
 if count<len(names) and (' '+names[count]+' = ') in line and line.startswith('      const float32x'):
  out.append(f'      /*@ assert next_acc_frame_chain_{count}: next_vec_same(vacc0x0,\\at(vacc0x0,NextAccEntry)); */\n');count+=1
assert count==12,count;p.write_text(''.join(out))
d=[]
for n in m['files']:
 for x in difflib.unified_diff(plain[n].splitlines(True),(t/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):d.append(x if x.endswith('\n') else x+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(d));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3']['proof_sha256']=sha(new/'proof.patch');m['proof_next'].update(previous_candidate_sha256=sha(old/'frozen.json'),revision='From19, pack A relation after existing scalar forall and split accumulator pure-frame across 8loads/4dups before firstFMA. Each of12 cuts is a required proof obligation; no new callee contract and no C/premise changes. Starts with one-step focused diagnosis before whole60 group.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=checker.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
