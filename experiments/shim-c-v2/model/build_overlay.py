"""Rebuild an independent WP share tree; never modify the official bundle."""
import hashlib,json,shutil
from pathlib import Path

HERE=Path(__file__).resolve().parent
REPO=HERE.parents[2]
VERUS=REPO.parents[1]
BUNDLE=VERUS/'research/frama-c-qs8-rsum/toolchain/bundle'
UPSTREAM=BUNDLE/'share/frama-c/share/wp'
ORIGINAL_SHA='c885fef3fda7754a95f44d5ef8480cf278dc8fe35c6797866713c820697654de'
def sha(p):return hashlib.sha256(p.read_bytes()).hexdigest()
assert sha(UPSTREAM/'why3/frama_c_wp/cfloat.mlw')==ORIGINAL_SHA
share=HERE/'wp-share'
if share.exists():shutil.rmtree(share)
shutil.copytree(UPSTREAM,share,ignore=shutil.ignore_patterns('.gitignore'))
shutil.copyfile(HERE/'why3/frama_c_wp/cfloat.mlw',share/'why3/frama_c_wp/cfloat.mlw')
for prover,driver in [('z3','z3_471.drv'),('cvc5','cvc5.drv')]:
 (HERE/(prover+'.drv')).write_text('import "'+str(BUNDLE/'share/why3/drivers'/driver)+'"\n\ntheory frama_c_wp.cfloat.Cfloat\n syntax function from_real32 "((_ to_fp 8 24) %1 %2)"\n syntax function from_real64 "((_ to_fp 11 53) %1 %2)"\nend\n')
(HERE/'why3.conf').write_text('[main]\nmagic = 14\n\n[prover]\nname = "Z3"\nversion = "4.12.5"\ncommand = "/home/ycsun/verus-x86-linux/z3 -smt2 -T:%t %f"\ndriver = "'+str(HERE/'z3.drv')+'"\n\n[prover]\nname = "CVC5"\nversion = "1.2.1"\ncommand = "'+str(VERUS/'research/agent-qs8-rsum/provers/bin/cvc5')+' --lang=smt2 --tlimit-per=%t000 %f"\ndriver = "'+str(HERE/'cvc5.drv')+'"\n')
inputs=[HERE/'build_overlay.py',HERE/'why3/frama_c_wp/cfloat.mlw',HERE/'z3.drv',HERE/'cvc5.drv',HERE/'why3.conf']
inputs += sorted(p for p in share.rglob('*') if p.is_file())
# Pin all upstream WP and Why3 source/driver files, not just the edited file.
inputs += sorted(p for base in [UPSTREAM,BUNDLE/'share/why3/drivers',BUNDLE/'share/why3/stdlib'] for p in base.rglob('*') if p.is_file())
inputs += [BUNDLE/'bin/frama-c',Path('/home/ycsun/verus-x86-linux/z3'),VERUS/'research/agent-qs8-rsum/provers/bin/cvc5']
def key(p):return str(p.relative_to(REPO)) if p.is_relative_to(REPO) else str(p)
lock=dict(version='native-cfloat-v2',loadpaths=[],share=key(share),why3_config=key(HERE/'why3.conf'),provers=['z3','cvc5'],files={key(p):sha(p) for p in inputs},upstream_cfloat_sha256=ORIGINAL_SHA,cfloat_axioms=0,scope='Native SMT IEEE arithmetic, classification, real-to-FP rounding and ACSL non-NaN sign. WP mixed-FP casts and negative-zero literals remain explicit frontend gaps.')
(HERE/'float_model_lock.json').write_text(json.dumps(lock,indent=2)+'\n')
print(json.dumps({'lock':key(HERE/'float_model_lock.json'),'sha256':sha(HERE/'float_model_lock.json'),'files':len(lock['files']),'share':lock['share'],'why3_config':lock['why3_config']}))
