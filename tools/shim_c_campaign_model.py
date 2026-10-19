"""Run a separately frozen, explicit WP memory-model variant of a case."""
import argparse
import json
from pathlib import Path
import shim_c_campaign as campaign

p = argparse.ArgumentParser(description=__doc__)
p.add_argument("case", type=Path)
p.add_argument("--frozen-sha256", required=True)
p.add_argument("--name", required=True)
p.add_argument("--prepare", action="store_true")
p.add_argument("--framac", default="frama-c")
p.add_argument("--prover-bin")
args = p.parse_args()
data = campaign.baseline(args.case.resolve(), args.frozen_sha256)
model = data["wp_model_variant"]
allowed = {"Typed+raw+float", "Bytes+float"} if data.get("model") == "Typed+float" else {"Typed+raw"}
if model not in allowed or data["files"]["model_runner.py"]["path"] != str(Path(__file__).resolve().relative_to(campaign.ROOT)):
    raise RuntimeError("Unsupported or unfrozen model adapter")
original_run = campaign.subprocess.run


def invoke(command, *positional, **options):
    if isinstance(command, list) and "-wp" in command:
        if "-wp-model" in command:
            command[command.index("-wp-model")+1] = model
        else:
            command += ["-wp-model", model]
        output = options.get("stdout")
        if hasattr(output, "write"):
            output.write("# Actual frozen model variant: " + repr(command) + "\n")
            output.flush()
    return original_run(command, *positional, **options)


campaign.subprocess.run = invoke
result = campaign.run(args)
print(json.dumps(result, indent=2))
raise SystemExit(0 if result.get("passed", result.get("complete")) else 1)
