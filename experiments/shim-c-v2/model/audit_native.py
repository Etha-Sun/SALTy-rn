"""Exact SMT checks of the native definitions, not a whole-WP consistency claim."""
from pathlib import Path
import hashlib,json,subprocess
ROOT=Path(__file__).resolve().parent
OUT=ROOT/'evidence/native';OUT.mkdir(parents=True,exist_ok=True)
P='''(set-logic ALL)
(declare-datatypes ((sign 0)) (((Positive) (Negative))))
(define-fun sign32 ((x (_ FloatingPoint 8 24))) sign (ite (fp.isNegative x) Negative Positive))
(define-fun sign64 ((x (_ FloatingPoint 11 53))) sign (ite (fp.isNegative x) Negative Positive))
(define-fun finite32 ((x (_ FloatingPoint 8 24))) Bool (not (or (fp.isNaN x) (fp.isInfinite x))))
(define-fun finite64 ((x (_ FloatingPoint 11 53))) Bool (not (or (fp.isNaN x) (fp.isInfinite x))))
(define-fun nz32 () (_ FloatingPoint 8 24) (_ -zero 8 24))
(define-fun pz32 () (_ FloatingPoint 8 24) (_ +zero 8 24))
(define-fun nan32 () (_ FloatingPoint 8 24) (_ NaN 8 24))
(define-fun nan64 () (_ FloatingPoint 11 53) (_ NaN 11 53))
'''
facts=[
 '(= (sign32 nz32) Negative)',
 '(= (sign32 pz32) Positive)',
 '(= (sign32 nan32) Positive)',
 '(fp.isNaN (fp.add RNE nan32 ((_ to_fp 8 24) RNE 1.0)))',
 '(fp.isNaN (fp.sub RNE (_ +oo 8 24) (_ +oo 8 24)))',
 '(and (fp.isInfinite (fp.mul RNE (_ -oo 8 24) ((_ to_fp 8 24) RNE (- 1.0)))) (fp.isPositive (fp.mul RNE (_ -oo 8 24) ((_ to_fp 8 24) RNE (- 1.0)))))',
 '(= (sign32 (fp.add RNE nz32 nz32)) Negative)',
 '(= (sign32 (fp.add RNE pz32 nz32)) Positive)',
 '(= (fp.mul RNE ((_ to_fp 8 24) #x00000001) ((_ to_fp 8 24) RNE 0.5)) pz32)',
 '(= ((_ to_fp 8 24) RNE 16777217.0) ((_ to_fp 8 24) RNE 16777216.0))',
 '(= ((_ to_fp 8 24) RTP 16777217.0) ((_ to_fp 8 24) RNE 16777218.0))',
 '(= ((_ to_fp 8 24) RTN (- 16777217.0)) ((_ to_fp 8 24) RNE (- 16777218.0)))',
 '(fp.isNaN ((_ to_fp 11 53) RNE nan32))',
 '(= (sign64 ((_ to_fp 11 53) RNE nz32)) Negative)',
]
max32=(2**24-1)*2**104;near32=max32+2**102
max64=(2**53-1)*2**971;near64=max64+2**969
facts += ['(= ((_ to_fp 8 24) RNE '+str(near32)+'.0) ((_ to_fp 8 24) RNE '+str(max32)+'.0))','(= ((_ to_fp 11 53) RNE '+str(near64)+'.0) ((_ to_fp 11 53) RNE '+str(max64)+'.0))']
cases={
 'native-definition-consistency':('sat','(assert (and '+' '.join(facts)+'))\n'),
 'native-semantic-facts':('unsat','(assert (not (and '+' '.join(facts)+')))\n'),
 'wrong-NaN-finite-has-counterexample':('sat','(assert (not (finite32 nan32)))\n'),
 'wrong-negative-zero-sign-has-counterexample':('sat','(assert (not (= (sign32 nz32) Positive)))\n'),
 'wrong-RNE-tie-has-counterexample':('sat','(assert (not (= ((_ to_fp 8 24) RNE 16777217.0) ((_ to_fp 8 24) RNE 16777218.0))))\n'),
 'old-sign-axioms-ground-contradiction':('unsat','(declare-const old_nan_sign sign)\n(assert (= (fp.isPositive nan32) (= old_nan_sign Positive)))\n(assert (= (fp.isNegative nan32) (= old_nan_sign Negative)))\n'),
 'old-real-zero-lemma-counterexample':('sat','(assert (= (fp.to_real nan32) 0.0))\n(assert (not (fp.isZero nan32)))\n'),
}
# A ground instance of the original to_f64 axioms and unguarded FP-cast bridge.
m=str(max64)+'.0'
cases['old-cross-FP-bridge-ground-contradiction']=('unsat','''(define-fun r () Real (fp.to_real nan32))
(declare-fun to_f64 (Real) (_ FloatingPoint 11 53))
(assert (=> (and (<= (- '''+m+''') r) (<= r '''+m+''')) (finite64 (to_f64 r))))
(assert (=> (< r (- '''+m+''')) (and (fp.isInfinite (to_f64 r)) (fp.isNegative (to_f64 r)))))
(assert (=> (> r '''+m+''') (and (fp.isInfinite (to_f64 r)) (fp.isPositive (to_f64 r)))))
(assert (= (to_f64 r) ((_ to_fp 11 53) RNE nan32)))
''')
rows=[]
for name,(expected,body) in cases.items():
 p=OUT/(name+'.smt2');p.write_text(P+body+'(check-sat)\n')
 for solver,cmd in [('z3',['/home/ycsun/verus-x86-linux/z3','-T:10',str(p)]),('cvc5',['/zp_vegeta/scratch_sb/ycsun/verus/research/agent-qs8-rsum/provers/bin/cvc5','--lang=smt2','--tlimit-per=10000',str(p)])]:
  r=subprocess.run(cmd,capture_output=True,text=True,timeout=15)
  (OUT/(name+'-'+solver+'.log')).write_text(r.stdout+r.stderr)
  rows.append(dict(name=name,solver=solver,expected=expected,actual=r.stdout.strip(),passed=r.returncode==0 and r.stdout.strip()==expected,command=cmd,input_sha256=hashlib.sha256(p.read_bytes()).hexdigest(),exit=r.returncode))
(OUT/'results.json').write_text(json.dumps(rows,indent=2)+'\n')
print(json.dumps(rows,indent=2))
raise SystemExit(0 if all(r['passed'] for r in rows) else 1)
