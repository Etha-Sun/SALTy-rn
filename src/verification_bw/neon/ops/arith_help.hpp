#pragma once
// NEON shared arithmetic/shift/saturation/widen/narrow helpers
#include "nhelp.hpp"
namespace salt {

// ---- non-saturating shifts (per-lane, W = element bits) ----
inline Term _nsh_shl_imm(TermManager& tm, Term a, int n, size_t W){ return fold_bvshl(tm,a,mk_bv_val(tm,W,n)); }
inline Term _nsh_shr_imm(TermManager& tm, Term a, int n, size_t W, bool arith){
    Term s=mk_bv_val(tm,W,n); return arith?fold_bvashr(tm,a,s):fold_bvlshr(tm,a,s); }
inline Term _nsh_rshr_imm(TermManager& tm, Term a, int n, size_t W, bool arith){
    size_t WW=2*W;
    Term ax=arith?fold_bvsext(tm,WW-W,a):fold_bvzext(tm,WW-W,a);
    Term round=mk_bv_val(tm,WW,(int64_t)1<<(n-1));
    Term sum=fold_bvadd(tm,ax,round);
    Term sh=mk_bv_val(tm,WW,n);
    Term r=arith?fold_bvashr(tm,sum,sh):fold_bvlshr(tm,sum,sh);
    return fold_bvextract(tm,W-1,0,r); }
inline Term _nsh_sri(TermManager& tm, Term dst, Term src, int n, size_t W){
    Term lo=fold_bvlshr(tm,src,mk_bv_val(tm,W,n));
    uint64_t low=((size_t)n>=W)?~0ull:(((uint64_t)1<<(W-n))-1);
    Term keep=fold_bvand(tm,dst,mk_bv_val(tm,W,(int64_t)~low));
    return fold_bvor(tm,lo,keep); }
inline Term _nsh_sli(TermManager& tm, Term dst, Term src, int n, size_t W){
    Term hi=fold_bvshl(tm,src,mk_bv_val(tm,W,n));
    uint64_t low=((uint64_t)1<<n)-1;
    Term keep=fold_bvand(tm,dst,mk_bv_val(tm,W,(int64_t)low));
    return fold_bvor(tm,hi,keep); }
inline Term _nsh_reg(TermManager& tm, Term a, Term cnt, size_t W, bool arith, bool round){
    Term zero=mk_bv_val(tm,W,0), neg=fold_bvneg(tm,cnt);
    Term left=fold_bvshl(tm,a,cnt), rright;
    if(!round){ rright=arith?fold_bvashr(tm,a,neg):fold_bvlshr(tm,a,neg); }
    else{ size_t WW=2*W;
        Term ax=arith?fold_bvsext(tm,WW-W,a):fold_bvzext(tm,WW-W,a);
        Term m=fold_bvzext(tm,WW-W,neg);
        Term one=mk_bv_val(tm,WW,1);
        Term rc=fold_bvshl(tm,one,fold_bvsub(tm,m,one));
        Term sum=fold_bvadd(tm,ax,rc);
        Term sh=arith?fold_bvashr(tm,sum,m):fold_bvlshr(tm,sum,m);
        rright=fold_bvextract(tm,W-1,0,sh); }
    return fold_ite(tm,cmp_sge(tm,cnt,zero),left,rright); }

// ---- saturation primitives ----
inline Term _nsat_clamp_s(TermManager& tm, Term wide, size_t WW, size_t W){
    Term thi=mk_bv_val(tm,WW,((int64_t)1<<(W-1))-1), tlo=mk_bv_val(tm,WW,-((int64_t)1<<(W-1)));
    Term c=fold_ite(tm,cmp_sgt(tm,wide,thi),thi,fold_ite(tm,cmp_slt(tm,wide,tlo),tlo,wide));
    return fold_bvextract(tm,W-1,0,c); }
inline Term _nsat_clamp_u(TermManager& tm, Term wide, size_t WW, size_t W){
    Term thi=fold_bvzext(tm,WW-W,bv_ones(tm,W)), zero=mk_bv_val(tm,WW,0);
    Term c=fold_ite(tm,cmp_sgt(tm,wide,thi),thi,fold_ite(tm,cmp_slt(tm,wide,zero),zero,wide));
    return fold_bvextract(tm,W-1,0,c); }
inline Term _nsat_sadd(TermManager& tm, Term a, Term b, size_t W){
    return _nsat_clamp_s(tm,fold_bvadd(tm,fold_bvsext(tm,1,a),fold_bvsext(tm,1,b)),W+1,W); }
inline Term _nsat_ssub(TermManager& tm, Term a, Term b, size_t W){
    return _nsat_clamp_s(tm,fold_bvsub(tm,fold_bvsext(tm,1,a),fold_bvsext(tm,1,b)),W+1,W); }
inline Term _nsat_uadd(TermManager& tm, Term a, Term b, size_t W){
    Term s=fold_bvadd(tm,fold_bvzext(tm,1,a),fold_bvzext(tm,1,b));
    Term ov=cmp_ne(tm,fold_bvextract(tm,W,W,s),mk_bv_val(tm,1,0));
    return fold_ite(tm,ov,bv_ones(tm,W),fold_bvextract(tm,W-1,0,s)); }
inline Term _nsat_usub(TermManager& tm, Term a, Term b, size_t W){
    return fold_ite(tm,cmp_ult(tm,a,b),bv_zero(tm,W),fold_bvsub(tm,a,b)); }
inline Term _nsat_sqneg(TermManager& tm, Term a, size_t W){
    Term mn=mk_bv_val(tm,W,-((int64_t)1<<(W-1))), mx=mk_bv_val(tm,W,((int64_t)1<<(W-1))-1);
    return fold_ite(tm,cmp_eq(tm,a,mn),mx,fold_bvneg(tm,a)); }
inline Term _nsat_sqabs(TermManager& tm, Term a, size_t W){
    Term mn=mk_bv_val(tm,W,-((int64_t)1<<(W-1))), mx=mk_bv_val(tm,W,((int64_t)1<<(W-1))-1);
    Term ab=fold_ite(tm,cmp_slt(tm,a,mk_bv_val(tm,W,0)),fold_bvneg(tm,a),a);
    return fold_ite(tm,cmp_eq(tm,a,mn),mx,ab); }
inline Term _nsat_suqadd(TermManager& tm, Term a_s, Term b_u, size_t W){
    return _nsat_clamp_s(tm,fold_bvadd(tm,fold_bvsext(tm,2,a_s),fold_bvzext(tm,2,b_u)),W+2,W); }
inline Term _nsat_usqadd(TermManager& tm, Term a_u, Term b_s, size_t W){
    return _nsat_clamp_u(tm,fold_bvadd(tm,fold_bvzext(tm,2,a_u),fold_bvsext(tm,2,b_s)),W+2,W); }

// ---- saturating shifts ----
inline Term _nqsh_left(TermManager& tm, Term a, Term sh, size_t W, bool uns_out, bool sext_in){
    size_t WW=2*W;
    Term ax=sext_in?fold_bvsext(tm,WW-W,a):fold_bvzext(tm,WW-W,a);
    Term shx=fold_bvzext(tm,WW-W,sh);
    Term shifted=fold_bvshl(tm,ax,shx);
    Term clamped=uns_out?_nsat_clamp_u(tm,shifted,WW,W):_nsat_clamp_s(tm,shifted,WW,W);
    Term z=mk_bv_val(tm,W,0);
    Term big;
    if(!uns_out){
        big=fold_ite(tm,cmp_sgt(tm,a,z),mk_bv_val(tm,W,((int64_t)1<<(W-1))-1),
            fold_ite(tm,cmp_slt(tm,a,z),mk_bv_val(tm,W,-((int64_t)1<<(W-1))),z));
    } else {
        Term nz=sext_in?cmp_sle(tm,a,z):cmp_eq(tm,a,z);
        big=fold_ite(tm,nz,z,bv_ones(tm,W));
    }
    return fold_ite(tm,cmp_uge(tm,sh,mk_bv_val(tm,W,(int64_t)W)),big,clamped); }
inline Term _nqsh_reg(TermManager& tm, Term a, Term cnt, size_t W, bool uns_out, bool sext_in, bool round){
    Term left=_nqsh_left(tm,a,cnt,W,uns_out,sext_in);
    Term neg=fold_bvneg(tm,cnt), right;
    if(!round){ right=sext_in?fold_bvashr(tm,a,neg):fold_bvlshr(tm,a,neg); }
    else{ size_t WW=2*W;
        Term ax=sext_in?fold_bvsext(tm,WW-W,a):fold_bvzext(tm,WW-W,a);
        Term m=fold_bvzext(tm,WW-W,neg);
        Term rc=fold_bvshl(tm,mk_bv_val(tm,WW,1),fold_bvsub(tm,m,mk_bv_val(tm,WW,1)));
        Term sum=fold_bvadd(tm,ax,rc);
        Term sh=sext_in?fold_bvashr(tm,sum,m):fold_bvlshr(tm,sum,m);
        right=fold_bvextract(tm,W-1,0,sh); }
    return fold_ite(tm,cmp_sge(tm,cnt,mk_bv_val(tm,W,0)),left,right); }

// ---- saturating doubling multiply-high ----
inline Term _nqd_mulh(TermManager& tm, Term a, Term b, size_t W, bool round){
    size_t WW=2*W+2;
    Term prod=fold_bvmul(tm,fold_bvsext(tm,WW-W,a),fold_bvsext(tm,WW-W,b));
    Term dbl=fold_bvshl(tm,prod,mk_bv_val(tm,WW,1));
    if(round) dbl=fold_bvadd(tm,dbl,mk_bv_val(tm,WW,(int64_t)1<<(W-1)));
    return _nsat_clamp_s(tm,fold_bvashr(tm,dbl,mk_bv_val(tm,WW,(int64_t)W)),WW,W); }
inline Term _nqd_mlah(TermManager& tm, Term acc, Term a, Term b, size_t W, bool sub){
    Term r=_nqd_mulh(tm,a,b,W,true);
    return sub?_nsat_ssub(tm,acc,r,W):_nsat_sadd(tm,acc,r,W); }

// ---- widen/narrow/halving/abd/bitcount helpers ----
inline Term _next(TermManager& tm, Term x, size_t fromW, size_t toW, bool s){
    return s?fold_bvsext(tm,toW-fromW,x):fold_bvzext(tm,toW-fromW,x); }
inline Term _nabd(TermManager& tm, Term a, Term b, size_t W, bool s){
    Term ea=_next(tm,a,W,W+1,s), eb=_next(tm,b,W,W+1,s);
    Term d=fold_bvsub(tm,ea,eb);
    Term ad=fold_ite(tm,cmp_slt(tm,d,mk_bv_val(tm,W+1,0)),fold_bvneg(tm,d),d);
    return fold_bvextract(tm,W-1,0,ad); }
inline Term _nabdl(TermManager& tm, Term a, Term b, size_t Win, size_t Wout, bool s){
    Term d=fold_bvsub(tm,_next(tm,a,Win,Wout,s),_next(tm,b,Win,Wout,s));
    return fold_ite(tm,cmp_slt(tm,d,mk_bv_val(tm,Wout,0)),fold_bvneg(tm,d),d); }
inline Term _nqdmull(TermManager& tm, Term a, Term b, size_t Win, size_t Wout){
    size_t WW=Wout+2;
    Term p=fold_bvmul(tm,_next(tm,a,Win,WW,true),_next(tm,b,Win,WW,true));
    return _nsat_clamp_s(tm,fold_bvshl(tm,p,mk_bv_val(tm,WW,1)),WW,Wout); }
inline Term _nhalf(TermManager& tm, Term a, Term b, size_t W, bool s, bool sub, bool round){
    Term ea=_next(tm,a,W,W+1,s), eb=_next(tm,b,W,W+1,s);
    Term c=sub?fold_bvsub(tm,ea,eb):fold_bvadd(tm,ea,eb);
    if(round) c=fold_bvadd(tm,c,mk_bv_val(tm,W+1,1));
    bool arith=s||sub;
    Term sh=arith?fold_bvashr(tm,c,mk_bv_val(tm,W+1,1)):fold_bvlshr(tm,c,mk_bv_val(tm,W+1,1));
    return fold_bvextract(tm,W-1,0,sh); }
inline Term _nnar_u(TermManager& tm, Term v, size_t W, size_t halfW){
    Term thi=fold_bvzext(tm,W-halfW,bv_ones(tm,halfW));
    return fold_ite(tm,cmp_ugt(tm,v,thi),bv_ones(tm,halfW),fold_bvextract(tm,halfW-1,0,v)); }
inline Term _naddhn(TermManager& tm, Term a, Term b, size_t Wd, size_t halfW, bool sub, bool round){
    Term ea=fold_bvzext(tm,1,a), eb=fold_bvzext(tm,1,b);
    Term c=sub?fold_bvsub(tm,ea,eb):fold_bvadd(tm,ea,eb);
    if(round) c=fold_bvadd(tm,c,mk_bv_val(tm,Wd+1,(int64_t)1<<(halfW-1)));
    return fold_bvextract(tm,halfW-1,0,fold_bvlshr(tm,c,mk_bv_val(tm,Wd+1,(int64_t)halfW))); }
inline Term _npopcnt(TermManager& tm, Term a, size_t W){
    Term c=mk_bv_val(tm,W,0);
    for(size_t b=0;b<W;b++) c=fold_bvadd(tm,c,fold_bvzext(tm,W-1,fold_bvextract(tm,b,b,a)));
    return c; }
inline Term _nclz(TermManager& tm, Term a, size_t W){
    Term cnt=mk_bv_val(tm,W,0), seen=mk_bv_val(tm,1,0);
    for(size_t b=0;b<W;b++){ size_t bit=W-1-b; Term bt=fold_bvextract(tm,bit,bit,a);
        Term notseen=fold_eq(tm,seen,mk_bv_val(tm,1,0));
        Term inc=fold_ite(tm,notseen,fold_ite(tm,fold_eq(tm,bt,mk_bv_val(tm,1,0)),mk_bv_val(tm,W,1),mk_bv_val(tm,W,0)),mk_bv_val(tm,W,0));
        cnt=fold_bvadd(tm,cnt,inc); seen=fold_bvor(tm,seen,bt); }
    return cnt; }
inline Term _ncls(TermManager& tm, Term a, size_t W){
    Term sign=fold_bvextract(tm,W-1,W-1,a);
    Term cnt=mk_bv_val(tm,W,0), notstop=mk_bv_val(tm,1,1);
    for(size_t b=0;b+1<W;b++){ size_t bit=W-2-b; Term bt=fold_bvextract(tm,bit,bit,a);
        Term eqs=fold_ite(tm,fold_eq(tm,bt,sign),mk_bv_val(tm,1,1),mk_bv_val(tm,1,0));
        Term take=fold_bvand(tm,notstop,eqs);
        cnt=fold_bvadd(tm,cnt,fold_bvzext(tm,W-1,take)); notstop=take; }
    return cnt; }
inline Term _nrbit(TermManager& tm, Term a, size_t W){
    Term r=fold_bvextract(tm,0,0,a);
    for(size_t b=1;b<W;b++) r=fold_bvconcat(tm,r,fold_bvextract(tm,b,b,a));
    return r; }


} // namespace salt
