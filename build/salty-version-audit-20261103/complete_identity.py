"""Extend the five-case frozen source ledger to all catalog entries, without benchmarks."""
import hashlib,json,re,subprocess,difflib
from pathlib import Path
OUT=Path(__file__).resolve().parent;ROOT=OUT.parents[1]
SALT=ROOT/'research/sol-pipeline-comparison-20261030/sources/SALTy-rn';OPT=ROOT/'research/sol-pipeline-comparison-20261030/round5-paper-bottom3/optimized-rvv-kernels'
XG=ROOT/'build/salty-paper-reproduction-20261102/xnnpack-history.git'
def run(*a):return subprocess.check_output(list(map(str,a)),stderr=subprocess.DEVNULL)
def sha(b):return hashlib.sha256(b).hexdigest()
def git(repo,*a):return run('git','-C',repo,*a)
rows=json.loads((OUT/'identity.json').read_text());all_sources=json.loads((OUT/'sources.json').read_text())
xpaths=run('git','--git-dir='+str(XG),'ls-tree','-r','--name-only','master').decode().splitlines();census=[]
for r in rows:
 k=r['kernel'];dest=OUT/'sources'/k;dest.mkdir(exist_ok=True);rel='kernels/target/'+k+'.c'
 bodies={}
 for role,repo,ref,path in [('A-head',ROOT,'978bc31b8d005122f8256605dc376bf3959e4d16',rel),('B-initial',SALT,r['author_initial_commit'],rel),('C-public',OPT,'597c1d233e65de5792e036a594be47bcd0603c50',{'x32-transposec':'x32transpose','f32-dwconv2d-chw':'dwconv2d-chw'}.get(k,k)+'.c'),('E-frozen',ROOT,'821969733d7953a212c51839194add416fd5799b','verification/qcp/verified/'+k+'/impl/testRVV.c')]:
  try:b=git(repo,'show',ref+':'+path)
  except subprocess.CalledProcessError:continue
  p=dest/(role+'.c')
  if p.exists():assert p.read_bytes()==b,(k,role,'frozen source drift')
  else:p.write_bytes(b)
  bodies[role]=b
  if not any(s['kernel']==k and s['role']==role for s in all_sources):
   all_sources.append(dict(kernel=k,role=role,source=str(p),commit=ref,path=path,sha256=sha(b),symbols=re.findall(r'\bvoid\s+(\w+)\s*\(',b.decode()),paper_figure_source_binding='unconfirmed'))
 # A was snapshotted at intake. For unchanged files, the immutable HEAD object is identical.
 ap=dest/'A-target.c'
 if not ap.exists():
  a=bodies['A-head'];assert sha(a)==r['working_sha256'];ap.write_bytes(a)
  all_sources.append(dict(kernel=k,role='A-target',source=str(ap),commit='978bc31b8d005122f8256605dc376bf3959e4d16',path=rel,sha256=sha(a),symbols=re.findall(r'\bvoid\s+(\w+)\s*\(',a.decode()),paper_figure_source_binding='unconfirmed'))
 a=ap.read_bytes();assert sha(a)==r['working_sha256']
 for role,b in bodies.items():
  (dest/(role+'.diff')).write_text(''.join(difflib.unified_diff(a.decode().splitlines(True),b.decode().splitlines(True),fromfile='A-target',tofile=role)))
 matches=[p for p in xpaths if p.startswith('src/') and '/gen/' in p and p.endswith('.c') and 'rvv' in p and Path(p).name.startswith(k+'-')]
 candidates=[]
 for p in matches:
  b=run('git','--git-dir='+str(XG),'show','master:'+p)
  candidates.append(dict(path=p,commit='9263081d93dc52e12f81239ee4b5d5f389661ab6',sha256=sha(b),symbols=re.findall(r'\bvoid\s+(\w+)\s*\(',b.decode()),status='family candidate only; ABI/packing/stride and paper binding must be checked before use'))
 helper_tree=None
 try:helper_tree=git(ROOT,'rev-parse','821969733:verification/qcp/verified/'+k+'/shim').decode().strip()
 except subprocess.CalledProcessError:pass
 census.append(dict(kernel=k,A_sha256=sha(a),B_sha256=sha(bodies['B-initial']) if 'B-initial' in bodies else None,C_sha256=sha(bodies['C-public']) if 'C-public' in bodies else None,E_sha256=sha(bodies['E-frozen']) if 'E-frozen' in bodies else None,E_helper_git_tree=helper_tree,D_paper_binding='missing for exact old-paper artifact; selected aligned candidates measured for five case studies only',handwritten_family_candidates=candidates))
(OUT/'sources.json').write_text(json.dumps(all_sources,indent=2)+'\n');(OUT/'catalog-ABCDE.json').write_text(json.dumps(census,indent=2)+'\n')
print('Catalog ledger:',len(census),'kernels;',sum(c['C_sha256'] is not None for c in census),'public optimized files;',sum(c['E_sha256'] is not None for c in census),'frozen repaired files')
