# 原版NaN反例与独立修复

原始impl逐字保留；Keagan来源为be16280c7812a7459c26c3ce82a47339a3d07718。NEON SHA为b8f827cb5936e5333a0144d793e541730bf3e33ca538d46d42c92f86b9751c61，RVV为9ae2f510ae8991e8dc80606edd0fb4595e02d11dcba6ae57974e7b5ef0b2b4b7。

最小模型/native历史反例是mr=nc=K=1（kc=4字节），A首元素0x7fc00000 NaN、其余物理行0；W为8个0 bias与8个1.0权重，lo=-1、hi=1。NEON最终NaN，原RVV为1.0，因此真实数值或双方NaN的比较不等。完整hex输入、输出和历史重放来源保留于[repair.json](repair.json)；旧阶段remaining列表是其历史来源记录，不代表本模型包已经完成C proof。

原因是NEON min/max传播NaN，而RVV minimumNumber/maximumNumber优先选择number。本包不把它们定义成同一个intrinsic，也不排除NaN。独立[repaired/rvv.c](repaired/rvv.c)及[patch](repaired/rvv.patch)补bound自比较、逐lane NaN mask和merge，原target不被覆盖；修复源SHA为b74472bb9b787da06d6f55981cdeb1475e8d7e392250f8c76ca9dff2a1724162。

[IntrinsicModel](proof/coq/GemmSpec/IntrinsicModel.v)实际证明original_clamp_nan_difference；[ClampRepair](proof/coq/GemmRepair/ClampRepair.v)与[Observation](proof/coq/GemmRepair/Observation.v)证明全部fp32下修复数学操作与NEON模型/公开观察相符，本轮都fresh检查。它们不证明原C到这些数学操作的对应，也不证明native硬件/ISA。修复版通过数学模型不算原版kernel成功。
