#include "../caller-qcp/deps/VaddComparator/comparator_def.h"
/*@ Import Coq Require Import FullDomainRvv.FullState FullDomainRvv.MachineDomain FullDomainMemory.OutputFinish FullDomainCaller.FullCallerLogic */
/*@ Extern Coq (machine_capacity : Z -> Z -> Z -> Z -> Z -> Z -> Prop)
 (panel_count : Z -> Z)
 (output_state : Z -> Z -> Z -> Z -> Z -> list fp32 -> list fp32 -> fp32 -> fp32 -> Assertion)
 (completed_values : list fp32 -> list fp32 -> Z -> Z -> Z -> fp32 -> fp32 -> list fp32)
 (FloatArray::undef_seg : Z -> Z -> Z -> Assertion)
 (FloatArray::undef_full : Z -> Z -> Assertion)
 (bit_same : fp32 -> fp32 -> Prop)
 (returned_one : Z -> Prop) */
