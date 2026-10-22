import unittest
from quota_watch import decide


def sample(remaining, secondary=50, allowed=True):
    return {'ordinaryUsageAllowed': allowed, 'rateLimitsByLimitId': {'codex': {
        'primary': {'usedPercent': 100-remaining, 'windowDurationMins': 300, 'resetsAt': 123},
        'secondary': {'usedPercent': 100-secondary, 'windowDurationMins': 10080, 'resetsAt': 456}}}}


class QuotaStateTests(unittest.TestCase):
    def test_bootstrap_threshold(self):
        self.assertEqual(decide('bootstrap', sample(9))['phase'], 'wait_initial')
        self.assertTrue(decide('bootstrap', sample(10))['can_run'])
        self.assertEqual(decide('bootstrap', sample(90))['phase'], 'bootstrap')

    def test_recovery_boundaries(self):
        for old in ['wait_initial', 'wait_leader']:
            self.assertFalse(decide(old, sample(89))['can_run'])
            state = decide(old, sample(90))
            self.assertEqual(state['phase'], 'leader')
            self.assertTrue(state['can_run'])
        self.assertEqual(decide('leader', sample(69))['phase'], 'wait_leader')
        self.assertFalse(decide('leader', sample(70))['can_run'])
        self.assertTrue(decide('leader', sample(71))['can_run'])

    def test_secondary_exhausted_and_backend_block(self):
        self.assertFalse(decide('leader', sample(99, secondary=0))['can_run'])
        self.assertFalse(decide('wait_initial', sample(99, allowed=False))['can_run'])
        self.assertFalse(decide('wait_initial', sample(99, allowed=None))['can_run'])

    def test_unknown_fails_closed(self):
        self.assertEqual(decide('leader', {})['phase'], 'leader')
        value = sample(99)
        value['rateLimitsByLimitId']['codex']['secondary'] = {'usedPercent': 'unknown', 'windowDurationMins': 10080}
        self.assertFalse(decide('wait_initial', value)['can_run'])
        value = sample(99)
        value['rateLimitsByLimitId']['codex']['primary']['usedPercent'] = '0'
        self.assertFalse(decide('wait_initial', value)['can_run'])

    def test_single_configured_window(self):
        value = sample(21)
        bucket = value['rateLimitsByLimitId']['codex']
        for missing in [False, True]:
            if missing:
                bucket.pop('secondary', None)
            else:
                bucket['secondary'] = None
            state = decide('bootstrap', value)
            self.assertTrue(state['can_run'])
            self.assertEqual(state['phase'], 'bootstrap')
            self.assertEqual(state['control_window'], 'primary')
            self.assertEqual(state['windows']['primary']['remaining_percent'], 21)
            self.assertFalse(state['windows']['secondary']['configured'])
        bucket['primary'] = None
        self.assertFalse(decide('bootstrap', value)['can_run'])

    def test_query_failure_preserves_phase(self):
        for phase in ['bootstrap', 'wait_initial', 'leader', 'wait_leader']:
            state = decide(phase, {})
            self.assertEqual(state['phase'], phase)
            self.assertFalse(state['can_run'])
        failed = decide('bootstrap', {})
        recovered = decide(failed['phase'], sample(21))
        self.assertTrue(recovered['can_run'])
        self.assertEqual(recovered['phase'], 'bootstrap')

    def test_missing_permission_legacy_vs_explicit_null(self):
        value = sample(99)
        del value['ordinaryUsageAllowed']
        state = decide('wait_initial', value)
        self.assertTrue(state['can_run'])
        self.assertFalse(state['permission_field_present'])
        value['ordinaryUsageAllowed'] = None
        self.assertFalse(decide('wait_initial', value)['can_run'])

    def test_bucket_selection_and_short_window(self):
        value = sample(80)
        value['rateLimits'] = {'limitId': 'other', 'primary': {'usedPercent': 100}}
        self.assertEqual(decide('leader', value)['control_window'], 'primary')
        bucket = value['rateLimitsByLimitId']['codex']
        bucket['primary'], bucket['secondary'] = bucket['secondary'], bucket['primary']
        self.assertEqual(decide('leader', value)['control_window'], 'secondary')
        self.assertTrue(decide('leader', value)['can_run'])
        self.assertFalse(decide('leader', {'rateLimits': {'primary': bucket['primary']}})['can_run'])


if __name__ == '__main__':
    unittest.main()
