import pathlib,json,hashlib,difflib,shutil
R=pathlib.Path.cwd();P=R/'experiments/integration-wave2';assert not (P/'QUOTA-STOP.json').exists();src=P/'vcmul-memory/v02';d=P/'vcmul-memory/v03';(d/'case').mkdir(parents=True);(d/'draft').mkdir();(d/'work').mkdir();cfg=json.load(open(src/'task.json'));f=json.load(open(src/'case/frozen.json'))
for n in ['neon.c','rvv.c','harness.c','complex_fp.c','complex_fp.h','spec.h','unit.c']:shutil.copyfile(src/'work'/n,d/'work'/n)
for n,label in [('neon.c','cx_neon_entry'),('rvv.c','cx_rvv_entry')]:
 p=d/'work'/n;s=p.read_text();inv='''      loop invariant memory_a_entry_valid: \\valid_read{LABEL}(\\at(cx_a,LABEL)+(0..2*\\at(cx_total,LABEL)+2));
      loop invariant memory_b_entry_valid: \\valid_read{LABEL}(\\at(cx_b,LABEL)+(0..2*\\at(cx_total,LABEL)+2));
      loop invariant memory_o_entry_valid: \\valid{LABEL}(\\at(cx_o,LABEL)+(0..2*\\at(cx_total,LABEL)-1));
'''.replace('LABEL',label);s=s.replace('      loop invariant memory_length:',inv+'      loop invariant memory_length:');p.write_text(s)
patch=''
for n,v in f['files'].items():
 p=d/'work'/n
 if not p.exists():continue
 a=(R/v['path']).read_text();b=p.read_text()
 if a!=b:patch+=''.join(l if l.endswith('\n') else l+'\n\\ No newline at end of file\n' for l in difflib.unified_diff(a.splitlines(True),b.splitlines(True),fromfile='a/'+n,tofile='b/'+n))
(d/'draft/proof.patch').write_text(patch);f['proof_patches']=[str((d/'draft/proof.patch').relative_to(R))];f['previous_candidate']=str(src.relative_to(R));(d/'case/frozen.json').write_text(json.dumps(f,indent=2)+'\n');cfg['case']=str((d/'case').relative_to(R));cfg['frozen_sha256']=hashlib.sha256((d/'case/frozen.json').read_bytes()).hexdigest();cfg['wall_seconds']=650;cfg['diagnostic_properties']=['memory_a_entry_valid','memory_b_entry_valid','memory_o_entry_valid','memory_a_unchanged','memory_b_unchanged','@requires','@assigns'];(d/'task.json').write_text(json.dumps(cfg,indent=2)+'\n');(d/'changes.json').write_text(json.dumps({'proof_only':True,'change':'Carry real kernel-entry validity of both input arrays and output across loops, to expose freshness/separation against local returned-struct temporaries','conditional_boundary':'Three uintptr initial pointer equalities remain unproved and unchanged; no claim of full or unconditional body closure','proof_sha256':hashlib.sha256(patch.encode()).hexdigest()},indent=2)+'\n')
