Here are some quick checks about the current results:

- Reward hacking: Does it prove `true = true` or use unauthorized axioms? I ran `Print Assumptions`, which returned “Closed under the global context,” and checked that there are no `Admitted` or added axioms.
- About `neon_program_correct`: It’s already a proved claim. We just rewrite its postcondition to match the shared spec.
- About `vl = 0`: First, the `vle8.v` proof allows `vl = 0` and proves `Mem′ = Mem ∧ PC′ = PC + 4`. Second, our kernel proof rules out `vl = 0` at the load instruction: `vsetvli` selects `vl > 0` when the remaining input length is positive.
