"""Read Codex account limits without model calls; emit only quota metadata."""
import json
from pathlib import Path
import selectors
import subprocess
import time
from datetime import datetime, timezone

server = subprocess.Popen(["codex", "app-server", "--stdio"], stdin=subprocess.PIPE,
                          stdout=subprocess.PIPE, stderr=subprocess.DEVNULL,
                          text=True, bufsize=1)
selector = selectors.DefaultSelector()
selector.register(server.stdout, selectors.EVENT_READ)


def send(message):
    server.stdin.write(json.dumps(message) + "\n")
    server.stdin.flush()


def receive(identifier):
    deadline = time.monotonic() + 25
    while time.monotonic() < deadline:
        if not selector.select(1):
            continue
        line = server.stdout.readline()
        if not line:
            raise RuntimeError("Account server closed; quota unknown")
        message = json.loads(line)
        if message.get("id") == identifier:
            if "error" in message:
                raise RuntimeError("Account query failed; quota unknown")
            return message["result"]
    raise TimeoutError("Account query timed out; quota unknown")


try:
    send({"id": 1, "method": "initialize", "params": {
        "clientInfo": {"name": "research_quota_read", "version": "1.0"}}})
    receive(1)
    send({"method": "initialized", "params": {}})
    send({"id": 2, "method": "account/rateLimits/read", "params": {}})
    response = receive(2)
    limits = response.get("rateLimitsByLimitId") or {"codex": response.get("rateLimits", {})}
    windows = []
    for name, limit in limits.items():
        for kind in ("primary", "secondary"):
            value = limit.get(kind)
            if value is not None:
                windows.append({"bucket": name, "window": kind,
                                "used_percent": value["usedPercent"],
                                "remaining_percent": 100 - value["usedPercent"],
                                "window_minutes": value.get("windowDurationMins"),
                                "resets_at": value.get("resetsAt")})
    snapshot = {"observed_at": datetime.now(timezone.utc).isoformat(),
                "method": "account/rateLimits/read", "windows": windows,
                "stop_new_work": not windows or any(x["remaining_percent"] <= 55 for x in windows),
                "user_reserve_percent": 50, "operational_stop_remaining_percent": 55}
    Path(__file__).with_name("quota-snapshot.json").write_text(json.dumps(snapshot, indent=2) + "\n")
    print(json.dumps(snapshot))
finally:
    server.terminate()
    try:
        server.wait(timeout=3)
    except subprocess.TimeoutExpired:
        server.kill()
