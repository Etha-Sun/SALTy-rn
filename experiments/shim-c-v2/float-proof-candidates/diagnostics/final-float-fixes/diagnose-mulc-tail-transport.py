from pathlib import Path
import shutil,json,subprocess,os
repo=Path('/zp_vegeta/scratch_sb/ycsun/verus/build/verified-output-equivalence');d=Path('/tmp/mulc-tail-transport-final');source=repo/'experiments/shim-c-v2/float-proof-candidates/f32-vmulc-index-tip-v7-front/.build/proof02/annotated';shutil.copytree(source,d,dirs_exist_ok=True)
p=d/'extensions.h';s=p.read_text();s=s.replace('proof_mulc_prefix_step, test_neon, test_rvv;', 'proof_mulc_prefix_step, canonical;');p.write_text(s)
p=d/'neon.c';s=p.read_text();needle=r'      /@ assert same_value(o_base[k],fp_mul32(a_base[k],b_base[0])); @/';at=s.rfind(needle);assert at>=0;s=s[:at]+s[at:].replace(needle,r'''      proof_check_same_value_trans();
      proof_check_fp_mul_transport();
      /@ assert tail_output_transport: same_value(o_base[k],fp_mul32(a_base[k],b_base[0])); @/''',1);p.write_text(s)
a=json.loads((repo/'experiments/shim-c-v2/float-proof-candidates/f32-vmulc-index-tip-v7-front/logs/proof02-summary.json').read_text());c=a['actual_command'];c=[str(d/'unit.c') if str(x).endswith('/annotated/unit.c') else str(d/'extensions.driver') if str(x).endswith('/annotated/extensions.driver') else x for x in c];i=c.index('-wp-report-json');c[i+1]='/tmp/mulc-tail-transport-final.json';c+=['-wp-fct','test_neon,test_rvv,proof_mulc_prefix_step,proof_check_same_value_trans,proof_check_fp_mul_transport','-wp-prop','@ensures,@requires,tail_output_transport'];env=dict(os.environ);env['PATH']='/zp_vegeta/scratch_sb/ycsun/verus/research/agent-qs8-rsum/provers/bin:'+env['PATH'];
with open('/tmp/mulc-tail-transport-final.log','w') as out:r=subprocess.run(c,cwd=d,env=env,stdout=out,stderr=subprocess.STDOUT)
print(r.returncode)
