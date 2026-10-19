from pathlib import Path
import json,hashlib,re
D=Path(__file__).resolve().parent;R=D.parents[4]
source=R/'experiments/shim-c-v2/stage3-byte-fp-front-v2/controls/backend-debug01/generated/bytes_bytefloat_fma/canonical_nan_assert_copy_1_word_Why3_Z3_4_12_5.smt2'
sha=lambda b:hashlib.sha256(b).hexdigest()
s=source.read_text();names=['checked_decodeencode32','checked_encoderange32','checked_decodeencode64','checked_encoderange64'];ranges=[]
def sexp_end(text,start):
 depth=0;mode=None;i=start
 while i<len(text):
  c=text[i]
  if mode=='comment':
   if c=='\n':mode=None
  elif mode=='bar':
   if c=='|':mode=None
  elif mode=='string':
   if c=='"':
    if i+1<len(text) and text[i+1]=='"':i+=1
    else:mode=None
  elif c==';':mode='comment'
  elif c=='|':mode='bar'
  elif c=='"':mode='string'
  elif c=='(':depth+=1
  elif c==')':
   depth-=1
   if depth==0:return i+1
  i+=1
 raise ValueError('Unbalanced SMT')
for name in names:
 marker=';; "'+name+'"';assert s.count(marker)==1
 a=s.index(marker);b=s.index('(assert',a);assert s[a+len(marker):b].strip()==''
 end=sexp_end(s,b);assert s[b:end].startswith('(assert\n  (forall')
 ranges.append((a,end,name))
assert ranges==sorted(ranges)
chunks=[];previous=0
for a,b,n in ranges:chunks.append(s[previous:a]);previous=b
chunks.append(s[previous:]);new=''.join(chunks)
# Only the four explicitly named support propositions are removed. No rewrite.
recovered=new
for a,b,n in reversed(ranges):pass
prefix_end=s.index(';; Goal ');assert new[new.index(';; Goal '):]==s[prefix_end:]
assert 'fp.to_ieee_bv' not in new[new.index(';; Goal '):]
assert not any(';; "'+n+'"' in new for n in names)
(D/'original.smt2').write_text(s);(D/'without-global-codec.smt2').write_text(new)
(D/'removed.json').write_text(json.dumps([{'name':n,'source_start':a,'source_end':b,'text':s[a:b],'sha256':sha(s[a:b].encode())} for a,b,n in ranges],indent=2)+'\n')
metadata={'method':'Exact SMT assertion removal corresponding to logical premise deletion; NOT a Why3 inst_rem invocation','source':str(source),'source_sha256':sha(source.read_bytes()),'original_sha256':sha(s.encode()),'transformed_sha256':sha(new.encode()),'script_sha256':sha(Path(__file__).read_bytes()),'only_removed':names,'ground_codec_instances_needed':0,'goal_suffix_sha256':sha(s[prefix_end:].encode()),'goal_suffix_identical':True,'all_other_text_identical_by_construction':True,'solver_invoked':False,'model_snapshot_modified':False,'soundness_boundary':'Deleting assumptions strengthens the proof obligation. No new premise or axiom is inserted. A future UNSAT result must be checked with same pinned solver; this artifact is diagnostic only.'}
(D/'TRANSFORM.json').write_text(json.dumps(metadata,indent=2)+'\n')
z3=R/'experiments/shim-c-v2/handoff-solvers/.build/bin/z3';(D/'commands.json').write_text(json.dumps({'prepare':['python3',str(D/'prepare.py')],'root_original':[str(z3),'-smt2','-T:30',str(D/'original.smt2')],'root_transformed':[str(z3),'-smt2','-T:30',str(D/'without-global-codec.smt2')],'solver_sha256':sha(z3.read_bytes())},indent=2)+'\n');print(metadata)
