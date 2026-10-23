#!/usr/bin/env python3
"""Reproduce the small QCP source lock from a fixed archive and official GitHub tree records."""
import argparse,collections,hashlib,json,pathlib,tarfile
COMMIT='08cc7a0f1373a1db3800111a0205a340b6d6f99c'
ROOT_TREE='6732339ef64bc329cc9a38f2050b0495db8ee456'
ROCQ_TREE='f51a198ef02b9a491ae428f4e7239ebe170781c1'
SUFFIXES=['.v','.ml','.mli','.mll','.mly','.mlpack','.mllib','.c','.h']
NAMES=['dune','dune-project','dune-workspace','_CoqProject','Makefile']
def git_tree(node):
 entries=[]
 for name,value in node.items():
  if isinstance(value,dict):mode='40000';digest=git_tree(value);key=name.encode()+b'/'
  else:mode,digest=value;key=name.encode()
  entries.append((key,mode.encode()+b' '+name.encode()+b'\0'+digest))
 body=b''.join(item[1] for item in sorted(entries))
 return hashlib.sha1(b'tree '+str(len(body)).encode()+b'\0'+body).digest()
def main():
 p=argparse.ArgumentParser(description=__doc__);p.add_argument('--archive',required=True,type=pathlib.Path);p.add_argument('--commit-api',required=True,type=pathlib.Path);p.add_argument('--root-tree-api',required=True,type=pathlib.Path);p.add_argument('--out',required=True,type=pathlib.Path);a=p.parse_args()
 commit=json.loads(a.commit_api.read_text());tree=json.loads(a.root_tree_api.read_text())
 if commit['sha']!=COMMIT or commit['tree']['sha']!=ROOT_TREE or tree['sha']!=ROOT_TREE:raise RuntimeError('official record does not match pinned commit/root tree')
 root={entry['path']:(entry['mode'].lstrip('0'),bytes.fromhex(entry['sha'])) for entry in tree['tree']}
 # API tree entries use git tree mode 040000; ensure the root record itself hashes correctly.
 entries=[]
 for entry in tree['tree']:
  mode=entry['mode'].lstrip('0');name=entry['path'];key=name.encode()+(b'/' if entry['type']=='tree' else b'')
  entries.append((key,mode.encode()+b' '+name.encode()+b'\0'+bytes.fromhex(entry['sha'])))
 body=b''.join(x[1] for x in sorted(entries))
 if hashlib.sha1(b'tree '+str(len(body)).encode()+b'\0'+body).hexdigest()!=ROOT_TREE:raise RuntimeError('root API tree contents fail git-object hash')
 if next(x['sha'] for x in tree['tree'] if x['path']=='Rocq')!=ROCQ_TREE:raise RuntimeError('Rocq tree mismatch')
 files={};nodes={};root_inputs={};required_root={'_CoqProject','dune-project'}
 with tarfile.open(a.archive) as archive:
  if archive.pax_headers.get('comment')!=COMMIT:raise RuntimeError('archive commit metadata mismatch')
  for member in archive.getmembers():
   if not member.isfile() or '/' not in member.name:continue
   relative=member.name.split('/',1)[1]
   if relative in required_root:
    if relative in root_inputs:raise RuntimeError('duplicate root build input: '+relative)
    data=archive.extractfile(member).read();mode='100755' if member.mode&0o111 else '100644'
    blob=hashlib.sha1(b'blob '+str(len(data)).encode()+b'\0'+data).digest()
    if root.get(relative)!=(mode,blob):raise RuntimeError('archive root build input differs from authenticated Git tree: '+relative)
    root_inputs[relative]=hashlib.sha256(data).hexdigest()
   if not relative.startswith('Rocq/'):continue
   name=relative[len('Rocq/'):];data=archive.extractfile(member).read();files[name]=data;cursor=nodes
   for part in name.split('/')[:-1]:cursor=cursor.setdefault(part,{})
   mode='100755' if member.mode&0o111 else '100644';cursor[name.split('/')[-1]]=(mode,hashlib.sha1(b'blob '+str(len(data)).encode()+b'\0'+data).digest())
 if set(root_inputs)!=required_root:raise RuntimeError('missing required archive root build input')
 if git_tree(nodes).hex()!=ROCQ_TREE:raise RuntimeError('archive full Rocq git tree differs from reviewed commit')
 groups=collections.defaultdict(list)
 for name,data in files.items():
  path=pathlib.Path(name)
  if path.suffix in SUFFIXES or path.name in NAMES:
   group=name.split('/',1)[0] if '/' in name else '.';groups[group].append((name,hashlib.sha256(data).hexdigest()))
 digests={}
 for group,entries in sorted(groups.items()):
  payload=''.join(name+'\0'+digest+'\n' for name,digest in sorted(entries)).encode();digests[group]={'files':len(entries),'sha256':hashlib.sha256(payload).hexdigest()}
 result={'schema':1,'repository':'https://github.com/QinxiangCao/QualifiedCProgramming','commit':COMMIT,'root_git_tree':ROOT_TREE,'verified_archive_rocq_git_tree':ROCQ_TREE,'archive_sha256':hashlib.sha256(a.archive.read_bytes()).hexdigest(),'source_scope':{'directory':'Rocq','suffixes':SUFFIXES,'names':NAMES,'algorithm':'Group by first relative component (root files group .); SHA256 of sorted UTF-8 relative path + NUL + content SHA256 hex + LF for every included file; additions/deletions rejected. Archive full Rocq Git tree independently matches pinned commit.'},'groups':digests,'coqproject_sha256':hashlib.sha256(files['_CoqProject']).hexdigest(),'provenance':'Generated from fixed-commit archive only after full Rocq Git tree matched official GitHub commit/root-tree responses. Existing compiled tree not used to generate source pins.','root_inputs':root_inputs}
 a.out.write_text(json.dumps(result,indent=2)+'\n');print(json.dumps({'matched_rocq_git_tree':ROCQ_TREE,'pinned_source_files':sum(x['files'] for x in digests.values()),'manifest_sha256':hashlib.sha256(a.out.read_bytes()).hexdigest()}))
if __name__=='__main__':main()
