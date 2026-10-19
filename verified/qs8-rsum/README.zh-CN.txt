qs8-rsum：实现、公共规格分开，证明材料集中一个标准补丁

当前结构
  neon.c / rvv.c：两份干净原始实现，与 original/ 中对应文件逐字一致。
  shim.h / shim.c：普通C类型、原型和intrinsic的普通C实现；没有ACSL证明注释。
  harness.c：给相同输入/输出初值运行两份kernel，返回最终输出是否相等。
  spec.h：固定的公共合法域、u32/s32/sum8定义、调用合同和输出相等后置条件。
  proof.patch：唯一证明材料文件，标准unified diff，包含19个shim的合同、
    内部逻辑定义、13个ghost helper、循环不变量、ghost变量和证明断言。
    补丁不改公共spec，不改普通C语义；#line恢复assert的原始文件/行号。
  build.py / audit.py / check.py：构建附注副本、审计分离、完整WP检查。
  frozen.json：冻结6个实现/规格文件，摘要另外硬编码在build.py；没有从当前
    proof重新生成基线的命令。修改proof不能更新此清单来掩盖实现/规格变化。

Frama-C WP仍需读取带注解的实际C。build.py只在.build/NAME/生成plain和
annotated副本，并用GNU patch --fuzz=0应用proof.patch，仓库的干净实现和
spec保持原样。这里没有新增语义DSL。官方ACSL Importer可导入合同和若干
语句注解；本例包含ghost局部变量/完整ghost函数体，其原生Importer迁移尚未
实现，因此本包沿用标准C/ACSL附注副本，不据此声称Importer不支持任何ghost。

证明范围
  equivalent唯一公开功能后置条件是result==1；返回表达式是neon==rvv。
  kernel没有数学结果post。内联其实际body验证wrapper，model_bridge是待证
  assert。shim与helper的合同仅在其所有body也闭合后才能作为完整结果使用。
  内部仍使用求和/模运算模型，公共requires也用sum8表达无signed-overflow条件。
  所以“功能post只有输出相等”不等于“整个规格和证明没有数学模型”。

  源自Arcadia-Y/SALTy-rn verification提交
  4a0627dc72d39de8b8e5c1971bcc23b267e2d4ca，来源与哈希见provenance.json。
  LP64 / x86_64、小端；VLEN固定128，e8m2/e32m8容量32、e32m1容量4；
  VL=min(remaining,32)。任意合法正总长度，不是有限loop-unrolling；
  不证明其他VLEN或所有架构允许的VL调度。NEON固定ARM64分支。
  0<n<=SIZE_MAX-15，输入n+15字节可读，输出有效，params非空，输入/输出
  不重叠，initial+s32(sum8(input,n))在int32范围内。
  观察只有最终int32输出，不包括机器标志、trace或编译后机器码。

守卫与复现
  需要Frama-C33 Arsenic、Clang14、GNU patch、Z3 4.12.5 / CVC5 1.2.1 /
  Alt-Ergo2.6.2。本包不复制工具，根目录tools提供安装/环境说明。

    python3 verified/qs8-rsum/build.py --name replay
    python3 verified/qs8-rsum/audit.py --name audit
    python3 verified/qs8-rsum/check.py --framac /path/to/frama-c \
      --prover-bin /path/to/provers/bin --name separated-replay

  FRAMAC/PROVER_BIN可替代对应参数，--clang可指定Clang路径。
  沙箱需允许Why3本地IPC；本主机filesystem沙箱也会拒绝GNU patch保留
  文件owner的系统调用，正常host执行可通过。该环境失败不是证明失败。
  单目标10秒，两路求解，1024MB内存限制，整次600秒，禁用proof cache。

  守卫先校验冻结impl/spec及固定manifest摘要，禁止patch触碰spec.h。
  只允许已知文件；公共函数不能通过proof额外注入requires/ensures等合同。
  另比较去注释/#line后的当前C子集token，包括inactive分支与多字符operator；
  最后用Clang真实预处理器对全部active C token的kind+spelling逐项比较，
  包括assert展开的__FILE__/__LINE__。并非简单删除空白后比较字符串。
  独立LLVM检查由tools/check_llvm_identity.py执行；logs/llvm-identity.json
  记录本例两侧LLVM IR字节完全相同及llvm-diff结果。这不是通用程序等价器。

  token/IR相等只证明编译C没变，不能单独证明ghost无干扰。此例ghost局部
  变量只存快照/计数，ghost循环只改ghost局部变量；13个helper的assigns
  nothing均须由完整WP检查。Frama33有基础ghost写普通变量检查，但官方
  实现不保证自动完成全部ghost non-interference验证，仍需独立ghost审计。

证据与历史
  当前分离结构fresh完整WP：579/579 raw义务通过，261.765秒；
  33个函数body ensures无遗漏，精确目标集合与历史一致；源输入与生成
  注解副本在运行期间哈希均不变，未使用proof cache。
  结果用logs/separated-summary.json、logs/separated.json和logs/separated.log，
  目标须与历史579项精确对应，33个函数body ensures无遗漏。检查期间冻结
  源码、spec、proof、脚本及生成文件均比较哈希；仅退出码0不足以算成功。
  metrics.json区分实现/spec行数、proof.patch行数和ACSL注释行数。当前
  proof.patch为688物理行，含52个#line及diff上下文；生成副本中除冻结
  spec之外的证明注释416非空行，公共spec注释34非空行。合计450比旧版
  448多两个分组边界行，数学内容/证明目标未增加，不能混同纯proof语句数。
  logs/recorded*是先前710行单文件版的历史检查，不代表当前结构新验证。
  旧proof.c可从Git 3b31101/570a7c5恢复，当前目录不保留第二份proof.c。

TCB与边界
  真实ISA intrinsic→普通C shim的形式对应尚未证明；原kernel逐字相同
  不能解除此边界。C/ACSL前端、预处理/inline、WP/Qed、Why3、SMT及其
  标准理论是信任链；没有SMT证书的独立Coq检查。
  Typed模型仍要求input与私有静态onemask_table分离；不支持的aligned
  pointer检查没有被证明。无间接调用，工具亦提示valid_function不支持。
  statement contract被WP跳过，没有隐藏数学ensures；实际内联body的
  断言/循环/RTE仍需全量通过。历史Sail/Coq的Hload结果未混入本结论。
