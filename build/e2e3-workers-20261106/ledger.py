#!/usr/bin/env python3
"""Aggregate worker runs into LEDGER.json / LEDGER.md (time, tokens, cost, retries).

Reads <root>/w*/runs/run*/{meta.json,events.jsonl}. Missing data is reported as null ("unknown"),
never as zero. Supervisor-approval status comes from <worker>/APPROVAL.json if present.
"""
import json, sys
from pathlib import Path

root = Path(sys.argv[1] if len(sys.argv) > 1 else Path(__file__).parent)
workers = []
for w in sorted(root.glob('w*')):
    if not w.is_dir():
        continue
    runs = []
    for r in sorted((w / 'runs').glob('run*')):
        meta = json.loads((r / 'meta.json').read_text()) if (r / 'meta.json').exists() else {}
        # A run may contain several result events (the worker is re-woken by its own background
        # tasks). duration/usage are per segment -> sum; total_cost_usd is cumulative -> last.
        results, session = [], None
        ev = r / 'events.jsonl'
        if ev.exists():
            for line in ev.read_text(errors='replace').splitlines():
                try:
                    e = json.loads(line)
                except ValueError:
                    continue
                session = e.get('session_id') or session
                if e.get('type') == 'result':
                    results.append(e)
        result = None
        if results:
            result = dict(results[-1])
            for k in ('duration_ms', 'duration_api_ms', 'num_turns'):
                result[k] = sum(x.get(k) or 0 for x in results)
            result['is_error'] = any(x.get('is_error') for x in results)
            result['usage'] = {k: sum((x.get('usage') or {}).get(k) or 0 for x in results)
                               for k in ('input_tokens', 'output_tokens', 'cache_read_input_tokens',
                                         'cache_creation_input_tokens')}
        u = (result or {}).get('usage') or {}
        runs.append({
            'run': r.name, 'session_id': session, 'model': meta.get('model'),
            'started_utc': meta.get('started_utc'), 'ended_utc': meta.get('ended_utc'),
            'exit_code': meta.get('exit_code'), 'resume_of': meta.get('resume'),
            'duration_s': round(result['duration_ms'] / 1000, 1) if result and 'duration_ms' in result else None,
            'api_duration_s': round(result['duration_api_ms'] / 1000, 1) if result and 'duration_api_ms' in result else None,
            'turns': (result or {}).get('num_turns'),
            'is_error': (result or {}).get('is_error'),
            'input_tokens': u.get('input_tokens'), 'output_tokens': u.get('output_tokens'),
            'cache_read_tokens': u.get('cache_read_input_tokens'),
            'cache_write_tokens': u.get('cache_creation_input_tokens'),
            'cost_usd': (result or {}).get('total_cost_usd'),
        })
    approval = json.loads((w / 'APPROVAL.json').read_text()) if (w / 'APPROVAL.json').exists() else None

    def total(key):
        vals = [x[key] for x in runs]
        return None if not vals or any(v is None for v in vals) else round(sum(vals), 4)
    workers.append({'worker': w.name, 'runs': runs, 'run_count': len(runs),
                    'failed_or_error_runs': sum(1 for x in runs if x['exit_code'] not in (0, None) or x['is_error']),
                    'total_duration_s': total('duration_s'), 'total_output_tokens': total('output_tokens'),
                    'total_input_tokens': total('input_tokens'), 'total_cache_read_tokens': total('cache_read_tokens'),
                    'total_cost_usd': total('cost_usd'), 'approval': approval})
(root / 'LEDGER.json').write_text(json.dumps(workers, indent=2) + '\n')
lines = ['# E2/E3 worker ledger（自动生成，勿手改；null = 未知）', '',
         '| worker | runs | 失败/错误 | 墙钟 s | 输入 tok | 输出 tok | cache 读 tok | 费用 USD | 监督者审批 |',
         '|---|---|---|---|---|---|---|---|---|']
for w in workers:
    a = w['approval']['status'] if w['approval'] else '未审'
    lines.append(f"| {w['worker']} | {w['run_count']} | {w['failed_or_error_runs']} | {w['total_duration_s']} | "
                 f"{w['total_input_tokens']} | {w['total_output_tokens']} | {w['total_cache_read_tokens']} | {w['total_cost_usd']} | {a} |")
(root / 'LEDGER.md').write_text('\n'.join(lines) + '\n')
print('\n'.join(lines))
