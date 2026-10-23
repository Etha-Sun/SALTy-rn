"""Resolve recorded artifact locations without rewriting historical records."""
import json
from pathlib import Path

CASE = Path(__file__).resolve().parent.parent
ROOT = next(p for p in CASE.parents if (p / '.git').exists())


def artifact_path(value):
    path = Path(value)
    prefixes = [ROOT / 'verification/qcp/candidates/f32-vlrelu']
    report = CASE / 'proof/relocation-audit.json'
    if report.exists():
        relocation = json.loads(report.read_text())
        prefixes += [Path(relocation[k]) for k in ['old_case', 'new_case']]
    for prefix in prefixes:
        try:
            return CASE / path.relative_to(prefix)
        except ValueError:
            continue
    return path
