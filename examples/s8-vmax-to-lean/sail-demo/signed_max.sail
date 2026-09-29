/* Educational lane operation, not a complete RVV instruction model.
 * The actual assembly experiment uses the upstream RISC-V ISA model.
 */
default Order dec
$include <prelude.sail>

val signed_max8 : (bits(8), bits(8)) -> bits(8)
function signed_max8(x, threshold) =
  if signed(x) < signed(threshold) then threshold else x

val sample_value : unit -> bits(8)
function sample_value() = signed_max8(0x80, 0xfb) /* max(-128, -5) = -5 */
