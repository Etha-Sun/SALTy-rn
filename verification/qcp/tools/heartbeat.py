#!/usr/bin/env python3
"""One bounded heartbeat: live quota, GitHub change detection, eligible local wakeup."""
import hashlib
import json
import subprocess
from pathlib import Path
from quota_watch import ROOT, poll

STATE = ROOT / '.build/quota'
CONFIG = ROOT / 'verification/qcp/docs/coordination.json'


def tick():
    STATE.mkdir(parents=True, exist_ok=True)
    # The timer runs sequentially; manual concurrent invocation is rejected.
    import fcntl
    with (STATE / 'heartbeat.lock').open('w') as lock:
        fcntl.flock(lock, fcntl.LOCK_EX | fcntl.LOCK_NB)
        quota = poll(STATE)
        config = json.loads(CONFIG.read_text())
        record = STATE / 'heartbeat.json'
        old = json.loads(record.read_text()) if record.exists() else {}
        result = {'quota_checked_at': quota['checked_at_unix'], 'can_run': quota['can_run'],
                  'phase': quota['phase'], 'queued': False}
        # Waiting is query-only: do not spend a model turn to report unchanged limits.
        if not quota['can_run']:
            record.write_text(json.dumps(result, indent=2) + '\n')
            return result
        pr = config.get('coordination_pr')
        digest = None
        if pr:
            try:
                responses = [subprocess.check_output(cmd, cwd=ROOT, timeout=45) for cmd in [
                    ['gh', 'pr', 'view', pr, '--json', 'body,comments,updatedAt'],
                    ['gh', 'pr', 'list', '--repo', config['repository'], '--base',
                     config['integration_branch'], '--json', 'number,headRefOid,updatedAt,isDraft']]]
                digest = hashlib.sha256(b'\n'.join(responses)).hexdigest()
            except (subprocess.SubprocessError, OSError):
                result['github_read_failed'] = True
        result['github_digest'] = digest or old.get('github_digest')
        pilot_pending = not (STATE / 'pilot-complete').exists()
        changed = digest is not None and digest != old.get('github_digest')
        if pilot_pending or changed or not old.get('can_run'):
            message = (
                'c-shim-v2 定时心跳：实时额度允许工作。先读 verification/qcp/docs/COORDINATION.zh-CN.md、'
                'ROADMAP.zh-CN.md 和 .build/quota/state.json（工作树 build/qcp-kernel-framework）。'
                '继续用户已授权的 VADD 首例；完成后本机只做 leader 审查协调，其他39项交另一服务器。'
                '每个小步骤前查询实时额度，当前bootstrap低于10%收尾；首次恢复>=90%转leader后低于70%收尾。'
                '暂停时保存checkpoint并结束，不用模型等待。不要重复已有任务或启动第二个重叠runner。'
                '检查协调PR新消息，仅状态变化回复。真实整核闭合后创建 .build/quota/pilot-complete，'
                '未完成不能创建。使用中文；无变化不向用户发例行汇报。')
            completed = subprocess.run(['codex', 'queue', '--thread', config['local_thread'],
                                        '--message', message], cwd=ROOT, capture_output=True, timeout=60)
            result['queued'] = completed.returncode == 0
            result['queue_exit_code'] = completed.returncode
        record.write_text(json.dumps(result, indent=2) + '\n')
        print(json.dumps(result), flush=True)
        return result


if __name__ == '__main__':
    tick()
