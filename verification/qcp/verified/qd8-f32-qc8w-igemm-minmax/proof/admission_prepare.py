"""Full admission unit registry; actual source preparation remains token-bound."""
from prepare import ROOT,prepare,contract as kernel_contract
UNITS={
 'neon':{'base':'neon','namespace':'IGemmNeon','expected':'proof/coq/IGemmNeon/neon_goal.v','fields':580},
 'rvv':{'base':'rvv','namespace':'IGemmRvv','expected':'proof/coq/IGemmRvv/rvv_goal.v','fields':719},
 'caller':{'base':'caller','namespace':'IGemmCaller','expected':'proof/coq/IGemmCaller/caller_goal.v','fields':40},
 'scalar_nan':{'base':'abi_probe','namespace':'Qd8RvvGoals','expected':'proof/coq/Qd8Nan/abi_probe_goal.v','fields':9},
 'neon_basic':{'base':'primitive','namespace':'Qd8Primitive','expected':'proof/coq/Qd8Primitive/primitive_goal.v','fields':22},
 'indirection':{'base':'indirection','namespace':'Qd8Indirect','expected':'proof/coq/Qd8Indirect/indirection_goal.v','fields':11,'strategy_namespace':'Qd8Indirect'},
}
def source(unit):
 if unit in ('neon','rvv'):return prepare(unit)
 if unit=='caller':return (ROOT/'spec.c').read_text()
 return '#include "shim/'+{'scalar_nan':'scalar_nan.c','neon_basic':'neon-basic.c','indirection':'indirection.c'}[unit]+'"\n'
