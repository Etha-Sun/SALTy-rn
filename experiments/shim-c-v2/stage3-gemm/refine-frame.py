from pathlib import Path
import json,hashlib,subprocess,tempfile,difflib,sys
ROOT=Path(__file__).resolve().parents[3];HERE=Path(__file__).resolve().parent;sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();sys.path.insert(0,str(ROOT/'tools'));import shim_c_campaign_closure as c
for name in ['f32-gemm-minmax','f32-igemm-minmax']:
 old=HERE/(name+'-r2');new=HERE/(name+'-r3');new.mkdir();m=json.loads((old/'frozen.json').read_text());tmp=Path(tempfile.mkdtemp(prefix='stage3-frame-',dir='/tmp'));plain={}
 for n,v in m['files'].items():plain[n]=(ROOT/v['path']).read_text();(tmp/n).write_text(plain[n])
 subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=tmp,capture_output=True,check=True)
 for file in ['neon.c','rvv.c']:
  p=tmp/file;s=p.read_text();s=s.replace('  do {','  do {\n    //@ ghost Stage3Block: ;',1)
  if name=='f32-gemm-minmax':
   s=s.replace('stage3_gacc(A0,W0,','stage3_gacc{Stage3Block}(A0,W0,')
   frame=r'''        loop invariant stage3_read_a: \forall integer q;0<=q<4*(KC/4) ==> ext_same(A0[q],\at(A0[q],Stage3Block));
        loop invariant stage3_read_w: \forall integer q;0<=q<((NC+7)/8)*(8+8*(KC/4)) ==> ext_same(W0[q],\at(W0[q],Stage3Block));
''';needle='        loop assigns k,a0,a1,a2,a3,w,';assert s.count(needle)==1;s=s.replace(needle,frame+needle)
  else:
   s=s.replace('stage3_iacc(A,W,','stage3_iacc{Stage3Block}(A,W,')
   frame=r'''        loop invariant stage3_read_table: \forall integer q;0<=q<KS/sizeof(void*) ==> A[q]==\at(A[q],Stage3Block);
        loop invariant stage3_read_rows: \forall integer q,t;0<=q<KS/sizeof(void*) && 0<=t<KC/4 ==> ext_same(A[q][t],\at(A[q][t],Stage3Block));
        loop invariant stage3_read_w: \forall integer q;0<=q<((NC+7)/8)*(8+8*(KC/4)*(KS/sizeof(void*))) ==> ext_same(W[q],\at(W[q],Stage3Block));
''';s=s.replace('        loop assigns p,a,w,',frame+'        loop assigns p,a,w,');s=s.replace('          loop assigns k,a0,w,',frame+'          loop assigns k,a0,w,')
  p.write_text(s)
 diff=[]
 for n in m['files']:
  for line in difflib.unified_diff(plain[n].splitlines(True),(tmp/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):diff.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
 (new/'proof.patch').write_text(''.join(diff));m['previous_version']=str(old.relative_to(ROOT));m['proof_patches']=[str((new/'proof.patch').relative_to(ROOT))];m['stage3'].update(previous_candidate_frozen_sha256=sha(old/'frozen.json'),proof_sha256=sha(new/'proof.patch'),fix='Freeze recursive reference at each block entry; carry explicit read-only input/weights frame through inner accumulations. Motivated by actual printseed01 Raw memcpy-memory mismatch, all frames remain proof obligations.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=c.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
s=(HERE/'run-r2.py').read_text().replace('f32-gemm-minmax-r2','f32-gemm-minmax-r3').replace('f32-igemm-minmax-r2','f32-igemm-minmax-r3');(HERE/'run-r3.py').write_text(s)
