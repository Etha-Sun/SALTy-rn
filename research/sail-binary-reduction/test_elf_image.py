"""Adversarial checks of the binary importer, using the actual built ELF files."""
import struct
import unittest
from pathlib import Path
from elf_image import parse

OUT = Path(__file__).resolve().parent / "out/binaries"


class ImportTests(unittest.TestCase):
    def test_real_images_and_bss(self):
        for arch, machine in [("neon", 183), ("rvv", 243)]:
            image = parse((OUT / f"{arch}.elf").read_bytes(), machine)
            address, size, _ = image.symbols["test_" + arch]
            self.assertGreater(len(image.read(address, size)), 0)
            bss = next(s for s in image.segments if s.memory_size > len(s.data))
            self.assertEqual(image.read(bss.address + len(bss.data), bss.memory_size - len(bss.data)),
                             bytes(bss.memory_size - len(bss.data)))
            with self.assertRaises(ValueError):
                image.read(0, 4)

    def test_wrong_architecture_and_file_kind(self):
        raw = (OUT / "rvv.elf").read_bytes()
        with self.assertRaisesRegex(ValueError, "architecture"):
            parse(raw, 183)
        for offset, value in [(4, 1), (5, 2), (16, 1)]:
            bad = bytearray(raw)
            bad[offset] = value
            with self.assertRaises(ValueError):
                parse(bad, 243)

    def test_truncation(self):
        raw = (OUT / "rvv.elf").read_bytes()
        for size in [0, 16, 63, 100, len(raw) - 1]:
            with self.assertRaises(ValueError):
                parse(raw[:size], 243)

    def test_bad_segments(self):
        raw = (OUT / "rvv.elf").read_bytes()
        h = struct.unpack_from("<16sHHIQQQIHHHHHH", raw)
        offsets = [h[5] + i * h[9] for i in range(h[10])
                   if struct.unpack_from("<I", raw, h[5] + i * h[9])[0] == 1]
        first, second = offsets[:2]
        # Removing execute permission must make the entry invalid.
        bad = bytearray(raw)
        struct.pack_into("<I", bad, first + 4, 4)
        with self.assertRaisesRegex(ValueError, "entry"):
            parse(bad, 243)
        # A segment cannot expose more file bytes than memory bytes.
        bad = bytearray(raw)
        struct.pack_into("<Q", bad, first + 40, 0)
        with self.assertRaisesRegex(ValueError, "layout"):
            parse(bad, 243)
        # Equal physical/virtual addresses do not justify overlapping segments.
        bad = bytearray(raw)
        address = struct.unpack_from("<Q", raw, first + 16)[0]
        struct.pack_into("<QQ", bad, second + 16, address, address)
        with self.assertRaises(ValueError):
            parse(bad, 243)


if __name__ == "__main__":
    unittest.main()
