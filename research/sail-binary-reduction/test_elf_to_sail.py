"""Check ELF boundary handling; opcode semantics stay with upstream Sail."""
import json
from pathlib import Path
import struct
import tempfile
import unittest

from elf_image import parse
from elf_to_sail import emit

ROOT = Path(__file__).resolve().parent


class ImportTests(unittest.TestCase):
    def test_every_kernel_byte_is_preserved_at_its_linked_address(self):
        source = ROOT / "artifacts/rvv.elf"
        image = parse(source.read_bytes(), 243)
        with tempfile.TemporaryDirectory() as tmp:
            out = Path(tmp) / "Kernel.sail"
            report = emit(source, "test_rvv", out)
            instructions = report["instructions"]
            address, length, _ = image.symbols["test_rvv"]
            self.assertEqual(len(instructions), 19)
            rebuilt = bytearray()
            for inst in instructions:
                self.assertEqual(inst["address"], address + len(rebuilt))
                rebuilt.extend(inst["word"].to_bytes(inst["width"], "little"))
            self.assertEqual(bytes(rebuilt), image.read(address, length))
            self.assertEqual({i["width"] for i in instructions}, {2, 4})
            self.assertEqual(json.loads(out.with_suffix(".json").read_text()), report)

    def test_rejects_long_encoding_instead_of_silently_splitting_it(self):
        data = bytearray((ROOT / "artifacts/rvv.elf").read_bytes())
        image = parse(data, 243)
        address, _, _ = image.symbols["test_rvv"]
        phoff = struct.unpack_from("<Q", data, 32)[0]
        count = struct.unpack_from("<H", data, 56)[0]
        for n in range(count):
            typ, flags, offset, va, pa, size, memsz, align = struct.unpack_from("<IIQQQQQQ", data, phoff + n * 56)
            if typ == 1 and va <= address < va + size:
                data[offset + address - va:offset + address - va + 2] = b"\x1f\x00"
                break
        else:
            self.fail("test fixture lost executable segment")
        with tempfile.TemporaryDirectory() as tmp:
            source = Path(tmp) / "invalid.elf"
            source.write_bytes(data)
            with self.assertRaisesRegex(ValueError, "longer than 32"):
                emit(source, "test_rvv", Path(tmp) / "Invalid.sail")

    def test_rejects_wrong_architecture(self):
        with tempfile.TemporaryDirectory() as tmp:
            with self.assertRaises(ValueError):
                emit(ROOT / "artifacts/neon.elf", "test_neon", Path(tmp) / "Invalid.sail")


if __name__ == "__main__":
    unittest.main()
