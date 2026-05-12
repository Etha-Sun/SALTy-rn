"""Pipeline configuration and result dataclasses."""

import argparse
import os
from dataclasses import dataclass, field
from pathlib import Path
from typing import Optional


SCRIPT_DIR = Path(__file__).resolve().parent
PROJECT_ROOT = SCRIPT_DIR.parent.parent  # src/workflow/ -> SALT/


@dataclass
class Config:
    # Translation
    source: str = "Neon"           # source language (maps to prompts/<source>/ and kernels/source/)
    target: str = "RVV"            # target language (maps to kernels/target/)
    model: str = "gemini-3.1-pro-preview-customtools"
    temperature: float = 0.1
    repair_temperature: float = 0.3
    thinking: Optional[str] = None  # Gemini thinking level (low/medium/high) or None

    # Verification
    verification_model: str = "gemini-3.1-pro-preview"   # LLM for harness inference (buffer sizes, params). Empty = use 'model'

    # Zephyr / Spike
    # zephyr_base: str = field(default_factory=lambda: str(PROJECT_ROOT / "third_party" / "zephyr"))
    # chipyard_path: str = ""
    zephyr_base: str = "/scratch/kchern2/SALTy-rn/third_party/zephyr"
    chipyard_path: str = "/scratch/kchern2/SALTy-rn/third_party/chipyard"


    # Pipeline
    max_compile_retries: int = 5
    max_verification_retries: int = 5
    verification_backend: str = "bitwuzla"   # 'bitwuzla' or 'cvc5'
    verification_timeout: int = 600          # per-batch timeout (s); default 10 min, 0 = no limit
    verification_batch: int = 0              # if >0, run ONLY this batch size; 0 = sweep
    kernels_dir: Path = field(default_factory=lambda: PROJECT_ROOT / "kernels")
    dry_run: bool = False
    skip_existing: bool = False
    rules_only: bool = False
    skip_translation: bool = False
    skip_spike: bool = False

    # Autocomp optimization (post-verify)
    optimize: bool = False                          # gate: run autocomp after a verified translation
    optimize_prob_id: int = -1                      # autocomp prob_id (single-kernel mode)
    optimize_map_file: Path = field(               # batch-mode kernel→prob_id map
        default_factory=lambda: PROJECT_ROOT / "kernels" / "optimize_map.json"
    )
    autocomp_models: list[str] = field(default_factory=lambda: [
        "anthropic::claude-opus-4-5-20251101",
    ])
    autocomp_iterations: int = 8
    autocomp_beam_size: int = 4
    autocomp_num_plan_candidates: int = 4
    autocomp_num_code_candidates: int = 2
    autocomp_vlen: int = 512
    autocomp_dlen: int = 256

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
        cfg.chipyard_path = args.chipyard_path or os.environ.get("CHIPYARD_PATH", cfg.chipyard_path)
        # Pipeline
        cfg.max_compile_retries = args.max_compile_retries
        cfg.max_verification_retries = args.max_verification_retries
        cfg.verification_backend = args.backend
        cfg.verification_timeout = args.verification_timeout
        cfg.verification_batch = getattr(args, "verify_batch", 0)
        cfg.dry_run = args.dry_run
        cfg.skip_existing = args.skip_existing
        cfg.rules_only = args.rules_only
        cfg.skip_translation = args.skip_translation
        cfg.skip_spike = args.skip_spike
        # Autocomp opt-in
        cfg.optimize = getattr(args, "optimize", False)
        cfg.optimize_prob_id = getattr(args, "prob_id", -1)
        if getattr(args, "optimize_map", None):
            cfg.optimize_map_file = Path(args.optimize_map)
        if getattr(args, "autocomp_iterations", None) is not None:
            cfg.autocomp_iterations = args.autocomp_iterations
        if getattr(args, "autocomp_beam_size", None) is not None:
            cfg.autocomp_beam_size = args.autocomp_beam_size
        if getattr(args, "autocomp_model", None):
            cfg.autocomp_models = list(args.autocomp_model)
        if args.kernels_dir:
            cfg.kernels_dir = Path(args.kernels_dir)
        return cfg

    def create_llm_client(self):
        """Create an LLMClient for translation from this config."""
        from .llm import LLMClient
        return LLMClient.from_model_string(self.model)

    def create_verification_llm_client(self):
        """Create an LLMClient for verification tasks (buffer inference, invariants).
        Falls back to the translation model if verification_model is not set."""
        from .llm import LLMClient
        model = self.verification_model or self.model
        return LLMClient.from_model_string(model)


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
