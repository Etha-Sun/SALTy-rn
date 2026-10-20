"""Concrete total address-code relabelling; diagnostics only, never a WP model."""
import json,math,pathlib

def zig(x):return 2*x if x>=0 else -2*x-1

def unzig(n):return n//2 if n%2==0 else -(n+1)//2

def encode(p):
 a,b=map(zig,p);return unzig((a+b)*(a+b+1)//2+b)

def decode(i):
 z=zig(i);w=(math.isqrt(8*z+1)-1)//2;b=z-w*(w+1)//2;a=w-b;return (unzig(a),unzig(b))

def apply(x,swaps):
 for a,b in swaps:x=b if x==a else a if x==b else x
 return x

p=(1,0);shift_p=(1,1);q=(2,0);swaps=[]
for addr,code in [(p,1),(shift_p,5),(q,9)]:
 old=apply(encode(addr),swaps)
 if old!=code:swaps.append((old,code))

def old_int(a):return apply(encode(a),swaps)

def old_addr(i):return decode(apply(i,list(reversed(swaps))))

pi=lambda x:apply(x,[(5,9)])
new_int=lambda a:pi(old_int(a))
new_addr=lambda i:old_addr(pi(i))
for a in [(b,o) for b in range(-40,41) for o in range(-40,41)]:
 assert old_addr(old_int(a))==a and new_addr(new_int(a))==a
for i in range(-4000,4001):assert encode(decode(i))==i
assert old_int((0,0))==0 and new_int((0,0))==0
assert old_addr(0)==new_addr(0)==(0,0)
step=(new_int(p)+4)%(1<<64);actual=new_addr(step)
assert actual==q and actual!=shift_p
out={'role':'Diagnostic concrete total interpretation of only physical-address functions; no production files modified','old_int_p':old_int(p),'old_int_shift_p':old_int(shift_p),'old_int_q':old_int(q),'new_int_p':new_int(p),'new_addr_of_uint64_plus_4':actual,'typed_float_shift':shift_p,'counterexample':actual!=shift_p,'bijection_justification':'zigzag Z↔N and Cantor N×N↔N are bijections; finite transpositions and inverses preserve bijection. Thus addr_of_int(int_of_addr(a))=a for every mathematical address a, not only tested samples. Null code 0 remains fixed.','finite_implementation_checks':'6561 address roundtrips and 8001 integer roundtrips; these test Python implementation and are not the universal metatheorem.','other_axioms':'All functions/predicates apart from int_of_addr/addr_of_int remain unchanged. Actual exported context and recursively used model modules must be checked to contain no other constraints on these two functions.'}
pth=pathlib.Path(__file__).with_name('countermodel.json');pth.write_text(json.dumps(out,indent=2)+'\n');print(json.dumps(out,indent=2))
