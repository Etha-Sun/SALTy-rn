import pathlib,json,hashlib,difflib,shutil
R=pathlib.Path.cwd();P=R/'experiments/integration-wave2';assert not (P/'QUOTA-STOP.json').exists();src=P/'vcmul-memory/v01';d=P/'vcmul-memory/v02';(d/'case').mkdir(parents=True);(d/'draft').mkdir();(d/'work').mkdir();cfg=json.load(open(src/'task.json'));f=json.load(open(src/'case/frozen.json'))
for n in ['neon.c','rvv.c','harness.c','complex_fp.c','complex_fp.h','spec.h','unit.c']:shutil.copyfile(src/'work'/n,d/'work'/n)
for name,label in [('neon.c','cx_neon_entry'),('rvv.c','cx_rvv_entry')]:
 p=d/'work'/name;s=p.read_text();needle='  //@ ghost float *cx_o=output;';assert needle in s;s=s.replace(needle,needle+'\n  /*@ ghost '+label+': ; */')
 inv='''      loop invariant memory_length: 0<cx_total<=SIZE_MAX/16-3;
      loop invariant memory_a_origin: cx_a==\\at(cx_a,LABEL);
      loop invariant memory_b_origin: cx_b==\\at(cx_b,LABEL);
      loop invariant memory_o_origin: cx_o==\\at(cx_o,LABEL);
      loop invariant memory_n_origin: cx_total==\\at(cx_total,LABEL);
      loop invariant memory_a_separated: \\separated(cx_a+(0..2*cx_total+2),cx_o+(0..2*cx_total-1));
      loop invariant memory_b_separated: \\separated(cx_b+(0..2*cx_total+2),cx_o+(0..2*cx_total-1));
      loop invariant memory_halves_separated: \\separated(cx_o+(0..cx_total-1),cx_o+(cx_total..2*cx_total-1));
      loop invariant memory_a_unchanged: \\forall integer j;0<=j<2*cx_total+3 ==> cx_same_float(cx_a[j],\\at(cx_a[j],LABEL));
      loop invariant memory_b_unchanged: \\forall integer j;0<=j<2*cx_total+3 ==> cx_same_float(cx_b[j],\\at(cx_b[j],LABEL));
'''.replace('LABEL',label)
 needle='      loop invariant \\valid_read(cx_a+';assert needle in s;s=s.replace(needle,inv+needle)
 if name=='rvv.c':
  needle='    __riscv_vse32_v_f32m4(out_r, vaccr, vl);'
  block='''    /*@ assert memory_output_real_valid: \\valid(out_r+(0..vl-1)); */
    /*@ assert memory_output_imag_valid: \\valid(out_i+(0..vl-1)); */
    /*@ assert memory_output_blocks_separated: \\separated(out_r+(0..vl-1),out_i+(0..vl-1)); */
''';assert needle in s;s=s.replace(needle,block+needle)
 p.write_text(s)
p=d/'work/harness.c';s=p.read_text();needle='  /*@ loop invariant 0<=i<=2*n;';assert needle in s;s=s.replace(needle,'  /*@ loop invariant 0<=i<=2*n;\n      loop invariant memory_equal_all: \\forall integer j;0<=j<2*n ==> cx_same_value(left[j],right[j]);');p.write_text(s)
patch=''
for n,v in f['files'].items():
 p=d/'work'/n
 if not p.exists():continue
 plain=(R/v['path']).read_text();annotated=p.read_text()
 if plain!=annotated:patch+=''.join(l if l.endswith('\n') else l+'\n\\ No newline at end of file\n' for l in difflib.unified_diff(plain.splitlines(True),annotated.splitlines(True),fromfile='a/'+n,tofile='b/'+n))
(d/'draft/proof.patch').write_text(patch);f['proof_patches']=[str((d/'draft/proof.patch').relative_to(R))];f['memory_wave2_seed']['proof_sha256']=hashlib.sha256((src/'draft/proof.patch').read_bytes()).hexdigest();f['previous_candidate']=str(src.relative_to(R));(d/'case/frozen.json').write_text(json.dumps(f,indent=2)+'\n');cfg['case']=str((d/'case').relative_to(R));cfg['frozen_sha256']=hashlib.sha256((d/'case/frozen.json').read_bytes()).hexdigest();cfg['wall_seconds']=1250;cfg['diagnostic_functions']=['equivalent'];cfg['diagnostic_properties']=[];(d/'task.json').write_text(json.dumps(cfg,indent=2)+'\n')
(d/'changes.json').write_text(json.dumps({'proof_only':True,'base':'noncomplex/f32-vcmul/v07','changes':['Real kernel entry ghost labels after input snapshots; no wrapper Pre for local values','Carry actual input/output and half-output separation through both loops','Carry unchanged input values and pointer/length origins through both loops','Make both RVV output range validity and block separation explicit before stores','Make wrapper all-output equality an invariant whose establishment must be proved'],'upstream_unproved':['Three actual uintptr initial half-pointer equalities remain as independent VCs; never assumed as public precondition'],'proof_sha256':hashlib.sha256(patch.encode()).hexdigest()},indent=2)+'\n')
print(cfg['frozen_sha256'])
