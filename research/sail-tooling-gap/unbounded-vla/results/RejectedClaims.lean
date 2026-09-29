import Memory

set_option autoImplicit false
namespace UnboundedVLA

def signedMin (x t : BitVec 8) : BitVec 8 := BitVec.ofInt 8 (min x.toInt t.toInt)
def unsignedMax (x t : BitVec 8) : BitVec 8 := if x.toNat < t.toNat then t else x

theorem wrong_opcode_witness :
    writeChunk (fun x => signedMax x 1) 0 64 16 (fun _ => 0) 64 =
    writeChunk (fun x => signedMin x 1) 0 64 16 (fun _ => 0) 64 := by decide

theorem wrong_signedness_witness :
    writeChunk (fun x => signedMax x 1) 0 64 16 (fun _ => 255) 64 =
    writeChunk (fun x => unsignedMax x 1) 0 64 16 (fun _ => 255) 64 := by decide

theorem missing_last_byte_witness :
    writeChunk (fun x => signedMax x 1) 0 64 16 (fun _ => 0) 79 =
    writeChunk (fun x => rvvLane x 1) 0 64 15 (fun _ => 0) 79 := by decide

theorem overlap_witness :
    executeBlocks (fun x => signedMax x 128) 0 1 0 [16, 16] ramp 17 =
    executeBlocks (fun x => rvvLane x 128) 0 1 0 [32] ramp 17 := by decide

#print axioms wrong_opcode_witness
#print axioms wrong_signedness_witness
#print axioms missing_last_byte_witness
#print axioms overlap_witness
end UnboundedVLA
