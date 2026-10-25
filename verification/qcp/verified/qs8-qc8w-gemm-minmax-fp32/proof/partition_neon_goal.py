#!/usr/bin/env python3
"""Partition unchanged generated definitions, then audit exact reconstruction.
The raw QCP goal and full signature stay intact in proof/generated. Each
transparent aggregate alias refers to the literal definition in its partition.
This changes compilation units, never statements or required proof fields.
"""
from pathlib import Path
import argparse,re,json,hashlib,shutil,gzip
T=Path(__file__).resolve().parents[1];sha=lambda b:hashlib.sha256(b).hexdigest()
p=argparse.ArgumentParser();p.add_argument('--source',type=Path);p.add_argument('--verify',action='store_true');a=p.parse_args();M=T/'proof/neon-partition.json';O=T/'proof/coq/Qs8NeonGoals';A=T/'proof/coq/Qs8Neon/neon_goal.v';R=T/'proof/generated/neon_goal.v.gz'
if not a.verify:
 assert a.source and not M.exists();b=a.source.read_bytes();starts=list(re.finditer(rb'^Definition (\w+) :=',b,re.M));end=b.index(b'Module Type VC_Correct.');head=b[:starts[0].start()];tail=b[end:];groups=[];seen=set();allnames={m.group(1).decode()for m in starts}
 for i,m in enumerate(starts):
  name=m.group(1).decode();base=re.sub(r'_(pure|aux)$','',name);data=b[m.start():starts[i+1].start()if i+1<len(starts)else end]
  if not groups or groups[-1]['base']!=base:
   seen.add(base);groups.append({'base':base,'defs':[],'data':b''})
  groups[-1]['defs'].append(name);groups[-1]['data']+=data
 owner={n:i for i,g in enumerate(groups)for n in g['defs']};O.mkdir(parents=True,exist_ok=False);A.parent.mkdir(exist_ok=True);R.parent.mkdir(exist_ok=True);R.write_bytes(gzip.compress(b,compresslevel=9,mtime=0));records=[]
 for i,g in enumerate(groups):
  refs=set(re.findall(rb'\btest_neon_[A-Za-z0-9_]+\b',g['data']));deps=sorted({owner[n.decode()]for n in refs if n.decode()in owner and owner[n.decode()]!=i});assert all(j<i for j in deps),deps
  pre=head+b''.join(f'From Qs8NeonGoals Require Export G{j:04d}.\n'.encode()for j in deps)
  f=O/f'G{i:04d}.v';f.write_bytes(pre+g['data']);records.append({'module':f'G{i:04d}','file':str(f.relative_to(T)),'definitions':g['defs'],'dependencies':[f'G{j:04d}'for j in deps],'prefix_bytes':len(pre),'definition_bytes':len(g['data']),'definition_sha256':sha(g['data']),'source_sha256':sha(f.read_bytes())})
 aggregate=head+b''.join(f'From Qs8NeonGoals Require Export G{i:04d}.\n'.encode()for i in range(len(groups)))+b''.join(f'Definition {n} := G{i:04d}.{n}.\n'.encode()for i,g in enumerate(groups)for n in g['defs'])+tail;A.write_bytes(aggregate)
 D={'kind':'literal_generated_definition_partition','raw':str(R.relative_to(T)),'raw_compression':'gzip','raw_compressed_sha256':sha(R.read_bytes()),'raw_compressed_bytes':R.stat().st_size,'raw_sha256':sha(b),'raw_bytes':len(b),'header_bytes':len(head),'trailer_offset':end,'header_sha256':sha(head),'trailer_sha256':sha(tail),'aggregate':str(A.relative_to(T)),'aggregate_sha256':sha(aggregate),'definitions':len(starts),'required_fields':len(re.findall(rb'^Axiom proof_of_',tail,re.M)),'parts':records};M.write_text(json.dumps(D,indent=2)+'\n')
D=json.loads(M.read_text());packed=(T/D['raw']).read_bytes();assert D.get('raw_compression')!='gzip' or sha(packed)==D['raw_compressed_sha256'];b=gzip.decompress(packed)if D.get('raw_compression')=='gzip'else packed;assert sha(b)==D['raw_sha256'];head=b[:D['header_bytes']];tail=b[D['trailer_offset']:];rebuilt=bytearray(head);aliases=[];imports=[];names=[]
for row in D['parts']:
 s=(T/row['file']).read_bytes();pre=head+b''.join(f'From Qs8NeonGoals Require Export {n}.\n'.encode()for n in row['dependencies']);assert s.startswith(pre)and len(pre)==row['prefix_bytes'];data=s[len(pre):];assert sha(s)==row['source_sha256']and sha(data)==row['definition_sha256'];rebuilt.extend(data);names+=row['definitions'];imports.append(f"From Qs8NeonGoals Require Export {row['module']}.\n".encode());aliases +=[f"Definition {n} := {row['module']}.{n}.\n".encode()for n in row['definitions']]
rebuilt.extend(tail);assert bytes(rebuilt)==b;assert len(names)==len(set(names))==D['definitions'];aggregate=head+b''.join(imports)+b''.join(aliases)+tail;assert (T/D['aggregate']).read_bytes()==aggregate and sha(aggregate)==D['aggregate_sha256'];assert len(re.findall(rb'^Axiom proof_of_',tail,re.M))==D['required_fields']
print('Literal reconstruction exact:',D['definitions'],'definitions,',D['required_fields'],'required fields,',len(D['parts']),'independent partitions')
