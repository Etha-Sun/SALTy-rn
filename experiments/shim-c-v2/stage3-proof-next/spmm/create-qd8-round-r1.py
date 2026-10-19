from pathlib import Path
import shutil,json,hashlib,difflib,subprocess,sys
R=Path('/srv/home/yuechunsun/tools/lean/build/shim-c');H=Path(__file__).resolve().parent;old=R/'experiments/shim-c-v2/stage3-gemm/qd8-f32-qc4w-gemm-minmax-r2';c=H/'qd8-round-r1';c.mkdir();d=json.loads((old/'frozen.json').read_text());plain=c/'.build/plain';ann=c/'.build/edit';plain.mkdir(parents=True)
for name,item in d['files'].items():shutil.copyfile(R/item['path'],plain/name)
shutil.copytree(plain,ann)
for pp in d['proof_patches']:
 r=subprocess.run(['patch','-p1','-i',str(R/pp)],cwd=ann,text=True,capture_output=True);assert r.returncode==0,r.stdout+r.stderr
before={p.name:p.read_text() for p in ann.iterdir() if p.is_file()}
p=ann/'utils.c';s=p.read_text();s=s.replace('size_t round_up_po2(',r'''/*@ ensures qd8_round_range: q==2 && n<=SIZE_MAX-2 ==> n<=\result<=n+1;
    ensures qd8_round_even: q==2 && n<=SIZE_MAX-2 ==> \result%2==0;
    ensures qd8_round_count: q==2 && n<=SIZE_MAX-2 ==> \result==2*((n+1)/2);
    ensures qd8_round_positive: q==2 && 0<n<=SIZE_MAX-2 ==> 0<\result;
*/
size_t round_up_po2(''');p.write_text(s)
for fn in ['neon','rvv']:
 p=ann/(fn+'.c');s=p.read_text();s=s.replace('loop invariant stage3_even_kc:',f'loop invariant qd8_{fn}_even_kc:');s=s.replace('loop invariant stage3_k:',f'loop invariant qd8_{fn}_k:');s=s.replace(f'loop invariant qd8_{fn}_k: 0<=k<=KC && k%2==0;',f'''loop invariant qd8_{fn}_k: 0<=k<=KC && k%2==0;
        loop invariant qd8_{fn}_count: k/2+(KC-k)/2==KC/2;''');p.write_text(s)
patch=[];review=[]
for p in sorted(ann.iterdir()):
 if not p.is_file():continue
 review.extend(difflib.unified_diff(before[p.name].splitlines(True),p.read_text().splitlines(True),fromfile='r2/'+p.name,tofile='qd8-round-r1/'+p.name))
 for line in difflib.unified_diff((plain/p.name).read_text().splitlines(True),p.read_text().splitlines(True),fromfile='a/'+p.name,tofile='b/'+p.name):patch.append(line if line.endswith('\n') else line+'\n\\ No newline at end of file\n')
(c/'proof.patch').write_text(''.join(patch));(c/'REVIEW.diff').write_text(''.join(review));sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();d.update(name='qd8-round-r1',previous_version=str(old.relative_to(R)),proof_patches=[str((c/'proof.patch').relative_to(R))],proof_sha256=sha(c/'proof.patch'),stage3_revision='Conditional body ensures for actual round_up_po2, no new requires/assigns; two arithmetic loop count invariants; same frozen r2 files/model.')
d['stage3']['proof_sha256']=sha(c/'proof.patch');(c/'frozen.json').write_text(json.dumps(d,indent=2)+'\n');(c/'freeze-sha256.txt').write_text(sha(c/'frozen.json')+'\n')
sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
_,g=checker.prepare(c,sha(c/'frozen.json'),'guard01');(c/'source-guard.json').write_text(json.dumps(g,indent=2));assert g['passed'];print('source guard passed')
