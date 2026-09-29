"""Reproduce the research inventory; this is NOT a semantic C frontend.

Uses real Clang Arm NEON declarations and a reconstructed audit-only XNN facade.
Reports parsing failures explicitly. Does not compile or execute neon2rvv.
Prints JSON to stdout; never changes repository inputs.
"""
import collections
import hashlib
import json
from pathlib import Path
import re
import subprocess
import sys

ROOT = Path(__file__).resolve().parents[1]
HEADER = ROOT.parent / "neon2rvv-reference/neon2rvv.h"

def uncomment(s):
    return re.sub(r"/\*.*?\*/|//[^\n]*", lambda m: "\n" * m[0].count("\n"), s, flags=re.S)

PRELUDE = r"""
#include <stdint.h>
#include <stddef.h>
#include <arm_neon.h>
#define assert(x) ((void)(x))
#define XNN_OOB_READS
#define XNN_ALIGN(n) __attribute__((aligned(n)))
#define XNN_LIKELY(x) (x)
#define XNN_UNLIKELY(x) (x)
#define XNN_UNPREDICTABLE(x) (x)
#define XNN_ARCH_ARM64 1
#define XNN_ARCH_ARM 0
#define min(a,b) ((a)<(b)?(a):(b))
#define max(a,b) ((a)>(b)?(a):(b))
#define round_down_po2(a,b) ((a)&~((b)-1))
#define round_up_po2(a,b) (((a)+(b)-1)&~((b)-1))
void xnn_prefetch_to_l1(const void*);
struct xnn_qd8_quantization_params { int32_t zero_point; float inv_scale; };
"""

def command(args, data=None):
    return subprocess.run(args, input=data, text=True, capture_output=True)

def walk(node, depth=0):
    kind = node.get("kind", "")
    depth += kind in {"ForStmt", "WhileStmt", "DoStmt"}
    yield node, depth
    for child in node.get("inner", []):
        yield from walk(child, depth)

header = uncomment(HEADER.read_text())
definitions = set(re.findall(r"\b(v\w+)\s*\([^;{}]*\)\s*\{", header))
definitions.update(re.findall(r"^\s*#define\s+(v\w+)\b", header, re.M))
rows = []
all_raw, all_active = set(), set()
for source in sorted((ROOT / "kernels/source").glob("*.c")):
    text = source.read_text()
    raw = uncomment(text)
    raw_calls = set(re.findall(r"\b(v\w+)\s*\(", raw))
    all_raw |= raw_calls
    initial = re.match(r"\s*/\*(.*?)\*/", text, re.S)
    declarations = initial[1] if initial and re.match(r"\s*(struct|union)\b", initial[1]) else ""
    unit = PRELUDE + declarations + '\n#line 1 "' + str(source) + '"\n' + text
    base = ["clang", "-target", "aarch64-none-elf", "-ffreestanding", "-std=c11", "-Wno-incompatible-pointer-types", "-x", "c", "-"]
    # Preprocessing without arm_neon.h preserves the original intrinsic spelling.
    pp = command(["clang", "-target", "aarch64-none-elf", "-ffreestanding", "-E", "-P", "-x", "c", "-"], unit.replace("#include <arm_neon.h>", ""))
    body = pp.stdout.split("void test_neon(", 1)[-1]
    active_calls = set(re.findall(r"\b(v\w+)\s*\(", body))
    all_active |= active_calls
    ast = command(base + ["-fsyntax-only", "-Xclang", "-ast-dump=json", "-Xclang", "-ast-dump-filter=test_neon"], unit)
    row = {"kernel": source.stem, "source_sha256": hashlib.sha256(text.encode()).hexdigest(),
           "target": "missing", "raw_intrinsics": sorted(raw_calls), "arm64_intrinsics": sorted(active_calls),
           "missing_header_definitions": sorted(active_calls - definitions),
           "ast_ok": ast.returncode == 0,
           "diagnostics": ast.stderr if ast.returncode else ""}
    target = ROOT / "kernels/target" / source.name
    if target.exists():
        row["target"] = "nonempty" if uncomment(target.read_text()).strip() else "empty"
    if ast.returncode == 0:
        nodes = list(walk(json.loads(ast.stdout)))
        kinds = collections.Counter(n["kind"] for n, _ in nodes if "kind" in n)
        row.update({"controls": {k: kinds[k] for k in ["ForStmt", "WhileStmt", "DoStmt", "IfStmt", "ConditionalOperator", "BreakStmt", "ContinueStmt", "SwitchStmt", "GotoStmt", "ReturnStmt"]},
                    "max_loop_depth": max(d for _, d in nodes),
                    "node_kinds": sorted(kinds),
                    "operators": sorted({n["opcode"] for n, _ in nodes if "opcode" in n}),
                    "casts": sorted({n["castKind"] for n, _ in nodes if "castKind" in n}),
                    "has_fp": bool(re.search(r"\bfloat\b|\bf\w*32x|_f32\b", body)),
                    "pointer_integer_casts": kinds["CStyleCastExpr"] > 0 and "uintptr_t" in body,
                    "pointer_table": bool(re.search(r"\*\s*(?:const\s*)?\*", raw)),
                    "tuple_val_access": ".val[" in raw})
    rows.append(row)

report = {"salt_commit": command(["git", "-C", str(ROOT), "rev-parse", "HEAD"]).stdout.strip(),
                  "neon2rvv_commit": command(["git", "-C", str(HEADER.parent), "rev-parse", "HEAD"]).stdout.strip(),
                  "method": "Clang 14 aarch64-none-elf; reconstructed XNN audit facade; structural inventory, not verified extraction; spelling coverage does not establish compilation or semantics",
                  "source_count": len(rows), "raw_intrinsic_count": len(all_raw), "arm64_intrinsic_count": len(all_active),
                  "arm64_missing_header_definitions": sorted(all_active - definitions), "kernels": rows}
if len(sys.argv) == 2:
    Path(sys.argv[1]).write_text(json.dumps(report, indent=2) + "\n")
    print(json.dumps({k: v for k, v in report.items() if k != "kernels"}, indent=2))
    for row in rows:
        print(row["kernel"], "AST=" + str(row["ast_ok"]), row.get("max_loop_depth"), row["target"], row["missing_header_definitions"])
        if row["diagnostics"]:
            print(row["diagnostics"][:1800])
else:
    print(json.dumps(report, indent=2))
