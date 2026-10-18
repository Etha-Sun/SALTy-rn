qs8-rsum：单文件普通 C / ACSL 输出等价证明

入口是 proof.c；它包括全部普通 C shim、逻辑定义、ghost 辅助证明、两个
kernel、以及等价性 wrapper。只有标准 C includes，没有本地 proof header。
原始未注释 kernel 在 original/neon.c 和 original/rvv.c，来自 Arcadia-Y /
SALTy-rn 的 verification 分支、提交 4a0627dc72d39de8b8e5c1971bcc23b267e2d4ca。
完整来源、逐组件哈希和模型范围见 provenance.json。

证明什么
  equivalent 的唯一公开功能后置条件是 result == 1；实际返回 neon == rvv。
  两个 kernel 没有导出求和公式作为后置条件。检查命令将它们实际内联进
  wrapper，再验证整个 wrapper；尾部 model_bridge 是需验证的 assert。
  shim 函数和 ghost helper 仍模块化，但最终同一次检查覆盖其全部函数体，
  不能只依赖未验证的合同。没有加入用户 axiom / assume / admit。
  内部证明仍使用 sum8、求和不变量和模整数引理；公开合法域仍用 sum8
  表达“最终 signed int32 加法不溢出”。并非整个规格不含数学模型。

精确范围
  LP64 / x86_64、小端；int32 为32位、size_t为64位。
  RVV VLEN固定128，e8m2/e32m8容量32，e32m1容量4；VL=min(remaining,32)。
  证明适用于任意合法正总输入长度，不是有限 loop-unrolling；不证明任意
  VLEN或全部架构允许的VL调度。
  0 < n <= SIZE_MAX-15；输入 n+15 字节可读；输入与输出不重叠；
  输出有效、params非空；最终 initial+s32(sum8(input,n)) 在int32范围内。
  观察是两个最终int32值相等，未比较机器标志、时间或二进制执行trace。
  NEON固定ARM64分支；非ARM64替代分支未验证。

可复现检查
  需要 Frama-C 33 Arsenic、Why3配置的 Z3 / CVC5 / Alt-Ergo；本包不复制工具。
  本次版本为 Z3 4.12.5、CVC5 1.2.1、Alt-Ergo 2.6.2。
  先审计，再完整验证：

    python3 verified/qs8-rsum/audit.py
    python3 verified/qs8-rsum/check.py --framac /path/to/frama-c \
      --prover-bin /path/to/provers/bin --name replay

  也可以通过 FRAMAC / PROVER_BIN 环境变量指定；未指定时查PATH。
  容器/沙箱必须允许 Why3 的本地 IPC。单目标10秒、两路求解、单进程
  1024MB上限、整次600秒预算、禁用proof cache。没有在预算内完成的
  目标导致脚本失败，不能用退出码0直接判定所有义务通过。
  replay生成独立日志，不覆盖本次保留的 recorded 证据。

  audit.py 校验整个 proof.c 哈希、8个组件的完整文本哈希，仅允许4个
  标准header；strip注释后两份kernel可执行文本须与original完全相同；
  还检查无用户unchecked-assumption语法与唯一公开功能后置条件。
  provenance中的原组件hash来自旧版已证的多文件输入；合并仅去掉
  本地include和最外层header guard，没有修改C/ACSL表达式。
  check.py在开始/结束比较全部证明输入及检查脚本hash；检查每个raw目标，
  并要求33个函数的body ensures全部出现、579个预期目标名字逐一对应。
  源码审计和哈希不是证明检查；最终证据以新鲜WP实际结果为准。

文件规模
  proof.c 710物理行 / 679非空行；其中448行非空ACSL/ghost注释，
  包含规格、不变量、ghost函数体，不是448行纯proof tactic。
  metrics.json记录计数。相对于先前多文件版仅打包，没有减少证明内容。

TCB与限制
  1. 真实 NEON/RVV intrinsic 到普通C shim的对应关系由人工建模，未证明；
     原始kernel可执行文本相同，不等于真实指令语义到C shim已建立形式桥。
  2. C/ACSL前端、预处理、inline转换、WP/Qed、Why3和使用的SMT求解器
     以及其标准库/数学理论属于信任链；本包没有SMT证明证书的独立Coq检查。
  3. WP Typed模型日志仍给出 input 与私有静态onemask_table的不重叠条件。
     RTE不支持的unaligned-pointer检查没有被证明；无间接调用，但工具也
     提示valid_function检查不支持。statement contract被WP跳过，不提供
     隐含数学ensures；实际内联body的断言/循环/RTE依然被逐项验证。
  4. 上述只是这个固定C模型中的输出等价性，不是编译器/ISA/机器码证明；
     历史Sail/Coq的Hload结果属于另一套模型，没有并入本包的已证结论。

本次新鲜完整检查：579/579 raw义务通过，262.409秒；33个函数全部覆盖，
精确目标集合与旧版一致，运行期间proof/检查脚本/provenance/original哈希不变。
证明由Z3/CVC5/Alt-Ergo与WP/Qed完成，未开启proof缓存。

证据：logs/recorded-summary.json、logs/recorded.json、
logs/recorded.log；logs/packing-comparison.json记录8个原组件到单文件的
完整C/ACSL文本转换对照。历史多文件实验和旧版均未改动。
