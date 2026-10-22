typedef unsigned long long size_t;
/*@ Import Coq Require Import QcpVadd.VaddBits */
/*@ Extern Coq (vadd_vl : Z -> Z) */
size_t __riscv_vsetvl_e32m8(size_t n)
/*@ Require emp Ensure __return == vadd_vl(n) && emp */
{ return n < 32 ? n : 32; }
struct sample { int v; };
size_t probe(size_t n)
/*@ Require emp Ensure __return == 0 && emp */
{
/*@ Inv 0 <= n && n <= n@pre && emp */
while(n > 0) {
 size_t vl = __riscv_vsetvl_e32m8(n);
 struct sample a; a.v = 0;
 /*@ Assert 0 < vl && vl <= 32 && vl <= n && n <= n@pre && store(&(a.v),int,0) */
 n -= vl;
}
return n;
}
