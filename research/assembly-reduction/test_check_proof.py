"""Checker integration tests use a clearly separate, trivial synthetic contract.
They never create or claim a proof of the real reduction kernel.
"""
import json
from pathlib import Path
import tempfile
import unittest

from check_proof import check
from run import ROOT, command, digest


class CheckerTests(unittest.TestCase):
    def setUp(self):
        self.temp = tempfile.TemporaryDirectory(prefix="assembly-checker-test-")
        self.out = Path(self.temp.name)
        # An isolated theorem True is enough to exercise fresh checking/axioms.
        files = {"Machine.lean": "import Std\n",
                 "Impl.lean": "import Machine\n",
                 "ReductionContract.lean": "import Machine\n",
                 "Spec.lean": "import Impl\nnamespace Kernel\ndef correctnessClaim : Prop := True\nend Kernel\n",
                 "ProofSupport.lean": "import Machine\n"}
        for name, content in files.items():
            (self.out / name).write_text(content)
        import os
        version = command(["lean", "--version"], env={**os.environ,
            "ELAN_TOOLCHAIN": (ROOT / "lean-toolchain").read_text().strip()}).strip()
        task = {"claim": "Kernel.correctnessClaim", "theorem": "Kernel.correctness",
                "lean_version": version, "protected_sha256": {n: digest(self.out / n) for n in files}}
        (self.out / "ProofTask.json").write_text(json.dumps(task))

    def tearDown(self):
        self.temp.cleanup()

    def proof(self, body):
        (self.out / "Proof.lean").write_text("import Spec\nimport ProofSupport\n" + body + "\n")

    def test_absent_is_not_success(self):
        self.assertFalse(check(self.out)["universal_kernel_proof"])

    def test_frozen_change(self):
        (self.out / "Machine.lean").write_text("import Std\n-- changed\n")
        with self.assertRaisesRegex(ValueError, "frozen input changed"):
            check(self.out)

    def test_sorry_rejected(self):
        self.proof("theorem Kernel.correctness : Kernel.correctnessClaim := by sorry")
        with self.assertRaisesRegex(ValueError, "forbidden"):
            check(self.out)

    def test_wrong_target_rejected(self):
        self.proof("theorem Kernel.correctness : 1 = 1 := rfl")
        with self.assertRaisesRegex(ValueError, "Audit.lean"):
            check(self.out)

    def test_actual_kernel_check_of_synthetic_proof(self):
        self.proof("theorem Kernel.correctness : Kernel.correctnessClaim := True.intro")
        result = check(self.out)
        self.assertTrue(result["universal_kernel_proof"])
        self.assertEqual(result["axioms"], [])


if __name__ == "__main__":
    unittest.main()
