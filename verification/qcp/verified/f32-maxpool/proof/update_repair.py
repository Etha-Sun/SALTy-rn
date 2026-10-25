#!/usr/bin/env python3
"""Rebuild the reviewable original-to-current patch and check exact replay."""
from pathlib import Path
import difflib,hashlib,json,shutil,subprocess,tempfile
C=Path(__file__).resolve().parents[1]
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
def diff(old,new,source,target):
 return ''.join(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n' for line in difflib.unified_diff(old.splitlines(True),new.splitlines(True),fromfile=source,tofile=target))
def main():
 p=C/'proof/repair.json';j=json.loads(p.read_text());patch='';paths=[]
 for isa in ['NEON','RVV']:
  rel='impl/test'+isa+'.c';paths.append(rel);patch+=diff((C/'proof/original'/('test'+isa+'.c')).read_text(),(C/rel).read_text(),'a/'+rel,'b/'+rel)
 for rel in j['added_helpers']:paths.append(rel);patch+=diff('',(C/rel).read_text(),'/dev/null','b/'+rel)
 dest=C/'proof/repair.patch';dest.write_text(patch);r=Path(tempfile.mkdtemp(prefix='exact-patch-',dir=C/'.build'));(r/'impl').mkdir();(r/'shim').mkdir()
 for isa in ['NEON','RVV']:shutil.copy2(C/'proof/original'/('test'+isa+'.c'),r/'impl'/('test'+isa+'.c'))
 cmd=['patch','--fuzz=0','-p1','-i',str(dest)];x=subprocess.run(cmd,cwd=r,text=True,stdout=subprocess.PIPE,stderr=subprocess.STDOUT);(r/'patch.log').write_text(x.stdout);assert x.returncode==0,x.stdout
 for rel in paths:assert(C/rel).read_bytes()==(r/rel).read_bytes(),rel
 j['repaired_sha256']={isa:sha(C/'impl'/('test'+isa+'.c'))for isa in ['NEON','RVV']};j['added_helpers']={rel:sha(C/rel)for rel in j['added_helpers']};j['patch_sha256']=sha(dest);j['patch_replay_directory']=str(r);j['patch_exact_application_checked']=True;p.write_text(json.dumps(j,indent=2)+'\n');(r/'status.json').write_text(json.dumps(dict(passed=True,command=cmd,patch_sha256=sha(dest),replayed_sha256={rel:sha(r/rel)for rel in paths}),indent=2)+'\n');print(r)
if __name__=='__main__':main()
