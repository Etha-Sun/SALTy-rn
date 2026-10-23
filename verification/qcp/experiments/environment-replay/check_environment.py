#!/usr/bin/env python3
"""Targeted source/layout controls; no project checkout edits or commits."""
import argparse,hashlib,importlib.util,json,os,pathlib,shutil,subprocess,sys,tarfile,time
sys.dont_write_bytecode=True
HERE=pathlib.Path(__file__).resolve().parent
TOOLS=HERE.parents[1]/'tools'
p=argparse.ArgumentParser();p.add_argument('--out',required=True,type=pathlib.Path);p.add_argument('--archive',required=True,type=pathlib.Path);p.add_argument('--compiled-home',required=True,type=pathlib.Path);p.add_argument('--coqc',required=True,type=pathlib.Path);p.add_argument('--fixture-git-source',required=True,type=pathlib.Path);args=p.parse_args()
out=args.out.resolve();out.mkdir(parents=True,exist_ok=False);fixture=out/'qcp-fixture';fixture.mkdir()
manifest=json.loads((TOOLS/'qcp-2.1.4-source.json').read_text());scope=manifest['source_scope']
def source(path):return path.suffix in scope['suffixes'] or path.name in scope['names']
with tarfile.open(args.archive) as archive:
 for member in archive.getmembers():
  if not member.isfile() or '/' not in member.name:continue
  relative=member.name.split('/',1)[1];path=pathlib.PurePosixPath(relative)
  if '..' in path.parts or path.is_absolute():raise RuntimeError('unsafe archive member')
  wanted=(relative.startswith('Rocq/') and source(path)) or relative in manifest['root_inputs'] or relative in ['linux-binary/symexec','linux-binary/StrategyCheck']
  if wanted:
   target=fixture/relative;target.parent.mkdir(parents=True,exist_ok=True);target.write_bytes(archive.extractfile(member).read());target.chmod(member.mode)
# A Dune-layout compatibility fixture, populated with immutable existing artifacts.
# It is explicitly not a new Dune build or proof of source-to-vo correspondence.
dune=fixture/'_build/default/Rocq'
for root in [fixture/'Rocq',dune]:
 # Preserve every namespace directory, including directories with no current .vo.
 for path in (fixture/'Rocq').iterdir():
  if path.is_dir():(root/path.name).mkdir(parents=True,exist_ok=True)
 for path in args.compiled_home.joinpath('Rocq').rglob('*'):
  if path.suffix in ('.vo','.vos','.vok'):
   target=root/path.relative_to(args.compiled_home/'Rocq');target.parent.mkdir(parents=True,exist_ok=True)
   try:os.link(path,target)
   except OSError:shutil.copy2(path,target)
# Needed nested mapped directory even when it has no compiled files in this closure.
(dune/'coq-record-update/src').mkdir(parents=True,exist_ok=True)
env=dict(os.environ,QCP_HOME=str(fixture),QCP_COQC=str(args.coqc.resolve()),PYTHONDONTWRITEBYTECODE='1')
records=[]
def invoke(name,layout,passed,needle=None):
 command=[sys.executable,str(TOOLS/'environment.py'),'--check','--layout',layout];started=time.monotonic()
 result=subprocess.run(command,env=env,capture_output=True,text=True,timeout=60)
 (out/(name+'.log')).write_text(result.stdout+result.stderr)
 try:parsed=json.loads(result.stdout)
 except json.JSONDecodeError:parsed={}
 ok=(result.returncode==0)==passed and parsed.get('passed')==passed
 if needle:ok=ok and needle in parsed.get('error','')
 records.append({'name':name,'command':command,'exit_code':result.returncode,'expected_passed':passed,'ok':ok,'seconds':round(time.monotonic()-started,3),'result':parsed})
 (out/'result.json').write_text(json.dumps({'checks':records,'passed':all(x['ok'] for x in records),'scope':'environment controls only; no kernel proof','dune_test_kind':'layout fixture copied/linked from prebuilt artifacts, not a Dune build'},indent=2)+'\n')
 if not ok:raise RuntimeError(name+' unexpected outcome; inspect log')
invoke('in-place','in-place',True)
invoke('dune','dune',True)
# Prove a missing Dune dependency cannot fall back to the complete in-place copy.
dep=dune/'SeparationLogic/Mem.vo';backup=dep.with_suffix('.saved');dep.rename(backup)
try:invoke('dune-missing-dependency','dune',False,'import failed')
finally:backup.rename(dep)
# Prove the symmetric in-place selection does not borrow Dune artifacts.
dep=fixture/'Rocq/SeparationLogic/Mem.vo';backup=dep.with_suffix('.saved');dep.rename(backup)
try:invoke('in-place-missing-dependency','in-place',False,'import failed')
finally:backup.rename(dep)
original=fixture/'Rocq/SeparationLogic/FloatLib.v';text=original.read_bytes();original.write_bytes(text+b'\n(* mutation control *)\n')
try:invoke('archive-source-mutation','in-place',False,'source/build inputs changed')
finally:original.write_bytes(text)
extra=fixture/'Rocq/SeparationLogic/Unexpected.v';extra.write_text('Definition unexpected := 0.\n')
try:invoke('archive-untracked-source','in-place',False,'source/build inputs changed')
finally:extra.unlink()
extra=fixture/'Rocq/SeparationLogic/UnreviewedDirectory';extra.symlink_to(out/'git-outside-source',target_is_directory=True)
(out/'git-outside-source').mkdir();(out/'git-outside-source/Injected.v').write_text('Definition injected := 0.\n')
try:invoke('archive-source-directory-symlink','in-place',False,'unexpected symlink')
finally:extra.unlink()
# Coq recursively follows directory symlinks below a mapped Dune namespace;
# inventory must not silently skip a subtree that pathlib.rglob cannot traverse.
extra=dune/'SeparationLogic/InjectedDirectory';extra.symlink_to(out/'git-outside-source',target_is_directory=True)
try:invoke('dune-selected-directory-symlink','dune',False,'selected-layout directory symlink')
finally:extra.unlink()
# Extra .vo without an authentic pinned source is rejected before the import probe.
extra=dune/'SeparationLogic/Unexpected.vo';os.link(dune/'SeparationLogic/Mem.vo',extra)
try:invoke('unexpected-compiled-module','dune',False,'no pinned source')
finally:extra.unlink()
# An isolated local clone provides an existing HEAD. No commit is created.
spec=importlib.util.spec_from_file_location('candidate_environment',TOOLS/'environment.py');module=importlib.util.module_from_spec(spec);spec.loader.exec_module(module)
def clone(name):
 target=out/name
 subprocess.run(['git','clone','--shared','--no-checkout',str(args.fixture_git_source.resolve()),str(target)],capture_output=True,text=True,check=True)
 head=subprocess.check_output(['git','-C',str(target),'rev-parse','HEAD'],text=True).strip()
 (target/'Rocq').mkdir();module.check_git_sources(target,expected_commit=head);return target,head
def rejected_git(name,root,head):
 try:module.check_git_sources(root,expected_commit=head)
 except RuntimeError as error:ok=True;message=str(error)
 else:ok=False;message='unexpected source acceptance'
 records.append({'name':name,'ok':ok,'result':message})
 if not ok:raise RuntimeError(name+' accepted a source mutation')
staged,head=clone('git-staged');(staged/'Rocq/Added.v').write_text('Definition staged := 0.\n')
subprocess.run(['git','-C',str(staged),'add','Rocq/Added.v'],check=True)
old=subprocess.run(['git','-C',str(staged),'diff','--quiet','--','Rocq']).returncode
if old!=0:raise RuntimeError('staged control does not reproduce the old check bug')
rejected_git('git-staged-source',staged,head)
(staged/'Rocq/Added.v').unlink()
rejected_git('git-staged-source-worktree-restored',staged,head)
untracked,head=clone('git-untracked');(untracked/'Rocq/Added.v').write_text('Definition untracked := 0.\n');rejected_git('git-untracked-source',untracked,head)
ignored,head=clone('git-ignored');(ignored/'.git/info/exclude').write_text('Rocq/Added.v\n');(ignored/'Rocq/Added.v').write_text('Definition ignored := 0.\n');rejected_git('git-ignored-importable-source',ignored,head)
result={'passed':all(x['ok'] for x in records),'scope':'environment identity/layout negative controls only; no kernel proof','checks':records,'dune_test_kind':'layout fixture with copied/linked existing artifacts, not a Dune build','fixture_git_commits_created':0,'reviewed_source_manifest_sha256':hashlib.sha256((TOOLS/'qcp-2.1.4-source.json').read_bytes()).hexdigest()}
(out/'result.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps({'passed':result['passed'],'checks':len(records),'out':str(out)}))
