#!/usr/bin/env python3
"""Pin the 40 upstream kernel pairs; lexical SIMD demand is not proof coverage."""
import argparse
from collections import Counter, defaultdict
import hashlib
import json
from pathlib import Path
import re
import subprocess

ROOT = Path(__file__).resolve().parents[3]
OUT = ROOT / 'verification/qcp'
BASE = 'be16280c7812a7459c26c3ce82a47339a3d07718'
NEW = {'qd8-f32-qc8w-gemm-minmax', 'qd8-f32-qc8w-igemm-minmax',
       'qs8-qc8w-gemm-minmax-fp32', 'u8-vclamp'}
FAMILIES = {
    'binary-f32': ('逐元素浮点二元/常量', '数组分解/拼接、tail padding、NaN/零；min/max需保持各ISA不同语义'),
    'unary-f32': ('逐元素浮点一元', 'sqrt/round/符号判定及位表示桥；不能排除NaN以简化证明'),
    'complex-f32': ('复数逐元素', '交错布局、复数乘法次序、尾部地址'),
    'conversion': ('数据转换', 'signed/unsigned扩展、IEEE舍入、FP16编码与特殊值'),
    'integer-reduction': ('整数归约', '整数wrap、分组归约、多行stride与前缀和不变量'),
    'integer-clamp': ('整数截断', 'signed/unsigned min/max与tail读写'),
    'quantized-elementwise': ('量化逐元素', '饱和、移位编码、VXRM、窄化、magic-bias和参数合法域'),
    'pooling': ('池化/索引', '间接指针表、NaN、argmax并列选择、有效窗口与输出索引'),
    'matrix-convolution': ('矩阵/卷积', 'packed/indirect/sparse布局、FMA精确次序、嵌套循环与边界mask'),
    'float-reduction-exp': ('浮点归约/指数', 'exp位算法、精确归约树、单次舍入与累加顺序'),
    'layout': ('排列/打包', 'segment/strided访问、tuple、二维置换和输出有效区域'),
}


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def family(name):
    if name in {'f32-vadd', 'f32-vsub', 'f32-vmul', 'f32-vdiv', 'f32-vmin', 'f32-vmax', 'f32-vmulc'}:
        return 'binary-f32'
    if name in {'f32-vsqrt', 'f32-vrndne', 'f32-vlrelu'}:
        return 'unary-f32'
    if name == 'f32-vcmul': return 'complex-f32'
    if name in {'f32-f16-vcvt', 'qs8-f32-vcvt', 'qu8-f32-vcvt'}: return 'conversion'
    if name.endswith(('rsum', 'rdsum')): return 'integer-reduction'
    if name.endswith('vclamp'): return 'integer-clamp'
    if name.startswith(('qs8-v', 'qu8-v')): return 'quantized-elementwise'
    if 'pool' in name: return 'pooling'
    if name.startswith('x32-'): return 'layout'
    if name == 'f32-raddstoreexpminusmax': return 'float-reduction-exp'
    if any(s in name for s in ('gemm', 'conv', 'spmm')): return 'matrix-convolution'
    raise ValueError(f'unclassified kernel: {name}')


def intrinsics(path):
    # All preprocessor branches intentionally retained: a conservative demand list.
    code = re.sub(r'/\*.*?\*/|//[^\n]*|"(?:\\.|[^"\\])*"', ' ', path.read_text(), flags=re.S)
    return sorted(set(re.findall(r'\b(__riscv_\w+|v[a-zA-Z0-9]+_[a-zA-Z0-9_]+)\s*\(', code)))


def demand(name):
    if 'vsetvl' in name: return 'VL调度与容量'
    if re.search(r'v(?:ld|st|le\d|se\d|lse|sse|lsseg|ssseg|sseg|lseg)', name): return '内存load/store及lane范围'
    if any(s in name for s in ('reinterpret', 'vreinterpret')): return '位重解释/表示桥'
    if any(s in name for s in ('fmacc', 'fmadd', 'fnm', 'vfma', 'vfms')): return 'FMA/融合次序'
    if any(s in name for s in ('cvt', 'convert', 'vfwcvt', 'vfncvt')): return '数值转换/舍入'
    if any(s in name for s in ('clip', 'vq', 'qr', 'sh', 'sr', 'sll', 'narrow')): return '移位/饱和/窄化'
    if any(s in name for s in ('red', 'addv', 'padd', 'padal', 'dot')): return '归约/dot顺序'
    if any(s in name for s in ('merge', 'bsl', 'cgt', 'clt', 'ceq', 'cge', 'cle', 'vmf', 'vms', 'vmand')): return '比较/mask/选择'
    if any(s in name for s in ('get', 'set', 'zip', 'uzp', 'trn', 'ext', 'slide', 'combine', 'dup', 'mov', 'vmv', 'vid')): return 'lane排列/广播/扩展'
    if '_f32' in name or '_f16' in name: return '浮点算术/minmax/sqrt'
    return '整数算术/位运算'


def pairs():
    sources = {p.stem: p for p in (ROOT / 'kernels/source').glob('*.c')}
    targets = {p.stem: p for p in (ROOT / 'kernels/target').glob('*.c')}
    if len(sources) != 40 or sources.keys() != targets.keys():
        raise ValueError(f'expected 40 exact pairs, got source={len(sources)}, target={len(targets)}')
    result = []
    for name, src in sorted(sources.items()):
        dst = targets[name]
        if not src.stat().st_size or not dst.stat().st_size: raise ValueError(f'empty kernel: {name}')
        for path in (src, dst):
            pinned = subprocess.check_output(['git', 'show', f'{BASE}:{path.relative_to(ROOT)}'], cwd=ROOT)
            if hashlib.sha256(pinned).hexdigest() != sha(path):
                raise ValueError(f'upstream source drift: {path.relative_to(ROOT)}')
        sets = {'neon': intrinsics(src), 'rvv': intrinsics(dst)}
        f = family(name)
        result.append({'name': name, 'family': f, 'difficulty': FAMILIES[f][1],
                       'upstream_added_target': name in NEW,
                       'files': {side: {'path': str(p.relative_to(ROOT)), 'sha256': sha(p), 'bytes': p.stat().st_size}
                                 for side, p in [('neon', src), ('rvv', dst)]},
                       'intrinsics': sets,
                       'shared_capabilities': sorted({demand(i) for v in sets.values() for i in v})})
    return result


def add_reference(entries, ref):
    manifest = json.loads((ref / 'verified/manifest.json').read_text())
    programs = {p['name']: p for p in manifest['programs']}
    repairs = {p['kernel']: p for p in json.loads((ref / 'experiments/shared-extension/results.json').read_text())['entries']}
    for e in entries:
        p, repair = programs.get(e['name']), repairs.get(e['name'], {})
        history = {'whole_kernel_status': p['status'] if p else 'not_admitted_in_current_manifest',
                   'evidence_is_historical_not_qcp': True,
                   'target_repair': repair.get('target_repair'),
                   'repair_source': 'experiments/shared-extension/results.json' if repair.get('target_repair') else None}
        if repair.get('target_repair'):
            history['repair_candidates'] = [
                {'path': str(Path(d) / 'rvv.c'), 'sha256': sha(ref / d / 'rvv.c'),
                 'matches_upstream_bytes': sha(ref / d / 'rvv.c') == e['files']['rvv']['sha256']}
                for d in repair.get('candidate_directories', []) if (ref / d / 'rvv.c').is_file()]
        if e['name'] == 'f32-gemm-minmax':
            history.update(target_repair='NaN clamp restoration; earlier repair, not admitted', repair_source='experiments/gemm-repair/README.zh-CN.txt')
        if e['name'] == 'f32-conv-hwc2chw':
            history['later_repair'] = {'description': 'odd right edge: skip masked 0*Inf FMA, preserve accumulator',
                                       'source': 'experiments/codex-kernel-wave1/WAVE2-REVIEW.zh-CN.md'}
        if e['name'] == 'u8-vclamp':
            history['implementation_note'] = 'CSim supplied its own missing-target implementation; different from the new upstream target.'
        if p:
            case = Path('verified') / Path(p['proof_file']).parent
            history['case'] = str(case)
            history['raw_obligations'] = p['raw_obligations']
            history['source_identity'] = {side: {'path': str(case / file), 'sha256': sha(ref / case / file),
                                               'matches_upstream_bytes': sha(ref / case / file) == e['files'][side]['sha256']}
                                          for side, file in [('neon', 'neon.c'), ('rvv', 'rvv.c')]}
        e['csim_reference'] = history
        e['qcp'] = {'whole_kernel_proved': False,
                    'status': 'pilot_body_proof_in_progress' if e['name'] == 'f32-vadd' else 'inventoried_not_verified',
                    'status_scope': 'original bodies + mapper + actual intrinsic bodies + comparator dependency closure'}
    evidence = ['verified/manifest.json', 'docs/shared-shim/HANDOFF.zh-CN.md',
                'experiments/codex-kernel-wave1/CHECKPOINT.zh-CN.txt',
                'experiments/integration-wave2/CHECKPOINT.zh-CN.md',
                'experiments/shared-extension/results.json', 'docs/shared-shim/EXTENSION-RESULTS.zh-CN.txt',
                'experiments/shim-c-v2/MODEL-AND-TCB.zh-CN.txt',
                'experiments/codex-kernel-wave1/WAVE2-REVIEW.zh-CN.md']
    return {'git_head': subprocess.check_output(['git', 'rev-parse', 'HEAD'], cwd=ref, text=True).strip(),
            'manifest_program_count': len(programs), 'quarantined_program_count': len(manifest['quarantined_programs']),
            'read_only_reference': str(ref), 'evidence': [{'path': p, 'sha256': sha(ref / p)} for p in evidence],
            'note': 'Latest manifest/integration supersede older handoff and wave1 counts; no historical proof replayed.'}


def write_docs(catalog):
    entries = catalog['kernels']
    counts = Counter(e['family'] for e in entries)
    lines = ['# 40 kernel 清单与共享 SIMD 需求', '',
             f'基线为 Keegan 上游 `{BASE}`。仅扫描 `kernels/source/*.c` 与 `kernels/target/*.c`：**40 对、80 个非空文件**。不是新增四个 kernel 名称：40 个 source 已存在，本次补齐了四个 target。', '',
             '新四项：`qd8-f32-qc8w-gemm-minmax`、`qd8-f32-qc8w-igemm-minmax`、`qs8-qc8w-gemm-minmax-fp32`、`u8-vclamp`。当前 QCP 完整 kernel 证明为 **0/40**；vadd 正在搭建与证明共享支持。清单收录不表示有可运行 mapper/spec 或已经生成/关闭 VC。', '',
             '逐文件完整 SHA、两侧 intrinsic 名称、CSim 修复来源和历史证据在 `../catalog.json`。intrinsic 提取是去注释后的词法调用集合，保留所有预处理分支；属于保守需求清单，不是已选宏环境的调用闭包，更不是 ISA 语义证明。', '',
             '## 能力矩阵', '', '| 接口族 | 数量 | 主要内部义务 |', '|---|---:|---|']
    lines += [f'| {FAMILIES[f][0]} (`{f}`) | {counts[f]} | {FAMILIES[f][1]} |' for f in FAMILIES]
    all_i = {side: {i for e in entries for i in e['intrinsics'][side]} for side in ('neon', 'rvv')}
    lines += ['', f'词法独立 API：NEON **{len(all_i["neon"])}**、RVV **{len(all_i["rvv"])}**，共 **{len(all_i["neon"] | all_i["rvv"])}**。按以下功能安排公共库；分类仅供实现计划，不宣称覆盖正式 intrinsic 规范。', '', '| 公共模块需求 | 不同 API 数 | 涉及 kernel 数 |', '|---|---:|---:|']
    needs = defaultdict(set)
    for i in all_i['neon'] | all_i['rvv']: needs[demand(i)].add(i)
    lines += [f'| {n} | {len(v)} | {sum(n in e["shared_capabilities"] for e in entries)} |' for n, v in sorted(needs.items())]
    lines += ['', '## 逐项状态', '', '| Kernel | 接口族 | NEON/RVV API | 上游新 target | CSim 历史 manifest | QCP 整核 |', '|---|---|---:|---|---|---|']
    for e in entries:
        h = e['csim_reference']
        hist = '已收录（历史）' if h.get('case') else '未收录'
        if h.get('target_repair'): hist += '；有独立修复'
        lines.append(f'| {e["name"]} | {e["family"]} | {len(e["intrinsics"]["neon"])}/{len(e["intrinsics"]["rvv"])} | {"是" if e["upstream_added_target"] else ""} | {hist} | 未完成 |')
    lines += ['', '## 接入与验收规则', '',
              '1. 人类审查原始两侧函数、接口配置、`spec.h` 和 `mapper.c`；共享 intrinsic/内存/浮点模型另作一次版本审查，不从逐 kernel 审查中隐去。',
              '2. 公开 post 保持 `equivalent` 返回 1；整数/浮点/索引输出使用明确 observation 模板。内部模型和循环不变量可以复杂，但必须关闭其自身 VC。',
              '3. 先完成 vadd 的 load/add/store/VL/half-lane 与数组前缀桥，再复用到其它 binary-f32；min/max 必须单独审查原版语义差异。然后推进整数 clamp/reduction/conversion；布局、量化、矩阵族各补模板。',
              '4. 将原始、修复候选分别固定版本。发现 CSim 已知反例时先重放原版与修复版；禁止让 shim 改变原 intrinsic 语义来掩盖差异。',
              '5. `python3 verification/qcp/tools/inventory.py --check` 检查40配对、当前文件与已固定上游commit、catalog SHA/词法清单；不会运行40个证明。',
              '6. 若只写 intrinsic 契约，消费者通过仍是条件性结果；只有实际实现、调用前件、helper、mapper、wrapper依赖闭包均检查，才能标成整核通过。ISA→C shim 另列义务。', '']
    (OUT / 'docs/INVENTORY.zh-CN.md').write_text('\n'.join(lines))


def main():
    parser = argparse.ArgumentParser(description=__doc__)
    parser.add_argument('--check', action='store_true')
    parser.add_argument('--csim-reference', type=Path, default=ROOT.parent / 'verified-output-equivalence')
    args = parser.parse_args()
    entries = pairs()
    if args.check:
        saved = json.loads((OUT / 'catalog.json').read_text())
        if saved['upstream_commit'] != BASE or len(saved['kernels']) != 40: raise ValueError('catalog base/count mismatch')
        for actual, pinned in zip(entries, saved['kernels']):
            for key, val in actual.items():
                if pinned.get(key) != val: raise ValueError(f'catalog drift: {actual["name"]}:{key}')
        print(json.dumps({'passed': True, 'pairs': 40, 'files': 80, 'new_targets': sorted(NEW),
                          'proofs_executed': 0, 'upstream_commit': BASE}, indent=2))
        return
    ref = args.csim_reference.resolve()
    provenance = add_reference(entries, ref)
    data = {'schema': 1, 'upstream_repository': 'keaganchern/SALTy-rn', 'upstream_commit': BASE,
            'kernel_count': 40, 'intrinsic_extraction': 'lexical all branches, comments/strings excluded; not call-closure proof',
            'csim_reference': provenance, 'kernels': entries}
    (OUT / 'catalog.json').write_text(json.dumps(data, ensure_ascii=False, indent=2) + '\n')
    write_docs(data)
    print(f'Wrote 40 pairs; historical CSim manifest has {provenance["manifest_program_count"]} entries; QCP full proof 0/40.')


if __name__ == '__main__':
    main()
