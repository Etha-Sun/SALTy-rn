from pathlib import Path
import json,re,hashlib,subprocess,tempfile
P=Path(__file__).resolve().parent;c=P.parent;run=Path(tempfile.mkdtemp(prefix='unit-preflight-',dir=c/'.build'));sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest();rows=[];findings=[]
def add(stem,source,status,typed,goalrun=None,cppsource=None):
 d=json.loads((P/status).read_text());base=Path(goalrun or d['run_directory']);goaldir=base/'coq'if(base/'coq'/(stem+'_goal.v')).exists()else base;goal=goaldir/(stem+'_goal.v');oldcpp=base/(stem+'.c');actual=c/source;target=run/(stem+'.c');cmd=['gcc','-E','-P','-CC','-nostdinc',str(cppsource or actual),'-o',str(target)];subprocess.run(cmd,cwd=run,check=True,timeout=60);names=re.findall(r'^Axiom proof_of_(\w+) :',goal.read_text(),re.M);text=re.sub(r'/\*.*?\*/|//[^\n]*','',target.read_text(),flags=re.S);bodies=re.findall(r'(?m)^(?:[A-Za-z_]\w*(?:\s+|\s*\*\s*))+([A-Za-z_]\w*)\s*\([^;{}]*\)\s*\{',text)
 row={'stem':stem,'namespace':'Qs8Rsum','actual_source':source,'actual_source_sha256':sha(actual),'status':status,'component_passed':d.get('passed',False),'status_sha256':sha(P/status),'typed_instance':typed,'goal':str(goal),'goal_sha256':sha(goal),'fields':names,'actual_c_vcs':len(names),'historical_cpp':str(oldcpp),'historical_cpp_sha256':sha(oldcpp),'current_cpp':str(target),'current_cpp_sha256':sha(target),'current_cpp_identical':sha(oldcpp)==sha(target),'actual_bodies':bodies,'cpp_command':cmd};rows.append(row)
 if not names or not row['current_cpp_identical']:findings.append({'stem':stem,'error':'Missing actual fields or current CPP differs from generated goal provenance'})
vector=json.loads((P/'vector-status.json').read_text())
add('scalar_primitives','shim/scalar_primitives.c','scalar-status.json','Qs8Rsum.ScalarChecked.CheckedScalar')
add('rvv_scalar','shim/rvv_scalar.c','vector-status.json','Qs8Rsum.RvvScalarChecked.Checked')
for i,u in enumerate(vector['units']):add(u['stem'],'shim/'+u['stem']+'.c','vector-status.json','Qs8Rsum.VectorChecked.Unit'+str(i))
add('neon_load','shim/neon_load.c','byte-memory-status.json','Qs8Rsum.NeonLoadChecked.CheckedNeonLoad')
add('rvv_load','shim/rvv_load.c','byte-memory-status.json','Qs8Rsum.RvvLoadChecked.CheckedRvvLoad')
add('vl','shim/vl.c','control-vl-status.json','Qs8Rsum.ControlChecked.Checkedvl')
add('control','shim/control.c','control-vl-status.json','Qs8Rsum.ControlChecked.Checkedcontrol')
for side in ['neon','rvv']:
 g=json.loads((P/(side+'-generation-status.json')).read_text());r=Path(g['run_directory']);add(side+'_unit','impl/test'+('NEON'if side=='neon'else'RVV')+'.c',side+'-generation-status.json','Qs8Rsum.'+('NeonChecked.CheckedNeon'if side=='neon'else'RvvChecked.CheckedRvv'),goalrun=r,cppsource=r/'annotated.c')
add('public_wrapper','spec.c','wrapper-proof-status.json','Qs8Rsum.WrapperChecked.CheckedWrapper',goalrun=json.loads((P/'wrapper-generation-status.json').read_text())['run_directory'])
result={'preflight_passed':not findings,'whole_kernel_verified':False,'scope':'Actual current CPP and goal inventory only; pending both complete typed kernel gates and final fresh whole-case replay','run_directory':str(run),'units':rows,'actual_c_units':len(rows),'actual_c_vcs':sum(r['actual_c_vcs']for r in rows),'unique_actual_c_bodies':len({n for r in rows for n in r['actual_bodies']}),'actual_c_bodies':sorted({n for r in rows for n in r['actual_bodies']}),'strategies':[{'stem':'byte_arrays','fields':2,'typed_instance':'Qs8Rsum.ByteStrategy.CheckedByteArrays'}],'findings':findings}
for p in [run/'status.json',P/'component-unit-preflight.json']:p.write_text(json.dumps(result,indent=2)+'\n')
print(json.dumps({k:result[k]for k in ['preflight_passed','actual_c_units','actual_c_vcs','unique_actual_c_bodies','findings']},indent=2));raise SystemExit(0 if result['preflight_passed']else 1)
