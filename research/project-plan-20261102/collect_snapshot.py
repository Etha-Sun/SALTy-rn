"""Read fixed Git objects; write planning evidence, without running proof tools."""
import collections
import csv
import difflib
import hashlib
import json
from pathlib import Path
import re
import subprocess

ROOT = Path(__file__).resolve().parents[2]
OUT = Path(__file__).resolve().parent
REF = "821969733d7953a212c51839194add416fd5799b"
PREFIX = "verification/qcp/verified/"


def read(path):
    return subprocess.check_output(["git", "show", REF + ":" + path], cwd=ROOT)


def sha(data):
    return hashlib.sha256(data).hexdigest()


# Same textual metric as the earlier review. Not a C parser or semantic diff.
LEX = re.compile(r'"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\'|/\*[\s\S]*?\*/|//[^\n]*|[A-Za-z_]\w*|(?:0[xX][0-9a-fA-F]+|\d+)(?:[\w.]*)|>>=|<<=|->|\+\+|--|&&|\|\||<=|>=|==|!=|<<|>>|\+=|-=|\*=|/=|%=|&=|\|=|\^=|##|[^\s]')
COMMENTS = re.compile(r'"(?:\\.|[^"\\])*"|\'(?:\\.|[^\'\\])*\'|/\*[\s\S]*?\*/|//[^\n]*')


def lines(data):
    text = COMMENTS.sub(lambda m: " " + "\n" * m.group().count("\n")
                        if m.group().startswith(("/*", "//")) else m.group(),
                        data.decode())
    return [tuple(LEX.findall(line)) for line in text.splitlines() if line.strip()]


def changes(a, b):
    return sum(max(j - i, y - x) for tag, i, j, x, y in
               difflib.SequenceMatcher(None, lines(a), lines(b), autojunk=False).get_opcodes()
               if tag != "equal")


manifest_bytes = read(PREFIX + "manifest.json")
manifest = json.loads(manifest_bytes)
rows = []
identities = []
for entry in manifest["kernels"]:
    kernel = entry["kernel"]
    base = PREFIX + entry["directory"] + "/"
    status = read(PREFIX + entry["full_status"])
    spec = read(base + "spec.c")
    row = {
        "kernel": kernel,
        "manifest_variant": entry.get("variant", "not_recorded_in_manifest"),
        "verification_basis": entry.get("verification_basis", "not_recorded_in_manifest"),
        "human_semantic_review": entry.get("human_semantic_review", "not_recorded_in_manifest"),
        "change_approval": "not_established_by_this_audit",
        "fresh_proof_replay": "not_run",
        "performance_same_version_and_profile": "not_established_by_this_audit",
        "status_hash_matches": sha(status) == entry["status_sha256"],
        "spec_hash_matches": sha(spec) == entry["spec_sha256"],
    }
    for side, folder in [("NEON", "source"), ("RVV", "target")]:
        original_path = f"kernels/{folder}/{kernel}.c"
        impl_path = base + f"impl/test{side}.c"
        original, impl = read(original_path), read(impl_path)
        row[side + "_main_changed_lines"] = changes(original, impl)
        row[side + "_main_byte_identical"] = original == impl
        identities.append(dict(kernel=kernel, side=side, original=original_path,
                               impl=impl_path, original_sha256=sha(original), impl_sha256=sha(impl)))
    row["combined_main_changed_lines"] = sum(row[s + "_main_changed_lines"] for s in ["NEON", "RVV"])
    row["package_url"] = f"https://github.com/Etha-Sun/SALTy-rn/tree/{REF}/{base}"
    rows.append(row)

with (OUT / "kernel-progress.csv").open("w") as f:
    writer = csv.DictWriter(f, fieldnames=list(rows[0]))
    writer.writeheader()
    writer.writerows(rows)

tree = subprocess.check_output(["git", "ls-tree", "-r", "--name-only", REF, PREFIX], cwd=ROOT, text=True).splitlines()
model_copies = {}
for name in ["FmaModel.v", "IntrinsicModel.v"]:
    groups = collections.defaultdict(list)
    for path in tree:
        if path.endswith("/" + name) and "/proof/coq/" in path and not any(
                "/" + part + "/" in path for part in ["history", "evidence", "archive"]):
            groups[sha(read(path))].append(path)
    model_copies[name] = dict(groups)

summary = {
    "review_date": "2026-11-02", "timezone": "America/Los_Angeles", "ref": REF,
    "scope": "Read-only source/hash/text-diff audit; not fresh proof or performance verification",
    "manifest_sha256": sha(manifest_bytes), "manifest_scope": manifest["scope"],
    "manifest_verified_count": manifest["verified_count"], "kernel_rows": len(rows),
    "all_status_hashes_match": all(r["status_hash_matches"] for r in rows),
    "all_spec_hashes_match": all(r["spec_hash_matches"] for r in rows),
    "both_main_files_byte_identical": sum(all(r[s + "_main_byte_identical"] for s in ["NEON", "RVV"]) for r in rows),
    "change_metric": "Main files only; comments/blank lines ignored, lexical whitespace normalized per line; sum max(deleted,added) per diff block. Helpers/macros excluded. Not approval or semantic equivalence.",
    "thresholds": [{"max_combined_lines": n, "kernels": sum(r["combined_main_changed_lines"] <= n for r in rows)} for n in [0, 5, 10, 20, 50, 100]],
    "identities": identities, "model_copy_groups": model_copies,
}
(OUT / "snapshot-audit.json").write_text(json.dumps(summary, ensure_ascii=False, indent=2) + "\n")

sample_names = ["s8-vclamp", "f32-vabs", "f32-vcopysign", "f32-vadd", "qs8-vadd", "qs8-rdsum", "x32-transposec", "f32-vneg"]
source = ROOT / "research/ecoop-experience-reading-20261024/xnnpack-four-isa/four_isa_kernels.csv"
samples = {r["kernel"]: r for r in csv.DictReader(source.open())}
table = ["# 四端候选的固定源码入口", "", "来自 2026-10-24 调研，固定 XNNPACK 23dd5070fa002ef0b124817798ae090fa29f9653；这是源码交集，不是等价证明。代表文件可能为 NON_PROD，逐项标明。", "", "| 候选 | NEON | RVV | AVX 家族 | HVX |", "|---|---|---|---|---|"]
for name in sample_names:
    r = samples[name]
    cells = [name]
    for side in ["NEON", "RVV", "AVX", "HVX"]:
        path = r[side + "_representative_source"]
        prod = "PROD" if r[side + "_representative_prod"] == "True" else "NON_PROD"
        cells.append(f"[{Path(path).name}]({r[side + '_source_url']}) ({prod})")
    table.append("| " + " | ".join(cells) + " |")
(OUT / "XNNPACK-SAMPLES.zh-CN.md").write_text("\n".join(table) + "\n")
print(json.dumps({k: v for k, v in summary.items() if k not in ["identities", "model_copy_groups"]}, ensure_ascii=False, indent=2))
