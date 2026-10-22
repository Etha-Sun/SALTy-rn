"""Audited vadd-only representation lowering; not a general C translator."""
import re
TYPES = {"float32x4_t": 4, "float32x2_t": 2, "vfloat32m8_t": 32}
OUT = {
    "vld1q_f32", "vaddq_f32", "vget_low_f32", "vget_high_f32",
    "__riscv_vle32_v_f32m8", "__riscv_vfadd_vv_f32m8",
}
KNOWN = OUT | {"vst1q_f32", "vst1_f32", "vst1_lane_f32",
               "__riscv_vse32_v_f32m8", "__riscv_vsetvl_e32m8"}


def vector_type_pattern():
    return "(?:" + "|".join(TYPES) + ")"


def lower_kernel(source):
    calls = set(re.findall(r"\b((?:__riscv_|vld|vadd|vst|vget)\w*)\s*\(", source))
    if calls - KNOWN:
        raise ValueError("Unsupported intrinsic calls: " + ", ".join(sorted(calls - KNOWN)))
    changes = []
    variables = set()

    def declaration(m):
        typ, var, fn, args = m.groups()
        if fn not in OUT:
            raise ValueError("Unsupported vector initializer: " + fn)
        variables.add(var)
        changes.append({"kind": "vector-initializer", "type": typ, "variable": var, "call": fn})
        return f"struct {typ} {var}; {fn}(&{var}, {args});"

    source = re.sub(r"\b(?:const\s+)?(" + vector_type_pattern() +
                    r")\s+(\w+)\s*=\s*(\w+)\(([^;]*)\);", declaration, source)

    def assignment(m):
        var, fn, args = m.groups()
        changes.append({"kind": "vector-assignment", "variable": var, "call": fn})
        return f"{fn}(&{var}, {args});"

    source = re.sub(r"\b(\w+)\s*=\s*(vget_high_f32)\(([^;]*)\);", assignment, source)

    def arguments(m):
        fn, args = m.groups()
        args = ["&" + arg.strip() if arg.strip() in variables else arg.strip()
                for arg in args.split(",")]
        return fn + "(" + ", ".join(args) + ")"

    source = re.sub(r"\b(" + "|".join(sorted(KNOWN)) + r")\(([^()]*)\)", arguments, source)
    if re.search(r"(?<!struct )\b" + vector_type_pattern() + r"\b", source):
        raise ValueError("Unconverted vector use")
    return source, changes


def lower_shared(source):
    # Recognize the frozen shared shim's finite lane loops.  Each finite loop
    # becomes scalar fields; the dynamic VL loops become guarded lane writes.
    def function(m):
        typ, name, args, body = m.groups()
        original_args = args
        result_type = typ if typ in TYPES else None
        if result_type:
            typ = "void"
            args = f"struct {result_type} *r, " + args
        args = re.sub(r"\b(" + vector_type_pattern() + r")\s+(\w+)",
                      r"const struct \1 *\2", args)
        initialized = bool(re.search(r"\br\s*=\s*\{\{0\}\}", body))
        body = re.sub(r"\b" + vector_type_pattern() + r"\s+r\s*(?:=\s*\{\{0\}\})?\s*;", "", body)
        if initialized:
            body = "\n" + "\n".join(f"  r->s{i} = 0.0f;" for i in range(TYPES[result_type])) + body

        def loop(lm):
            bound, statement = lm.groups()
            capacity = TYPES[result_type] if result_type else next(
                TYPES[t] for t in TYPES if re.search(r"\b" + t + r"\b", original_args))
            count = capacity if bound == "vl" else int(bound)
            lines = []
            for i in range(count):
                text = re.sub(r"\b(\w+)\.lane\[i(?:\+(\d+))?\]",
                              lambda x: f"{x[1]}->s{i + int(x[2] or 0)}", statement)
                text = re.sub(r"\bi\b", str(i), text)
                lines.append((f"if ({i} < vl) " if bound == "vl" else "") + text)
            return "\n  ".join(lines)

        body = re.sub(r"for \(size_t i = 0; i < (\d+|vl); \+\+i\) ([^;]+;)", loop, body)
        if name == "vst1_lane_f32":
            if body.strip() != "*p = a.lane[lane];":
                raise ValueError("Unsupported lane-store body")
            body = "\n  if (lane == 0) *p = a->s0;\n  if (lane == 1) *p = a->s1;\n"
        body = body.replace("return r;", "return;")
        if ".lane[" in body or re.search(r"\b" + vector_type_pattern() + r"\b", body):
            raise ValueError("Unconverted shared vector body: " + name)
        return f"{typ} {name}({args}) {{{body}}}"

    # A brace in this frozen input occurs only in the {{0}} initializer.  Match
    # a closing brace that is followed by a new function or end of file.
    pattern = r"^(float|void|" + vector_type_pattern() + r")\s+(\w+)\(([^)]*)\)\s*\{(.*?)\}(?=\s*(?:(?:float|void|" + vector_type_pattern() + r")\s+\w+\(|\Z))"
    result, count = re.subn(pattern, function, source, flags=re.M | re.S)
    if count != 11:
        raise ValueError(f"Expected 11 audited shared functions, found {count}")
    return result


