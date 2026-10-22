"""Offline scheduler checks: all quota reads, GitHub calls and queue writes are mocked."""
import hashlib
import json
import subprocess
import sys
import tempfile
import unittest
from pathlib import Path
from unittest.mock import patch

sys.path.insert(0, str(Path(__file__).resolve().parent))
import heartbeat
from quota_watch import decide


def quota(remaining, allowed=True):
    return {'rateLimitsByLimitId': {'codex': {
        'primary': {'usedPercent': 100 - remaining, 'windowDurationMins': 300}}},
        'ordinaryUsageAllowed': allowed}


class QuotaTests(unittest.TestCase):
    def test_unknown_never_runs_or_changes_phase(self):
        for phase in ['bootstrap', 'wait_initial', 'leader', 'wait_leader']:
            result = decide(phase, {})
            self.assertFalse(result['can_run'])
            self.assertEqual(result['phase'], phase)
        self.assertFalse(decide('bootstrap', quota(95, None))['can_run'])
        self.assertFalse(decide('bootstrap', quota(95, False))['can_run'])

    def test_bootstrap_10_then_recovery_90_then_leader_70(self):
        self.assertTrue(decide('bootstrap', quota(10))['can_run'])
        stopped = decide('bootstrap', quota(9))
        self.assertEqual(stopped['phase'], 'wait_initial')
        self.assertFalse(decide(stopped['phase'], quota(89))['can_run'])
        resumed = decide(stopped['phase'], quota(90))
        self.assertEqual(resumed['phase'], 'leader')
        self.assertTrue(resumed['can_run'])
        self.assertFalse(decide('leader', quota(70))['can_run'])
        self.assertTrue(decide('leader', quota(71))['can_run'])
        self.assertEqual(decide('leader', quota(69))['phase'], 'wait_leader')
        self.assertFalse(decide('wait_leader', quota(89))['can_run'])
        self.assertTrue(decide('wait_leader', quota(90))['can_run'])


class HeartbeatTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory()
        self.addCleanup(self.temp.cleanup)
        self.state = Path(self.temp.name)
        self.config = self.state / 'coordination.json'
        self.config.write_text(json.dumps({'coordination_pr': 'https://example.test/pr/1',
            'repository': 'example/repo', 'integration_branch': 'c-shim-v2',
            'local_thread': 'offline-test'}))
        self.responses = [b'{"body":"unchanged","comments":[]}', b'[]']
        self.poll = self.enterContext(patch.object(heartbeat, 'poll', return_value={
            'checked_at_unix': 1, 'phase': 'leader', 'can_run': True}))
        self.enterContext(patch.object(heartbeat, 'STATE', self.state))
        self.enterContext(patch.object(heartbeat, 'CONFIG', self.config))
        self.github = self.enterContext(patch.object(heartbeat.subprocess, 'check_output',
            side_effect=lambda cmd, **kwargs: self.responses[0 if cmd[2] == 'view' else 1]))
        self.queue = self.enterContext(patch.object(heartbeat.subprocess, 'run',
            return_value=subprocess.CompletedProcess([], 0, b'', b'')))

    def seed_complete_pilot(self):
        (self.state / 'pilot-complete').touch()
        digest = hashlib.sha256(b'\n'.join(self.responses)).hexdigest()
        (self.state / 'heartbeat.json').write_text(json.dumps({
            'can_run': True, 'github_digest': digest}))

    def test_allowed_pending_pilot_queues(self):
        self.assertTrue(heartbeat.tick()['queued'])
        self.queue.assert_called_once()
        self.assertTrue((self.state / 'wakeup-pending').exists())
        self.assertFalse(heartbeat.tick()['queued'])
        self.queue.assert_called_once()
        (self.state / 'wakeup-pending').unlink()  # Agent ends its turn.
        self.assertTrue(heartbeat.tick()['queued'])
        self.assertEqual(self.queue.call_count, 2)

    def test_denied_does_not_query_github_or_queue(self):
        for phase in ['bootstrap', 'wait_initial', 'leader', 'wait_leader']:
            self.poll.return_value = {'checked_at_unix': 1, 'phase': phase, 'can_run': False}
            self.assertFalse(heartbeat.tick()['queued'])
        self.github.assert_not_called()
        self.queue.assert_not_called()

    def test_complete_pilot_unchanged_is_quiet(self):
        self.seed_complete_pilot()
        self.assertFalse(heartbeat.tick()['queued'])
        self.queue.assert_not_called()

    def test_new_message_queues_once_after_pilot_complete(self):
        self.seed_complete_pilot()
        self.responses[0] = b'{"body":"unchanged","comments":["new message"]}'
        self.assertTrue(heartbeat.tick()['queued'])
        self.assertFalse(heartbeat.tick()['queued'])
        self.queue.assert_called_once()

    def test_failed_queue_retries_unacknowledged_github_change(self):
        # A failed submission must not acknowledge the observed GitHub change.
        self.seed_complete_pilot()
        self.responses[0] = b'{"body":"unchanged","comments":["new message"]}'
        self.queue.return_value = subprocess.CompletedProcess([], 1, b'', b'failure')
        self.assertFalse(heartbeat.tick()['queued'])
        self.assertTrue(json.loads((self.state / 'heartbeat.json').read_text())['retry_pending'])
        self.assertFalse((self.state / 'wakeup-pending').exists())
        self.queue.return_value = subprocess.CompletedProcess([], 0, b'', b'')
        self.assertTrue(heartbeat.tick()['queued'])
        self.assertEqual(self.queue.call_count, 2)

    def test_message_during_pending_turn_is_not_acknowledged(self):
        self.seed_complete_pilot()
        self.responses[0] = b'{"body":"first change","comments":[]}'
        self.assertTrue(heartbeat.tick()['queued'])
        acknowledged = json.loads((self.state / 'heartbeat.json').read_text())['github_digest']
        self.responses[0] = b'{"body":"second change","comments":[]}'
        result = heartbeat.tick()
        self.assertFalse(result['queued'])
        self.assertEqual(result['github_digest'], acknowledged)
        (self.state / 'wakeup-pending').unlink()
        self.assertTrue(heartbeat.tick()['queued'])
        self.assertEqual(self.queue.call_count, 2)


if __name__ == '__main__':
    unittest.main()
