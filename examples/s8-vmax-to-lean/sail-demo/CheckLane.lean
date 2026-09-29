import LaneExample

open LaneExample.Functions

-- Execute the code emitted by Sail (signed -5 has byte representation 251).
#eval (sample_value ()).toInt

-- A kernel-checked concrete fact about that generated code.
example : sample_value () = (251 : BitVec 8) := by decide
