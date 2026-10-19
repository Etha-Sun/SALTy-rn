from pathlib import Path
import shutil,json,subprocess,os
repo=Path('/zp_vegeta/scratch_sb/ycsun/verus/build/verified-output-equivalence');d=Path('/tmp/add-two-points-final');case=repo/'experiments/shim-c-v2/float-proof-candidates/f32-vadd-tail-point-v7-front';shutil.copytree(case/'.build/proof01/annotated',d,dirs_exist_ok=True);p=d/'neon.c';s=p.read_text();old=r'''      /*@ assert \forall integer j; 0<=j<2 ==>
        same_value(vacc_lo.lane[j],fp_add32(a_base[total-batch/4+j+2],b_base[total-batch/4+j+2])); */''';new=r'''      /*@ assert high_both_points:
        same_value(vacc_lo.lane[0],fp_add32(a_base[total-batch/4+2],b_base[total-batch/4+2])) &&
        same_value(vacc_lo.lane[1],fp_add32(a_base[total-batch/4+3],b_base[total-batch/4+3])); */''';assert s.count(old)==1;p.write_text(s.replace(old,new));a=json.loads((case/'logs/proof01-summary.json').read_text());c=a['actual_command'];c=[str(d/'unit.c') if str(x).endswith('/annotated/unit.c') else str(d/'extensions.driver') if str(x).endswith('/annotated/extensions.driver') else x for x in c];i=c.index('-wp-report-json');c[i+1]='/tmp/add-two-points-final.json';c+=['-wp-fct','test_neon','-wp-prop','high_output_2,high_output_3,high_both_points'];env=dict(os.environ);env['PATH']='/zp_vegeta/scratch_sb/ycsun/verus/research/agent-qs8-rsum/provers/bin:'+env['PATH'];
with open('/tmp/add-two-points-final.log','w') as out:r=subprocess.run(c,cwd=d,env=env,stdout=out,stderr=subprocess.STDOUT)
print(r.returncode)
