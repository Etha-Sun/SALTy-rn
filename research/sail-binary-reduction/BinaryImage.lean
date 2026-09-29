import Std

namespace BinaryImage

/-- PT_LOAD data, including memory permissions and implicit BSS zero-fill. -/
structure Segment where
  address : Nat
  memorySize : Nat
  flags : Nat
  bytes : Array UInt8

structure Image where
  machine : Nat
  entry : Nat
  segments : Array Segment

/-- Initial image bytes only. A real execution also needs stack, arguments,
    input/output memory, architectural state and an ISA memory adapter. -/
def Image.byteAt (image : Image) (address : Nat) : Option UInt8 := do
  let segment ← image.segments.find? fun s =>
    s.address ≤ address && address < s.address + s.memorySize
  return segment.bytes[address - segment.address]?.getD 0

end BinaryImage
