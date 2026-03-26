"""Pipeline configuration and result dataclasses."""

import argparse
import os
from dataclasses import dataclass, field
from pathlib import Path


SCRIPT_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = SCRIPT_DIR.parent.parent  # src/workflow/ -> SALT/


@dataclass
class Config:
    """Pipeline configuration.

    Usage:
        python pipeline.py --source Neon --model gcp::gemini-3.1-pro-preview-customtools
        python pipeline.py --source RVV --model openai::gpt-4o
    """
    # Translation
    source: str = "Neon"           # source language (maps to prompts/<source>/ and kernels/source/)
    target: str = "RVV"            # target language (maps to kernels/target/)
    model: str = "gemini-3.1-pro-preview-customtools"  # provider::model format
    temperature: float = 0.1
    repair_temperature: float = 0.3
    thinking: str | None = None  # Gemini thinking level (low/medium/high) or None

    # Zephyr / Spike
    zephyr_base: str = field(default_factory=lambda: str(PROJECT_ROOT / "third_party" / "zephyr"))
    chipyard_path: str = ""  # machine-specific, set via env CHIPYARD_PATH or CLI

    # Pipeline
    max_retries: int = 5
    kernels_dir: Path = field(default_factory=lambda: PROJECT_ROOT / "kernels")
    dry_run: bool = False
    skip_existing: bool = False
    rules_only: bool = False

    @property
    def source_dir(self) -> Path:
        return self.kernels_dir / "source"

    @property
    def target_dir(self) -> Path:
        return self.kernels_dir / "target"

    @property
    def status_file(self) -> Path:
        return self.kernels_dir / "status.json"

    @classmethod
    def from_env_and_args(cls, args: argparse.Namespace) -> "Config":
        cfg = cls()
        # Translation
        cfg.source = args.source
        cfg.target = args.target
        cfg.model = args.model
        cfg.temperature = args.temperature
        cfg.repair_temperature = args.repair_temperature
        cfg.thinking = args.thinking
        # Build paths
        cfg.zephyr_base = args.zephyr_base or os.environ.get("ZEPHYR_BASE", cfg.zephyr_base)
        cfg.chipyard_path = args.chipyard_path or os.environ.get("CHIPYARD_PATH", "")
        # Pipeline
        cfg.max_retries = args.max_retries
        cfg.dry_run = args.dry_run
        cfg.skip_existing = args.skip_existing
        cfg.rules_only = args.rules_only
        if args.kernels_dir:
            cfg.kernels_dir = Path(args.kernels_dir)
        return cfg

    def create_llm_client(self):
        """Create an LLMClient from this config."""
        from .llm import LLMClient
        return LLMClient.from_model_string(self.model)


@dataclass
class CompileResult:
    """Result of a Zephyr/Spike compile-and-run attempt."""
    success: bool
    error_message: str = ""
    output: str = ""


@dataclass
class TranslationResult:
    """Result of translating a single kernel."""
    kernel_name: str
    success: bool
    attempts: int = 0
    output_file: str = ""
    error: str = ""
