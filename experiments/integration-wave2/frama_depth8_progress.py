#!/usr/bin/env python3
"""Use the qualified native-v6 model with depth8 search and verdict logging."""
import os
from pathlib import Path
import sys

root = Path(__file__).resolve().parents[2]
runner = root / 'experiments/codex-kernel-wave1/float-bits/model-native-bytes32-v6-no-pointer-range/frama-c.py'
os.execv(sys.executable, [sys.executable, str(runner), *sys.argv[1:], '-wp-auto-depth', '8', '-wp-msg-key', 'shell'])
