"""Stage one independently checked integer package for a fresh canonical replay."""
import argparse
import hashlib
import json
from pathlib import Path
import shutil

ROOT = Path(__file__).resolve().parents[2]
p = argparse.ArgumentParser(description=__doc__)
p.add_argument('candidate', type=Path)
args = p.parse_args()
source = (ROOT / args.candidate).resolve()
assert source.is_relative_to(ROOT / 'experiments/codex-kernel-wave1')
data = json.loads((source / 'frozen.json').read_text())
assert data['name'] in {'qs8-vcvt', 'qs8-vlrelu'}
sha = lambda path: hashlib.sha256(path.read_bytes()).hexdigest()
for name in ('full01', 'root-independent01'):
    result = json.loads((source / 'logs' / (name + '-summary.json')).read_text())
    assert result['complete'] and result['model_control']['accepted'], name
    assert not result['pending'] and not result['missing_body_ensures'] and not result['missing_global_lemmas']
    assert result['source_guard']['frozen_sha256'] == sha(source / 'frozen.json')
    assert result['unchanged'] and result['model_inputs_unchanged'] and result['source_guard']['passed']
    assert result['source_guard']['proof'] == {str((source / 'proof.patch').relative_to(ROOT)): sha(source / 'proof.patch')}
    rows = json.loads((source / 'logs' / (name + '.json')).read_text())
    assert rows and all(row['passed'] for row in rows)
    assert result['raw_obligations'] == {'passed': len(rows), 'total': len(rows)}
    assert not any(flag in result['actual_command'] for flag in ('-wp-fct', '-wp-prop', '-wp-skip-fct'))
    assert 'Memory model hypotheses' not in (source / 'logs' / (name + '.log')).read_text()
for item in data['files'].values():
    assert sha(ROOT / item['path']) == item['sha256'], item['path']
model_dir = ROOT / Path(data['files']['float_model_lock.json']['path']).parent
assert model_dir.name == 'model-integer-byte-v4-no-pointer-range', 'Old inconsistent range model is blocked'
qualification = json.loads((ROOT / 'experiments/codex-kernel-wave1/audit/integer-v4-root-independent01/qualification-results.json').read_text())
assert qualification['all_accepted'] and qualification['model_lock_sha256'] == sha(model_dir / 'model_lock.json')
destination = ROOT / 'verified' / (data['name'] + '-bytes-v4')
assert not destination.exists(), 'Preserve existing packages'
origin = json.loads(json.dumps(data['files']))
original_dir = (ROOT / origin['neon.c']['path']).parent / 'original'
assert all((original_dir / name).is_file() for name in ('neon.c', 'rvv.c'))
originals_equal = {name: (original_dir / name).read_bytes() == (ROOT / origin[name]['path']).read_bytes()
                   for name in ('neon.c', 'rvv.c')}
assert originals_equal['neon.c']
assert originals_equal['rvv.c'] == (data['name'] == 'qs8-vlrelu')
destination.mkdir()
for name, item in data['files'].items():
    if Path(name).suffix in {'.c', '.h'} or name == 'interface.json':
        shutil.copyfile(ROOT / item['path'], destination / name)
        item['path'] = str((destination / name).relative_to(ROOT))
shutil.copyfile(source / 'proof.patch', destination / 'proof.patch')
data['proof_patches'] = [str((destination / 'proof.patch').relative_to(ROOT))]
data['candidate_source'] = str(source.relative_to(ROOT))
data['origin'] = ('NEON original unchanged. RVV original preserved separately; '
                  + ('current RVV is byte-identical to original.' if originals_equal['rvv.c'] else
                     'current RVV is the pre-existing independently frozen vnclip15 repair; see repair-witness-results.json.'))
(destination / 'frozen.json').write_text(json.dumps(data, indent=2) + '\n')
shutil.copytree(original_dir, destination / 'original')
if not originals_equal['rvv.c']:
    shutil.copyfile(original_dir.parent.parent / 'witness-results.json', destination / 'repair-witness-results.json')
provenance = {'candidate': str(source.relative_to(ROOT)), 'candidate_manifest_sha256': sha(source / 'frozen.json'),
              'original_frozen_files': origin, 'ordinary_C_and_public_spec_unchanged_from_frozen_baseline': True,
              'original_kernel_byte_identity': originals_equal, 'proof_helper_files': [], 'canonical_admitted': False,
              'tooling_note': 'Retains reviewed runner paths; integer-v4 removes only the inconsistent global pointer-range law.',
              'model_lock_sha256': sha(model_dir / 'model_lock.json'),
              'model_qualification': 'Global finite-address conflict removed; remaining model axioms are TCB, not proved consistent.'}
(destination / 'provenance.json').write_text(json.dumps(provenance, indent=2) + '\n')
command = ['python3', data['files']['model_runner.py']['path'], str(destination.relative_to(ROOT)),
           '--frozen-sha256', sha(destination / 'frozen.json'), '--name', 'canonical01', '--framac',
           str(model_dir / 'frama-c.py'),
           '--prover-bin', '/zp_vegeta/scratch_sb/ycsun/verus/research/agent-qs8-rsum/provers/bin']
(destination / 'canonical01-command.json').write_text(json.dumps(command, indent=2) + '\n')
(destination / 'README.zh-CN.txt').write_text(
    data['name'] + '：候选已完成两次完整检查；当前仅待canonical重放，不代表已经加入manifest。\n'
    'spec.h与普通C独立冻结；唯一证明文件proof.patch，ghost helper都在该patch内。original保留原kernel。\n'
    '纯整数Bytes-v4已删除旧模型的全局地址范围公理，LP64小端，VLEN=128，VL=min(remaining,32)。长度为公开spec范围内符号值。\n'
    'libc memcpy内容/终止/退出合同、WP/Why3/SMT及memory model属于TCB；ISA到shim对应未证明。\n'
    '工具外部构建缓存不入Git，fresh clone并不是已配置环境。重放命令见canonical01-command.json。\n')
print(json.dumps({'package': str(destination.relative_to(ROOT)), 'command': command}, indent=2))
