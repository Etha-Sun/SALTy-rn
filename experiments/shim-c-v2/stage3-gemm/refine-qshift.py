from pathlib import Path
import json,hashlib,subprocess,tempfile,difflib,sys
R=Path(__file__).resolve().parents[3];H=Path(__file__).resolve().parent;sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as c
old=H/'qd8-f32-qc4w-gemm-minmax-r2';new=H/'qd8-f32-qc4w-gemm-minmax-r3';new.mkdir();m=json.loads((old/'frozen.json').read_text());tmp=Path(tempfile.mkdtemp(prefix='stage3-qshift-',dir='/tmp'));plain={}
for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(tmp/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=tmp,capture_output=True,check=True)
p=tmp/'fp_primitives.h';s=p.read_text();pos=s.rfind('#endif');assert pos>=0
addition='/*@\n'+''.join(f' lemma stage3_shift_{n}: \\forall integer u; 0<=u<=255 ==> 0<=(u<<{n})<=32640;\n' for n in range(8))+r''' lemma stage3_shift_cases: \forall integer n; 0<=n<8 ==> n==0 || n==1 || n==2 || n==3 || n==4 || n==5 || n==6 || n==7;
 lemma stage3_shift_bound: \forall integer u,n; 0<=u<=255 && 0<=n<8 ==> 0<=(u<<n)<=32640;
*/
'''
p.write_text(s[:pos]+addition+s[pos:]);diff=[]
for n in m['files']:
 for line in difflib.unified_diff(plain[n].splitlines(True),(tmp/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):diff.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(diff));m['previous_version']=str(old.relative_to(R));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3'].update(previous_candidate_frozen_sha256=sha(old/'frozen.json'),proof_sha256=sha(new/'proof.patch'),fix='Prove unsigned-byte shifted by n=0..7 bounded by 32640, via 8 separately checked constant-shift lemmas and finite case coverage. No new preconditions.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=c.prepare(new,sha(new/'frozen.json'),'diagnostic02');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
s=(H/'run-qc4-components.py').read_text().replace('qd8-f32-qc4w-gemm-minmax-r2','qd8-f32-qc4w-gemm-minmax-r3').replace('diagnostic01/annotated','diagnostic02/annotated').replace('components01','components02');(H/'run-qc4-components-r3.py').write_text(s)
s=s.replace("fcts='bits_i8,__riscv_vle8_v_i8m2,__riscv_vsll_vx_i8m2,__riscv_vand_vx_i8m2,__riscv_vsext_vf2_i16m4'","fcts='@lemma'").replace("'-wp-fct',fcts","'-wp-prop',fcts").replace('components02','lemmas02').replace('Complete selected helper bodies and RTE only; not full kernel. No implementations skipped within these selected bodies.','Global lemmas only, including all new shift facts. Not body/kernel acceptance.');(H/'run-qc4-lemmas-r3.py').write_text(s)
