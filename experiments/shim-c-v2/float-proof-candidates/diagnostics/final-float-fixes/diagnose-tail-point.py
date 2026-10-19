from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
import shutil,json,subprocess,os
repo=Path('/zp_vegeta/scratch_sb/ycsun/verus/build/verified-output-equivalence')
def go(op):
 source=Path(f'/tmp/{op}-tail-transport-final');d=Path(f'/tmp/{op}-tail-point-final');shutil.copytree(source,d,dirs_exist_ok=True);arith='add' if op=='add' else 'mul';p=d/'neon.c';s=p.read_text();bidx='0' if op=='mulc' else 'k';old_a=r'\at(a_base[\at(k,Here)],Before1)';old_b=r'\at(b_base[0],Before1)' if op=='mulc' else r'\at(b_base[\at(k,Here)],Before1)';oldop=f'fp_{arith}32({old_a},{old_b})';newop=f'fp_{arith}32(a_base[k],b_base[{bidx}])';needle=f'      proof_check_same_value_trans();\n      proof_check_fp_{arith}_transport();\n      /@ assert tail_output_transport: same_value(o_base[k],{newop}); @/';assert s.count(needle)==1
 repl=f'''      proof_check_same_value_trans();
      /@ assert tail_value_old: same_value(o_base[k],{oldop}); @/
      /@ assert tail_input_sym_a: same_float({old_a},a_base[k]); @/
      /@ assert tail_input_sym_b: same_float({old_b},b_base[{bidx}]); @/
      proof_check_fp_{arith}_congruence();
      /@ assert tail_op_same: same_value({oldop},{newop}); @/
      /@ assert tail_output_transport: same_value(o_base[k],{newop}); @/''';s=s.replace(needle,repl);p.write_text(s)
 case=repo/f'experiments/shim-c-v2/float-proof-candidates/f32-v{op}-index-tip-v7-front';a=json.loads((case/'logs/proof02-summary.json').read_text());c=a['actual_command'];c=[str(d/'unit.c') if str(x).endswith('/annotated/unit.c') else str(d/'extensions.driver') if str(x).endswith('/annotated/extensions.driver') else x for x in c];i=c.index('-wp-report-json');c[i+1]=f'/tmp/{op}-tail-point-final.json';c+=['-wp-fct',f'test_neon,test_rvv,proof_{op}_prefix_step,proof_check_same_value_trans,proof_check_fp_{arith}_congruence','-wp-prop','@ensures,tail_value_old,tail_input_sym_a,tail_input_sym_b,tail_op_same,tail_output_transport,tail_index_exact,tail_input_op,tail_point_index,tail_point_lane,tail_point_old_op,tail_lane_old_op,high_output_2,high_output_3'];env=dict(os.environ);env['PATH']='/zp_vegeta/scratch_sb/ycsun/verus/research/agent-qs8-rsum/provers/bin:'+env['PATH']
 with open(f'/tmp/{op}-tail-point-final.log','w') as out:r=subprocess.run(c,cwd=d,env=env,stdout=out,stderr=subprocess.STDOUT)
 print(op,r.returncode,flush=True)
with ThreadPoolExecutor(max_workers=3) as p:list(p.map(go,['mulc','add','mul']))
