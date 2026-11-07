#!/usr/bin/env python3
"""Unit tests of the rules R17, R20, R21, R22, R23, R25, R26 on small self-contained fixtures
(`--isa x86 --preprocessed`; R26 and the HVX cases use `--isa hvx` on plain kernel files). Each case states the expected outcome (rewrite or rejection).
usage: rule_tests.py [--out DIR]    exit code 0 = all cases as expected
"""
import argparse
import json
import re
import subprocess
import sys
import tempfile
from pathlib import Path

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE))
import rvv_ptr_lower as L  # noqa: E402

TYPES = """typedef struct { float s0, s1, s2, s3; } __m128;
typedef struct { float s0, s1, s2, s3, s4, s5, s6, s7; } __m256;
__m128 op(__m128 a, __m128 b);
__m128 op3(__m128 a, __m128 b, __m128 c);
__m128 id(__m128 a);
int cond(__m128 a);
void qcp_mm256_storeu_ps(float *p, const __m256 *a);
"""

CASES = []


def case(name, body, expect, check=None, pre=True, isa="x86", extra=()):
    """pre=True: preprocessed fixture (TYPES prelude, `--preprocessed`); pre=False: a plain
    kernel file parsed with the ISA profile (system headers available)."""
    CASES.append((name, (TYPES if pre else "") + body, expect, check, pre, isa, list(extra)))


def survivors(text):
    return sorted(re.findall(r"^(?:static\s+(?:inline\s+)?)?(?:int|void)\s+(\w+)\s*\(", text.split("/* END-TYPES */")[-1], re.M))


# ---- R20 -------------------------------------------------------------------
case("R20 unreferenced / chain / recursion / prototype deleted; non-static, non-inline, referenced kept",
     """/* END-TYPES */
static inline int dead_a(void) { return 1; }
static inline int dead_b(void) { return 2; }
static inline int dead_c(void) { return dead_b(); }
static inline int dead_rec(int n) { return n ? dead_rec(n - 1) : 0; }
static inline int dead_proto(void);
static inline int dead_proto(void) { return 3; }
static inline int keep_ref(void) { return 4; }
static inline int keep_fp(void) { return 5; }
static int keep_plain(void) { return 6; }
int keep_extern(void) { return 7; }
int (*gp)(void) = keep_fp;
int user(void) { return keep_ref() + keep_plain(); }
""", "ok", lambda t, rw: (
    sorted({e["function"] for e in rw if e["rule"] == "R20"}) ==
    ["dead_a", "dead_b", "dead_c", "dead_proto", "dead_rec"] and
    sorted(re.findall(r"\b(keep_\w+)\s*\(void\)\s*{", t)) == ["keep_extern", "keep_fp", "keep_plain", "keep_ref"] and
    "dead_" not in t))

def retained(js):
    return {r["function"]: r["reason"] for r in js["r20_retained"]}


case("R20 negative controls: constructor / destructor / used / retain / alias target / cleanup function are kept; only the dead one goes",
     """/* END-TYPES */
static inline void ctor(void) __attribute__((constructor));
static inline void ctor(void) {}
static inline __attribute__((destructor)) void dtor(void) {}
static inline __attribute__((used)) int usedf(void) { return 1; }
static inline __attribute__((retain)) int retf(void) { return 1; }
static inline int al_target(void) { return 0; }
int al_name(void) __attribute__((alias("al_target")));
static inline void clean_f(int *p) { (void)p; }
void g(void) { int x __attribute__((cleanup(clean_f))) = 0; (void)x; }
static inline int dead_one(void) { return 9; }
""", "ok", lambda t, rw, js: (
    [e["function"] for e in rw if e["rule"] == "R20"] == ["dead_one"] and
    set(retained(js)) == {"ctor", "dtor", "usedf", "retf", "al_target", "clean_f"} and
    "attribute: constructor" in retained(js)["ctor"] and
    "attribute: destructor" in retained(js)["dtor"] and
    "attribute: used" in retained(js)["usedf"] and
    "attribute: retain" in retained(js)["retf"] and
    "referenced by FunctionDecl al_name" in retained(js)["al_target"] and
    "referenced by FunctionDecl g" in retained(js)["clean_f"] and
    "dead_one" not in t))
case("R20 negative controls: referenced by call, address-of, function-pointer store, array initialiser; reference cycle kept",
     """/* END-TYPES */
static inline int by_call(void) { return 1; }
static inline int by_addr(void) { return 2; }
static inline int by_store(void) { return 3; }
static inline int by_init(void) { return 4; }
static inline int cyc_a(int n);
static inline int cyc_b(int n) { return n ? cyc_a(n - 1) : 0; }
static inline int cyc_a(int n) { return n ? cyc_b(n - 1) : 0; }
static inline int chain_leaf(void) { return 5; }
static inline int chain_mid(void) { return chain_leaf(); }
static inline int dead_top(void) { return chain_mid(); }
int (*tab[])(void) = { by_init };
int use(int (**out)(void)) { *out = by_store; (void)&by_addr; return by_call(); }
""", "ok", lambda t, rw, js: (
    sorted({e["function"] for e in rw if e["rule"] == "R20"}) == ["chain_leaf", "chain_mid", "dead_top"] and
    set(retained(js)) == {"by_call", "by_addr", "by_store", "by_init", "cyc_a", "cyc_b"} and
    "reference cycle kept conservatively" in retained(js)["cyc_a"] and
    "reference cycle kept conservatively" in retained(js)["cyc_b"] and
    "reference cycle" not in retained(js)["by_init"] and
    "chain_" not in t))

# ---- R17 (x86: the callee must be a builtin or declared in a system header) ---------
R17_BODY = """void f(float *out) {
  static const float tbl[8] = {1, 2, 3, 4, 5, 6, 7, 8};
  __m256 v = %s(tbl);
  _mm256_storeu_ps(out, v);
}
"""
case("R17 positive control: static const table passed to the system intrinsic _mm256_loadu_ps",
     R17_BODY % "_mm256_loadu_ps", "ok",
     lambda t, rw: sum(e["rule"] == "R17" for e in rw) == 1 and "static const float tbl" not in t, pre=False)
case("R17 rejected: user-defined function named _mm_my_load receives the table",
     "static inline __m256 _mm_my_load(const float *p) { return _mm256_loadu_ps(p); }\n" + R17_BODY % "_mm_my_load",
     "reject:STATIC", pre=False)
case("R17 rejected: _mm_ext only declared in the kernel file",
     "__m256 _mm_ext(const float *p);\n" + R17_BODY % "_mm_ext", "reject:STATIC", pre=False)

# ---- R21 -------------------------------------------------------------------
case("R21 declaration initialiser, assignment, expression statement, triple use",
     """void f(__m128 v, __m128 w) {
  __m128 r = op(v, v);
  r = op(r, r);
  op(v, v);
  r = op3(v, w, v);
  r = op3(v, v, v);
  r = op(v, w);
}
""", "ok", lambda t, rw: (
    sum(e["rule"] == "R21" and e["original"] == "" for e in rw) == 5 and
    len(re.findall(r"__m128 qcpv_dup\d+ = ", t)) == 6 and
    "op(v, w);" in t))
case("R21 is off for --isa neon (negative control: same-variable repeated argument is left alone)",
     """typedef struct { float s[4]; } float32x4_t;
float32x4_t vop(float32x4_t a, float32x4_t b);
void g(float32x4_t v) { float32x4_t r = vop(v, v); (void)r; }
""", "ok", lambda t, rw: not rw and "qcpv_dup" not in t, isa="neon")
case("R21 inside a nested block and loop body block",
     """void f(__m128 v) {
  for (int i = 0; i < 2; i++) { __m128 r = op(v, v); (void)r; }
}
""", "ok", lambda t, rw: len(re.findall(r"qcpv_dup", t)) == 2)
case("R21 rejected: nested call", "void f(__m128 v) { __m128 r = id(op(v, v)); (void)r; }\n", "reject:R21")
case("R21 rejected: call in an if condition", "void f(__m128 v) { if (cond(op(v, v))) { } }\n", "reject:R21")
case("R21 rejected: bare statement body of a loop", "void f(__m128 v) { for (int i = 0; i < 2; i++) op(v, v); }\n", "reject:R21")
case("R21 rejected: argument contains a call", "void f(__m128 v) { __m128 r = op3(v, id(v), v); (void)r; }\n", "reject:R21")

# ---- R22 -------------------------------------------------------------------
case("R22 wrapper call annotated; pure by-value function and pointer form untouched",
     """static inline void st(float* p, __m256 v) { qcp_mm256_storeu_ps(p, &v); }
static inline void st2(float* p, __m256 a, __m256 b) { qcp_mm256_storeu_ps(p, &a); qcp_mm256_storeu_ps(p + 8, &b); }
static inline __m256 pure(__m256 a) { return a; }
void f(float* o, __m256 x, __m256 y) {
  st(o, x);
  st2(o, x, y);
  __m256 z = pure(x);
  qcp_mm256_storeu_ps(o, &z);
}
""", "ok", lambda t, rw: (
    [e["rewritten"] for e in rw if e["rule"] == "R22"] == ["\n/*@ where v=&x */\n", "\n/*@ where a=&x, b=&y */\n"] and
    t.count("/*@") == 2))
case("R22 rejected: by-value argument is not a plain variable",
     """__m256 make(void);
static inline void st(float* p, __m256 v) { qcp_mm256_storeu_ps(p, &v); }
void f(float* o) { st(o, make()); }
""", "reject:R22")


# ---- R23 (`*p++` split; all ISAs) --------------------------------------------------
R23_POS = """#include <stdint.h>
#include <stdio.h>
static const int8_t buf[16] = {1, -2, 3, -4, 5, -6, 7, -8, 9, -10, 11, -12, 13, -14, 15, -16};
int f_decl(const int8_t* p) { const int8_t v = *p++; return v * 100 + p[0]; }
int f_assign(const int8_t* p) { int x; x = *p++; return x * 100 + p[0]; }
int f_postdec(const int8_t* p) { p += 4; int x = *p--; return x * 100 + p[0]; }
int f_preinc(const int8_t* p) { int x = *++p; return x * 100 + p[0]; }
int f_predec(const int8_t* p) { p += 4; int x = *--p; return x * 100 + p[0]; }
int f_assign_pre(const int8_t* p) { int x; x = *++p; return x * 100 + p[0]; }
int f_loop(const int8_t* p, int n) { int s = 0; do { const int8_t v = *p++; s += v; } while (--n != 0); return s * 100 + p[0]; }
int f_binop(const int8_t* p, int a) { int x = a + 2 * *p++; return x * 100 + p[0]; }
int f_cast(const int8_t* p) { long x = (long)*p++; return (int)x * 100 + p[0]; }
int f_paren(const int8_t* q) { const int8_t* p = q; int x = *(p++); return x * 100 + *p; }
int f_ptrptr(const int8_t* const* ids) { const int8_t* r = *ids; int x = *r++; return x * 100 + r[0]; }
int main(void) {
  const int8_t* b = buf;
  printf("%d %d %d %d %d %d %d %d %d %d %d\\n", f_decl(b), f_assign(b), f_postdec(b), f_preinc(b), f_predec(b + 1),
         f_assign_pre(b), f_loop(b, 3), f_binop(b, 7), f_cast(b), f_paren(b), f_ptrptr(&b));
  return 0;
}
"""


def exec_equal(orig, new):
    """Compile both programs with the host gcc and compare stdout and exit code."""
    outs = []
    with tempfile.TemporaryDirectory(prefix="r23exec_") as tmp:
        for tag, txt in (("o", orig), ("n", new)):
            c = Path(tmp) / (tag + ".c")
            c.write_text(txt)
            b = Path(tmp) / (tag + ".exe")
            r = subprocess.run(["gcc", "-O0", "-w", "-o", str(b), str(c)], capture_output=True, text=True)
            if r.returncode:
                return False
            q = subprocess.run([str(b)], capture_output=True, text=True)
            outs.append((q.returncode, q.stdout))
    return outs[0] == outs[1] and outs[0][1].strip() != ""


R23_LEFT = re.compile(r"\*\s*\(?\s*(?:\+\+|--)?\s*\w+\s*(?:\+\+|--)")
R23_LEFT2 = re.compile(r"\*\s*\(?\s*(?:\+\+|--)")


def r23_pos_check(orig):
    def chk(t, rw):
        r = [e for e in rw if e["rule"] == "R23"]
        ins = [e["rewritten"].strip() for e in r if e["original"] == ""]
        # 11 sites; each is two log entries (the operand edit and the inserted update)
        return (len(r) == 22 and len(ins) == 11 and not R23_LEFT.search(t) and not R23_LEFT2.search(t) and
                "const int8_t v = *p; p += 1;" in t and "x = *p; p += 1;" in t and
                "int x = *p; p -= 1;" in t and "p += 1; int x = *p;" in t and "p -= 1; int x = *p;" in t and
                "p += 1; x = *p;" in t and exec_equal(orig, t))
    return chk


case("R23 positive (x86): declaration, assignment, ++/-- prefix and postfix, cast, binary operand, parentheses, do-while body",
     R23_POS, "ok", r23_pos_check(R23_POS), pre=False)
case("R23 positive (neon profile): same fixture", R23_POS, "ok", r23_pos_check(R23_POS), pre=False, isa="neon")

R23_NEG_HEAD = "#include <stdint.h>\nextern const int8_t gbuf[4];\nconst int8_t* gp;\nstruct S { const int8_t* p; };\n"
for _name, _body in [
    ("p is a global", "int f(void) { int x = *gp++; return x; }"),
    ("p is a function-local static", "int f(void) { static const int8_t* sp = gbuf; int x = *sp++; return x; }"),
    ("p occurs again in the statement (initialiser)", "int f(const int8_t* p) { int x = *p++ + p[0]; return x; }"),
    ("p occurs again in the statement (assignment right-hand side)", "int f(const int8_t* p) { int x; x = *p++ * *p; return x; }"),
    ("p occurs again on the left-hand side", "int g(int* q, const int8_t* p) { q[*p] = *p++; return 0; }"),
    ("in an if condition", "int f(const int8_t* p) { int x = 0; if (*p++ > 0) { x = 1; } return x; }"),
    ("in a while condition", "int f(const int8_t* p) { int x = 0; while (*p++) { x++; } return x; }"),
    ("in a do-while condition", "int f(const int8_t* p) { int x = 0; do { x++; } while (*p++); return x; }"),
    ("in a for condition", "int f(const int8_t* p) { int x = 0; for (; *p++; ) { x++; } return x; }"),
    ("in a for initialiser", "int f(const int8_t* p) { int x = 0; for (int y = *p++; y < 3; y++) { x++; } return x; }"),
    ("unbraced if body", "int f(const int8_t* p, int n) { int x = 0; if (n) x = *p++; return x; }"),
    ("unbraced for body", "int f(const int8_t* p, int n) { int x = 0; for (int i = 0; i < n; i++) x = *p++; return x; }"),
    ("member expression operand", "int f(struct S* s) { int x = *s->p++; return x; }"),
    ("volatile pointer", "int f(const int8_t* volatile p) { int x = *p++; return x; }"),
    ("address of p taken in the function", "int f(const int8_t* p) { const int8_t** pp = &p; int x = *p++; return x + (**pp); }"),
    ("conditional operator arm", "int f(const int8_t* p, int n) { int x = n ? *p++ : 0; return x; }"),
    ("right operand of &&", "int f(const int8_t* p, int n) { int x = n && *p++; return x; }"),
    ("call argument", "int h(int a); int f(const int8_t* p) { int x = h(*p++); return x; }"),
    ("two different pointers in one statement", "int f(const int8_t* p, const int8_t* q) { int x = *p++ + *q++; return x; }"),
    ("several declarators", "int f(const int8_t* p, const int8_t* q) { int x = *p++, y = *q++; return x + y; }"),
    ("declarator without site next to one with", "int f(const int8_t* p) { int x = *p++, y = 5; return x + y; }"),
    ("return statement", "int f(const int8_t* p) { return *p++; }"),
    ("dereference on the left of the assignment", "void f(int8_t* p, int8_t v) { *p++ = v; }"),
    ("compound assignment", "int f(const int8_t* p) { int x = 0; x += *p++; return x; }"),
    ("bare expression statement", "void f(const int8_t* p) { *p++; }"),
    ("case label statement", "int f(const int8_t* p, int n) { int x = 0; switch (n) { case 1: x = *p++; break; } return x; }"),
    ("inside a macro expansion", "#define NEXT(q) (*q++)\nint f(const int8_t* p) { int x = NEXT(p); return x; }"),
]:
    case("R23 rejected: " + _name, R23_NEG_HEAD + _body + "\n", "reject:R23", pre=False)
case("R23 rejected (neon profile): p is a global", R23_NEG_HEAD + "int f(void) { int x = *gp++; return x; }\n",
     "reject:R23", pre=False, isa="neon")


# ---- R25 (`--entry`: keep only the call graph of the entry) --------------------------
def r25_removed(rw):
    return sorted({e["function"] for e in rw if e["rule"] == "R25"})


def r25_retained(js):
    return {r["function"]: r["reason"] for r in js["r25_retained"]}


ENTRY = ["--entry", "user"]
case("R25 positive: unreferenced (also non-static / non-inline), chains, recursion, prototypes are deleted; callees of the entry kept",
     """static inline int callee(int x) { return x + 1; }
static inline int callee2(int x);
static inline int callee2(int x) { return callee(x) + 2; }
int dead_extern(void) { return 1; }
static int dead_plain(void) { return 2; }
static inline int dead_b(void) { return 3; }
static inline int dead_c(void) { return dead_b(); }
static inline int dead_rec(int n) { return n ? dead_rec(n - 1) : 0; }
static inline int dead_proto(void);
static inline int dead_proto(void) { return 4; }
int user(int x) { return callee2(x); }
""", "ok", lambda t, rw, js: (
    r25_removed(rw) == ["dead_b", "dead_c", "dead_extern", "dead_plain", "dead_proto", "dead_rec"] and
    set(r25_retained(js)) == {"user", "callee", "callee2"} and
    r25_retained(js)["user"] == "entry" and
    r25_retained(js)["callee"] == "called from callee2" and
    sorted(re.findall(r"\b(\w+)\s*\(int x\)\s*[{;]", t)) == ["callee", "callee2", "callee2", "user"] and
    "dead" not in t), extra=ENTRY, pre=False)
case("R25 positive: reference cycle reachable from the entry is kept, unreachable cycle is deleted",
     """static inline int a(int n);
static inline int b(int n) { return n ? a(n - 1) : 0; }
static inline int a(int n) { return n ? b(n - 1) : 0; }
static inline int dx(int n);
static inline int dy(int n) { return n ? dx(n - 1) : 0; }
static inline int dx(int n) { return n ? dy(n - 1) : 0; }
int user(int n) { return a(n); }
""", "ok", lambda t, rw, js: (
    r25_removed(rw) == ["dx", "dy"] and set(r25_retained(js)) == {"user", "a", "b"} and "dx" not in t and "dy" not in t),
     extra=ENTRY, pre=False)
case("R25 negative controls: address taken (call-free reference, function-pointer store, array initialiser, global initialiser, cast) keeps the function and its callees",
     """static inline int leaf2(int x) { return x; }
static inline int leaf(int x) { return leaf2(x); }
static inline int by_store(int x) { return leaf(x); }
static inline int by_init(int x) { return x; }
static inline int by_glob(int x) { return x; }
static inline int by_addr(int x) { return x; }
static inline int by_cast(int x) { return x; }
static inline int dead_one(int x) { return x; }
int (*tab[])(int) = { by_init };
int (*gfp)(int) = by_glob;
int user(int (**out)(int)) { *out = by_store; (void)&by_addr; (void)(long)by_cast; return 0; }
""", "ok", lambda t, rw, js: (
    r25_removed(rw) == ["dead_one"] and
    set(r25_retained(js)) == {"user", "leaf", "leaf2", "by_store", "by_init", "by_glob", "by_addr", "by_cast"} and
    r25_retained(js)["leaf2"] == "called from leaf" and
    r25_retained(js)["by_store"].startswith("address taken or referenced outside a call") and
    r25_retained(js)["by_init"] == "address taken or referenced outside a call" and
    r25_retained(js)["by_glob"] == "address taken or referenced outside a call" and
    r25_retained(js)["leaf"] == "called from by_store" and
    "dead_one" not in t), extra=ENTRY, pre=False)
case("R25 negative controls: constructor / destructor / used / retain / weak / alias target / cleanup function are kept with their reason",
     """static inline void ctor(void) __attribute__((constructor));
static inline void ctor(void) {}
static inline __attribute__((destructor)) void dtor(void) {}
static inline __attribute__((used)) int usedf(void) { return 1; }
static inline __attribute__((retain)) int retf(void) { return 1; }
__attribute__((weak)) int weakf(void) { return 1; }
static inline int al_target(void) { return 0; }
int al_name(void) __attribute__((alias("al_target")));
static inline void clean_f(int *p) { (void)p; }
static inline void clean_dead(int *p) { (void)p; }
static inline int dead_one(void) { return 9; }
static inline int dead_user(void) { int y __attribute__((cleanup(clean_dead))) = 0; return y; }
int user(void) { int x __attribute__((cleanup(clean_f))) = 0; return x; }
""", "ok", lambda t, rw, js: (
    r25_removed(rw) == ["dead_one", "dead_user"] and
    set(r25_retained(js)) == {"user", "ctor", "dtor", "usedf", "retf", "weakf", "al_target", "clean_f", "clean_dead"} and
    r25_retained(js)["clean_dead"] == "address taken or referenced outside a call" and
    "attribute: constructor" in r25_retained(js)["ctor"] and
    "attribute: destructor" in r25_retained(js)["dtor"] and
    "attribute: used" in r25_retained(js)["usedf"] and
    "attribute: retain" in r25_retained(js)["retf"] and
    "attribute: weak" in r25_retained(js)["weakf"] and
    "dead_one" not in t), extra=ENTRY, pre=False)
case("R25 rejected: the entry function is not defined in the input", "int other(void) { return 1; }\n", "reject:R25",
     extra=["--entry", "user"], pre=False)
case("R25 is off without --entry (negative control: unreferenced functions are kept)",
     """int dead_extern(void) { return 1; }
int user(void) { return 0; }
""", "ok", lambda t, rw, js: not any(e["rule"] == "R25" for e in rw) and "dead_extern" in t and "r25_retained" not in js, pre=False)


# ---- R26 (HVX lane-0 pun `*(T *)&v`) and the HVX front end ----------------------------
HVX_HEAD = """#include <stdint.h>
#include <hexagon_types.h>
#include <hvx_hexagon_protos.h>
#include <hexagon_protos.h>
"""


def r26_log(rw):
    return [e for e in rw if e["rule"] == "R26"]


case("R26 positive (hvx): lane 0 of a local vector read as char class and as the element type; parenthesised; in an expression",
     HVX_HEAD + """int f(const int8_t* p) {
  HVX_Vector v = Q6_V_vsplat_R(*p);
  int8_t a = *(int8_t*)&v;
  uint8_t b = *(uint8_t*)&v;
  char c = *(char*)&v;
  long d = *(long*)&v;
  int e = (int)(*((int8_t*)&v));
  return a + b + c + (int)d + e;
}
int g(const int8_t* q) {
  const HVX_Vector w = Q6_V_vsplat_R(*q);
  HVX_VectorPair pr = Q6_W_vcombine_VV(w, w);
  return *(uint8_t*)&w + *(int8_t*)&pr;
}
""", "ok", lambda t, rw, js: (
    len(r26_log(rw)) == 7 and
    "qcp_p_lane0_HVX_Vector_int8_t(&v)" in t and "qcp_p_lane0_HVX_Vector_uint8_t(&v)" in t and "qcp_p_lane0_HVX_Vector_long(&v)" in t and "qcp_p_lane0_HVX_Vector_char(&v)" in t and
    "qcp_p_lane0_HVX_Vector_uint8_t(&w)" in t and "qcp_p_lane0_HVX_VectorPair_int8_t(&pr)" in t and
    not re.search(r"\*\s*\(\s*(?:u?int8_t|char|long)\s*\*\s*\)\s*&", t) and
    all(e["original"].startswith("*") for e in r26_log(rw))), pre=False, isa="hvx")

R26_NEG_BODIES = [
    ("vector parameter (already rejected by VECPARAM)", "int f(HVX_Vector v) { return *(int8_t*)&v; }", "VECPARAM"),
    ("function-local static vector (already rejected by STATIC)", "int f(const int8_t* p) { static HVX_Vector v; v = Q6_V_vsplat_R(*p); return *(int8_t*)&v; }", "STATIC"),
    ("global vector", "HVX_Vector gv;\nint f(const int8_t* p) { gv = Q6_V_vsplat_R(*p); return *(int8_t*)&gv; }", "ADDROF"),
    ("volatile local vector", "int f(const int8_t* p) { volatile HVX_Vector v = Q6_V_vsplat_R(*p); return *(int8_t*)&v; }", "ADDROF"),
    ("target type is neither a char class nor the element type", "int f(const int8_t* p) { HVX_Vector v = Q6_V_vsplat_R(*p); return *(int16_t*)&v; }", "ADDROF"),
    ("target type int32_t (the element type is long)", "int f(const int8_t* p) { HVX_Vector v = Q6_V_vsplat_R(*p); return *(int32_t*)&v; }", "ADDROF"),
    ("target is a float", "float f(const int8_t* p) { HVX_Vector v = Q6_V_vsplat_R(*p); return *(float*)&v; }", "ADDROF"),
    ("offset form `*((T*)&v + 1)`", "int f(const int8_t* p) { HVX_Vector v = Q6_V_vsplat_R(*p); return *((int8_t*)&v + 1); }", "ADDROF"),
    ("array form `((T*)&v)[0]`", "int f(const int8_t* p) { HVX_Vector v = Q6_V_vsplat_R(*p); return ((int8_t*)&v)[0]; }", "ADDROF"),
    ("pointer form `*(T*)(&v)` through an intermediate pointer variable", "int f(const int8_t* p) { HVX_Vector v = Q6_V_vsplat_R(*p); int8_t* q = (int8_t*)&v; return *q; }", "ADDROF"),
    ("write through the pun", "void f(const int8_t* p) { HVX_Vector v = Q6_V_vsplat_R(*p); *(int8_t*)&v = 5; }", "R26"),
    ("compound write through the pun", "void f(const int8_t* p) { HVX_Vector v = Q6_V_vsplat_R(*p); *(int8_t*)&v += 5; }", "R26"),
    ("increment through the pun", "void f(const int8_t* p) { HVX_Vector v = Q6_V_vsplat_R(*p); (*(int8_t*)&v)++; }", "R26"),
    ("address of the pun result", "int8_t* f(const int8_t* p) { HVX_Vector v = Q6_V_vsplat_R(*p); return &*(int8_t*)&v; }", "R26"),
    ("plain address of a vector passed to a function", "void h(HVX_Vector* q);\nvoid f(const int8_t* p) { HVX_Vector v = Q6_V_vsplat_R(*p); h(&v); }", "ADDROF"),
    ("pun of a scalar is not touched but a second plain &v is rejected", "int f(const int8_t* p) { HVX_Vector v = Q6_V_vsplat_R(*p); HVX_Vector* q = &v; return *(int8_t*)&v + (q != 0); }", "ADDROF"),
]
for _name, _body, _rule in R26_NEG_BODIES:
    case("R26 rejected (hvx): " + _name, HVX_HEAD + _body + "\n", "reject:" + _rule, pre=False, isa="hvx")

case("R26 not applied (hvx): `*(char*)&x` on a scalar variable is left untouched",
     HVX_HEAD + "int f(int x) { int y = x + 1; return *(char*)&y; }\n", "ok",
     lambda t, rw, js: not r26_log(rw) and "return *(char*)&y;" in t, pre=False, isa="hvx")
HVX_R25 = HVX_HEAD + """static inline HVX_Vector dead_helper(HVX_Vector a, HVX_Vector b) { return Q6_Vb_vmax_VbVb(a, b); }
int8_t user(const int8_t* p) {
  HVX_Vector v = Q6_V_vsplat_R(*p);
  return *(int8_t*)&v;
}
"""
case("R25 (hvx): a dead function with vector parameter and return is deleted; the entry lowers", HVX_R25, "ok",
     lambda t, rw, js: (r25_removed(rw) == ["dead_helper"] and "dead_helper" not in t and
                        set(r25_retained(js)) == {"user"} and len(r26_log(rw)) == 1),
     pre=False, isa="hvx", extra=ENTRY)
case("R25 (hvx) negative control: without --entry the same input is rejected (VECPARAM)", HVX_R25, "reject:VECPARAM",
     pre=False, isa="hvx")
case("HVX positive: Q6 macro call, vector copy, load through a char pointer, lane-0 read, 2-operand op with a pointer result",
     HVX_HEAD + """int8_t f(const int8_t* p, const int8_t* q) {
  HVX_Vector a = *((const HVX_UVector*)p);
  HVX_Vector b = Q6_V_vsplat_R(*q);
  HVX_Vector c = Q6_Vb_vmax_VbVb(a, b);
  HVX_Vector d = c;
  return *(int8_t*)&d;
}
""", "ok", lambda t, rw, js: (
    "qcp_p_load_HVX_UVector_int8_t" in t and
    "qcp_p_Q6_V_vsplat_R" in t and "qcp_p_Q6_Vb_vmax_VbVb" in t and "qcp_p_copy_HVX_Vector" in t and
    "qcp_p_lane0_HVX_Vector_int8_t(&d)" in t and len(r26_log(rw)) == 1), pre=False, isa="hvx")
case("HVX rejected: vector load through an int pointer (the pointee must be a char class or void)",
     HVX_HEAD + "int f(const int32_t* p) { HVX_Vector a = *((const HVX_UVector*)p); return *(int8_t*)&a; }\n",
     "reject:VECEXPR", pre=False, isa="hvx")


def run_case(name, text, expect, check, pre, isa, extra, work):
    d = work / re.sub(r"\W+", "_", name)[:50]
    d.mkdir(parents=True, exist_ok=True)
    src = d / "t.c"
    src.write_text(text)
    out1, out2 = d / "o1", d / "o2"
    flags = ["--isa", isa] + (["--preprocessed"] if pre else []) + extra
    hvx = isa == "hvx"
    stem = "t.lowered.c" if hvx else "t.normalized.c"
    jname = "t.lowering.json" if hvx else "t.normalization.json"
    cmd = [sys.executable, "-I", str(HERE / "rvv_ptr_lower.py"), str(src)] + flags
    p1 = subprocess.run(cmd + ["--out-dir", str(out1)], capture_output=True, text=True, env=L.clang_env())
    if expect.startswith("reject:"):
        rule = expect.split(":")[1]
        js = json.loads((out1 / "t.lowering.json").read_text()) if (out1 / "t.lowering.json").exists() else {}
        if not js and (out1 / "t.normalization.json").exists():
            js = json.loads((out1 / "t.normalization.json").read_text())
        ok = p1.returncode == 1 and any(r.get("rule") == rule for r in js.get("rejections", []))
        return ok, (js.get("rejections") or p1.stdout + p1.stderr)
    if p1.returncode:
        return False, p1.stdout + p1.stderr
    norm = (out1 / stem).read_text()
    js = json.loads((out1 / jname).read_text())
    rw = js["rewrites"]
    ok = check(norm, rw, js) if check.__code__.co_argcount == 3 else check(norm, rw)
    p2 = subprocess.run(cmd + ["--out-dir", str(out2)], capture_output=True, text=True, env=L.clang_env())
    ok = ok and p2.returncode == 0 and (out2 / stem).read_text() == norm
    if hvx:
        return ok, ""
    # idempotence: second pass over the output rewrites nothing
    d3 = d / "o3"
    (d / "t2.c").write_text(norm)
    p3 = subprocess.run([sys.executable, "-I", str(HERE / "rvv_ptr_lower.py"), str(d / "t2.c")] + [f for f in flags if f not in extra] +
                        ["--out-dir", str(d3)], capture_output=True, text=True, env=L.clang_env())
    ok = ok and p3.returncode == 0 and not json.loads((d3 / "t2.normalization.json").read_text())["rewrites"]
    return ok, ""


def main():
    ap = argparse.ArgumentParser()
    ap.add_argument("--out")
    ap.add_argument("--only", action="append", default=[], help="run only the cases whose name starts with one of these prefixes")
    a = ap.parse_args()
    with tempfile.TemporaryDirectory(prefix="rule_tests_") as tmp:
        work = Path(a.out).resolve() if a.out else Path(tmp)
        work.mkdir(parents=True, exist_ok=True)
        bad = 0
        for name, text, expect, check, pre, isa, extra in CASES:
            if a.only and not any(name.startswith(o) for o in a.only):
                continue
            ok, info = run_case(name, text, expect, check, pre, isa, extra, work)
            print("PASS" if ok else "FAIL", name, "" if ok else info)
            bad += not ok
    n = len(CASES) if not a.only else sum(any(c[0].startswith(o) for o in a.only) for c in CASES)
    print(f"{n - bad}/{n} cases as expected")
    return 1 if bad else 0


if __name__ == "__main__":
    sys.exit(main())
