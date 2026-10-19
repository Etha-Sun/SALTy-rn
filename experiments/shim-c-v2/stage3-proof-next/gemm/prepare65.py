from pathlib import Path
import sys,json,hashlib,subprocess,tempfile,difflib
H=Path(__file__).resolve().parent;R=H.parents[3];sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
old=H/'candidate62';new=H/'candidate65';new.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();m=json.loads((old/'frozen.json').read_text());t=Path(tempfile.mkdtemp(prefix='gemm-fix-',dir='/tmp'));plain={}
for n,v in m['files'].items():plain[n]=(R/v['path']).read_text();(t/n).write_text(plain[n])
subprocess.run(['patch','--batch','--fuzz=0','-p1','-i',str(old/'proof.patch')],cwd=t,capture_output=True,check=True)
p=t/'neon.c';s=p.read_text()
ref='next_read{Stage3Block}(A0,(KC-k)/4+1)'
needle='      /*@ assert next_fma_second_pre_a0:'
assert s.count(needle)==1
s=s.replace(needle,'      /*@ assert next_second_source: ext_same(va0.lane[1],'+ref+'); */\n'+needle)
for j in range(4):
 needle=f'      /*@ assert next_fma_second_pre_a{j}:'
 assert s.count(needle)==1
 actual=f'va0c1.lane[{j}],va0.lane[1],va0.lane[1]'
 bridge=f'      /*@ assert next_second_dup{j}: ext_same(va0c1.lane[{j}],va0.lane[1]); */\n'
 bridge+=f'      /*@ ghost next_splat_transport({actual}); */\n'
 bridge+=f'      /*@ assert next_second_join{j}: next_splat_join({actual},{ref}); */\n'
 s=s.replace(needle,bridge+needle)

import re
loads=list(re.finditer(r'(?m)^(?P<pad>[ \t]*)(?:const\s+)?float32x4_t\s+vacc0x1\s*=\s*vld1q_f32\((?P<ptr>[^;\n]+)\);',s));assert len(loads)==1
m=loads[0];pad=m['pad'];ptr=m['ptr']
loadcuts=''.join(f'\n{pad}/*@ assert next_high_bias_load_{j}: ext_same(vacc0x1.lane[{j}],({ptr})[{j}]); */' for j in range(4));s=s[:m.end()]+loadcuts+s[m.end():]
comments=list(re.finditer(r'/\*@(?:(?!\*/)[\s\S])*\*/',s));blocks=[m for m in comments if re.search(r'loop invariant next_high_inv_0\s*:',m.group())];assert len(blocks)==1;m=blocks[0]
refs=''.join(f'/*@ assert next_high_bias_ref_{j}: ext_same(vacc0x1.lane[{j}],stage3_gacc{{Stage3Block}}(A0,W0,0,(NC-nc)/8,{4+j},0,KC/4)); */\n      ' for j in range(4));s=s[:m.start()]+refs+s[m.start():]
p.write_text(s)

d=[]
for n in m['files']:
 for x in difflib.unified_diff(plain[n].splitlines(True),(t/n).read_text().splitlines(True),fromfile='a/'+n,tofile='b/'+n):d.append(x if x.endswith('\n') else x+'\n\\ No newline at end of file\n')
(new/'proof.patch').write_text(''.join(d));m['proof_patches']=[str((new/'proof.patch').relative_to(R))];m['stage3']['proof_sha256']=sha(new/'proof.patch');m['proof_next'].update(previous_candidate_sha256=sha(old/'frozen.json'),revision='Combine candidate62 high-lane expansion with candidate64 scalar second-A bridge and eight mandatory high bias load/entry cuts. No new hypotheses or C/spec/model changes.');(new/'frozen.json').write_text(json.dumps(m,indent=2)+'\n');_,g=checker.prepare(new,sha(new/'frozen.json'),'diagnostic01');(new/'source-guard.json').write_text(json.dumps(g,indent=2)+'\n')
