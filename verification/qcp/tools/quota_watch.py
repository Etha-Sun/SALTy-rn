#!/usr/bin/env python3
"""Read live Codex quota and write eligibility only; never start/resume/stop work."""
import argparse
import json
import os
import selectors
import subprocess
import time
from pathlib import Path

ROOT = Path(__file__).resolve().parents[3]
PHASES = {'bootstrap', 'wait_initial', 'leader', 'wait_leader'}


def read_quota(timeout=45):
    """Only initialize and account/rateLimits/read, using the current login."""
    proc = subprocess.Popen(['codex', 'app-server', '--stdio'], stdin=subprocess.PIPE,
                            stdout=subprocess.PIPE, stderr=subprocess.DEVNULL)
    selector = selectors.DefaultSelector()
    selector.register(proc.stdout, selectors.EVENT_READ)
    buffered = b''
    deadline = time.monotonic() + timeout

    def send(message):
        proc.stdin.write((json.dumps(message) + '\n').encode())
        proc.stdin.flush()

    def response(request_id):
        nonlocal buffered
        while time.monotonic() < deadline:
            while b'\n' in buffered:
                line, buffered = buffered.split(b'\n', 1)
                message = json.loads(line)
                if message.get('id') == request_id:
                    if 'error' in message:
                        raise RuntimeError('app_server_request_failed_' + str(request_id))
                    return message['result']
            if not selector.select(max(0, deadline - time.monotonic())):
                break
            chunk = os.read(proc.stdout.fileno(), 65536)
            if not chunk:
                break
            buffered += chunk
        raise RuntimeError('live_quota_unavailable')

    try:
        send({'id': 1, 'method': 'initialize', 'params': {
            'clientInfo': {'name': 'qcp_quota_watch', 'version': '1'}}})
        response(1)
        send({'method': 'initialized', 'params': {}})
        send({'id': 2, 'method': 'account/rateLimits/read',
              'params': {'excludeResetCreditDetails': True}})
        return response(2)
    finally:
        selector.close()
        proc.stdin.close()  # EOF shuts down this read-only transport.
        try:
            proc.wait(timeout=5)
        except subprocess.TimeoutExpired:
            pass  # Never kill another process, including on transport failure.
        proc.stdout.close()


def decide(previous, response):
    phase = previous if previous in PHASES else 'bootstrap'
    buckets = response.get('rateLimitsByLimitId') or {}
    bucket = buckets.get('codex')
    if bucket is None and response.get('rateLimits', {}).get('limitId') == 'codex':
        bucket = response['rateLimits']
    bucket = bucket if isinstance(bucket, dict) else None
    windows = {}
    known = bucket is not None
    for name in ('primary', 'secondary'):
        window = (bucket or {}).get(name)
        used = window.get('usedPercent') if isinstance(window, dict) else None
        duration = window.get('windowDurationMins') if isinstance(window, dict) else None
        valid = type(used) is int and used >= 0 and type(duration) is int and duration > 0
        configured = window is not None
        windows[name] = {'configured': configured, 'known': valid, 'used_percent': used,
                         'remaining_percent': max(0, 100 - used) if valid else None,
                         'duration_minutes': duration,
                         'resets_at': window.get('resetsAt') if isinstance(window, dict) else None}
        known = known and (not configured or valid)
    configured = [name for name, window in windows.items() if window['configured']]
    known = known and bool(configured)
    control = min(configured, key=lambda name: windows[name]['duration_minutes']) if known else None
    remaining = windows[control]['remaining_percent'] if known else None
    allowed_present = 'ordinaryUsageAllowed' in response
    allowed = response.get('ordinaryUsageAllowed')
    reason = 'quota_unknown'
    # Older app-server versions omit the permission field. Explicit null in
    # the current schema is unavailable and never establishes recovery.
    if known and (not allowed_present or allowed is not None):
        reason = 'available'
        if (allowed_present and allowed is not True) or bucket.get('spendControlReached') is True or bucket.get('rateLimitReachedType'):
            reason = 'backend_usage_blocked'
        elif any(w['remaining_percent'] == 0 for w in windows.values()):
            reason = 'window_exhausted'
        elif (bucket.get('individualLimit') or {}).get('remainingPercent', 1) <= 0:
            reason = 'individual_limit_exhausted'
    if reason != 'available':
        # A failed/unknown read does not prove a threshold crossing. Keep the
        # phase so a transient query failure cannot manufacture a 90% wait.
        if reason != 'quota_unknown':
            phase = 'wait_initial' if phase in ('bootstrap', 'wait_initial') else 'wait_leader'
    elif phase == 'bootstrap' and remaining < 10:
        phase, reason = 'wait_initial', 'bootstrap_below_10'
    elif phase == 'leader' and remaining < 70:
        phase, reason = 'wait_leader', 'leader_below_70'
    elif phase in ('wait_initial', 'wait_leader'):
        if remaining >= 90:
            phase = 'leader'
        else:
            reason = 'waiting_for_90'
    return {'phase': phase, 'can_run': reason == 'available' and phase in ('bootstrap', 'leader'),
            'reason': reason, 'bucket': 'codex' if bucket is not None else None,
            'control_window': control, 'ordinary_usage_allowed': allowed,
            'permission_field_present': allowed_present,
            'windows': windows, 'source': 'live account/rateLimits/read'}


def poll(state_dir):
    path = state_dir / 'state.json'
    previous = json.loads(path.read_text()).get('phase') if path.exists() else 'bootstrap'
    error = None
    try:
        response = read_quota()
    except (OSError, RuntimeError, ValueError) as exc:
        error = str(exc) if isinstance(exc, RuntimeError) else type(exc).__name__
        response = {}  # Preserve no credentials, raw responses or backend errors.
    state = decide(previous, response if isinstance(response, dict) else {})
    state['read_error'] = error
    state['checked_at_unix'] = int(time.time())
    state_dir.mkdir(parents=True, exist_ok=True)
    temporary = path.with_suffix('.tmp')
    temporary.write_text(json.dumps(state, indent=2) + '\n')
    temporary.replace(path)
    print(json.dumps(state, ensure_ascii=False), flush=True)
    return state


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    mode = parser.add_mutually_exclusive_group()
    mode.add_argument('--once', action='store_true')
    mode.add_argument('--loop', action='store_true', help='Read every 1800 seconds; never execute work')
    parser.add_argument('--state-dir', type=Path, default=ROOT / '.build/quota')
    args = parser.parse_args()
    while True:
        poll(args.state_dir)
        if not args.loop:
            return
        time.sleep(1800)


if __name__ == '__main__':
    main()
