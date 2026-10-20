f32-vlrelu：两个候选完整重放及打包canonical均为770/770，现已通过root审计并准入manifest。

neon.c、rvv.c为冻结实现，spec.h为公开规格，harness.c为冻结比较wrapper；唯一证明文件proof.patch。ghost helper位于patch中，无额外proof helper文件。原版本及全部历史失败记录保留在experiments。

固定VLEN=128，RVV e32m8 capacity=32、VL=min(remaining,32)。公开spec允许任意合法size_t长度，输入另有3个float padding，输出不重叠。比较数值相等或两边NaN，不比较正负零位、NaN payload、FP flags或errno；不声称任意VL调度或二进制等价。

当前模型为已冻结native32 Bytes-v6。ISA intrinsic到C shim对应、Frama-C/WP/Qed/strategy、Why3/driver/浮点与内存模型、标准库合同、求解器、ABI和检查器仍为TCB；控制测试不是模型一致性定理，日志保留通用valid_function RTE不支持警告，不能声称穷尽ISO C UB。模型/工具链安装依赖外部缓存，fresh clone未必可直接重放。

打包canonical01：1451.548秒，749个主目标+21条全局引理；36个函数体覆盖、全部private callpre、RTE、frame/assigns、循环/终止与入口exits均实际检查。记录中128路，单目标30秒/1024MiB，cache none；source/model posthash、正常正负控制和host LLVM身份均通过。

原生C补充测试8256组在RNE、ASan/UBSan下通过，仅为有限测试。初次sandbox的LeakSanitizer ptrace环境错误保留，同二进制在host重跑通过，未禁用sanitizer。

重放（需现有外部工具链；此直接入口使用runner默认并行度，128路Gateway profile见experiments/integration-wave2/vlrelu-final-merge/v02-canonical）：

```sh
python3 tools/shim_c_campaign_v4.py verified/f32-vlrelu --frozen-sha256 06c50d51378cb01d23f8547238a54397f35fb99690e3fa191c88fed656bd6f12 --name replay02 --framac /zp_vegeta/scratch_sb/ycsun/verus/build/verified-output-equivalence/experiments/integration-wave2/frama_depth16_progress.py --prover-bin /zp_vegeta/scratch_sb/ycsun/verus/research/agent-qs8-rsum/provers/bin
```
