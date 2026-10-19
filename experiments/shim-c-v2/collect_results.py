"""Index full frozen campaign replays; never treat lemma-only output as a kernel proof."""
from pathlib import Path
import datetime
import hashlib
import json

ROOT = Path(__file__).resolve().parents[2]
BASE = Path(__file__).resolve().parent
GROUPS = ['frontend-campaign', 'plus-campaign', 'v4-campaign', 'v5-campaign',
          'float-proof-candidates', 'integer-array', 'integer-array-v2',
          'integer-array-v3', 'integer-byte', 'integer-byte-v2', 'complex-array', 'complex-byte', 'complex-byte-v2']
FLOATS = ['f32-vadd', 'f32-vsub', 'f32-vmul', 'f32-vdiv', 'f32-vmulc', 'f32-vmin', 'f32-vmax']
REASONS = {
 'qs8-vadd-minmax': '量化加法的舍入/饱和、输入前缀与参数 frame；Typed 的字节/整字打包缺桥，已增加受限整数 Bytes 完整尝试。',
 'qu8-vadd-minmax': '无符号量化加法的舍入/饱和及前缀/frame；受限整数 Bytes 仍须检查所有函数体。',
 'qs8-vcvt': 'memcpy 打包与 signed/unsigned 字节视图、原输入/参数快照和输出前缀；Cint/Byte 辅助结论成功不替代整核。',
 'qs8-vlrelu': '字节打包、分支定点舍入和内存前缀/frame，已有完整新注释版及整数 Bytes 重验。',
 'qs8-f32-vcvt': '混合 int→float/IEEE 乘法的局部结果、数组写入后的前缀/frame；checked Wp.array 已闭合部分实际 helper。',
 'qu8-f32-vcvt': '混合整数居中/IEEE 乘法、数组前缀及输入 frame；已实际应用数组策略和局部乘法证明。',
 'f32-f16-vcvt': 'float↔uint32 位表示桥及 FP16 NaN/sign/rounding；Typed 不提供所需 bridge，已知不一致的 Bytes+float 禁用。',
 'qs8-vmul-minmax-fp32': 'magic-bias 重量化后的 float↔int32 位重解释和移位/舍入/饱和；Typed 缺 codec，不能借用坏 Bytes+float。',
 'qs8-rdsum': '冻结公共 requires 使用带 lambda 的 \\sum；实际 WP/Why3 出现 unbound variable in of_term，另有 floor/指针地址和循环义务。',
 'qu8-rdsum': '内部行和已改为等义递归 logic（public spec 不变）；仍有 floor 的整数/浮点桥、uintptr 地址/frame 和行前缀。',
 'f32-vsqrt': 'float/uint32 memcpy 位表示桥；标量 bit-search sqrt 还需与 IEEE 正确舍入建立关系；另有前缀/frame。',
 'f32-vlrelu': 'float 符号位提取/重构的 memcpy bridge 及向量前缀；原始浮点 Byte codec 不可用。',
 'f32-vrndne': '取位、magic-number 舍入和符号重构所需 float↔bits bridge；另有前缀/frame。',
 'x32-packw-gemm-goi': 'uintptr 地址/offset、char↔uint32 访问、strided/segmented store 与 packed/padding 布局前缀；纯整数 Bytes 新实验保留全部条件。',
 'x32-transposec': 'uintptr 地址桥、char↔uint32 strided store 与 tile/行列前缀；Bytes tuple 局部成功不能替代整核。',
 'f32-vcmul': 'uintptr 尾部地址与内存前缀/frame；实际非融合 VMLA/VMLS helper 已由 checked 数组策略补证，但整核仍须独立验收。',
 'f32-argmaxpool': 'uintptr 地址、float/uint32 位选择、索引与 strided store；Typed 缺位表示及部分跨类型地址关系。',
 'f32-maxpool': 'uintptr 地址、canonical NaN 的 memcpy 位分类桥、pooling 前缀和内存 frame。',
 'f32-conv-hwc2chw': 'uintptr 地址/布局、NaN 位分类桥及卷积累加前缀；融合与非融合顺序需按原 C 逐步证明。',
 'f32-dwconv2d-chw': 'uintptr 地址/stride、NaN 位分类桥及卷积累加器/frame；仍未闭合。',
 'f32-dwconv-minmax': 'uintptr 地址和 canonical NaN 的位表示桥、通道/像素累加器及 frame；私有 min/max helper 已局部补证。',
 'f32-gemm-minmax': 'packed weights 的 uintptr 地址、NaN 位桥、NC/KC 累加器及输出前缀；尚未建立完整 GEMM 关系。',
 'f32-igemm-minmax': 'indirect input/packed weight 地址、NaN 位桥、嵌套归约和输出 frame；未闭合。',
 'qd8-f32-qc4w-gemm-minmax': '4-bit 权重解包、量化到浮点、packed 地址/布局及 FMA 累加/NaN 位桥；完整证明未闭合。',
 'f32-spmm-minmax': '稀疏索引/uintptr 地址、NaN 位桥、分段行列累加与 frame；未闭合。',
 'f32-raddstoreexpminusmax': 'exp 近似中的整数位构造/float 重解释、IEEE FMA 和归约顺序；该项不依赖 uintptr，主要是位模型和算法关系。',
}
for name in FLOATS:
 REASONS[name] = '修复前端后补全 NaN-aware 逐点关系、输出前缀/内存 frame；最新模块化尝试还需同时闭合两个 kernel body 与 wrapper。'


def sha(path):
 return hashlib.sha256(path.read_bytes()).hexdigest()


def describe(path):
 m = json.loads(path.read_text())
 raw_path = path.with_name(path.name.replace('-summary.json', '.json'))
 rows = json.loads(raw_path.read_text()) if raw_path.exists() else []
 body = [x for x in rows if x.get('function')]
 lemmas = [x for x in rows if x.get('property', '').startswith('lemma_')]
 case = ROOT / m['case']
 frozen = json.loads((case/'frozen.json').read_text())
 model_path = frozen['files'].get('float_model_lock.json', {}).get('path', '')
 qualified = any('/'+name+'/' in model_path for name in
                 ['model-front', 'model-plus', 'model-integer-byte', 'model-integer-byte-v2'])
 return {
  'case': m['case'], 'summary': str(path.relative_to(ROOT)), 'summary_sha256': sha(path),
  'exit': m['exit'], 'seconds': m['seconds'], 'complete': m['complete'] and qualified,
  'recorded_complete': m['complete'], 'qualified_frontend': qualified,
  'budget_exceeded': m['exit'] == 124,
  'body_vcs': {'passed': sum(x['passed'] for x in body), 'total': len(body)} if body else None,
  'global_lemma_vcs': {'passed': sum(x['passed'] for x in lemmas), 'total': len(lemmas)},
  'reported_raw_vcs': m['raw_obligations'],
  'source_guard_passed': m['source_guard']['passed'], 'inputs_unchanged': m['unchanged'],
  'model_inputs_unchanged': m.get('model_inputs_unchanged'),
  'model_control_accepted': m.get('model_control', {}).get('accepted'),
  'model_lock': frozen['files'].get('float_model_lock.json'),
  'frozen_sha256': m['source_guard']['frozen_sha256'],
  'proof_sha256': m['source_guard']['proof'],
  'missing_body_ensures': m.get('missing_body_ensures', []),
  'missing_global_lemmas': m.get('missing_global_lemmas', []),
  'pending': [{'function': x.get('function'), 'property': x['property'],
               'verdict': x['verdict'], 'source': x.get('file'), 'line': x.get('line')}
              for x in m['pending']],
 }


def main():
 # Keep the final agents' detailed diagnoses rather than the earlier broad categories.
 integer = json.loads((BASE/'integer/STATUS.json').read_text())
 REASONS.update({item['name']: item['reason'] for item in integer['items']})
 complex_results = json.loads((BASE/'complex-v3-next/results.json').read_text())
 REASONS.update({name: item['specific_root_cause_zh']
                 for name, item in complex_results.items()})
 names = FLOATS + sorted(json.loads((BASE/'v4-campaign/locked.json').read_text()))
 assert len(names) == len(set(names)) == 33
 attempts = {n: [] for n in names}
 for group in GROUPS:
  for frozen in (BASE/group).glob('*/frozen.json'):
   name = json.loads(frozen.read_text())['name']
   if name not in attempts:
    continue
   for path in (frozen.parent/'logs').glob('*-summary.json'):
    attempts[name].append((path.stat().st_mtime, describe(path)))
 for p in (ROOT/'verified').glob('*-v2/logs/canonical01-summary.json'):
  name = p.parent.parent.name.removesuffix('-v2')
  if name in attempts:
   attempts[name].append((p.stat().st_mtime, describe(p)))
 items = []
 for name in names:
  runs = sorted(attempts[name], key=lambda x: x[0])
  complete = [r for _, r in runs if r['complete']]
  chosen = complete[-1] if complete else runs[-1][1] if runs else None
  items.append({'name': name, 'status': 'proved_under_declared_c_model' if complete else 'not_proved',
                'reason': '完整函体/lemma 和模型/源码冻结检查通过；仍限于声明 C/shim 模型。' if complete else REASONS[name],
                'selected_attempt': chosen, 'attempts': [r for _, r in runs]})
 counts = {'requested': 33, 'proved': sum(x['status']=='proved_under_declared_c_model' for x in items),
           'not_proved': sum(x['status']=='not_proved' for x in items)}
 result = {'generated_utc': datetime.datetime.now(datetime.timezone.utc).isoformat(), 'counts': counts,
           'scope': '7 old quarantined floats plus 26 pending kernels; no C/spec/shim changes this round',
           'snapshot_note': 'Timestamped snapshot; only complete=true means a finished successful full replay.',
           'counterexample_found_this_round': False, 'items': items}
 (BASE/'RESULTS.json').write_text(json.dumps(result, ensure_ascii=False, indent=2)+'\n')
 text = ['本轮33项结果（7项旧浮点隔离 + 26项原未完成）', str(counts),
         '旧版保留；本轮未改kernel/shim/public spec/wrapper。只在新proof和独立模型版本工作。',
         '没有把超时、缺最终raw或仅global lemma通过算整核成功；尚未证明不等于发现反例。', '']
 for item in items:
  a = item['selected_attempt']; count = a['body_vcs'] if a else None
  state = '通过' if item['status']=='proved_under_declared_c_model' else '未通过'
  metric = f"body {count['passed']}/{count['total']}" if count else '无最终body报告'
  text += [f"{item['name']}: {state}; {metric}", item['reason']]
  if a:
   text += ['结果: '+a['summary'], '退出码: '+str(a['exit'])+'; 完整检查: '+str(a['complete'])]
  text += ['']
 text += ['逐条未解VC、文件行号、所有历史/当前full尝试、冻结SHA见RESULTS.json。',
          '复杂13项精细模型/源码审计: complex-v3-next/results.json；整数10项: integer/STATUS.json。',
          '浮点观察为既有数值相等或双方NaN，未证明ISA→C shim；硬件VLEN和VL调度保持原固定配置。',
          '模型修复、禁用配置和TCB: MODEL-AND-TCB.zh-CN.txt。']
 (BASE/'RESULTS.zh-CN.txt').write_text('\n'.join(text)+'\n')
 print(counts)


if __name__ == '__main__':
 main()
