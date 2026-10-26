From ArgmaxPool Require Import block32_goal rvv_update_into_goal APBlock32CallChecked APBlock32RootChecked RvvUpdateIntoChecked.
Module FullBlock : ArgmaxPool.block32_goal.VC_Correct.
Include ArgmaxPool.APBlock32CallChecked.CheckedAPBlock32Calls.
Include ArgmaxPool.APBlock32RootChecked.CheckedRootBlockStages.
End FullBlock.
Module ActualCallee : ArgmaxPool.rvv_update_into_goal.VC_Correct := ArgmaxPool.RvvUpdateIntoChecked.CheckedRvvUpdateInto.
