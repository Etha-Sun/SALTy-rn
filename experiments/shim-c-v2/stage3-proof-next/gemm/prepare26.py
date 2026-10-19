from pathlib import Path
import sys,json,hashlib,subprocess,tempfile,difflib
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=H/'candidate19';new=H/'candidate26';new.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();m=json.loads((old/'frozen.json').read_text());t=Path(tempfile.mkdtemp(prefix='gemm-fix-',dir='/tmp'));plain={}
for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(t/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=t,capture_output=True,check=True)
p=t/'fp_primitives.h';s=p.read_text();anchor=' logic float complex_add32';pred=' predicate next_vec_same(float32x4_t a,float32x4_t b) =\n  '+' && '.join(f'ext_same(a.lane[{i}],b.lane[{i}])' for i in range(4))+';\n';assert s.count(anchor)==1;s=s.replace(anchor,pred+anchor);p.write_text(s)
p=t/'neon.c';s=p.read_text();lines=s.splitlines(True);idx=next(i for i,l in enumerate(lines) if 'assert next_a_aggregate:' in l);line=lines.pop(idx);j=next(i for i,l in enumerate(lines) if 'assert next_a_load:' in l);lines.insert(j+1,line);s=''.join(lines)
lines=s.splitlines(True);out=[]
for line in lines:
 out.append(line)
 if 'assert next_acc_entry:' in line:
  out.append('      //@ ghost float32x4_t next_acc_snapshot = vacc0x0;\n')
  out.append('      /*@ assert next_snapshot_copy: next_vec_same(next_acc_snapshot,vacc0x0); */\n')
  out.append('      /*@ assert next_snapshot_ref: next_vec4_acc{Stage3Block}(next_acc_snapshot,A0,W0,(NC-nc)/8,(KC-k)/4,KC/4); */\n')
 if 'const float32x2_t va0 = vld1_f32(a0);' in line:
  out.append('      /*@ assert next_snapshot_first_frame: next_vec_same(vacc0x0,next_acc_snapshot); */\n')
s=''.join(out);anchor='      /*@ assert next_acc_before_0:'
ann='      /*@ assert next_snapshot_before_frame: next_vec_same(vacc0x0,next_acc_snapshot); */\n      /*@ assert next_snapshot_before_ref: next_vec4_acc{Stage3Block}(next_acc_snapshot,A0,W0,(NC-nc)/8,(KC-k)/4,KC/4); */\n'
assert s.count(anchor)==1;s=s.replace(anchor,ann+anchor);p.write_text(s)
d=[]
for n in m['files']:
 for x in difflib.unified_diff(plain[n].splitlines(True),(t/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):d.append(x if x.endswith('\n') else x+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(d));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3']['proof_sha256']=sha(new/'proof.patch');m['proof_next'].update(previous_candidate_sha256=sha(old/'frozen.json'),revision='From19, ordinary C unchanged: ghost struct snapshot at loop entry, body-checked copy/reference cuts, first-load current same-map relation, and firstFMA current snapshot frame/reference cuts. All five new assertion debts retained; original before/after cuts retained; no labeled old-heap frame or new callee contract.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=checker.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
