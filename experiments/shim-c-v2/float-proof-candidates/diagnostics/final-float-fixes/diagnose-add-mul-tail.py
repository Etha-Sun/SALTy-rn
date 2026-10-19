from pathlib import Path
from concurrent.futures import ThreadPoolExecutor
import shutil,json,subprocess,os
repo=Path('/zp_vegeta/scratch_sb/ycsun/verus/build/verified-output-equivalence')
def go(op):
 d=Path(f'/tmp/{op}-tail-transport-final');case=repo/f'experiments/shim-c-v2/float-proof-candidates/f32-v{op}-index-tip-v7-front';shutil.copytree(case/'.build/proof02/annotated',d,dirs_exist_ok=True)
 p=d/('float_ops.h' if op=='add' else 'extensions.h');s=p.read_text().replace(f'proof_{op}_prefix_step, test_neon, test_rvv;',f'proof_{op}_prefix_step, canonical;');p.write_text(s)
 p=d/'neon.c';s=p.read_text()
 if op=='add':
  marker='      /*@ assert \\forall integer j; 0<=j<2 ==>\n        same_value(vacc_lo.lane[j],fp_add32(a_base[total-batch/4+j+2],b_base[total-batch/4+j+2])); */';assert s.count(marker)==1
  cuts='\n'.join(f'      //@ assert high_output_{lane}: same_value(vacc_lo.lane[{lane-2}],fp_add32(a_base[total-batch/4+{lane}],b_base[total-batch/4+{lane}]));' for lane in [2,3]);s=s.replace(marker,cuts+'\n'+marker)
 needle='      //@ ghost Before1: ;';assert s.count(needle)==1;s=s.replace(needle,f'''      //@ ghost size_t tail_index=total-1;
      //@ assert tail_index_exact: tail_index==total-1;
      //@ assert tail_input_op: same_value(vacc_lo.lane[0],fp_{op}32(a_base[tail_index],b_base[tail_index]));
'''+needle)
 needle=f'        /@ assert same_value(vacc_lo.lane[k-(total-1)],fp_{op}32(\\at(a_base[\\at(k,Here)],Before1),\\at(b_base[\\at(k,Here)],Before1))); @/';assert s.count(needle)==1
 s=s.replace(needle,f'''        /@ assert tail_point_index: k==tail_index; @/
        /@ assert tail_point_lane: k-(total-1)==0; @/
        /@ assert tail_point_old_op: same_value(vacc_lo.lane[0],fp_{op}32(\\at(a_base[tail_index],Before1),\\at(b_base[tail_index],Before1))); @/
'''+needle.replace('assert same_value','assert tail_lane_old_op: same_value'))
 needle=f'      /@ assert same_value(o_base[k],fp_{op}32(a_base[k],b_base[k])); @/';at=s.rfind(needle);assert at>=0;s=s[:at]+s[at:].replace(needle,f'''      proof_check_same_value_trans();
      proof_check_fp_{op}_transport();
      /@ assert tail_output_transport: same_value(o_base[k],fp_{op}32(a_base[k],b_base[k])); @/''',1);p.write_text(s)
 a=json.loads((case/'logs/proof02-summary.json').read_text());c=a['actual_command'];c=[str(d/'unit.c') if str(x).endswith('/annotated/unit.c') else str(d/'extensions.driver') if str(x).endswith('/annotated/extensions.driver') else x for x in c];i=c.index('-wp-report-json');c[i+1]=f'/tmp/{op}-tail-transport-final.json';c+=['-wp-fct',f'test_neon,test_rvv,proof_{op}_prefix_step,proof_check_same_value_trans,proof_check_fp_{op}_transport','-wp-prop','@ensures,@requires,tail_index_exact,tail_input_op,tail_point_index,tail_point_lane,tail_point_old_op,tail_lane_old_op,tail_output_transport,high_output_2,high_output_3'];env=dict(os.environ);env['PATH']='/zp_vegeta/scratch_sb/ycsun/verus/research/agent-qs8-rsum/provers/bin:'+env['PATH']
 with open(f'/tmp/{op}-tail-transport-final.log','w') as out:r=subprocess.run(c,cwd=d,env=env,stdout=out,stderr=subprocess.STDOUT)
 print(op,r.returncode,flush=True)
with ThreadPoolExecutor(max_workers=2) as p:list(p.map(go,['add','mul']))
