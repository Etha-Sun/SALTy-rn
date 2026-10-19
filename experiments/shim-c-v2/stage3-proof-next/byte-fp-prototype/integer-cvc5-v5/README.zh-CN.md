纯整数/BV后端候选，尚未solver验证。固定CVC5 1.2.1与Why3官方cvc5.drv；自定义无axiom原语仅int2bv、bv2nat、concat，不加载prototype FP codec driver。所有导出无fp.to_ieee_bv/FP项，也无标准BV逆公理。2个真实body待证：int64往返与高低32拆分；3负控使用具体错误整数关系及false，实际parse/solver错误不能计负控成功。commands.json给root30秒/2048MB命令。

PureBV是独立Why3类型名字；即便此处native证明成功，也必须显式记录后端/driver依赖，并在原接口类型下重验或构造已审查的定义对应，不能无声把独立命题当旧nativebv.IntRoundtrip64已证明。旧FP CVC5 encoder不兼容状态不变。没有改公共share或旧driver。
