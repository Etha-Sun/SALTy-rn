"""
LLM advisor for shape-plan completion.

Fires when `classify_shape` returns UNCLASSIFIED or when a ShapePlan has
`unresolved` fields.  The advisor asks an LLM for a strict JSON object
completing only the plan fields it can infer from the kernel signature +
source; does NOT generate C++.  Callers merge the suggestions back into
the plan and fail loudly if any field the emitter depends on is still
missing.

Contract:
  - If `llm_client` is None → return the plan unchanged.
  - If the plan has no unresolved fields and shape != UNCLASSIFIED → no-op.
  - JSON is schema-shaped (matches ShapePlan's own fields); anything else
    is discarded with a warning so malformed replies never reach the emitter.
"""

import json
import logging
import re
from typing import Optional

from .sig_parser import FuncSignature, ArgRole
from .size_inferrer import Shape, ShapePlan, DimSpec, BufferSpec

log = logging.getLogger("pipeline")


_SYSTEM_PROMPT = (
    "You are a SIMD kernel analysis expert.  Given a kernel function "
    "signature and source, return a JSON object that completes the listed "
    "unresolved fields of a ShapePlan.  Never emit C++ harness code — only "
    "the JSON.  Do not wrap in markdown fences.\n"
    "\n"
    "CRITICAL — buffer sizing for SIMD tail safety:\n"
    "Vector kernels routinely over-read up to one SIMD register width past "
    "the logical end of any data row, even when the data length is not a "
    "multiple of the vector width.  The harness backs each symbolic buffer "
    "with a real std::vector AND with byte-granular symbolic memory; sizing "
    "either to the exact logical length will (a) segfault on host-side "
    "vector-load over-reads, and (b) fail the symbolic findBuffer(ptr) "
    "lookup.  Therefore every buffer_plans size_expr you emit MUST include "
    "tail slack of at least 32 bytes beyond the logical extent.  Concretely:\n"
    "  - For per-row layouts use a `padded_row_bytes` = channels + pad "
    "(pad >= 16) and size_expr = rows * padded_row_bytes.\n"
    "  - For flat 1D layouts use size_expr = ((batch + 15) / 16) * 16 + 32 "
    "(or similar round-up + tail slack).\n"
    "  - For weight tables that are read in tiles, size up to a full tile "
    "boundary plus 32-byte slack.\n"
    "Never emit a size_expr that equals the exact logical extent (e.g., "
    "`(rows - 1) * stride + channels` without padding) — that pattern is "
    "always wrong even if it superficially looks right."
)


def advise_shape_plan(plan: ShapePlan, sig: FuncSignature,
                      source: str, llm_client) -> ShapePlan:
    """Fill unresolved plan fields via an LLM.  Returns plan unchanged if no
    client or no unresolved fields.  Logs prompt + raw response."""
    if llm_client is None:
        return plan
    if plan.shape != Shape.UNCLASSIFIED and not plan.unresolved:
        return plan

    prompt = _build_prompt(plan, sig, source)
    log.info("LLM shape advisor: kernel=%s shape=%s unresolved=%s",
             sig.name, plan.shape.name, plan.unresolved)

    try:
        response = llm_client.chat(prompt, system=_SYSTEM_PROMPT,
                                    temperature=0.1, max_tokens=2048)
    except Exception as e:
        log.error("LLM advisor call failed: %s", e, exc_info=True)
        return plan

    log.info("LLM advisor raw response:\n%s", response)

    suggestions = _parse_json_object(response)
    if not suggestions:
        log.warning("LLM advisor returned unparseable response; plan unchanged.")
        return plan

    _merge_suggestions(plan, suggestions, sig)
    log.info("LLM advisor merged plan: shape=%s unresolved=%s sweep_dims=%s "
             "arg_bindings=%s buffer_plans=%s",
             plan.shape.name, plan.unresolved,
             [d.name for d in plan.sweep_dims],
             list(plan.arg_bindings.keys()),
             list(plan.buffer_plans.keys()))
    return plan


# ---------------------------------------------------------------------------
# Prompt construction
# ---------------------------------------------------------------------------

def _build_prompt(plan: ShapePlan, sig: FuncSignature, source: str) -> str:
    """Build the user prompt.  Caps source at 16KB to stay well under provider
    context limits while preserving loop structure for conv-shaped kernels."""
    source_excerpt = source if len(source) <= 16000 else source[:16000] + "\n// ... (truncated)"

    sig_args = "\n".join(
        f"  {a.role.name:15s}  {a.c_type}  {a.name}" for a in sig.args
    )

    unresolved_desc = ", ".join(plan.unresolved) or "(none — pure classification fill-in)"
    example = _example_for_shape(plan.shape)

    return f"""Kernel function name: `{sig.name}`

Classified shape: **{plan.shape.name}**
Unresolved fields: {unresolved_desc}

Signature arguments (role, type, name):
{sig_args}

Kernel source:
```c
{source_excerpt}
```

Respond with ONLY a JSON object using these optional keys:
- `sweep_dims`: list of {{name, unit ("elements"|"bytes"), values (list of ints/strings, optional), step (int, optional)}}
- `arg_bindings`: mapping of signature-arg names → C++ expressions using sweep-dim names and constants
- `buffer_plans`: mapping of signature-arg names → {{size_expr (C++ bytes expression), is_symbolic (bool)}}
- `alloc_decls`: list of C++ declaration strings emitted at top of verify()
- `alloc_count_name`, `count_name`: names of C++ locals
- `shape`: one of "FLAT_1D", "ROW_CHAN_2D", "SPATIAL_HWC_CHW" to reclassify an UNCLASSIFIED plan

Only include keys you can fill in.  Omit unresolved ones rather than guessing.

Example for a simple elementwise kernel (FLAT_1D):
{example}
"""


def _example_for_shape(shape: Shape) -> str:
    """Terse, schema-shaped examples the LLM can pattern-match on."""
    if shape == Shape.FLAT_1D:
        return json.dumps({
            "sweep_dims": [{"name": "batch", "unit": "elements"}],
            "arg_bindings": {"batch": "batch"},
            "alloc_decls": ["size_t padded = ((batch + 15) / 16) * 16 + 16;"],
        }, indent=2)
    if shape == Shape.ROW_CHAN_2D:
        return json.dumps({
            "sweep_dims": [
                {"name": "rows", "unit": "elements"},
                {"name": "channels", "unit": "bytes"},
            ],
            "arg_bindings": {
                "rows": "rows", "channels": "channels",
                "input_stride": "padded_row_bytes",
                "output_stride": "padded_row_bytes",
            },
            "alloc_decls": [
                "size_t padded_row_bytes = channels + 16;",
                "size_t padded_total_elems = rows * (padded_row_bytes / sizeof(elem_t));",
            ],
            "buffer_plans": {
                "input":  {"size_expr": "rows * padded_row_bytes + 32",
                           "is_symbolic": True},
                "output": {"size_expr": "rows * padded_row_bytes + 32",
                           "is_symbolic": False},
            },
        }, indent=2)
    # SPATIAL or UNCLASSIFIED: show the full shape.
    return json.dumps({
        "shape": "SPATIAL_HWC_CHW",
        "sweep_dims": [
            {"name": "output_rows", "unit": "elements"},
            {"name": "output_channels", "unit": "elements",
             "values": [4, 8], "step": 4},
        ],
        "arg_bindings": {
            "input_height": "2 * output_rows - 1",
            "output_y_start": "0",
            "output_y_end": "output_rows",
        },
        "buffer_plans": {
            "input": {"size_expr": "input_height * input_width * 3 * 2",
                      "is_symbolic": True},
            "output": {"size_expr": "output_channels * output_channel_stride_bytes",
                       "is_symbolic": True},
        },
        "alloc_decls": [
            "size_t input_height = 2 * output_rows - 1;",
            "size_t output_width = 2;",
        ],
    }, indent=2)


# ---------------------------------------------------------------------------
# Response parsing / plan merging
# ---------------------------------------------------------------------------

def _parse_json_object(response: str) -> dict:
    """Extract a JSON object from an LLM response.  Handles markdown fences
    and trailing prose; balanced-brace scan as fallback."""
    text = response.strip()
    text = re.sub(r'^```(?:json)?\s*\n?', '', text)
    text = re.sub(r'\n?```\s*$', '', text)
    text = text.strip()

    try:
        result = json.loads(text)
        if isinstance(result, dict):
            return result
    except json.JSONDecodeError:
        pass

    start = text.find('{')
    if start < 0:
        return {}
    depth = 0
    for i in range(start, len(text)):
        if text[i] == '{':
            depth += 1
        elif text[i] == '}':
            depth -= 1
            if depth == 0:
                try:
                    result = json.loads(text[start:i + 1])
                    if isinstance(result, dict):
                        return result
                except json.JSONDecodeError:
                    return {}
    return {}


def _merge_suggestions(plan: ShapePlan, s: dict, sig: FuncSignature) -> None:
    """Apply LLM suggestions to the plan in-place.  Unknown keys and
    malformed entries are silently discarded after a warning — the plan
    stays valid so downstream code fails loudly rather than processing
    bad data."""
    # Reclassification (UNCLASSIFIED → concrete shape).
    if "shape" in s:
        try:
            plan.shape = Shape[s["shape"]]
        except KeyError:
            log.warning("LLM advisor: unknown shape '%s'", s["shape"])

    if isinstance(s.get("sweep_dims"), list):
        dims = []
        for d in s["sweep_dims"]:
            if not isinstance(d, dict) or "name" not in d:
                continue
            dims.append(DimSpec(
                name=str(d["name"]),
                unit=str(d.get("unit", "elements")),
                values=d.get("values"),
                start=d.get("start"),
                end=d.get("end"),
                step=int(d.get("step", 1)),
            ))
        if dims:
            plan.sweep_dims = dims

    if isinstance(s.get("arg_bindings"), dict):
        # Stringify values so downstream string interpolation works.
        plan.arg_bindings.update({k: str(v) for k, v in s["arg_bindings"].items()})

    if isinstance(s.get("buffer_plans"), dict):
        role_by_name = {a.name: a.role for a in sig.args}
        type_by_name = {a.name: a.elem_type for a in sig.args}
        for name, entry in s["buffer_plans"].items():
            if not isinstance(entry, dict) or "size_expr" not in entry:
                continue
            if name not in role_by_name:
                log.warning("LLM advisor: buffer_plan for unknown arg '%s'", name)
                continue
            plan.buffer_plans[name] = BufferSpec(
                arg_name=name,
                role=role_by_name[name],
                elem_type=type_by_name[name],
                size_expr=str(entry["size_expr"]),
                is_symbolic=bool(entry.get("is_symbolic", True)),
            )

    if isinstance(s.get("alloc_decls"), list):
        plan.alloc_decls = [str(d) for d in s["alloc_decls"]]

    if isinstance(s.get("alloc_count_name"), str):
        plan.alloc_count_name = s["alloc_count_name"]
    if isinstance(s.get("count_name"), str):
        plan.count_name = s["count_name"]

    # Clear `unresolved` entries the LLM just filled.  A residual entry
    # means the emitter should still fail loudly downstream.
    plan.unresolved = [u for u in plan.unresolved if not _is_resolved(u, plan)]


def _is_resolved(token: str, plan: ShapePlan) -> bool:
    """Check whether an `unresolved` entry is now satisfied by the plan."""
    key = token.split(":", 1)[0]
    if key == "sweep_dims":   return bool(plan.sweep_dims)
    if key == "arg_bindings": return bool(plan.arg_bindings)
    if key == "buffer_plans": return bool(plan.buffer_plans)
    if key == "alloc_decls":  return bool(plan.alloc_decls)
    return False
