完整整核检查：main 528/543，全部 global 12/12，总计540/555。剩15项全部在 equivalent，尚未整核验证通过。

对 memory/v08：原4个 signed reinterpret 缺口全部关闭，新增2个 bounded-prefix assigns 全关闭，无回归；剩余集合恰为原 caller15。普通 C/spec/shim/model/driver/checker 不变，sourceguard5740tokens，负控制未证、正控制通过。实际命令par64、depth5、30s/1024MiB。

review.json含逐项raw和baseline对照；不把TIP分支计数589误作原始义务543。
