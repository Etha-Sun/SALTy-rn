#!/usr/bin/env python3
"""Keep the frozen depth16 frontend; add WP progress logging only."""
import os
from pathlib import Path
import sys

runner = Path(__file__).with_name('frama_depth16.py')
os.execv(sys.executable, [sys.executable, str(runner), *sys.argv[1:], '-wp-verbose', '2'])
