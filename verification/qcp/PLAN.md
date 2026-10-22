# QCP kernel framework plan

Base: keaganchern/SALTy-rn main at be16280c7812a7459c26c3ce82a47339a3d07718.
Branch: c-shim-v2. Existing feat/shim-c worktree is read-only reference.

Goal: clean review surface (original NEON/RVV, interface/spec.h, mapper.c), reusable verified intrinsic support, all 40 kernel pairs inventoried, and actual bounded vadd proof development.

1. Pin all 40 upstream pairs and audit the four-file upstream addition. Record CSim repairs separately; never replace originals silently.
2. Implement deterministic case generation, source/spec/mapper freeze checks, isolated build/results, and negative integrity controls.
3. Subagents implement/prove vadd intrinsic contracts and investigate float/NaN compatibility; no assumed implementations, Admitted, new axioms, or finite-only input restriction.
4. Document architecture, review boundaries, trust assumptions, proof closure, shared SIMD strategy, and per-family coverage. Re-run only checks affected by changes.

Accepted scope: disjoint inputs; LP64 little endian; initial vadd VLEN128/min-VL and RNE; number-or-both-NaN observation. Source identity, lowering validity, shim correctness and ISA correspondence are different obligations.
Minimum evidence: reproducible inventory and source guards, original-code native vadd comparison, checked shared local lemmas, explicit unresolved proof paths. Full-kernel status must remain pending until original bodies, adapters, shim and comparator dependencies are all checked.

File ownership: root owns tools/build/audit/check, cases/f32-vadd review surface and framework docs. vadd agent owns shared/vadd and experiments/vadd-proof. NaN agent owns experiments/nan-bridge. Inventory agent owns tools/inventory.py, catalog.json and docs/INVENTORY/CSIM-REPAIRS.
