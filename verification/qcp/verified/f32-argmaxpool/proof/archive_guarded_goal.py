#!/usr/bin/env python3
"""Archive an actual generated goal byte for byte; grants no proof credit."""
from pathlib import Path
import argparse,gzip,hashlib,json,os,tempfile
C=Path(__file__).resolve().parents[1]
def digest(p):
 h=hashlib.sha256();n=0
 with p.open('rb') as f:
  for block in iter(lambda:f.read(1024*1024),b''):h.update(block);n+=len(block)
 return h.hexdigest(),n

def main():
 ap=argparse.ArgumentParser();ap.add_argument('--isa',choices=['neon','rvv'],required=True);a=ap.parse_args()
 receipt=C/'proof'/(a.isa+'-guarded-generation-status.json');r=json.loads(receipt.read_text())
 assert r['passed'] and not r['prepare_only'] and r['isa']==a.isa and r['original_same_frontend_CPP_tokens_identical']
 for rel,want in r['input_sha256'].items():assert digest(C/rel)[0]==want,('generation input changed',rel)
 src=Path(r['goal_path']);rawsha,rawlen=digest(src);assert rawsha==r['goal_sha256']
 directory=C/'proof/evidence'/(a.isa+'-guarded-actual-goal');directory.mkdir(parents=True,exist_ok=True)
 target=directory/(a.isa+'_unit_goal.'+rawsha+'.v.gz')
 fd,filename=tempfile.mkstemp(prefix='archive-goal-',suffix='.gz',dir=C/'.build');os.close(fd);tmp=Path(filename)
 try:
  with src.open('rb')as inp,tmp.open('wb')as out:
   with gzip.GzipFile(filename='',mode='wb',fileobj=out,mtime=0,compresslevel=9)as z:
    for block in iter(lambda:inp.read(1024*1024),b''):z.write(block)
  h=hashlib.sha256();n=0
  with gzip.open(tmp,'rb')as z:
   for block in iter(lambda:z.read(1024*1024),b''):h.update(block);n+=len(block)
  assert h.hexdigest()==rawsha and n==rawlen
  assert digest(src)==(rawsha,rawlen),'goal changed during compression'
  zippedsha,zippedlen=digest(tmp)
  if target.exists():assert digest(target)==(zippedsha,zippedlen),'existing immutable archive mismatch'
  else:os.replace(tmp,target)
  index=C/'proof'/(a.isa+'-guarded-actual-goal-archive.json')
  result=dict(archival_identity_passed=True,whole_kernel_verified=False,proof_replayed=False,scope='byte-preserving compression of actual QCP goal; not a proof or a new C verification run',isa=a.isa,generation_status=str(receipt.relative_to(C)),generation_status_sha256=digest(receipt)[0],actual_C_fields=r['actual_C_fields'],original_goal_path=str(src),raw_sha256=rawsha,raw_bytes=rawlen,gzip_path=str(target.relative_to(C)),gzip_sha256=zippedsha,gzip_bytes=zippedlen,decompressed_identity_checked=True,ordinary_compilation_input='uncompressed original .v in a private run; compressed bytes are archival only')
  data=(json.dumps(result,indent=2)+'\n').encode()
  if index.exists():assert index.read_bytes()==data,'existing immutable index differs; retain both histories explicitly'
  else:index.write_bytes(data)
  print(json.dumps(result,indent=2))
 finally:
  if tmp.exists():tmp.unlink()
if __name__=='__main__':main()
