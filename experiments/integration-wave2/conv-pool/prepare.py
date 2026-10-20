import json,pathlib,subprocess,hashlib,shutil,difflib,re
R=pathlib.Path.cwd(); O=R/'experiments/integration-wave2/conv-pool'; DS=R/'experiments/deepseek-swarm-v1/kernel-tasks'; REV='101fc27d738d6bfd934730ef5aec055dca716542'
def git(p):return subprocess.check_output(['git','show',REV+':'+p])
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
remote={'f32-conv-hwc2chw':'experiments/shim-c-v2/stage3-proof-next/dwconv/conv-cursor-inline-r4','f32-dwconv-minmax':'experiments/shim-c-v2/stage3-proof-next/dwconv/frame-root45','f32-dwconv2d-chw':'experiments/shim-c-v2/stage3-proof-next/dwconv/root30','f32-maxpool':'experiments/shim-c-v2/stage3-pool-spmm/f32-maxpool-step-v3','f32-argmaxpool':'experiments/shim-c-v2/stage3-target-fixes/f32-argmaxpool-tail-v1'}
if any(O.glob('*/frozen.json')):
 raise SystemExit('Seed import already materialized; preserve current proof drafts and recorded attempts. Do not rerun over them.')
for k,rs in remote.items():
 d=O/k;
 d.mkdir(exist_ok=True); (d/'inputs').mkdir(exist_ok=True);(d/'remote').mkdir(exist_ok=True);(d/'deepseek').mkdir(exist_ok=True)
 rf=json.loads(git(rs+'/frozen.json')); (d/'remote/frozen.json').write_text(json.dumps(rf,indent=2)+'\n')
 rp=b''.join(git(p) for p in rf['proof_patches']);(d/'remote/proof.patch').write_bytes(rp)
 base=json.loads((DS/k/'case/frozen.json').read_text())
 if k=='f32-argmaxpool':
  for n in ['neon.c','rvv.c','spec.h','harness.c']:
   data=(R/'experiments/integration-review-v1/argmax-import'/rs/n).read_bytes(); p=d/'inputs'/n;p.write_bytes(data);base['files'][n]={'path':str(p.relative_to(R)),'sha256':sha(p)}
 # All ordinary files stay pinned, only argmax uses separately reviewed repaired input.
 for n,v in base['files'].items():
  if (R/v['path']).resolve()!=(d/'inputs'/n).resolve():shutil.copyfile(R/v['path'],d/'inputs'/n)
 for n,v in rf['files'].items():
  if pathlib.Path(n).suffix in ['.c','.h'] or n.endswith('.driver'):
   (d/'remote'/n).write_bytes(git(v['path']))
 subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(d/'remote/proof.patch')],cwd=d/'remote',check=True,capture_output=True)
 for n in base['files']:shutil.copyfile(d/'inputs'/n,d/'deepseek'/n)
 if (DS/k/'draft/proof.patch').exists():
  dp=DS/k/'draft/proof.patch';subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(dp)],cwd=d/'deepseek',check=True,capture_output=True)
 changes=[]
 if k=='f32-conv-hwc2chw':
  # Remote RVV source predates the independent right-edge repair: keep the entire DS target annotation.
  chosen={n:(d/'deepseek'/n).read_text() for n in base['files'] if pathlib.Path(n).suffix in ['.c','.h']}
  for n,s in list(chosen.items()):
   s=s.replace(r'\valid_read(&a.lane[i]+(0..3))',r'\valid_read((unsigned char*)&a.lane[i]+(0..3))').replace(r'\valid(&a.lane[i]+(0..3))',r'\valid((unsigned char*)&a.lane[i]+(0..3))')
   chosen[n]=s
  changes+=['Correct ci_read_src_valid/ci_write_dst_valid from four int32 lanes to four bytes; retain independently repaired RVV source.','ROOT10 cursor/integer proof structure already present in DS baseline; retain local revised source annotations.']
 else:
  chosen={n:(d/'remote'/n).read_text() if (d/'remote'/n).exists() else (d/'inputs'/n).read_text() for n in base['files'] if pathlib.Path(n).suffix in ['.c','.h']}
  if k!='f32-argmaxpool':
   ds=(d/'deepseek/fp_primitives.h').read_text();target=chosen['fp_primitives.h']; added=[]
   for m in re.finditer(r'/\*@.*?\*/',ds,re.S):
    block=m.group();names=re.findall(r'\blemma\s+(\w+)',block)
    if names and all(re.search(r'\blemma\s+'+re.escape(name)+r'\b',target) is None for name in names):
     if k=='f32-maxpool' and any(n.startswith('core_pool_') for n in names) or k=='f32-dwconv-minmax' and any(n in ['ext_fma_congruence3','ext_add_congruence1','ext_add_congruence2','ext_max_congruence1','ext_min_congruence1'] for n in names):
      target+='\n'+block+'\n';added+=names
   if k=='f32-dwconv-minmax':
    for line in ds.splitlines():
     m=re.match(r'\s*lemma (\w+):.*',line)
     if m and m.group(1) in ['ext_fma_congruence3','ext_add_congruence1','ext_add_congruence2','ext_max_congruence1','ext_min_congruence1'] and m.group(1) not in added:
      target+='\n/*@ '+line.strip()+' */\n';added.append(m.group(1))
   chosen['fp_primitives.h']=target;changes+=['ROOT10 full annotation seed with local approved model.', 'DeepSeek pure congruence lemma additions: '+','.join(added)]
  else: changes+=['ROOT10 repaired-tail proof, independently rebound to local approved native Bytes-v6 FMA model; preserve exact repaired C/spec.']
 # Drop duplicate consecutive #line directives from repeated ROOT10 preparations.
 for n,s in list(chosen.items()):chosen[n]=re.sub(r'(^#line [^\n]*\n)(?:\1)+',r'\1',s,flags=re.M)
 # Standalone unchanged spec never appears in patch.
 patch=''
 for n,s in chosen.items():
  plain=(d/'inputs'/n).read_text()
  if s!=plain:patch+=''.join(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n' for line in difflib.unified_diff(plain.splitlines(True),s.splitlines(True),fromfile='a/'+n,tofile='b/'+n))
 (d/'proof.patch').write_text(patch)
 base['proof_patches']=[str((d/'proof.patch').relative_to(R))];base['integration_wave2']={'remote':REV,'remote_case':rs,'deepseek_draft_sha256':sha(DS/k/'draft/proof.patch') if (DS/k/'draft/proof.patch').exists() else None,'changes':changes,'old_results_inherited':False};base['wp_budget']=min(1200,base.get('wp_budget',1200))
 (d/'frozen.json').write_text(json.dumps(base,indent=2)+'\n');(d/'seed.json').write_text(json.dumps({'kernel':k,'changes':changes,'proof_sha256':sha(d/'proof.patch'),'frozen_sha256':sha(d/'frozen.json')},indent=2)+'\n')
 print(k,len(patch),changes)
