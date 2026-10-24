"""Operational admission only; never changes proof input or a tool command.

Configured worker count and individual limits remain recorded. A separate live
JSON can reduce admission without restarting successful work. Waiting for a
slot happens before the subprocess timeout starts. Heavy commands reserve their
actual larger limit, so a 32 GiB job occupies two ordinary 16 GiB slots.
"""
from contextlib import contextmanager
import hashlib
import json
from pathlib import Path
import threading
import time


class ExecutionAdmission:
    def __init__(self, configured_jobs, control_file=None, maximum_job_gib=32):
        self.configured_jobs = configured_jobs
        self.control_file = Path(control_file).resolve() if control_file else None
        self.default_memory_gib = configured_jobs * maximum_job_gib
        self.condition = threading.Condition()
        self.active_jobs = 0
        self.reserved_gib = 0
        self.peak_jobs = 0
        self.peak_reserved_gib = 0

    def limits(self):
        digest = None
        if self.control_file:
            raw = self.control_file.read_bytes()
            data = json.loads(raw)
            digest = hashlib.sha256(raw).hexdigest()
            jobs, memory = data['jobs'], data['memory_budget_gib']
        else:
            jobs, memory = self.configured_jobs, self.default_memory_gib
        if type(jobs) is not int or not 1 <= jobs <= self.configured_jobs:
            raise ValueError('Invalid operational admission job limit')
        if type(memory) is not int or memory <= 0:
            raise ValueError('Invalid operational admission memory reservation')
        return jobs, memory, digest

    @contextmanager
    def reserve(self, memory_gib):
        start = time.monotonic()
        with self.condition:
            while True:
                jobs, budget, digest = self.limits()
                if memory_gib > budget:
                    raise ValueError('A single job exceeds live admission budget')
                if self.active_jobs < jobs and self.reserved_gib + memory_gib <= budget:
                    break
                self.condition.wait(timeout=1)
            self.active_jobs += 1
            self.reserved_gib += memory_gib
            self.peak_jobs = max(self.peak_jobs, self.active_jobs)
            self.peak_reserved_gib = max(self.peak_reserved_gib, self.reserved_gib)
            receipt = dict(configured_jobs=self.configured_jobs, live_job_limit=jobs,
                           live_memory_budget_gib=budget,
                           control_file=str(self.control_file) if self.control_file else None,
                           control_sha256=digest, admitted_active_jobs=self.active_jobs,
                           admitted_reserved_gib=self.reserved_gib,
                           job_memory_gib=memory_gib,
                           admission_wait_seconds=time.monotonic() - start)
        try:
            yield receipt
        finally:
            with self.condition:
                self.active_jobs -= 1
                self.reserved_gib -= memory_gib
                self.condition.notify_all()

    def snapshot(self):
        with self.condition:
            return dict(configured_jobs=self.configured_jobs,
                        control_file=str(self.control_file) if self.control_file else None,
                        active_jobs=self.active_jobs, reserved_gib=self.reserved_gib,
                        peak_active_jobs=self.peak_jobs,
                        peak_reserved_gib=self.peak_reserved_gib)
