# Acceptance checklist

- [x] New worktree starts at exact Keagan main commit; old worktrees preserved.
- [x] 40 source/target pairs, upstream four-file change, hashes and intrinsic inventory recorded.
- [x] Human review files and shared trusted components documented separately.
- [x] Vadd native mapper uses exact upstream bodies through includes.
- [x] QCP lowering is explicit and guarded; it is not claimed to be verbatim original C.
- [x] Frozen source/spec/mapper changes are detected by negative controls.
- [x] Vadd shared SIMD contracts/proofs have actual evidence and complete status labels.
- [x] NaN issue is bridged without weakening input/observation, or precisely reported.
- [x] CSim kernel repairs and tool/model repairs are distinguished; originals retained.
- [x] Full-kernel success cannot be inferred from local proof or native pass.

- [x] c-shim-v2 published; dedicated draft PR available for cross-server coordination.
- [x] Full 40-kernel roadmap and second-server prompt published.
- [x] Live quota query and two-stage threshold tests pass; user timer deployed.
- [ ] VADD complete kernel dependency closure (explicitly pending).
- [ ] Second server started by user with its own credentials and heartbeat.
