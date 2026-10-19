from pathlib import Path
import json,hashlib,subprocess,time,difflib,re
D=Path(__file__).resolve().parent;R=D.parents[5];B=R/'experiments/shim-c-v2';P=D.parent
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
rows=json.loads((P/'drop-only-address02/result.json').read_text())['tasks']
old1='''(assert
  (forall ((a addr) (m (Array Int Int)) (n Int))
    (=> (< 0 n) (=> (valid_rd m a n) (statically_allocated (base a))))))'''
old2='''(assert
  (forall ((p addr))
    (=> (statically_allocated (base p)) (= (addr_of_int (int_of_addr p)) p))))'''
patterns={'expanded':'((select m (base a)) (+ (offset a) n))'}
results=[]
for variant,pat in patterns.items():
 for i,row in enumerate(rows):
  source=P/'drop-only-address02'/str(i)/'subset.smt2';src=source.read_text();assert sha(source)==row['subset_sha256'];assert src.count(old1)==src.count(old2)==1
  one='''(assert
  (forall ((a addr) (m (Array Int Int)) (n Int))
    (! (=> (< 0 n) (=> (valid_rd m a n) (statically_allocated (base a))))
       :pattern %s)))'''%pat
  two='''(assert
  (forall ((p addr))
    (! (=> (statically_allocated (base p)) (= (addr_of_int (int_of_addr p)) p))
       :pattern ((int_of_addr p)))))'''
  dst=src.replace(old1,one).replace(old2,two);assert dst.replace(one,old1).replace(two,old2)==src
  goal=src[src.index(';; Goal "wp_goal"'):];assert dst[dst.index(';; Goal "wp_goal"'):]==goal
  assert dst.count('(assert')==src.count('(assert')
  run=D/f'{variant}-{i}';run.mkdir();task=run/'task.smt2';task.write_text(dst);(run/'metadata-only.diff').write_text(''.join(difflib.unified_diff(src.splitlines(True),dst.splitlines(True),fromfile=str(source),tofile=str(task))))
  cmd=[str(B/'handoff-solvers/.build/bin/z3'),'-T:10','-memory:2048',str(task)];start=time.monotonic()
  try:
   p=subprocess.run(cmd,capture_output=True,text=True,timeout=15);code=p.returncode;out=p.stdout;err=p.stderr
  except subprocess.TimeoutExpired as e:code=124;out=(e.stdout or b'').decode() if isinstance(e.stdout,bytes) else e.stdout or '';err=(e.stderr or b'').decode() if isinstance(e.stderr,bytes) else e.stderr or ''
  (run/'stdout').write_text(out);(run/'stderr').write_text(err)
  info={'source':str(source.relative_to(R)),'source_sha256':sha(source),'task_sha256':sha(task),'reverse_rewrite_byte_identical':True,'goal_byte_identical':True,'assert_count_unchanged':True,'command':cmd,'exit':code,'seconds':time.monotonic()-start,'stdout':out,'stderr':err,'qualified':False}
  (run/'result.json').write_text(json.dumps(info,indent=2)+'\n');results.append(info);print(variant,i,code,out.strip(),err[:150],flush=True)
(D/'RESULTS.json').write_text(json.dumps({'scope':'Only pattern metadata on existing universal assumptions; existing drop-only subsets, no further assertion added/removed, no qualification or kernel acceptance.','runs':results},indent=2)+'\n')
