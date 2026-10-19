from pathlib import Path
import hashlib,json,subprocess,shutil,importlib.util
HERE=Path(__file__).resolve().parent;ROOT=HERE.parents[2]
base_model=HERE/'model-native-bytes32';model=HERE/'model-native-bytes32-z3'
if not model.exists():
 model.mkdir()
 s=(base_model/'frama-c.py').read_text().replace("install=here/'.build/install'","install=here.parent/'model-native-bytes32/.build/install'")
 s=s.replace("else:args+=['-wp-share',str(here/'wp-share')]","else:args+=['-wp-share',str(here.parent/'model-native-bytes32/wp-share')]")
 s=s.replace("here/'wp-share'","here.parent/'model-native-bytes32/wp-share'")
 s=s.replace("str(here/'libc')","str(here.parent/'model-native-bytes32/libc')")
 s=s.replace("install=here.parent", "args += ['-wp-driver',str(here/'acsl-bits.driver')]\ninstall=here.parent")
 (model/'frama-c.py').write_text(s);(model/'frama-c.py').chmod(0o755)
 (model/'why3.conf').write_text((base_model/'why3.conf').read_text().split('\n[prover]\nname = "CVC5"')[0]+'\n')
 (model/'acsl-bits.driver').write_text('library cfloat:\nlogic float32 "from_repr32"(integer) = "repr_decode32";\nlogic integer "repr32"(float32) = "repr_encode32";\n')
 lock=json.loads((base_model/'float_model_lock.json').read_text());lock['version']='experimental-native-bytes32-z3-acsl-bridge-v1';lock['provers']=['z3'];lock['why3_config']=str((model/'why3.conf').relative_to(ROOT));lock['qualification']='experimental, Z3 extension encoder; independent root replay pending'
 for p in [model/'frama-c.py',model/'why3.conf',model/'acsl-bits.driver']:
  lock['files'][str(p.relative_to(ROOT))]=hashlib.sha256(p.read_bytes()).hexdigest()
 (model/'float_model_lock.json').write_text(json.dumps(lock,indent=2)+'\n')
old=ROOT/'experiments/shim-c-v2/v4-campaign/f32-vlrelu';case=HERE/'f32-vlrelu-native-bytes';case.mkdir(exist_ok=True)
m=json.loads((old/'frozen.json').read_text());work=HERE/'candidate-lrelu-source';plain=work/'plain';annotated=work/'annotated'
if work.exists():shutil.rmtree(work)
plain.mkdir(parents=True);annotated.mkdir()
for name,entry in m['files'].items():
 p=ROOT/entry['path'];assert hashlib.sha256(p.read_bytes()).hexdigest()==entry['sha256']
 shutil.copyfile(p,plain/name);shutil.copyfile(p,annotated/name)
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=annotated,check=True,stdout=subprocess.DEVNULL)
p=annotated/'extensions.h';s=p.read_text().replace('logic float fp_sub32(float a,float b);','logic float fp_sub32(float a,float b) = \\sub_float(a,b);')
s=s.replace('/*@ assigns \\nothing; ensures \\result==repr32(x); */','/*@ assigns \\nothing; ensures same_float(from_repr32(\\result),x);\n    ensures !\\is_NaN(x) ==> \\result==repr32(x); */')
s=s.replace('logic float unary_value(float x,float s) = repr32(x)<2147483648 ? x : fp_mul32(x,s);','logic float unary_value(float x,float s) = \\sign(x)==\\Negative ? fp_mul32(x,s) : x;\n  lemma nan_mul_left: \\forall float x,s; \\is_NaN(x) ==> \\is_NaN(fp_mul32(x,s));\n  lemma same_float_trans: \\forall float a,b,c; same_float(a,b) && same_float(b,c) ==> same_float(a,c);')
p.write_text(s)
p=annotated/'bits.c';s=p.read_text();lines=s.splitlines()
for n,line in enumerate(lines):
 if 'vreinterpretq_s32_f32(' in line or '__riscv_vreinterpret_v_f32m8_i32m8(' in line:
  for j in [n-1,n]:
   text=lines[j]
   for obj in ['r','\\result']:
    expr=obj+'.lane[j]==(repr32(a.lane[j])<2147483648?repr32(a.lane[j]):repr32(a.lane[j])-4294967296)'
    text=text.replace(expr,'(\\is_NaN(a.lane[j]) || '+expr+')')
   lines[j]=text
idx=next(i for i,x in enumerate(lines) if 'float32x4_t vbslq_f32(' in x)
post=lambda obj,j: '(m.lane['+j+']==0 ==> same_float('+obj+'.lane['+j+'],b.lane['+j+'])) && (m.lane['+j+']==4294967295 ==> same_float('+obj+'.lane['+j+'],a.lane['+j+']))'
lines[idx-1]='/*@ assigns \\nothing; ensures \\forall integer j; 0<=j<4 ==> '+post('\\result','j')+'; */'
raw=next(x for x in (plain/'bits.c').read_text().splitlines() if 'float32x4_t vbslq_f32(' in x)
loop='/*@ loop invariant 0<=i<=4; loop invariant \\forall integer j; 0<=j<i ==> '+post('r','j')+'; loop assigns i,r.lane[0..3]; loop variant 4-i; */ '
lines[idx]=raw.replace('for(size_t i=0;i<4;i++)',loop+'for(size_t i=0;i<4;i++)')
p.write_text('\n'.join(lines)+'\n')
p=annotated/'representation.c';s=p.read_text();s=s.replace('memcpy(&u,&x,4); return u;','memcpy(&u,&x,4); /*@ assert bits_copied: u == *(uint32_t*)&x; */ return u;').replace('memcpy(&x,&u,4); return x;','memcpy(&x,&u,4); /*@ assert word_copied: *(uint32_t*)&x == u; */ return x;');p.write_text(s)
sp=importlib.util.spec_from_file_location('guard',ROOT/'verified/qs8-rsum/build.py');guard=importlib.util.module_from_spec(sp);sp.loader.exec_module(guard)
parts=[]
for p in sorted(plain.iterdir()):
 q=annotated/p.name
 if p.suffix in {'.h','.c'}:assert guard.raw_c_tokens(p.read_text())==guard.raw_c_tokens(q.read_text()),p
 if p.read_bytes()==q.read_bytes():continue
 a=subprocess.run(['diff','-u','--label','a/'+p.name,'--label','b/'+p.name,str(p),str(q)],stdout=subprocess.PIPE);assert a.returncode==1;parts.append(a.stdout)
(case/'proof.patch').write_bytes(b''.join(parts));m['proof_patches']=[str((case/'proof.patch').relative_to(ROOT))]
m['files']['float_model_lock.json']={'path':str((model/'float_model_lock.json').relative_to(ROOT)),'sha256':hashlib.sha256((model/'float_model_lock.json').read_bytes()).hexdigest()}
m.update(model='Bytes',wp_share=str((base_model/'wp-share').relative_to(ROOT)),wp_why3_config=str((model/'why3.conf').relative_to(ROOT)),wp_provers='z3',previous_version=str(old.relative_to(ROOT)),candidate_scope='Experimental independent IEEE32 Bytes model; exact source/spec freeze; NaN payload observation unchanged; no admission yet.')
(case/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');print('case_sha',hashlib.sha256((case/'frozen.json').read_bytes()).hexdigest());print('model_sha',m['files']['float_model_lock.json']['sha256'])
