// Generated from ELF; instruction semantics come from upstream Sail.
// ELF SHA256: 34af16d56742985cb0c8ce864523395d5e5582d80048e81cbce4e637a77a0de9
// Static code, RV64, no fetch faults/interrupts/landing-pad checks.
// A platform must initialize registers and data memory separately.
val kernel_instruction : bits(64) -> option((instruction, range(2, 4)))
function kernel_instruction address = match address {
  0x00000000800001bc => Some((encdec(0x0d307757), 4)),
  0x00000000800001c0 => Some((encdec(0x5e003457), 4)),
  0x00000000800001c4 => Some((encdec_compressed(0xcd01), 2)),
  0x00000000800001c6 => Some((encdec(0x093577d7), 4)),
  0x00000000800001ca => Some((encdec(0x02058107), 4)),
  0x00000000800001ce => Some((encdec_compressed(0x8d1d), 2)),
  0x00000000800001d0 => Some((encdec_compressed(0x95be), 2)),
  0x00000000800001d2 => Some((encdec(0x4a222857), 4)),
  0x00000000800001d6 => Some((encdec(0x02880457), 4)),
  0x00000000800001da => Some((encdec_compressed(0xf575), 2)),
  0x00000000800001dc => Some((encdec(0x0d0077d7), 4)),
  0x00000000800001e0 => Some((encdec(0x5e0030d7), 4)),
  0x00000000800001e4 => Some((encdec(0x0d307757), 4)),
  0x00000000800001e8 => Some((encdec_compressed(0x4214), 2)),
  0x00000000800001ea => Some((encdec(0x0280a457), 4)),
  0x00000000800001ee => Some((encdec(0x428027d7), 4)),
  0x00000000800001f2 => Some((encdec_compressed(0x9fb5), 2)),
  0x00000000800001f4 => Some((encdec_compressed(0xc21c), 2)),
  0x00000000800001f6 => Some((encdec_compressed(0x8082), 2)),
  _ => None(),
}

// Execute one instruction and commit PC only on successful retirement.
// None means PC is outside the imported instruction boundaries.
// A leaf function returns by setting PC to the caller's return sentinel.
val kernel_step : unit -> option(ExecutionResult)
function kernel_step () = match kernel_instruction(zero_extend(PC)) {
  None() => None(),
  Some((ins, width)) => {
    nextPC = PC + to_bits(sizeof(xlen), width);
    let result = if width == 2 & not(currentlyEnabled(Ext_Zca)) then
      Illegal_Instruction()
    else match execute(ins) {
      ExecuteAs(expanded) => execute(expanded),
      other_result => other_result,
    };
    match result {
      Retire_Success() => PC = nextPC,
      _ => (),
    };
    Some(result)
  },
}
