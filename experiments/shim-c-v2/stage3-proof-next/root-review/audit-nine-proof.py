"""Independent source/model identity review. Never declares a proof complete."""
from pathlib import Path
import sys,json,hashlib,datetime
H=Path(__file__).resolve().parent;R=H.parents[3];TOP=H.parent;sys.path.insert(0,str(R/'tools'));import shim_c_campaign_closure as checker
run=sys.argv[1];out=H/(run+'.json');assert not out.exists();sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
bases={'maxpool':'stage3-pool-spmm/f32-maxpool-step-v3','gemm':'stage3-gemm/f32-gemm-minmax-r4','dwconv':'stage3-conv/revision5/f32-dwconv-minmax','spmm':'stage3-pool-spmm/f32-spmm-frame-v3','root-review':'stage3-gemm/f32-gemm-minmax-r4'}
records=[];locks={}
for p in sorted(TOP.glob('*/*/frozen.json')):
 group=p.parent.parent.name
 if group not in bases:continue
 m=json.loads(p.read_text());old=R/m['previous_version']
 while old.is_relative_to(TOP):
  ancestor=json.loads((old/'frozen.json').read_text());old=R/ancestor['previous_version']
 assert old.is_relative_to(R/'experiments/shim-c-v2'),old
 allowed=('stage3-gemm/','stage3-conv/','stage3-pool-spmm/','stage3-unary-front/replay/')
 assert str(old.relative_to(R/'experiments/shim-c-v2')).startswith(allowed),old;base=json.loads((old/'frozen.json').read_text());assert m['files']==base['files'],p
 assert m.get('wp_model_variant',m['model'])==base.get('wp_model_variant',base['model']),p
 for k in ['wp_share','wp_why3_config','driver']:assert m.get(k)==base.get(k),(p,k)
 assert len(m['proof_patches'])==1
 patch=R/m['proof_patches'][0];assert patch.parent==p.parent and patch.name=='proof.patch'
 _,g=checker.prepare(p.parent,sha(p),run)
 lp=R/m['files']['float_model_lock.json']['path'];locks[str(lp)]=json.loads(lp.read_text())
 records.append({'candidate':str(p.parent.relative_to(R)),'base':str(old.relative_to(R)),'frozen_sha256':sha(p),'proof_sha256':sha(patch),'source_guard':g,'all_frozen_file_entries_identical':True,'model_configuration_identical':True,'proof_parser_checked':False,'whole_kernel_accepted':False})
checked=0
for lp,lock in locks.items():
 for n,d in lock['files'].items():assert sha(Path(n) if Path(n).is_absolute() else R/n)==d,n;checked+=1
record={'time_utc':datetime.datetime.now(datetime.timezone.utc).isoformat(),'scope':'Identity and annotation guard only. Does not establish ACSL parsing, truth of assertions, complete coverage or whole-kernel proof.','locked_external_files_checked':checked,'candidates':records}
out.write_text(json.dumps(record,indent=2)+'\n');print('audited',len(records),'candidates;',checked,'locked files')
