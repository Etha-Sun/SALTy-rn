"""Four explicit proof-only merges; no model, ordinary C or public spec edits."""
from pathlib import Path
import difflib,hashlib,json,re
ROOT=Path.cwd();BASE=ROOT/'experiments/integration-wave2/gemm-sparse'
assert not (BASE.parent/'QUOTA-STOP.json').exists()
assert not json.loads((BASE.parent/'quota-status.json').read_text())['closing']
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
KS=['f32-gemm-minmax','f32-igemm-minmax','qd8-f32-qc4w-gemm-minmax','f32-spmm-minmax']
SRC={'f32-gemm-minmax':'experiments/integration-review-v1/candidates/gemm-hybrid-v3', 'f32-igemm-minmax':'experiments/shim-c-v2/stage3-proof-next/dwconv/igemm-frame-r3','qd8-f32-qc4w-gemm-minmax':'experiments/shim-c-v2/stage3-proof-next/spmm/qd8-nibbles-r10','f32-spmm-minmax':'experiments/shim-c-v2/stage3-proof-next/spmm/neon-frame-v10'}
def decl(directory,name):
 for f in directory.glob('*'):
  if f.suffix not in ['.c','.h']:continue
  for b in re.findall(r'/\*@.*?\*/',f.read_text(),re.S):
   m=re.search(r'\b(?:lemma|predicate|logic\s+\w+)\s+'+name+r'\b',b)
   if not m:continue
   tail=b[m.start():];end=re.search(r'\b(?:lemma|predicate|logic)\s+|\\wp::|\*/',tail[m.end()-m.start():])
   text=tail[:m.end()-m.start()+end.start()] if end else tail
   return text.strip()
 raise RuntimeError('Missing '+name)
cong_names=['ext_neon_min_cong1','ext_neon_min_cong2','ext_neon_max_cong1','ext_neon_max_cong2']
congs=[decl(BASE/'f32-spmm-minmax/deepseek-annotated',n) for n in cong_names]
for k in KS:
 d=BASE/k;case=d/'case';draft=d/'draft';case.mkdir();draft.mkdir();taskold=ROOT/'experiments/deepseek-swarm-v1/kernel-tasks'/k
 f=json.loads(((ROOT/SRC[k]/'frozen.json') if k=='f32-gemm-minmax' else taskold/'case/frozen.json').read_text())
 seed=ROOT/SRC[k]/'.build/prepare01/annotated' if k=='f32-gemm-minmax' else d/'root10-annotated'
 texts={n:re.sub(r'^#line[^\n]*\n','',(seed/n).read_text(),flags=re.M) for n in f['files'] if n.endswith(('.c','.h','.driver'))}
 additions=list(congs);dsnames=list(cong_names);changes=[]
 if k=='f32-igemm-minmax':
  for n in ['ext_same_sym','ext_same_weak','ig_fma_congruence']:additions.append(decl(d/'deepseek-annotated',n));dsnames.append(n)
 if k=='f32-spmm-minmax':
  for n in ['ext_fma_cong_x','ext_fma_cong_y','sp_fma_swap']:additions.append(decl(d/'deepseek-annotated',n));dsnames.append(n)
 if k.startswith('qd8'):
  for n in ['core_wrap32','core_nibble','qc4_modulo_cast_add','qc4_byte_unsigned_view']:additions.append(decl(d/'deepseek-annotated',n));dsnames.append(n)
  additions+=['lemma hybrid_qc4_low_view: \\forall integer b;0<=b<256 ==> core_nibble(b,0)==stage3_signed_nibble(b%16);','lemma hybrid_qc4_high_view: \\forall integer b;0<=b<256 ==> core_nibble(b,1)==stage3_signed_nibble(b/16);']
 # Place after existing root10 header declarations, so nibble/FMA symbols are available.
 texts['fp_primitives.h']+='\n/*@\n '+'\n '.join(additions)+'\n*/\n'
 changes.append('Copy reviewed DeepSeek pure congruence/representation declarations and check all global lemmas, no assumptions.')
 if k=='f32-gemm-minmax':
  s=texts['neon.c']
  for v in re.findall(r'\b(vacc[0-3]x[01]) = vminq_f32',s):
   needle=f'    {v} = vminq_f32({v}, vmax);'
   cut=f'\n    /*@ assert wave2_neon_min_{v}: \\forall integer j;0<=j<4 ==> ext_same({v}.lane[j],ext_neon_min32(hybrid_pre_{v}.lane[j],vmax.lane[j])); */'
   assert needle in s;s=s.replace(needle,needle+cut,1)
  texts['neon.c']=s;changes.append('Split each actual NEON two-stage clamp with a proved-obligation min cut before max; existing final clamp/bridge cuts retained.')
 elif k in ['f32-igemm-minmax','f32-spmm-minmax']:
  s=texts['neon.c']
  if k=='f32-igemm-minmax':
   needle='    const float32x4_t vmax = vdupq_n_f32(params->scalar.max);'
   assert needle in s;s=s.replace(needle,'    //@ ghost float32x4_t wave2_pre0=vacc0x0,wave2_pre1=vacc0x1;\n'+needle)
   for v,pre in [('vacc0x0','wave2_pre0'),('vacc0x1','wave2_pre1')]:
    needle=f'    {v} = vminq_f32({v}, vmax);';s=s.replace(needle,needle+f'\n    /*@ assert wave2_ig_min_{v}: \\forall integer j;0<=j<4 ==> ext_same({v}.lane[j],ext_neon_min32({pre}.lane[j],vmax.lane[j])); */')
    needle=f'    {v} = vmaxq_f32({v}, vmin);';s=s.replace(needle,needle+f'\n    /*@ assert wave2_ig_clamp_{v}: \\forall integer j;0<=j<4 ==> ext_same({v}.lane[j],ext_neon_max32(ext_neon_min32({pre}.lane[j],vmax.lane[j]),vmin.lane[j])); */')
   for n in ['neon.c','rvv.c']:
    t=s if n=='neon.c' else texts[n]
    t=t.replace('stage3_nc: 0<nc<=NC && (NC-nc)%8==0','stage3_nc: 0<=nc<=NC && (nc>0 ==> (NC-nc)%8==0)')
    # Only outer block pointers cease being meaningful when tail sets nc=0.
    for x in ['a==A','c0==C+(NC-nc)','w==W+((NC-nc)/8)*(8+8*(KC/4)*(KS/sizeof(void*)))']:
     t=t.replace('loop invariant '+x+';','loop invariant nc>0 ==> ('+x+');',1)
    t=t.replace('stage3_positions: 0<p<=KS','stage3_positions: 0<=p<=KS');texts[n]=t
   changes.append('Actual NEON clamp min/final cuts, and allow nc/p==0 at genuine do/while exits without restricting wrapper domain.')
  else:
   needle='      float32x4_t vout0123 = vminq_f32(vacc0123, vmax);';assert needle in s
   s=s.replace(needle,needle+'\n      /*@ assert wave2_sp_min4: \\forall integer j;0<=j<4 ==> ext_same(vout0123.lane[j],ext_neon_min32(vacc0123.lane[j],vmax.lane[j])); */',1)
   needle='      vout0123 = vmaxq_f32(vout0123, vmin);';s=s.replace(needle,needle+'\n      /*@ assert wave2_sp_clamp4: \\forall integer j;0<=j<4 ==> ext_same(vout0123.lane[j],ext_neon_max32(ext_neon_min32(vacc0123.lane[j],vmax.lane[j]),vmin.lane[j])); */',1)
   s=s.replace('0<n<=nc','0<=n<=nc').replace('0<nnz<=','0<=nnz<=');texts['neon.c']=s
   changes.append('Actual NEON min/final clamp cuts and zero-inclusive do/while countdown bounds; body/input/output unchanged.')
 else:
  for n in ['neon.c','rvv.c']:
   t=texts[n].replace('stage3_nc: 0<nc<=NC && (NC-nc)%16==0','stage3_nc: 0<=nc<=NC && (nc>0 ==> (NC-nc)%16==0)')
   for x in ['a0==A','c0==C+(NC-nc)']:t=t.replace('loop invariant '+x+';','loop invariant nc>0 ==> ('+x+');',1)
   texts[n]=t
  needle='      vint16m4_t vxb_c0 = __riscv_vsext_vf2_i16m4(vb_c0, vl);'
  assert needle in texts['rvv.c'];texts['rvv.c']=texts['rvv.c'].replace(needle,'      /*@ assert wave2_qc4_low_fold_view: \\forall integer j;0<=j<vl ==> vb_c0.lane[j]==16*core_nibble((uint8_t)vb_c01.lane[j],0);\n          assert wave2_qc4_high_fold_view: \\forall integer j;0<=j<vl ==> vb_c1.lane[j]==16*core_nibble((uint8_t)vb_c01.lane[j],1); */\n'+needle)
  changes.append('Bridge ROOT10 actual nibble-extraction results to DeepSeek core_nibble fold vocabulary, with explicit checked assertions; preserve real AND/ghost body closure.')
 # ROOT10 only has semantic-free strategy blocks, except no blocks in spmm.
 removed=[]
 for n,t in list(texts.items()):
  def remove(m):
   block=m.group()
   if r'\wp::' not in block:return block
   assert block.startswith('/*@ \\wp::strategy'),(k,n,block[:90])
   assert not re.search(r'\b(?:assert|lemma|axiom|requires|ensures|assigns|invariant|variant|logic|predicate)\b',re.sub(r'"(?:\\.|[^"\\])*"','""',block))
   removed.append({'file':n,'sha256':hashlib.sha256(block.encode()).hexdigest()});return ''
  texts[n]=re.sub(r'/\*@.*?\*/',remove,t,flags=re.S)
 diffs=[]
 for n,t in texts.items():
  clean=(ROOT/f['files'][n]['path']).read_text();diffs.extend(difflib.unified_diff(clean.splitlines(True),t.splitlines(True),fromfile='a/'+n,tofile='b/'+n))
 (draft/'proof.patch').write_text(''.join(diffs));f['proof_patches']=[str((draft/'proof.patch').relative_to(ROOT))];f['wp_provers']='z3,cvc5';f['wp_budget']=1200
 (case/'frozen.json').write_text(json.dumps(f,indent=2)+'\n')
 task=json.loads((taskold/'task.json').read_text());task.update(task_id='wave2-'+k,case=str(case.relative_to(ROOT)),frozen_sha256=sha(case/'frozen.json'),source_case=SRC[k],source_frozen_sha256=None,wall_seconds=1200,agent_wall_seconds=1200,diagnostic_functions=['equivalent'],diagnostic_properties={'f32-gemm-minmax':['root86_weight_origin','root86_weight_entry_valid','next_w_frame_0','wave2_neon_min_vacc0x0','hybrid_neon_clamp_vacc0x0'],'f32-igemm-minmax':['igemm_entry_kc_equal','igemm_entry_kc_multiple','wave2_ig_min_vacc0x0','wave2_ig_clamp_vacc0x0'],'qd8-f32-qc4w-gemm-minmax':['stage3_low_nibble','stage3_high_nibble','wave2_qc4_low_fold_view','wave2_qc4_high_fold_view'],'f32-spmm-minmax':['spmm_origin_count','spmm_map_initial_value','wave2_sp_min4','wave2_sp_clamp4']}[k],readiness='candidate_pending_guard',sourceguard_exit=None)
 if k=='f32-gemm-minmax':
  task['framac']=str(ROOT/'experiments/shim-c-v2/model-front/frama-c.py');task['runner']=f['files']['model_runner.py']['path'];task['runner_sha256']=f['files']['model_runner.py']['sha256'];task['tool_hashes']={v['path']:v['sha256'] for n,v in f['files'].items() if n.endswith('.py')};task['tool_hashes'][task['framac']]=sha(Path(task['framac']))
 task['resources'].update(wp_timeout=f['wp_timeout'],wp_budget=1200)
 (d/'task.json').write_text(json.dumps(task,indent=2)+'\n')
 prov={'root10_revision':'101fc27d738d6bfd934730ef5aec055dca716542','root10_proof_source':SRC[k],'root10_proof_sha256':sha(d/'root10-seed.txt') if (d/'root10-seed.txt').exists() else sha(ROOT/SRC[k]/'proof.patch'),'deepseek_proof_sha256':sha(taskold/'draft/proof.patch'),'deepseek_pure_declarations':dsnames,'changes':changes,'removed_strategy_blocks':removed,'ordinary_C_spec_shim_model_driver_unchanged':True,'frozen_sha256':sha(case/'frozen.json'),'proof_sha256':sha(draft/'proof.patch'),'complete_kernel':False}
 (d/'provenance.json').write_text(json.dumps(prov,indent=2)+'\n');print(k,prov['frozen_sha256'],prov['proof_sha256'])
