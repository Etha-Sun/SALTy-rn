# SALTy-RN

LLM-powered SIMD kernel translation pipeline (Neon → RVV).

## Setup

```bash
# Clone with submodules
git clone --recursive git@github.com:keaganchern/SALTy-rn.git
cd SALTy-rn

# Create virtual environment
python3 -m venv .venv
source .venv/bin/activate

# Install package and dependencies
pip install -e .

# Set up API keys
cp src/workflow/llm/keys.py.example src/workflow/llm/keys.py
# Edit keys.py with your API keys

# (Optional) Set Chipyard path for Spike simulation
export CHIPYARD_PATH=/path/to/chipyard
```

## Usage

```bash
# Translate a single kernel
salty-rn -k qs8-vaddc

# Translate a specific file
salty-rn -f kernels/source/qs8-vaddc.c

# Translate all kernels
salty-rn -b

# Dry run (no LLM calls)
salty-rn -k qs8-vaddc --dry-run

# With translation rules only (smaller prompt)
salty-rn -k qs8-vaddc --rules-only

# With intrinsics search tools
salty-rn -k qs8-vaddc --tools

# With thinking enabled
salty-rn -k qs8-vaddc --thinking medium

# Compile and run only (no translation)
salty-compile qs8-vaddc
salty-compile qs8-vaddc --build-only
```

## Project Structure

```
SALTy-rn/
├── src/workflow/          # Pipeline code
│   ├── pipeline.py        # Entry point
│   ├── config.py          # Configuration
│   ├── status.py          # Status tracking
│   ├── llm/               # LLM client (multi-provider)
│   ├── prompts_pkg/       # Prompt loading + intrinsics search
│   └── build/             # Zephyr compilation + Spike
├── kernels/
│   ├── source/            # Input kernels (Neon)
│   ├── target/            # Generated output (RVV)
│   ├── harness/           # Test harnesses
│   └── status.json        # Translation progress
├── prompts/               # Prompt templates by source ISA
│   └── Neon/
├── op-semantics/          # Intrinsics reference docs
├── third_party/           # Git submodules
│   ├── autocomp/
│   └── zephyr/
└── benchmark/
    └── XNNPACK/           # Git submodule
```
