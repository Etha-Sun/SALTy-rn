"""Proof-only maxpool cursor candidate; all helper bodies remain obligations."""
from pathlib import Path
import sys,json,hashlib,tempfile,subprocess,difflib
H=Path(__file__).resolve().parent
R=H.parents[3]
sys.path.insert(0,str(R/'tools'))
import shim_c_campaign_closure as checker
old=H/'cursor-r1'
case=H/'cursor-r2'
case.mkdir()
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
m=json.loads((old/'frozen.json').read_text())
t=Path(tempfile.mkdtemp(prefix='maxpool-proof-'))
plain={}
for n,v in m['files'].items():
    plain[n]=(R/v['path']).read_text()
    (t/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=t,capture_output=True,check=True)
p=t/'fp_primitives.h'
s=p.read_text()
strategy=r"""/*@ \wp::strategy MaxCursorChild: \prover("z3",10), \prover("cvc5",10);
    \wp::strategy MaxCursorFilter: \tactic("Wp.filter",\goal(_),\children(MaxCursorChild)), MaxCursorChild;
    \wp::proof MaxCursorFilter: equivalent; */
"""
assert s.count('#endif')==1
p.write_text(s.replace('#endif',strategy+'#endif'))
parts=[]
for n in m['files']:
    for line in difflib.unified_diff(plain[n].splitlines(True),(t/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):
        parts.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(case/'proof.patch').write_text(''.join(parts))
m['proof_patches']=[str((case/'proof.patch').relative_to(R))]
m['proof_sha256']=sha(case/'proof.patch')
m['previous_version']=str(old.relative_to(R))
m['stage3_revision']='WP built-in context filtering for actual cursor goals; retains all r1 proof debts, no new premises or model changes.'
(case/'frozen.json').write_text(json.dumps(m,indent=2)+'\n')
_,g=checker.prepare(case,sha(case/'frozen.json'),'diagnostic01')
(case/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
print(g['passed'])
