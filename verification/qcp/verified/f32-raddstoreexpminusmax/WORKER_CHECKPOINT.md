# Exp 当前恢复点

更新：2026-10-25T22:54:53.416776+00:00。

本案尚未 full 验收，不增加 verified 数量。当前 C、原件、repair.patch、公开 Require/post、全部 FP32/RNE/硬件 VLMAX16、RO/mutable 与 output/sum alias 域均未因证明脚本修复而改变。

## 完整组件

- NEON268：proof/neon-kernel-proof-status.json，359项目源从.v fresh普通全0；严格 primary/second、16组268Print逐源码offset真，13既有依赖，无新公理。
- RVV223：proof/rvv-kernel-proof-status.json（canonical安装后SHA d3048fa68bce7cdcd8cb5746bda3ad2d1e21d224bd9300e716c25c7d79e4fc20）。run module-replay-kup0nrae，42新普通全0、251明确成功对象复用(208字段+43core)，primary/second/223Print真。组件明确非wholefresh。
- 原new209池 re10ehsa 最后119在2035.964s NoApplicable，其他208真0；旧206池 zci_4aul 205真0、同119失败，两池都自然终态，现0active。失败是记录构造器eta/空间归一tactic问题，不是程序反例/资源失败。
- NEW RvvFinalRepair119：完整原119、second、2Print 13.52s真0，proof/rvv-final119-proof-status.json。47纯前提与完整SEP保留，只用Closed eta16及共享Assertion保留，重新包装同16个Floatcells。
- RVV11memory/3Which都有完整ordinary+exacttype/Print，现统一223已覆盖。
- Scalar5、actual public caller6完整typed；native/public-native两san各6192cases/402480lane、共同错输出oracle拒绝真，actual16GiB/swap0。

## Canonical与来源

canonical RVV rawgoal 54a3ab0282f1558251f4b5205b0b23c70484d6cb87e92be771c3bcd67063396a 已逐字安装 proof/coq/rvv_unit_goal.v。
proof/rvv-canonical-promotion.json记录220→223 transitive definition closure93同/127变/+3；不借旧205信用。
旧goal、旧gen/status、失败119源码与日志保留 proof/history/rvv-canonical223-20261025T224334Z。
旧4未消费模板(7/8/69/119)均保留原完整FQ类型并改为真实已证typedalias，没有删除义务。

## 全案候选，未冻结/未运行

完整H候选：.build/full-handoff-qtd53pgl/handoff.json，SHA fa8fb624653e6b599f628c29f304a23c86f7f88b40a72d48468498aa18db477e。
4实际TU：268+223+5+6=502；6 ordinary bodies；40 original intrinsic-spec terminal views；无自定义策略。
671输入pin、586项目源码DAG，预计含17typed/audit及Final共604普通编译，504最终Print(502+2math)。
4当前CPP与raw/manual结构定义descriptor、manual VectorRecords64LE/fp32/Float SHA、approved config原文/flags/SHA都在候选。
完整H未安装，whole未启动。Root明确接手review→freeze/run→issuer/发布。

命令（root负责执行）：
 python3 proof/build_full_handoff.py --freeze
 python3 proof/check_full.py --config /srv/home/yuechunsun/tools/qcp-simple-kernels/.build/simple-kernels-bootstrap/coq-flags.json --jobs 32 --live-jobs 12

新增 --candidate 仅生成私有完整计划，不冻结证书。ordinary编译默认16GiB/7200；H heavy_coq_labels为空；两main QCP32GiB/21600。配置32，actual按共享预算，root可调live-limit。当前只Root可启新whole。

## 静态审阅/负控

rvv-worker-admission/argmax-exp-review.json静态复核3补口后无其他阻碍（不是formalcredit）。
最终metadata-negative-guards-zvxup7_j 19控制全部拒绝，profile-definition-guards-_d8zlkcu22控制全部拒绝；后续candidate/ordinary16G小改的原字节在tool-history/final-candidate-plan。所有历史失败候选均保留。
私有fast120仅26完整字段已验(type/second/52Print)，94未验保留原proof；未采用canonical，dispatcher已退休/0queued，继续hold，不为加速绕过fresh验证。

## 内存紧急记录

emergency-memory-hold.json记录只SIGSTOP父2192629/4126972，没有kill coqc；两次resume JSON记录原7200s检查均未超。两池现自然终态，已无需恢复PID。最新mem恢复，quota由Root30min监控，strict>95停止新批。不要把环境hold当proof失败。
