from pathlib import Path
import shutil,json,subprocess,os
repo=Path('/zp_vegeta/scratch_sb/ycsun/verus/build/verified-output-equivalence');d=Path('/tmp/div-tail-frame-final');source=repo/'experiments/shim-c-v2/float-proof-candidates/f32-vdiv-index-tip-v7-front/.build/proof02/annotated';shutil.copytree(source,d,dirs_exist_ok=True)
p=d/'extensions.h';s=p.read_text();s=s.replace('proof_div_prefix_step, test_neon, test_rvv;', 'proof_div_prefix_step, canonical;');p.write_text(s)
p=d/'neon.c';s=p.read_text();needle='      //@ ghost Before1: ;';assert s.count(needle)==1;s=s.replace(needle,r'''      //@ ghost size_t tail_index=total-1;
      //@ assert tail_index_exact: tail_index==total-1;
'''+needle)
needle=r'        /@ assert same_float(o_base[k],\at(o_base[\at(k,Here)],Before1)); @/';assert s.count(needle)==1;s=s.replace(needle,r'''        /@ assert tail_old_index: k<tail_index; @/
        /@ assert tail_store_position: output==o_base+tail_index; @/
        /@ assert tail_old_separated: \separated(o_base+k,output); @/
        /@ assert tail_old_output_frame: same_float(o_base[k],\at(o_base[\at(k,Here)],Before1)); @/''');p.write_text(s)
a=json.loads((repo/'experiments/shim-c-v2/float-proof-candidates/f32-vdiv-index-tip-v7-front/logs/proof02-summary.json').read_text());c=a['actual_command'];c=[str(d/'unit.c') if str(x).endswith('/annotated/unit.c') else str(d/'extensions.driver') if str(x).endswith('/annotated/extensions.driver') else x for x in c];i=c.index('-wp-report-json');c[i+1]='/tmp/div-tail-frame-final.json';c+=['-wp-fct','test_neon,test_rvv,proof_div_prefix_step','-wp-prop','@ensures,tail_index_exact,tail_old_index,tail_store_position,tail_old_separated,tail_old_output_frame'];env=dict(os.environ);env['PATH']='/zp_vegeta/scratch_sb/ycsun/verus/research/agent-qs8-rsum/provers/bin:'+env['PATH'];
with open('/tmp/div-tail-frame-final.log','w') as out:r=subprocess.run(c,cwd=d,env=env,stdout=out,stderr=subprocess.STDOUT)
print(r.returncode)
