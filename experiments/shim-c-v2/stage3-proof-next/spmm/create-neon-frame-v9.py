from pathlib import Path
import shutil,json,hashlib,difflib,subprocess,sys
R=Path('/srv/home/yuechunsun/tools/lean/build/shim-c');H=Path(__file__).resolve().parent;old=H/'neon-frame-v8';c=H/'neon-frame-v9';c.mkdir();d=json.loads((old/'frozen.json').read_text());plain=c/'.build/plain';ann=c/'.build/edit';plain.mkdir(parents=True)
for name,item in d['files'].items():shutil.copyfile(R/item['path'],plain/name)
shutil.copytree(plain,ann)
for pp in d['proof_patches']:
 result=subprocess.run(['patch','-p1','-i',str(R/pp)],cwd=ann,text=True,capture_output=True);assert result.returncode==0,result.stdout+result.stderr
p=ann/'neon.c';s=p.read_text();original_rvv=s
s=s.replace('    //@ ghost float *spn_column_4=output;','    //@ ghost float *spn_column_4=output;\n    //@ assert spn_entry_n4: n==nc;\n    //@ assert spn_entry_zero4: (nc-n)*(spn_MC/4+4)==0;',1)
p.write_text(s);patch=[]
for p in sorted(ann.iterdir()):
 if not p.is_file():continue
 for line in difflib.unified_diff((plain/p.name).read_text().splitlines(True),p.read_text().splitlines(True),fromfile='a/'+p.name,tofile='b/'+p.name):patch.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(c/'proof.patch').write_text(''.join(patch));sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();d.update(name='spmm-neon-frame-v9',previous_version=str(old.relative_to(R)),proof_patches=[str((c/'proof.patch').relative_to(R))],proof_sha256=sha(c/'proof.patch'),wp_timeout=30,wp_budget=1200,stage3_revision='Two checked entry arithmetic cuts for the original four-lane cursor establishment; preservation and pointer/frame debts retained; no new requires.')
d['stage3']['previous_candidate_frozen_sha256']=sha(old/'frozen.json');d['stage3']['proof_sha256']=sha(c/'proof.patch');(c/'frozen.json').write_text(json.dumps(d,indent=2)+'\n');(c/'freeze-sha256.txt').write_text(sha(c/'frozen.json')+'\n');(c/'REVIEW.diff').write_text(''.join(difflib.unified_diff(original_rvv.splitlines(True),s.splitlines(True),fromfile='v8/neon.c',tofile='v9/neon.c')))
sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
_,g=checker.prepare(c,sha(c/'frozen.json'),'guard01');(c/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n');assert g['passed'];print('source guard passed')
