"""Read the user's cq function every 30 minutes; never run a model request."""
import argparse
import json
import os
from pathlib import Path
import signal
import subprocess
import time

HERE = Path(__file__).resolve().parent


def save(name, data):
    path = HERE / name
    temporary = path.with_suffix(path.suffix + '.tmp')
    temporary.write_text(json.dumps(data, indent=2) + '\n')
    temporary.replace(path)


def check():
    process = subprocess.Popen(['/bin/bash', '-ic', 'codex_quota -j'],
                               stdout=subprocess.PIPE, stderr=subprocess.PIPE,
                               text=True, start_new_session=True)
    try:
        stdout, _ = process.communicate(timeout=45)
        if process.returncode:
            raise RuntimeError('cq query failed')
        response = json.loads(stdout[stdout.index('{'):])['result']
        windows = []
        def collect(value):
            if isinstance(value, dict):
                if 'usedPercent' in value:
                    used = float(value['usedPercent'])
                    if not 0 <= used <= 100:
                        raise ValueError('Invalid quota percentage')
                    windows.append({'remaining_percent': 100-used,
                                    'window_minutes': value.get('windowDurationMins'),
                                    'resets_at': value.get('resetsAt')})
                for child in value.values():
                    collect(child)
            elif isinstance(value, list):
                for child in value:
                    collect(child)
        collect(response['rateLimits'])
        if not windows:
            raise RuntimeError('No quota windows returned')
        status = {'checked_at': time.time(), 'remaining_percent': min(
            w['remaining_percent'] for w in windows), 'windows': windows,
            'threshold_percent': 55, 'interval_seconds': 1800, 'query_ok': True}
        status['closing'] = status['remaining_percent'] < 55 or response.get('ordinaryUsageAllowed') is False
    except (Exception, subprocess.TimeoutExpired):
        if process.poll() is None:
            os.killpg(process.pid, signal.SIGKILL)
            process.communicate()
        status = {'checked_at': time.time(), 'query_ok': False, 'closing': True,
                  'reason': 'Quota query unavailable; stop new work until root review'}
    save('quota-status.json', status)
    with (HERE / 'quota-history.jsonl').open('a') as log:
        log.write(json.dumps(status) + '\n')
    if status['closing']:
        save('QUOTA-STOP.json', status)
    print(json.dumps(status), flush=True)
    return status


if __name__ == '__main__':
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--once', action='store_true')
    args = parser.parse_args()
    save('quota-watch-process.json', {'pid': os.getpid(), 'interval_seconds': 1800})
    while not (HERE / 'MONITOR-DONE').exists():
        started = time.monotonic()
        if check()['closing'] or args.once:
            break
        while time.monotonic()-started < 1800 and not (HERE / 'MONITOR-DONE').exists():
            time.sleep(1)
