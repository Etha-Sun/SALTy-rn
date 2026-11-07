#!/usr/bin/env bash
# Launch or resume one Claude CLI worker (independent process) for Vekto E2/E3.
# Usage: launch.sh <worker-dir> [--resume <session-id> --message-file <file>]
#   First run reads <worker-dir>/BRIEF.md as the prompt.
# Each run gets runs/runNN/{events.jsonl,stderr.log,meta.json}; ledger.py aggregates them.
set -euo pipefail
ROOT=$(cd "$(dirname "$0")" && pwd)
REPO=$(cd "$ROOT/../.." && pwd)
W=$(cd "$1" && pwd); shift
RESUME=""; MSG="$W/BRIEF.md"
while [ $# -gt 0 ]; do
  case "$1" in
    --resume) RESUME="$2"; shift 2;;
    --message-file) MSG="$(cd "$(dirname "$2")" && pwd)/$(basename "$2")"; shift 2;;
    *) echo "unknown arg $1" >&2; exit 2;;
  esac
done
MODEL=${MODEL:-claude-sonnet-5-5}
MEM=${MEM:-128G}
n=$(find "$W/runs" -mindepth 1 -maxdepth 1 -name "run*" 2>/dev/null | wc -l || true)
RUN=$(printf '%s/runs/run%02d' "$W" $((n+1)))
mkdir -p "$RUN" "$W/work"
name=$(basename "$W")
python3 -I - "$RUN/meta.json" "$name" "$MODEL" "$MEM" "$RESUME" "$MSG" <<'EOF'
import json, sys, time, hashlib
out, name, model, mem, resume, msg = sys.argv[1:]
text = open(msg, 'rb').read()
json.dump({'worker': name, 'model': model, 'memory_max': mem, 'resume': resume or None,
           'prompt_file': msg, 'prompt_sha256': hashlib.sha256(text).hexdigest(),
           'started_utc': time.strftime('%Y-%m-%dT%H:%M:%SZ', time.gmtime())}, open(out, 'w'), indent=2)
EOF
# Sandbox: Bash runs inside bubblewrap, writes confined to the worker dir (like codex workspace-write).
# Write/Edit tools: only the cwd (work/). Read tool: whole repo via an explicit Read rule.
# NOTE: do NOT use --add-dir for the repo -- in acceptEdits mode it grants Write/Edit there too
# (W04 incident 2026-11-07).
WEB=''
# Per-worker opt-in for read-only web tools (user 11-07: W03 may go online for HVX docs). Bash network stays sandboxed.
[ -f "$W/ALLOW_WEB" ] && WEB=',"WebFetch","WebSearch"'
SETTINGS='{"sandbox":{"enabled":true,"autoAllowBashIfSandboxed":true,"allowUnsandboxedCommands":false},"permissions":{"allow":["Read(//srv/home/yuechunsun/tools/lean/**)","Read(//tmp/**)"'"$WEB"']}}'
export ZIG_GLOBAL_CACHE_DIR="$W/work/.zig-cache" ZIG_LOCAL_CACHE_DIR="$W/work/.zig-cache" TMPDIR="/tmp/vk-$(basename "$W")"
mkdir -p "$TMPDIR"
args=(-p --model "$MODEL" --permission-mode acceptEdits --settings "$SETTINGS" --output-format stream-json --verbose --debug-file "$RUN/debug.log"
      --append-system-prompt "$(cat "$ROOT/COMMON-RULES.zh-CN.md")")
[ -n "$RESUME" ] && args+=(--resume "$RESUME")
cd "$W/work"
set +e
systemd-run --user --scope -q --unit="vekto-$name-$(basename "$RUN")" -p MemoryMax="$MEM" \
  claude "${args[@]}" < "$MSG" > "$RUN/events.jsonl" 2> "$RUN/stderr.log"
rc=$?
set -e
python3 -I - "$RUN/meta.json" "$rc" <<'EOF'
import json, sys, time
p, rc = sys.argv[1], int(sys.argv[2])
m = json.load(open(p)); m['exit_code'] = rc
m['ended_utc'] = time.strftime('%Y-%m-%dT%H:%M:%SZ', time.gmtime())
json.dump(m, open(p, 'w'), indent=2)
EOF
python3 -I "$ROOT/ledger.py" "$ROOT" > /dev/null || true
exit $rc
