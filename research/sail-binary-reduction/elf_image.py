#!/usr/bin/env python3
"""Import linked ELF64 little-endian images as DATA, without decoding instructions.

Restricted loader: ET_EXEC, static, identity virtual/physical mapping, disjoint
PT_LOAD ranges, no remaining relocations in allocated sections. BSS is recorded
as zero-fill, not copied from the file. No claim that this Python loader is proved.
"""
from __future__ import annotations
import argparse
from dataclasses import dataclass
import hashlib
import json
from pathlib import Path
import struct


@dataclass
class Segment:
    address: int
    memory_size: int
    flags: int
    data: bytes


@dataclass
class Image:
    machine: int
    entry: int
    segments: list[Segment]
    symbols: dict[str, tuple[int, int, int]]
    sha256: str

    def read(self, address: int, size: int) -> bytes:
        for s in self.segments:
            offset = address - s.address
            if 0 <= offset and offset + size <= s.memory_size:
                b = s.data[offset:offset + size]
                return b + bytes(size - len(b))
        raise ValueError(f"unmapped range: {address:#x}+{size}")


def parse(data: bytes, machine: int) -> Image:
    def take(offset, size):
        if offset < 0 or size < 0 or offset + size > len(data):
            raise ValueError("truncated ELF")
        return data[offset:offset + size]

    h = struct.unpack("<16sHHIQQQIHHHHHH", take(0, 64))
    ident, kind, actual, version, entry, phoff, shoff, flags, ehsize, phsize, phnum, shsize, shnum, shstr = h
    if ident[:7] != b"\x7fELF\x02\x01\x01" or version != 1 or kind != 2:
        raise ValueError("requires little-endian ELF64 ET_EXEC")
    if actual != machine or actual not in (183, 243):
        raise ValueError(f"wrong architecture {actual}, expected {machine}")
    if ehsize != 64 or phsize != 56 or shsize != 64 or not phnum or not shnum:
        raise ValueError("unsupported ELF header/table format")
    segments = []
    for n in range(phnum):
        typ, perm, offset, va, pa, filesz, memsz, align = struct.unpack(
            "<IIQQQQQQ", take(phoff + n * phsize, phsize))
        if typ in (2, 3):
            raise ValueError("dynamic/interpreted ELF is unsupported")
        if typ != 1:
            continue
        if va != pa or filesz > memsz or va + memsz > 1 << 64:
            raise ValueError("unsupported PT_LOAD layout")
        if align not in (0, 1) and (align & (align - 1) or va % align != offset % align):
            raise ValueError("invalid PT_LOAD alignment")
        segments.append(Segment(va, memsz, perm, take(offset, filesz)))
    segments.sort(key=lambda s: s.address)
    if not segments or any(a.address + a.memory_size > b.address for a, b in zip(segments, segments[1:])):
        raise ValueError("missing/overlapping PT_LOAD ranges")
    if not any(s.flags & 1 and s.address <= entry < s.address + len(s.data) for s in segments):
        raise ValueError("entry is not backed by executable file bytes")
    sections = [struct.unpack("<IIQQQQIIQQ", take(shoff + n * shsize, shsize)) for n in range(shnum)]
    symbols = {}
    for s in sections:
        _, typ, sf, address, offset, size, link, info, _, entsize = s
        if typ in (4, 9) and size and (sf & 2 or info < shnum and sections[info][2] & 2):
            raise ValueError("unapplied allocated relocations")
        if typ != 2:
            continue
        if entsize != 24 or size % entsize or link >= shnum or sections[link][1] != 3:
            raise ValueError("invalid symbol table")
        strings = take(sections[link][4], sections[link][5])
        for i in range(size // entsize):
            name, si, other, ndx, value, length = struct.unpack("<IBBHQQ", take(offset + 24 * i, 24))
            if not ndx or not name:
                continue
            if name >= len(strings) or b"\0" not in strings[name:]:
                raise ValueError("invalid symbol name")
            symbol = strings[name:strings.index(b"\0", name)].decode("utf-8")
            # ELF local symbols may repeat. Required externally visible symbols may not.
            if si >> 4 == 0:
                continue
            if symbol in symbols:
                raise ValueError(f"duplicate global symbol: {symbol}")
            symbols[symbol] = (value, length, si & 15)
    return Image(actual, entry, segments, symbols, hashlib.sha256(data).hexdigest())


def literal(data):
    lines = [", ".join(f"0x{b:02x}" for b in data[i:i + 16]) for i in range(0, len(data), 16)]
    return "#[\n    " + ",\n    ".join(lines) + "\n  ]"


def emit(elf: Path, symbol: str, architecture: str, out: Path):
    image = parse(elf.read_bytes(), {"neon": 183, "rvv": 243}[architecture])
    if symbol not in image.symbols:
        raise ValueError(f"missing symbol: {symbol}")
    address, size, typ = image.symbols[symbol]
    if typ != 2 or not size:
        raise ValueError("kernel symbol must be a nonempty function")
    if not any(s.flags & 1 and s.address <= address and address + size <= s.address + len(s.data)
               for s in image.segments):
        raise ValueError("kernel is not executable file-backed data")
    kernel = image.read(address, size)
    namespace = "NeonBinary" if architecture == "neon" else "RvvBinary"
    text = ["-- Generated ELF DATA. ISA semantics are a separate dependency.",
            "import BinaryImage", "set_option maxRecDepth 8192", "set_option maxHeartbeats 2000000",
            f"namespace {namespace}", "open BinaryImage",
            f'def elfSha256 : String := "{image.sha256}"',
            f"def kernelAddress : Nat := 0x{address:x}",
            f"def kernelBytes : Array UInt8 := {literal(kernel)}",
            "def image : Image := {", f"  machine := {image.machine}",
            f"  entry := 0x{image.entry:x}", "  segments := #["]
    for i, s in enumerate(image.segments):
        text.append(f"    ⟨0x{s.address:x}, {s.memory_size}, {s.flags}, {literal(s.data)}⟩" +
                    ("," if i + 1 < len(image.segments) else ""))
    text.extend(["  ]", "}", f"end {namespace}", ""])
    out.write_text("\n".join(text))
    manifest = {"elf_sha256": image.sha256, "machine": image.machine,
                "entry": image.entry, "symbol": symbol, "kernel_address": address,
                "kernel_size": size, "kernel_bytes": kernel.hex(),
                "segments": [{"address": s.address, "memory_size": s.memory_size,
                              "file_size": len(s.data), "flags": s.flags} for s in image.segments],
                "semantics": "data-only", "loader_formally_verified": False}
    out.with_suffix(".json").write_text(json.dumps(manifest, indent=2) + "\n")
    return manifest


if __name__ == "__main__":
    p = argparse.ArgumentParser(description=__doc__)
    p.add_argument("elf", type=Path)
    p.add_argument("symbol")
    p.add_argument("architecture", choices=["neon", "rvv"])
    p.add_argument("output", type=Path)
    a = p.parse_args()
    emit(a.elf, a.symbol, a.architecture, a.output)
