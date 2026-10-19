from pathlib import Path
import json,hashlib,shutil,difflib
R=Path(__file__).resolve().parents[4];B=R/'experiments/shim-c-v2';old=B/'stage3-byte-fp-front-v19';H=B/'stage3-byte-fp-front-v35';H.mkdir();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
audit=json.loads((old/'source-audit.json').read_text());before=audit['source_after'];source=old/'.build/source';dest=H/'.build/source';dest.mkdir(parents=True)
for n,h in before.items():
 p=source/n;assert sha(p)==h,n;q=dest/n;q.parent.mkdir(parents=True,exist_ok=True);shutil.copy2(p,q)
p=dest/'src/plugins/wp/MemBytes.ml';s=p.read_text();original=s
a=s.index('      (* Specializes the lemma in Pointers below for globals *)');z=s.index('      let compile vi =',a)
s=s[:a]+"      (* No non-definitional pointer-width assumption is generated. *)\n      let pointer_type _prefix _base = ()\n\n"+s[z:]
a=s.index('      let ranges () =');z=s.index('      let compile () =',a)
s=s[:a]+"      (* An unbounded static-base offset space cannot inject into uint64.\n         Removing this admitted range strengthens all affected VCs. *)\n      let ranges () = ()\n\n"+s[z:]
assert 'pointers_int_range' not in s;assert 'in_uintptr_range' not in s;p.write_text(s)
(H/'pointer-width-removal.patch').write_text(''.join(difflib.unified_diff(original.splitlines(True),s.splitlines(True),fromfile='a/src/plugins/wp/MemBytes.ml',tofile='b/src/plugins/wp/MemBytes.ml')))
after={n:sha(dest/n) for n in before};changed=[n for n in before if before[n]!=after[n]];assert changed==['src/plugins/wp/MemBytes.ml'];assert all(sha(source/n)==h for n,h in before.items())
(H/'source-audit.json').write_text(json.dumps({'status':'audited-source-experiment-not-qualified','previous_source_audit_sha256':sha(old/'source-audit.json'),'source_before':before,'source_after':after,'changed_files':changed,'patch_sha256':sha(H/'pointer-width-removal.patch'),'change':'Delete the two non-definitional pointer-width Admit generation paths. No replacement assumption or memory law. All old inputs preserved. All controls, exported-task audit and strict known-case replay required.'},indent=2)+'\n')
shutil.copyfile(old/'build.py',H/'build.py');shutil.copyfile(old/'build-observer01.py',H/'build-observer01.py');print('source audited',len(after),changed,flush=True)
