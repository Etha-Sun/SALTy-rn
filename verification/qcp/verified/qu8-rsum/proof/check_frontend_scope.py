#!/usr/bin/env python3
"""Guard the exact actual alias call; this is a scope audit, not an ISA proof."""
from pathlib import Path
import hashlib,json,re
case=Path(__file__).resolve().parent.parent
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
source=case/'impl/testRVV.c';header=case/'shim/rvv_frontend.h'
clean=re.sub(r'/\*.*?\*/|//[^\n]*','',source.read_text(),flags=re.S)
name='__riscv_vadd_vv_u32m8_tu'
matches=re.findall(r'\b'+name+r'\s*\(([^()]*)\)',clean)
assert len(matches)==1 and re.findall(r'\b'+name+r'\b',clean)==[name]
args=[x.strip()for x in matches[0].split(',')]
assert args==['vacc','vacc','vt32','vl'],'Specialized TU adapter requires the same side-effect-free accumulator twice'
macro=next(l for l in header.read_text().splitlines()if l.startswith('#define '+name))
assert re.sub(r'\s+','',macro)=='#define__riscv_vadd_vv_u32m8_tu(p,a,b,vl)rsum_alias_vadd_u32m8(a,b,vl)'
status={'passed':True,'formal_proof':False,'whole_kernel_verified':False,'scope':'Syntactic guard of specialized single-resource C adapter and fixed shim configuration; no ISA/ABI refinement claim','call_arguments':args,'source_sha256':{str(p.relative_to(case)):sha(p)for p in [source,header]},'observation':'All 32 accumulator fields are preserved or updated by the actual C adapter; inactive lanes retain their previous accumulator. The duplicate passthrough argument is the same side-effect-free lvalue.','configuration':{'pointer_bits':64,'endian':'little','VLEN':128,'e8m2_VLMAX':32,'e32m8_VLMAX':32,'e32m1_VLMAX':4,'setvl':'min(AVL,32)'},'aliases':'Hardware u8/u32 spellings map to explicitly defined scalar-field C u8/u32 providers; names do not establish actual ISA semantics.'}
p=case/'proof/frontend-scope.json';p.write_text(json.dumps(status,ensure_ascii=False,indent=2)+'\n');print(json.dumps({'passed':True,'path':str(p)}))
