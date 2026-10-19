from pathlib import Path
import shutil,json,hashlib
H=Path(__file__).resolve().parent;B=H.parent;R=H.parents[2];old=B/'stage3-byte-fp-front-v6';proof=B/'stage3-proof-next/byte-fp-prototype/store-read-v16'
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
assert not (H/'experimental-inputs01.json').exists()
watch=json.loads((old/'experimental-inputs01.json').read_text())['files']
for p,v in watch.items():assert sha(Path(p))==v,p
shutil.copytree(old/'wp-share',H/'wp-share')
for name in ['why3.conf','z3-codec.drv','cvc5-codec.drv','cvc5-supported.py','bytefloat.driver','controls.c','run-control.py','run-qualification.py']:
 p=H/name;p.write_text((old/name).read_text().replace(str(old),str(H)));p.chmod((old/name).stat().st_mode)
for src,dst in [('memoryread.mlw','memoryread.mlw'),('store-read.mlw','storeread.mlw'),('loadframe.mlw','loadframe.mlw')]:shutil.copyfile(proof/src,H/'wp-share/why3'/dst)
p=H/'bytefloat.driver';p.write_text(p.read_text()+'why3.import += "storeread.StoreRead32";\nwhy3.import += "loadframe.LoadFrame32";\n')
p=H/'cvc5-codec.drv';p.write_text(p.read_text()+'\nmodule storeread.StoreRead32\n remove prop checked_store_read32\nend\n')
q=H/'qualification01';q.mkdir()
for name in ['memory.c','ieee.c','fma.c','unary.c','partial-frame-r2.c']:shutil.copyfile(old/'qualification01'/name,q/name)
(H/'README.zh-CN.md').write_text('# 独立 Bytes/IEEE v7（未资格认证）\n\nv6新增已证明memory read/write及浮点store/load/frame组合引理；每条均有body，依赖由v16真实证明。保留v6失败控制与旧锁；未用于kernel。CVC5仅删除含不支持encoder的已证store推论（加强目标），原生Z3保留。仍须新share重放、正反内存/IEEE回归及完整已过案例。\n')
provenance={'previous_snapshot_sha256':sha(old/'experimental-inputs01.json'),'body_sources':{str(p.relative_to(R)):sha(p) for p in proof.iterdir() if p.is_file()},'changes':['proved read/write32 plus frame helper bodies','proved IEEE store/read32 and frame32 composed from checked bodies'],'qualification':False}
(H/'support-provenance.json').write_text(json.dumps(provenance,indent=2)+'\n')
watch[str(old/'experimental-inputs01.json')]=sha(old/'experimental-inputs01.json')
for p in H.rglob('*'):
 if p.is_file() and '.build' not in p.parts:watch[str(p)]=sha(p)
(H/'experimental-inputs01.json').write_text(json.dumps({'qualification':False,'files':watch},indent=2)+'\n');print(len(watch))
