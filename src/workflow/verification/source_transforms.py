"""Named source transforms — explicit registry of kernel-source rewrites.

Each transform is a function returning (new_source, matched). matched=True
means at least one target pattern was found and rewritten. Transforms raise
TransformError on partial/incomplete rewrites (residual patterns left behind).

Profile-declared `required_transforms` must return matched=True; the runner
fails closed otherwise. Transforms not in the required list are best-effort.

Usage:
    from .source_transforms import apply_transforms
    source, results = apply_transforms(source, names, ctx)
"""
from __future__ import annotations

from dataclasses import dataclass


class TransformError(ValueError):
    """Raised when a transform's rewrite is incomplete (residuals)."""


@dataclass
class TransformResult:
    name: str
    matched: bool
    evidence: str = ""


def _t_symbolic_params(source: str, params_type: str = "", **_) -> tuple:
    """Rewrite params->field reads to use SymbolicScalar<T>. Delegates to the
    full implementation in harness_gen._rewrite_params_symbolic."""
    if not params_type:
        return source, False
    from .harness_gen import _rewrite_params_symbolic
    try:
        new_source = _rewrite_params_symbolic(source, params_type)
    except ValueError as e:
        raise TransformError(f"symbolic_params: {e}") from e
    return new_source, new_source != source


def _t_strip_lut_externs(source: str, tables: list = None, **_) -> tuple:
    if not tables:
        return source, False
    from .harness_gen import _strip_lut_externs
    try:
        new_source = _strip_lut_externs(source, tables)
    except ValueError as e:
        raise TransformError(f"strip_lut_externs: {e}") from e
    return new_source, new_source != source


def _t_neon_lut_gathers(source: str, tables: list = None, **_) -> tuple:
    if not tables:
        return source, False
    from .harness_gen import _rewrite_neon_lut_gathers
    try:
        new_source = _rewrite_neon_lut_gathers(source, tables)
    except ValueError as e:
        raise TransformError(f"neon_lut_gathers: {e}") from e
    return new_source, new_source != source


@dataclass
class TransformSpec:
    """Registry entry. `targets` constrains which source the transform applies
    to; runner skips transforms whose target doesn't include the current source."""
    fn: callable
    targets: frozenset   # subset of {"neon", "rvv"}


REGISTRY = {
    "symbolic_params":   TransformSpec(_t_symbolic_params,  frozenset({"neon", "rvv"})),
    "neon_lut_gathers":  TransformSpec(_t_neon_lut_gathers, frozenset({"neon"})),
    "strip_lut_externs": TransformSpec(_t_strip_lut_externs, frozenset({"rvv"})),
}


def apply_transforms(source: str, names: list, ctx: dict, target: str,
                      required: set = None) -> tuple:
    """Run named transforms in order; return (mutated_source, [TransformResult]).

    target: "neon" or "rvv". Transforms whose REGISTRY targets exclude this
            value are skipped (no-op, no required-check).
    required: subset of names that MUST report matched=True for transforms
              that targeted this source; raises otherwise.
    """
    required = required or set()
    results = []
    for name in names:
        if name not in REGISTRY:
            raise TransformError(
                f"Unknown transform '{name}'. Known: {sorted(REGISTRY)}")
        spec = REGISTRY[name]
        if target not in spec.targets:
            continue
        new_src, matched = spec.fn(source, **ctx)
        results.append(TransformResult(name=name, matched=matched))
        if name in required and not matched:
            raise TransformError(
                f"Required transform '{name}' did not match in {target} source. "
                f"Profile declared it required but the rewrite was a no-op.")
        source = new_src
    return source, results
