#pragma once
// NEON crypto (AES/SHA/SM3/SM4) — generated.
#include "nhelp.hpp"
namespace salt_cvc5 {

// ---- constant tables ----
static const uint8_t _ncr_AES_SBOX[256]={99,124,119,123,242,107,111,197,48,1,103,43,254,215,171,118,202,130,201,125,250,89,71,240,173,212,162,175,156,164,114,192,183,253,147,38,54,63,247,204,52,165,229,241,113,216,49,21,4,199,35,195,24,150,5,154,7,18,128,226,235,39,178,117,9,131,44,26,27,110,90,160,82,59,214,179,41,227,47,132,83,209,0,237,32,252,177,91,106,203,190,57,74,76,88,207,208,239,170,251,67,77,51,133,69,249,2,127,80,60,159,168,81,163,64,143,146,157,56,245,188,182,218,33,16,255,243,210,205,12,19,236,95,151,68,23,196,167,126,61,100,93,25,115,96,129,79,220,34,42,144,136,70,238,184,20,222,94,11,219,224,50,58,10,73,6,36,92,194,211,172,98,145,149,228,121,231,200,55,109,141,213,78,169,108,86,244,234,101,122,174,8,186,120,37,46,28,166,180,198,232,221,116,31,75,189,139,138,112,62,181,102,72,3,246,14,97,53,87,185,134,193,29,158,225,248,152,17,105,217,142,148,155,30,135,233,206,85,40,223,140,161,137,13,191,230,66,104,65,153,45,15,176,84,187,22};
static const uint8_t _ncr_AES_INV_SBOX[256]={82,9,106,213,48,54,165,56,191,64,163,158,129,243,215,251,124,227,57,130,155,47,255,135,52,142,67,68,196,222,233,203,84,123,148,50,166,194,35,61,238,76,149,11,66,250,195,78,8,46,161,102,40,217,36,178,118,91,162,73,109,139,209,37,114,248,246,100,134,104,152,22,212,164,92,204,93,101,182,146,108,112,72,80,253,237,185,218,94,21,70,87,167,141,157,132,144,216,171,0,140,188,211,10,247,228,88,5,184,179,69,6,208,44,30,143,202,63,15,2,193,175,189,3,1,19,138,107,58,145,17,65,79,103,220,234,151,242,207,206,240,180,230,115,150,172,116,34,231,173,53,133,226,249,55,232,28,117,223,110,71,241,26,113,29,41,197,137,111,183,98,14,170,24,190,27,252,86,62,75,198,210,121,32,154,219,192,254,120,205,90,244,31,221,168,51,136,7,199,49,177,18,16,89,39,128,236,95,96,81,127,169,25,181,74,13,45,229,122,159,147,201,156,239,160,224,59,77,174,42,245,176,200,235,187,60,131,83,153,97,23,43,4,126,186,119,214,38,225,105,20,99,85,33,12,125};
static const uint8_t _ncr_SM4_SBOX[256]={214,144,233,254,204,225,61,183,22,182,20,194,40,251,44,5,43,103,154,118,42,190,4,195,170,68,19,38,73,134,6,153,156,66,80,244,145,239,152,122,51,84,11,67,237,207,172,98,228,179,28,169,201,8,232,149,128,223,148,250,117,143,63,166,71,7,167,252,243,115,23,186,131,89,60,25,230,133,79,168,104,107,129,178,113,100,218,139,248,235,15,75,112,86,157,53,30,36,14,94,99,88,209,162,37,34,124,59,1,33,120,135,212,0,70,87,159,211,39,82,76,54,2,231,160,196,200,158,234,191,138,210,64,199,56,181,163,247,242,206,249,97,21,161,224,174,93,164,155,52,26,85,173,147,50,48,245,140,177,227,29,246,226,46,130,102,202,96,192,41,35,171,13,83,78,111,213,219,55,69,222,253,142,47,3,255,106,114,109,108,91,81,141,27,175,146,187,221,188,127,17,217,92,65,31,16,90,216,10,193,49,136,165,205,123,189,45,116,208,18,184,229,180,176,137,105,151,74,12,150,119,126,101,185,241,9,197,110,198,132,24,240,125,236,58,220,77,32,121,238,95,62,215,203,57,72};

// ---- ShiftRows / InvShiftRows byte permutations (out[i]=in[perm[i]]) ----
static const int _ncr_AES_SR[16]   ={0,5,10,15, 4,9,14,3, 8,13,2,7, 12,1,6,11};
static const int _ncr_AES_ISR[16]  ={0,13,10,7, 4,1,14,11, 8,5,2,15, 12,9,6,3};

// ---- rotate-left of a W-bit term by k (1..W-1) ----
inline Term _ncr_rol(TermManager& tm, const Term& x, unsigned W, unsigned k){
    if(k==0) return x;
    return fold_bvor(tm, fold_bvshl(tm,x,mk_bv_val(tm,W,(int64_t)k)),
                         fold_bvlshr(tm,x,mk_bv_val(tm,W,(int64_t)(W-k))));
}
inline Term _ncr_rol32(TermManager& tm, const Term& x, unsigned k){ return _ncr_rol(tm,x,32,k); }
inline Term _ncr_rol64(TermManager& tm, const Term& x, unsigned k){ return _ncr_rol(tm,x,64,k); }
// rotate-right == rotate-left by W-k
inline Term _ncr_ror32(TermManager& tm, const Term& x, unsigned k){ return _ncr_rol(tm,x,32,32-k); }
inline Term _ncr_ror64(TermManager& tm, const Term& x, unsigned k){ return _ncr_rol(tm,x,64,64-k); }

// ---- byte-indexed S-box lookups (ITE chain over 256 entries) ----
inline Term _ncr_sbox(TermManager& tm, const Term& b){
    Term r=mk_bv_val(tm,8,0);
    for(int k=255;k>=0;k--) r=fold_ite(tm, cmp_eq(tm,b,mk_bv_val(tm,8,k)), mk_bv_val(tm,8,_ncr_AES_SBOX[k]), r);
    return r;
}
inline Term _ncr_isbox(TermManager& tm, const Term& b){
    Term r=mk_bv_val(tm,8,0);
    for(int k=255;k>=0;k--) r=fold_ite(tm, cmp_eq(tm,b,mk_bv_val(tm,8,k)), mk_bv_val(tm,8,_ncr_AES_INV_SBOX[k]), r);
    return r;
}
inline Term _ncr_sm4box(TermManager& tm, const Term& b){
    Term r=mk_bv_val(tm,8,0);
    for(int k=255;k>=0;k--) r=fold_ite(tm, cmp_eq(tm,b,mk_bv_val(tm,8,k)), mk_bv_val(tm,8,_ncr_SM4_SBOX[k]), r);
    return r;
}

// ---- GF(2^8) multiply (poly 0x11B): xtime, then mul-by-constant ----
inline Term _ncr_xtime(TermManager& tm, const Term& b){
    Term sh=fold_bvshl(tm,b,mk_bv_val(tm,8,1));
    Term hi=fold_bvextract(tm,7,7,b);
    return fold_ite(tm, cmp_eq(tm,hi,mk_bv_val(tm,1,1)), fold_bvxor(tm,sh,mk_bv_val(tm,8,0x1B)), sh);
}
inline Term _ncr_gmul(TermManager& tm, const Term& b, unsigned c){
    Term acc=mk_bv_val(tm,8,0); Term cur=b;
    for(unsigned bit=0; bit<8; bit++){
        if(c & (1u<<bit)) acc=fold_bvxor(tm,acc,cur);
        cur=_ncr_xtime(tm,cur);
    }
    return acc;
}

// ---- AES MixColumns / InvMixColumns on a 16-byte lane array (in place into out) ----
inline void _ncr_mixcols(TermManager& tm, const std::array<Term,16>& in, std::array<Term,16>& out){
    for(int col=0; col<4; col++){
        const Term& b0=in[col*4+0]; const Term& b1=in[col*4+1];
        const Term& b2=in[col*4+2]; const Term& b3=in[col*4+3];
        out[col*4+0]=fold_bvxor(tm, fold_bvxor(tm,_ncr_gmul(tm,b0,2),_ncr_gmul(tm,b1,3)), fold_bvxor(tm,b2,b3));
        out[col*4+1]=fold_bvxor(tm, fold_bvxor(tm,b0,_ncr_gmul(tm,b1,2)), fold_bvxor(tm,_ncr_gmul(tm,b2,3),b3));
        out[col*4+2]=fold_bvxor(tm, fold_bvxor(tm,b0,b1), fold_bvxor(tm,_ncr_gmul(tm,b2,2),_ncr_gmul(tm,b3,3)));
        out[col*4+3]=fold_bvxor(tm, fold_bvxor(tm,_ncr_gmul(tm,b0,3),b1), fold_bvxor(tm,b2,_ncr_gmul(tm,b3,2)));
    }
}
inline void _ncr_imixcols(TermManager& tm, const std::array<Term,16>& in, std::array<Term,16>& out){
    for(int col=0; col<4; col++){
        const Term& b0=in[col*4+0]; const Term& b1=in[col*4+1];
        const Term& b2=in[col*4+2]; const Term& b3=in[col*4+3];
        out[col*4+0]=fold_bvxor(tm, fold_bvxor(tm,_ncr_gmul(tm,b0,14),_ncr_gmul(tm,b1,11)), fold_bvxor(tm,_ncr_gmul(tm,b2,13),_ncr_gmul(tm,b3,9)));
        out[col*4+1]=fold_bvxor(tm, fold_bvxor(tm,_ncr_gmul(tm,b0,9),_ncr_gmul(tm,b1,14)), fold_bvxor(tm,_ncr_gmul(tm,b2,11),_ncr_gmul(tm,b3,13)));
        out[col*4+2]=fold_bvxor(tm, fold_bvxor(tm,_ncr_gmul(tm,b0,13),_ncr_gmul(tm,b1,9)), fold_bvxor(tm,_ncr_gmul(tm,b2,14),_ncr_gmul(tm,b3,11)));
        out[col*4+3]=fold_bvxor(tm, fold_bvxor(tm,_ncr_gmul(tm,b0,11),_ncr_gmul(tm,b1,13)), fold_bvxor(tm,_ncr_gmul(tm,b2,9),_ncr_gmul(tm,b3,14)));
    }
}

// ---- SHA helper bit functions (32-bit terms) ----
inline Term _ncr_choose(TermManager& tm, const Term& x, const Term& y, const Term& z){
    // (((y EOR z) AND x) EOR z)
    return fold_bvxor(tm, fold_bvand(tm, fold_bvxor(tm,y,z), x), z);
}
inline Term _ncr_majority(TermManager& tm, const Term& x, const Term& y, const Term& z){
    // (x AND y) OR ((x OR y) AND z)
    return fold_bvor(tm, fold_bvand(tm,x,y), fold_bvand(tm, fold_bvor(tm,x,y), z));
}
inline Term _ncr_parity(TermManager& tm, const Term& x, const Term& y, const Term& z){
    return fold_bvxor(tm, fold_bvxor(tm,x,y), z);
}
inline Term _ncr_SIG0(TermManager& tm, const Term& x){ return fold_bvxor(tm, fold_bvxor(tm,_ncr_ror32(tm,x,2),_ncr_ror32(tm,x,13)), _ncr_ror32(tm,x,22)); }
inline Term _ncr_SIG1(TermManager& tm, const Term& x){ return fold_bvxor(tm, fold_bvxor(tm,_ncr_ror32(tm,x,6),_ncr_ror32(tm,x,11)), _ncr_ror32(tm,x,25)); }

// ---- 4-lane (128-bit) helpers: pack lanes 0..3 (le) into one 128-bit term, and back ----
inline Term _ncr_pack128(TermManager& tm, const std::array<Term,4>& l){
    return fold_bvconcat(tm, fold_bvconcat(tm, l[3], l[2]), fold_bvconcat(tm, l[1], l[0]));
}
inline std::array<Term,4> _ncr_unpack128(TermManager& tm, const Term& v){
    return { fold_bvextract(tm,31,0,v), fold_bvextract(tm,63,32,v),
             fold_bvextract(tm,95,64,v), fold_bvextract(tm,127,96,v) };
}

// =============================== AES ===============================
inline uint8x16_t vaeseq_u8(uint8x16_t data, uint8x16_t key){
    auto& tm = g_ctx->tm;
    std::array<Term,16> st, sr, out;
    for(int i=0;i<16;i++) st[i]=fold_bvxor(tm, data.getLane(i), key.getLane(i));
    for(int i=0;i<16;i++) sr[i]=st[_ncr_AES_SR[i]];          // ShiftRows
    for(int i=0;i<16;i++) out[i]=_ncr_sbox(tm, sr[i]);        // SubBytes
    return uint8x16_t(tm, out);
}
inline uint8x16_t vaesdq_u8(uint8x16_t data, uint8x16_t key){
    auto& tm = g_ctx->tm;
    std::array<Term,16> st, sr, out;
    for(int i=0;i<16;i++) st[i]=fold_bvxor(tm, data.getLane(i), key.getLane(i));
    for(int i=0;i<16;i++) sr[i]=st[_ncr_AES_ISR[i]];         // InvShiftRows
    for(int i=0;i<16;i++) out[i]=_ncr_isbox(tm, sr[i]);       // InvSubBytes
    return uint8x16_t(tm, out);
}
inline uint8x16_t vaesmcq_u8(uint8x16_t data){
    auto& tm = g_ctx->tm;
    std::array<Term,16> in, out;
    for(int i=0;i<16;i++) in[i]=data.getLane(i);
    _ncr_mixcols(tm,in,out);
    return uint8x16_t(tm, out);
}
inline uint8x16_t vaesimcq_u8(uint8x16_t data){
    auto& tm = g_ctx->tm;
    std::array<Term,16> in, out;
    for(int i=0;i<16;i++) in[i]=data.getLane(i);
    _ncr_imixcols(tm,in,out);
    return uint8x16_t(tm, out);
}

// =============================== SHA1 ===============================
// shared SHA1 round body; sel: 0=choose,1=parity,2=majority
inline uint32x4_t _ncr_sha1_round(TermManager& tm, uint32x4_t hash_abcd, uint32_t hash_e, uint32x4_t wk, int sel){
    Term x0=hash_abcd.getLane(0), x1=hash_abcd.getLane(1), x2=hash_abcd.getLane(2), x3=hash_abcd.getLane(3);
    Term Y=mk_bv_val(tm,32,(int64_t)hash_e);
    for(int e=0;e<4;e++){
        Term t = sel==0 ? _ncr_choose(tm,x1,x2,x3)
               : sel==1 ? _ncr_parity(tm,x1,x2,x3)
                        : _ncr_majority(tm,x1,x2,x3);
        Term we = wk.getLane(e);
        Y = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, Y, _ncr_rol32(tm,x0,5)), t), we);
        x1 = _ncr_rol32(tm,x1,30);
        // <Y,X> = ROL(Y : X, 32), where Y is high 32, X is 128 (x3:x2:x1:x0)
        Term YX = fold_bvconcat(tm, Y, _ncr_pack128(tm,{x0,x1,x2,x3})); // 160-bit
        YX = _ncr_rol(tm, YX, 160, 32);
        Y  = fold_bvextract(tm,159,128,YX);
        Term X128 = fold_bvextract(tm,127,0,YX);
        x0=fold_bvextract(tm,31,0,X128); x1=fold_bvextract(tm,63,32,X128);
        x2=fold_bvextract(tm,95,64,X128); x3=fold_bvextract(tm,127,96,X128);
    }
    std::array<Term,4> out={x0,x1,x2,x3};
    return uint32x4_t(tm, out);
}
inline uint32x4_t vsha1cq_u32(uint32x4_t hash_abcd, uint32_t hash_e, uint32x4_t wk){
    return _ncr_sha1_round(g_ctx->tm, hash_abcd, hash_e, wk, 0);
}
inline uint32x4_t vsha1mq_u32(uint32x4_t hash_abcd, uint32_t hash_e, uint32x4_t wk){
    return _ncr_sha1_round(g_ctx->tm, hash_abcd, hash_e, wk, 2);
}
inline uint32x4_t vsha1pq_u32(uint32x4_t hash_abcd, uint32_t hash_e, uint32x4_t wk){
    return _ncr_sha1_round(g_ctx->tm, hash_abcd, hash_e, wk, 1);
}
// scalar-return: cannot carry a symbolic Term (codebase convention).
inline uint32_t vsha1h_u32(uint32_t hash_e){ (void)hash_e; return 0; }

inline uint32x4_t vsha1su0q_u32(uint32x4_t w0_3, uint32x4_t w4_7, uint32x4_t w8_11){
    auto& tm = g_ctx->tm;
    Term op1=_ncr_pack128(tm,{w0_3.getLane(0),w0_3.getLane(1),w0_3.getLane(2),w0_3.getLane(3)});
    Term op2=_ncr_pack128(tm,{w4_7.getLane(0),w4_7.getLane(1),w4_7.getLane(2),w4_7.getLane(3)});
    Term op3=_ncr_pack128(tm,{w8_11.getLane(0),w8_11.getLane(1),w8_11.getLane(2),w8_11.getLane(3)});
    // result = operand2<63:0> : operand1<127:64>
    Term res = fold_bvconcat(tm, fold_bvextract(tm,63,0,op2), fold_bvextract(tm,127,64,op1));
    res = fold_bvxor(tm, fold_bvxor(tm,res,op1), op3);
    auto lanes=_ncr_unpack128(tm,res);
    std::array<Term,4> out={lanes[0],lanes[1],lanes[2],lanes[3]};
    return uint32x4_t(tm, out);
}
inline uint32x4_t vsha1su1q_u32(uint32x4_t tw0_3, uint32x4_t w12_15){
    auto& tm = g_ctx->tm;
    Term op1=_ncr_pack128(tm,{tw0_3.getLane(0),tw0_3.getLane(1),tw0_3.getLane(2),tw0_3.getLane(3)});
    Term op2=_ncr_pack128(tm,{w12_15.getLane(0),w12_15.getLane(1),w12_15.getLane(2),w12_15.getLane(3)});
    Term T = fold_bvxor(tm, op1, fold_bvlshr(tm, op2, mk_bv_val(tm,128,32))); // LSR(op2,32)
    Term t0=fold_bvextract(tm,31,0,T), t1=fold_bvextract(tm,63,32,T), t2=fold_bvextract(tm,95,64,T), t3=fold_bvextract(tm,127,96,T);
    Term r0=_ncr_rol32(tm,t0,1), r1=_ncr_rol32(tm,t1,1), r2=_ncr_rol32(tm,t2,1);
    Term r3=fold_bvxor(tm,_ncr_rol32(tm,t3,1), _ncr_rol32(tm,t0,2));
    std::array<Term,4> out={r0,r1,r2,r3};
    return uint32x4_t(tm, out);
}

// =============================== SHA256 ===============================
// SHA256hash(X,Y,W,part1) — X,Y,W as 4-lane arrays; returns 4-lane array.
inline std::array<Term,4> _ncr_sha256hash(TermManager& tm, std::array<Term,4> X, std::array<Term,4> Y, const std::array<Term,4>& W, bool part1){
    for(int e=0;e<4;e++){
        Term chs=_ncr_choose(tm,Y[0],Y[1],Y[2]);
        Term maj=_ncr_majority(tm,X[0],X[1],X[2]);
        Term t = fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm, Y[3], _ncr_SIG1(tm,Y[0])), chs), W[e]);
        Term newX3 = fold_bvadd(tm, t, X[3]);
        Term newY3 = fold_bvadd(tm, fold_bvadd(tm, t, _ncr_SIG0(tm,X[0])), maj);
        X[3]=newX3; Y[3]=newY3;
        // <Y,X> = ROL(Y:X, 32) over 256 bits (Y high 128, X low 128)
        Term YH=_ncr_pack128(tm,Y), XL=_ncr_pack128(tm,X);
        Term YX=fold_bvconcat(tm,YH,XL);
        YX=_ncr_rol(tm,YX,256,32);
        Term nY=fold_bvextract(tm,255,128,YX), nX=fold_bvextract(tm,127,0,YX);
        X=_ncr_unpack128(tm,nX); Y=_ncr_unpack128(tm,nY);
    }
    return part1 ? X : Y;
}
inline uint32x4_t vsha256hq_u32(uint32x4_t hash_abcd, uint32x4_t hash_efgh, uint32x4_t wk){
    auto& tm = g_ctx->tm;
    std::array<Term,4> X={hash_abcd.getLane(0),hash_abcd.getLane(1),hash_abcd.getLane(2),hash_abcd.getLane(3)};
    std::array<Term,4> Y={hash_efgh.getLane(0),hash_efgh.getLane(1),hash_efgh.getLane(2),hash_efgh.getLane(3)};
    std::array<Term,4> W={wk.getLane(0),wk.getLane(1),wk.getLane(2),wk.getLane(3)};
    auto r=_ncr_sha256hash(tm,X,Y,W,true);
    std::array<Term,4> out={r[0],r[1],r[2],r[3]};
    return uint32x4_t(tm, out);
}
inline uint32x4_t vsha256h2q_u32(uint32x4_t hash_efgh, uint32x4_t hash_abcd, uint32x4_t wk){
    auto& tm = g_ctx->tm;
    // V[d]=hash_efgh, V[n]=hash_abcd, V[m]=wk; part1 FALSE => SHA256hash(V[n],V[d],V[m],FALSE)
    std::array<Term,4> X={hash_abcd.getLane(0),hash_abcd.getLane(1),hash_abcd.getLane(2),hash_abcd.getLane(3)};
    std::array<Term,4> Y={hash_efgh.getLane(0),hash_efgh.getLane(1),hash_efgh.getLane(2),hash_efgh.getLane(3)};
    std::array<Term,4> W={wk.getLane(0),wk.getLane(1),wk.getLane(2),wk.getLane(3)};
    auto r=_ncr_sha256hash(tm,X,Y,W,false);
    std::array<Term,4> out={r[0],r[1],r[2],r[3]};
    return uint32x4_t(tm, out);
}
inline uint32x4_t vsha256su0q_u32(uint32x4_t w0_3, uint32x4_t w4_7){
    auto& tm = g_ctx->tm;
    Term op1=_ncr_pack128(tm,{w0_3.getLane(0),w0_3.getLane(1),w0_3.getLane(2),w0_3.getLane(3)});
    Term op2=_ncr_pack128(tm,{w4_7.getLane(0),w4_7.getLane(1),w4_7.getLane(2),w4_7.getLane(3)});
    // T = operand2<31:0> : operand1<127:32>
    Term T = fold_bvconcat(tm, fold_bvextract(tm,31,0,op2), fold_bvextract(tm,127,32,op1));
    auto Te=_ncr_unpack128(tm,T);
    auto o1=_ncr_unpack128(tm,op1);
    std::array<Term,4> out;
    for(int e=0;e<4;e++){
        Term elt=fold_bvxor(tm, fold_bvxor(tm,_ncr_ror32(tm,Te[e],7),_ncr_ror32(tm,Te[e],18)), fold_bvlshr(tm,Te[e],mk_bv_val(tm,32,3)));
        out[e]=fold_bvadd(tm, elt, o1[e]);
    }
    return uint32x4_t(tm, out);
}
inline uint32x4_t vsha256su1q_u32(uint32x4_t tw0_3, uint32x4_t w8_11, uint32x4_t w12_15){
    auto& tm = g_ctx->tm;
    Term op1=_ncr_pack128(tm,{tw0_3.getLane(0),tw0_3.getLane(1),tw0_3.getLane(2),tw0_3.getLane(3)});
    Term op2=_ncr_pack128(tm,{w8_11.getLane(0),w8_11.getLane(1),w8_11.getLane(2),w8_11.getLane(3)});
    Term op3=_ncr_pack128(tm,{w12_15.getLane(0),w12_15.getLane(1),w12_15.getLane(2),w12_15.getLane(3)});
    // T0 = operand3<31:0> : operand2<127:32>
    Term T0 = fold_bvconcat(tm, fold_bvextract(tm,31,0,op3), fold_bvextract(tm,127,32,op2));
    auto T0e=_ncr_unpack128(tm,T0);
    auto o1=_ncr_unpack128(tm,op1);
    // T1 = operand3<127:64>  (two 32-bit elems: e=0->bits 79:64? Elem[T1,e,32] with T1 64-bit)
    Term T1a=fold_bvextract(tm,95,64,op3);   // operand3<95:64>  = T1 elem0
    Term T1b=fold_bvextract(tm,127,96,op3);  // operand3<127:96> = T1 elem1
    std::array<Term,4> out;
    for(int e=0;e<2;e++){
        Term elt = (e==0)?T1a:T1b;
        elt=fold_bvxor(tm, fold_bvxor(tm,_ncr_ror32(tm,elt,17),_ncr_ror32(tm,elt,19)), fold_bvlshr(tm,elt,mk_bv_val(tm,32,10)));
        out[e]=fold_bvadd(tm, fold_bvadd(tm,elt,o1[e]), T0e[e]);
    }
    // T1 = result<63:0> -> elems out[0],out[1]
    for(int e=2;e<4;e++){
        Term elt = out[e-2];
        elt=fold_bvxor(tm, fold_bvxor(tm,_ncr_ror32(tm,elt,17),_ncr_ror32(tm,elt,19)), fold_bvlshr(tm,elt,mk_bv_val(tm,32,10)));
        out[e]=fold_bvadd(tm, fold_bvadd(tm,elt,o1[e]), T0e[e]);
    }
    return uint32x4_t(tm, out);
}

// =============================== SHA512 ===============================
inline uint64x2_t vsha512hq_u64(uint64x2_t hash_ed, uint64x2_t hash_gf, uint64x2_t kwh_kwh2){
    auto& tm = g_ctx->tm;
    // X=V[n]=hash_gf, Y=V[m]=kwh_kwh2, W=V[d]=hash_ed. lane0=<63:0>, lane1=<127:64>.
    Term Xl=hash_gf.getLane(0),  Xh=hash_gf.getLane(1);
    Term Yl=kwh_kwh2.getLane(0), Yh=kwh_kwh2.getLane(1);
    Term Wl=hash_ed.getLane(0),  Wh=hash_ed.getLane(1);
    Term MSigma1=fold_bvxor(tm, fold_bvxor(tm,_ncr_ror64(tm,Yh,14),_ncr_ror64(tm,Yh,18)), _ncr_ror64(tm,Yh,41));
    Term Vth=fold_bvxor(tm, fold_bvand(tm,Yh,Xl), fold_bvand(tm,fold_bvnot(tm,Yh),Xh));
    Vth=fold_bvadd(tm, fold_bvadd(tm,Vth,MSigma1), Wh);
    Term tmp=fold_bvadd(tm,Vth,Yl);
    MSigma1=fold_bvxor(tm, fold_bvxor(tm,_ncr_ror64(tm,tmp,14),_ncr_ror64(tm,tmp,18)), _ncr_ror64(tm,tmp,41));
    Term Vtl=fold_bvxor(tm, fold_bvand(tm,tmp,Yh), fold_bvand(tm,fold_bvnot(tm,tmp),Xl));
    Vtl=fold_bvadd(tm, fold_bvadd(tm,Vtl,MSigma1), Wl);
    std::array<Term,2> out={Vtl,Vth};
    return uint64x2_t(tm, out);
}
inline uint64x2_t vsha512h2q_u64(uint64x2_t sum_ab, uint64x2_t hash_c_, uint64x2_t hash_ab){
    auto& tm = g_ctx->tm;
    // X=V[n]=hash_c_, Y=V[m]=hash_ab, W=V[d]=sum_ab.
    Term Xl=hash_c_.getLane(0), Xh=hash_c_.getLane(1);
    Term Yl=hash_ab.getLane(0), Yh=hash_ab.getLane(1);
    Term Wl=sum_ab.getLane(0),  Wh=sum_ab.getLane(1);
    Term NSigma0=fold_bvxor(tm, fold_bvxor(tm,_ncr_ror64(tm,Yl,28),_ncr_ror64(tm,Yl,34)), _ncr_ror64(tm,Yl,39));
    Term Vth=fold_bvxor(tm, fold_bvxor(tm, fold_bvand(tm,Xl,Yh), fold_bvand(tm,Xl,Yl)), fold_bvand(tm,Yh,Yl));
    Vth=fold_bvadd(tm, fold_bvadd(tm,Vth,NSigma0), Wh);
    NSigma0=fold_bvxor(tm, fold_bvxor(tm,_ncr_ror64(tm,Vth,28),_ncr_ror64(tm,Vth,34)), _ncr_ror64(tm,Vth,39));
    Term Vtl=fold_bvxor(tm, fold_bvxor(tm, fold_bvand(tm,Vth,Yl), fold_bvand(tm,Vth,Yh)), fold_bvand(tm,Yh,Yl));
    Vtl=fold_bvadd(tm, fold_bvadd(tm,Vtl,NSigma0), Wl);
    std::array<Term,2> out={Vtl,Vth};
    return uint64x2_t(tm, out);
}
inline uint64x2_t vsha512su0q_u64(uint64x2_t w0_1, uint64x2_t w2_){
    auto& tm = g_ctx->tm;
    // X=V[n]=w2_, W=V[d]=w0_1.
    Term Xl=w2_.getLane(0);
    Term Wl=w0_1.getLane(0), Wh=w0_1.getLane(1);
    // sig0 on W<127:64>: ROR1 ^ ROR8 ^ (W<127:64> LSR 7)
    Term s0a=fold_bvxor(tm, fold_bvxor(tm,_ncr_ror64(tm,Wh,1),_ncr_ror64(tm,Wh,8)), fold_bvlshr(tm,Wh,mk_bv_val(tm,64,7)));
    Term Vtl=fold_bvadd(tm, Wl, s0a);
    // sig0 on X<63:0>
    Term s0b=fold_bvxor(tm, fold_bvxor(tm,_ncr_ror64(tm,Xl,1),_ncr_ror64(tm,Xl,8)), fold_bvlshr(tm,Xl,mk_bv_val(tm,64,7)));
    Term Vth=fold_bvadd(tm, Wh, s0b);
    std::array<Term,2> out={Vtl,Vth};
    return uint64x2_t(tm, out);
}
inline uint64x2_t vsha512su1q_u64(uint64x2_t s01_s02, uint64x2_t w14_15, uint64x2_t w9_10){
    auto& tm = g_ctx->tm;
    // X=V[n]=w14_15, Y=V[m]=w9_10, W=V[d]=s01_s02.
    Term Xl=w14_15.getLane(0), Xh=w14_15.getLane(1);
    Term Yl=w9_10.getLane(0),  Yh=w9_10.getLane(1);
    Term Wl=s01_s02.getLane(0),Wh=s01_s02.getLane(1);
    // sig1 on X<127:64>: ROR19 ^ ROR61 ^ (X<127:64> LSR 6)
    Term s1a=fold_bvxor(tm, fold_bvxor(tm,_ncr_ror64(tm,Xh,19),_ncr_ror64(tm,Xh,61)), fold_bvlshr(tm,Xh,mk_bv_val(tm,64,6)));
    Term Vth=fold_bvadd(tm, fold_bvadd(tm,Wh,s1a), Yh);
    Term s1b=fold_bvxor(tm, fold_bvxor(tm,_ncr_ror64(tm,Xl,19),_ncr_ror64(tm,Xl,61)), fold_bvlshr(tm,Xl,mk_bv_val(tm,64,6)));
    Term Vtl=fold_bvadd(tm, fold_bvadd(tm,Wl,s1b), Yl);
    std::array<Term,2> out={Vtl,Vth};
    return uint64x2_t(tm, out);
}

// =============================== SM3 ===============================
inline uint32x4_t vsm3partw1q_u32(uint32x4_t a, uint32x4_t b, uint32x4_t c){
    auto& tm = g_ctx->tm;
    // Vd=a, Vn=b, Vm=c. result lanes r0..r3.
    Term d0=a.getLane(0),d1=a.getLane(1),d2=a.getLane(2),d3=a.getLane(3);
    Term n0=b.getLane(0),n1=b.getLane(1),n2=b.getLane(2),n3=b.getLane(3);
    Term m1=c.getLane(1),m2=c.getLane(2),m3=c.getLane(3);
    // result<95:0> = (Vd EOR Vn)<95:0> EOR (ROL(Vm<127:96>,15):ROL(Vm<95:64>,15):ROL(Vm<63:32>,15))
    Term r0=fold_bvxor(tm, fold_bvxor(tm,d0,n0), _ncr_rol32(tm,m1,15));
    Term r1=fold_bvxor(tm, fold_bvxor(tm,d1,n1), _ncr_rol32(tm,m2,15));
    Term r2=fold_bvxor(tm, fold_bvxor(tm,d2,n2), _ncr_rol32(tm,m3,15));
    Term r3; // computed at i==3 below
    Term rr[4]={r0,r1,r2,Term()};
    for(int i=0;i<4;i++){
        if(i==3){
            rr[3]=fold_bvxor(tm, fold_bvxor(tm,d3,n3), _ncr_rol32(tm,rr[0],15));
        }
        rr[i]=fold_bvxor(tm, fold_bvxor(tm,rr[i],_ncr_rol32(tm,rr[i],15)), _ncr_rol32(tm,rr[i],23));
    }
    std::array<Term,4> out={rr[0],rr[1],rr[2],rr[3]};
    return uint32x4_t(tm, out);
}
inline uint32x4_t vsm3partw2q_u32(uint32x4_t a, uint32x4_t b, uint32x4_t c){
    auto& tm = g_ctx->tm;
    // Vd=a, Vn=b, Vm=c.
    Term d0=a.getLane(0),d1=a.getLane(1),d2=a.getLane(2),d3=a.getLane(3);
    Term n0=b.getLane(0),n1=b.getLane(1),n2=b.getLane(2),n3=b.getLane(3);
    Term m0=c.getLane(0),m1=c.getLane(1),m2=c.getLane(2),m3=c.getLane(3);
    // tmp = Vn EOR (ROL(Vm<127:96>,7):ROL(Vm<95:64>,7):ROL(Vm<63:32>,7):ROL(Vm<31:0>,7))
    Term t0=fold_bvxor(tm,n0,_ncr_rol32(tm,m0,7));
    Term t1=fold_bvxor(tm,n1,_ncr_rol32(tm,m1,7));
    Term t2=fold_bvxor(tm,n2,_ncr_rol32(tm,m2,7));
    Term t3=fold_bvxor(tm,n3,_ncr_rol32(tm,m3,7));
    Term r0=fold_bvxor(tm,d0,t0), r1=fold_bvxor(tm,d1,t1), r2=fold_bvxor(tm,d2,t2), r3=fold_bvxor(tm,d3,t3);
    Term tmp2=_ncr_rol32(tm,t0,15);
    tmp2=fold_bvxor(tm, fold_bvxor(tm,tmp2,_ncr_rol32(tm,tmp2,15)), _ncr_rol32(tm,tmp2,23));
    r3=fold_bvxor(tm,r3,tmp2);
    std::array<Term,4> out={r0,r1,r2,r3};
    return uint32x4_t(tm, out);
}
inline uint32x4_t vsm3ss1q_u32(uint32x4_t a, uint32x4_t b, uint32x4_t c){
    auto& tm = g_ctx->tm;
    // ACLE: a=Vn, b=Vm, c=Va. Vd<127:96>=ROL(ROL(Vn<127:96>,12)+Vm<127:96>+Va<127:96>,7); rest 0.
    Term vn3=a.getLane(3), vm3=b.getLane(3), va3=c.getLane(3);
    Term s=fold_bvadd(tm, fold_bvadd(tm,_ncr_rol32(tm,vn3,12),vm3), va3);
    Term r3=_ncr_rol32(tm,s,7);
    Term z=mk_bv_val(tm,32,0);
    std::array<Term,4> out={z,z,z,r3};
    return uint32x4_t(tm, out);
}
// SM3TT1: sel 0=EOR (a-variant), 1=majority (b-variant)
inline uint32x4_t _ncr_sm3tt1(TermManager& tm, uint32x4_t a, uint32x4_t b, uint32x4_t c, int imm2, int sel){
    Term d0=a.getLane(0),d1=a.getLane(1),d2=a.getLane(2),d3=a.getLane(3);
    Term n3=b.getLane(3);
    Term Wj=c.getLane(imm2&3);
    Term SS2=fold_bvxor(tm, n3, _ncr_rol32(tm,d3,12));
    Term TT1 = sel==0 ? fold_bvxor(tm, d1, fold_bvxor(tm,d3,d2))
                      : fold_bvor(tm, fold_bvor(tm, fold_bvand(tm,d3,d1), fold_bvand(tm,d3,d2)), fold_bvand(tm,d1,d2));
    TT1=fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm,TT1,d0), SS2), Wj);
    Term r0=d1, r1=_ncr_rol32(tm,d2,9), r2=d3, r3=TT1;
    std::array<Term,4> out={r0,r1,r2,r3};
    return uint32x4_t(tm, out);
}
inline uint32x4_t vsm3tt1aq_u32(uint32x4_t a, uint32x4_t b, uint32x4_t c, const int imm2){
    return _ncr_sm3tt1(g_ctx->tm, a, b, c, imm2, 0);
}
inline uint32x4_t vsm3tt1bq_u32(uint32x4_t a, uint32x4_t b, uint32x4_t c, const int imm2){
    return _ncr_sm3tt1(g_ctx->tm, a, b, c, imm2, 1);
}
// SM3TT2: sel 0=EOR, 1=GG ((Vd3 AND Vd2) OR (NOT Vd3 AND Vd1))
inline uint32x4_t _ncr_sm3tt2(TermManager& tm, uint32x4_t a, uint32x4_t b, uint32x4_t c, int imm2, int sel){
    Term d0=a.getLane(0),d1=a.getLane(1),d2=a.getLane(2),d3=a.getLane(3);
    Term n3=b.getLane(3);
    Term Wj=c.getLane(imm2&3);
    Term TT2 = sel==0 ? fold_bvxor(tm, d1, fold_bvxor(tm,d3,d2))
                      : fold_bvor(tm, fold_bvand(tm,d3,d2), fold_bvand(tm,fold_bvnot(tm,d3),d1));
    TT2=fold_bvadd(tm, fold_bvadd(tm, fold_bvadd(tm,TT2,d0), n3), Wj);
    Term r0=d1, r1=_ncr_rol32(tm,d2,19), r2=d3;
    Term r3=fold_bvxor(tm, fold_bvxor(tm,TT2,_ncr_rol32(tm,TT2,9)), _ncr_rol32(tm,TT2,17));
    std::array<Term,4> out={r0,r1,r2,r3};
    return uint32x4_t(tm, out);
}
inline uint32x4_t vsm3tt2aq_u32(uint32x4_t a, uint32x4_t b, uint32x4_t c, const int imm2){
    return _ncr_sm3tt2(g_ctx->tm, a, b, c, imm2, 0);
}
inline uint32x4_t vsm3tt2bq_u32(uint32x4_t a, uint32x4_t b, uint32x4_t c, const int imm2){
    return _ncr_sm3tt2(g_ctx->tm, a, b, c, imm2, 1);
}

// =============================== SM4 ===============================
// SM4 nonlinear tau over a 32-bit word: apply Sbox to each byte.
inline Term _ncr_sm4_tau(TermManager& tm, const Term& w){
    Term b0=fold_bvextract(tm,7,0,w),  b1=fold_bvextract(tm,15,8,w);
    Term b2=fold_bvextract(tm,23,16,w),b3=fold_bvextract(tm,31,24,w);
    b0=_ncr_sm4box(tm,b0); b1=_ncr_sm4box(tm,b1); b2=_ncr_sm4box(tm,b2); b3=_ncr_sm4box(tm,b3);
    return fold_bvconcat(tm, fold_bvconcat(tm,b3,b2), fold_bvconcat(tm,b1,b0));
}
inline uint32x4_t vsm4eq_u32(uint32x4_t a, uint32x4_t b){
    auto& tm = g_ctx->tm;
    // Vn=b round keys; roundresult=V[d]=a.
    Term rr0=a.getLane(0),rr1=a.getLane(1),rr2=a.getLane(2),rr3=a.getLane(3);
    for(int index=0;index<4;index++){
        Term rk=b.getLane(index);
        Term intval=fold_bvxor(tm, fold_bvxor(tm,rr3,rr2), fold_bvxor(tm,rr1,rk));
        intval=_ncr_sm4_tau(tm,intval);
        intval=fold_bvxor(tm, fold_bvxor(tm, fold_bvxor(tm, fold_bvxor(tm,intval,_ncr_rol32(tm,intval,2)), _ncr_rol32(tm,intval,10)), _ncr_rol32(tm,intval,18)), _ncr_rol32(tm,intval,24));
        intval=fold_bvxor(tm,intval,rr0);
        rr0=rr1; rr1=rr2; rr2=rr3; rr3=intval;
    }
    std::array<Term,4> out={rr0,rr1,rr2,rr3};
    return uint32x4_t(tm, out);
}
inline uint32x4_t vsm4ekeyq_u32(uint32x4_t a, uint32x4_t b){
    auto& tm = g_ctx->tm;
    // Vm=b constants; roundresult=V[n]=a.
    Term rr0=a.getLane(0),rr1=a.getLane(1),rr2=a.getLane(2),rr3=a.getLane(3);
    for(int index=0;index<4;index++){
        Term ck=b.getLane(index);
        Term intval=fold_bvxor(tm, fold_bvxor(tm,rr3,rr2), fold_bvxor(tm,rr1,ck));
        intval=_ncr_sm4_tau(tm,intval);
        intval=fold_bvxor(tm, fold_bvxor(tm,intval,_ncr_rol32(tm,intval,13)), _ncr_rol32(tm,intval,23));
        intval=fold_bvxor(tm,intval,rr0);
        rr0=rr1; rr1=rr2; rr2=rr3; rr3=intval;
    }
    std::array<Term,4> out={rr0,rr1,rr2,rr3};
    return uint32x4_t(tm, out);
}

} // namespace salt_cvc5
