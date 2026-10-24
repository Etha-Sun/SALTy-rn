from pathlib import Path
import re,json,hashlib
c=Path(__file__).resolve().parent.parent;s=(c/'impl/testNEON.c').read_text();findings=[];rules={}
for f,pat,expected in [('vget_low_u16',r'vaddw_u16\(\s*([A-Za-z_]\w*)\s*,\s*vget_low_u16\(\s*([A-Za-z_]\w*)\s*\)\s*\)',5),('vget_high_u16',r'vaddw_u16\(\s*([A-Za-z_]\w*)\s*,\s*vget_high_u16\(\s*([A-Za-z_]\w*)\s*\)\s*\)',5),('vget_low_u32',r'vadd_u32\(\s*([A-Za-z_]\w*)\s*,\s*vget_low_u32\(\s*([A-Za-z_]\w*)\s*\)\s*\)',1),('vextq_u32',r'vextq_u32\(\s*([A-Za-z_]\w*)\s*,\s*\1\s*,\s*2\s*\)',1),('vgetq_lane_u32',r'vgetq_lane_u32\(\s*([A-Za-z_]\w*)\s*,\s*0\s*\)',1)]:
 allcalls=len(re.findall(r'\b'+f+r'\s*\(',s));matched=list(re.finditer(pat,s));rules[f]={'occurrences':allcalls,'guarded_occurrences':len(matched),'expected':expected,'literal_matches':[m.group()for m in matched]}
 if len(matched)!=allcalls or allcalls!=expected:findings.append(f)
result={'passed':not findings,'scope':'exact side-effect-free source call shapes only; pure semantic bridges and actual helper body proofs separately required','findings':findings,'rules':rules,'source_sha256':hashlib.sha256(s.encode()).hexdigest(),'frontend_sha256':hashlib.sha256((c/'shim/neon_frontend.h').read_bytes()).hexdigest()};(c/'proof/frontend-scope.json').write_text(json.dumps(result,indent=2)+'\n');print(json.dumps(result));raise SystemExit(bool(findings))
