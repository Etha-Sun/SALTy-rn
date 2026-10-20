"""Run a frozen Gateway task with one of sixteen process-owned WP slots."""
import argparse
import json
from pathlib import Path
import sys
import time

HERE = Path(__file__).resolve().parent
sys.path.insert(0, str(HERE.parent / 'deepseek-swarm-v1'))
from gateway import Gateway
from kernel_supervisor import FileSlots


def gate_open():
    path = HERE / 'quota-status.json'
    if (HERE / 'QUOTA-STOP.json').exists() or not path.exists():
        return False
    status = json.loads(path.read_text())
    return status.get('query_ok') and not status.get('closing') and time.time()-status['checked_at'] < 1900


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('task_root', type=Path)
    parser.add_argument('--mode', choices=['full', 'focus'], default='full')
    parser.add_argument('--seconds', type=int, default=1200)
    args = parser.parse_args()
    if not 1 <= args.seconds <= 3600:
        parser.error('Bound each run to 1..3600 seconds')
    if not gate_open():
        raise SystemExit('Quota gate closed; save proof and begin wrap-up')
    root = args.task_root.resolve()
    gateway = Gateway(root, FileSlots(HERE / 'wp-slots', 16))
    attempt = gateway.start_verify(args.mode)['attempt']
    started = None
    try:
        while True:
            result = gateway.poll(attempt)
            if result['state'] not in ['running', 'queued']:
                break
            if result['state'] == 'queued' and not gate_open():
                result = gateway.cancel(attempt)
                result['administrative_reason'] = 'quota gate closed while queued'
                break
            if result['state'] == 'running':
                started = started or time.monotonic()
                if time.monotonic()-started > args.seconds:
                    result = gateway.cancel(attempt)
                    result['administrative_reason'] = 'bounded CPU verification budget'
                    break
            time.sleep(1)
    finally:
        if gateway.poll(attempt)['state'] in ['queued', 'running']:
            gateway.cancel(attempt)
    (root / ('run-'+attempt+'.json')).write_text(json.dumps(result, indent=2)+'\n')
    print(json.dumps(result), flush=True)


if __name__ == '__main__':
    main()
