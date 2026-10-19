from pathlib import Path
import json,hashlib,importlib.util,re,sys
R=Path('/srv/home/yuechunsun/tools/lean/build/shim-c');H=R/'experiments/shim-c-v2/stage3-byte-fp-front-v34';out=H/'AUDIT-ROOT07.json';assert not out.exists();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
sp=importlib.util.spec_from_file_location('scan',H/'cvc5-supported.py');sc=importlib.util.module_from_spec(sp);sp.loader.exec_module(sc)
def commands(s):return [s[a:b] for a,b in sc.commands(s)]
rows=[];fail=[];pending=[]
for d in sorted((H/'qualification01/z3-adapter-evidence').iterdir()):
 orig=d/'original.smt2';record=d/'executions.json'
 if not record.exists():pending.append(str(d));continue
 O=commands(orig.read_text());goal=[s for s in O if re.match(r'\(\s*assert\b',s)][-1]
 for q in json.loads(record.read_text()):
  n=q['kind'];p=d/(n+'.smt2');S=commands(p.read_text());j=0;removed=[]
  for v in S:
   while j<len(O) and O[j]!=v:removed.append(O[j]);j+=1
   assert j<len(O),(d,n,'not_subsequence');j+=1
  removed.extend(O[j:]);assert all(re.match(r'\(\s*assert\b',x) for x in removed),(d,n,'nonassert_removed');assert goal not in removed and [x for x in S if re.match(r'\(\s*assert\b',x)][-1]==goal
  assert sha(p)==q['source_sha256'] and sha(d/(n+'.stdout'))==q['stdout_sha256'] and sha(d/(n+'.stderr'))==q['stderr_sha256']
  rows.append({'directory':str(d.relative_to(R)),'kind':n,'source_sha256':sha(p),'removed_assertions':len(removed),'goal_byte_identical':True,'exit':q['exit'],'stdout_first':(d/(n+'.stdout')).read_text().splitlines()[:1]})
B=R/'experiments/shim-c-v2/stage3-proof-next';deps=B/'root-review/byte-dependency-replay01/root01/RESULTS.json';choice=B/'byte-fp-prototype/choice-body18/root01/result.json';cd=json.loads(choice.read_text());assert cd['complete'] and cd['valid']==cd['total_solver_leaves']==6 and not cd['before_mismatches'] and not cd['after_mismatches'] and not cd['forbidden_assumption_leaks']
report={'qualified':False,'adapter_review':'Original command sequence preserved except whole non-goal assertions. Same exact goal/check-sat; no assumptions added. Every completed Z3 execution present at audit time checked; later/running executions not covered. UNSAT is sufficient for original task, subset SAT is not an original counterexample.','completed_execution_count':len(rows),'running_evidence_directories':pending,'executions':rows,'native_dependency_replay':{'path':str(deps.relative_to(R)),'sha256':sha(deps),'report':json.loads(deps.read_text())},'choice_body':{'path':str(choice.relative_to(R)),'sha256':sha(choice),'valid':6,'total':6},'remaining':'Full semantic controls and strict known-case acceptance; audit does not itself establish qualification.'};out.write_text(json.dumps(report,indent=2)+'\n');print(len(rows),'completed execution transformations checked;',len(pending),'still running')
