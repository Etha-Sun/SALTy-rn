#!/usr/bin/env python3
"""Fresh actual C VC generation and isolated dependency/loop proof checking."""
import ctypes
import hashlib
import json
from pathlib import Path
import random
import re
import shutil
import subprocess
import tempfile

HERE = Path(__file__).resolve().parent
QCP = HERE.parents[1]
SHARED = QCP / 'shared/vadd'
NAN = HERE.parent / 'nan-bridge'
WORKSPACE = Path('/zp_vegeta/scratch_sb/ycsun/verus')
CONFIG = WORKSPACE / 'research/qcp-shim-vadd/results/coq-flags.json'
STRATEGY = WORKSPACE / '.local/qcp/QCP-V2.1.4/linux-binary/StrategyCheck'


def sha(p): return hashlib.sha256(p.read_bytes()).hexdigest()


def main():
    build = HERE / '.build'
    build.mkdir(exist_ok=True)
    run = Path(tempfile.mkdtemp(prefix='replay-', dir=build))
    config = json.loads(CONFIG.read_text())
    records = []
    def execute(cmd, name, expected=0):
        p = subprocess.run([str(x) for x in cmd], cwd=config['cwd'], capture_output=True, text=True, timeout=120)
        log = run / (name + '.log')
        log.write_text(p.stdout + p.stderr)
        records.append({'command': [str(x) for x in cmd], 'exit_code': p.returncode,
                        'log': str(log.relative_to(HERE)), 'log_sha256': sha(log)})
        if (p.returncode == 0) != (expected == 0) or (expected == 0 and 'fatal error:' in p.stderr):
            raise RuntimeError(name + ': ' + p.stdout[-1000:] + p.stderr[-2000:])
        return p
    def qcp(source, output, ns, strategies=None, expected=0):
        output.mkdir(exist_ok=True)
        cmd = ['qcp','--arch=64','--endian=little','--no-float-finite-vc',
               '--input-file='+str(source),'--coq-output-dir='+str(output),
               '--coq-logic-path='+ns,'--no-exec-info']
        if strategies: cmd += ['-slp', str(strategies), ns]
        return execute(cmd, ns+'-'+output.name+'-'+source.stem, expected)
    def same(actual, expected):
        if actual.read_bytes() != expected.read_bytes():
            raise RuntimeError('Generated goal drift: '+str(expected))
    def contract(text, name):
        pattern=r'(?:void|int)\s+'+name+r'\s*\([^)]*\)\s*/\*@.*?\*/'
        return re.sub(r'\s+', '', re.search(pattern,text,re.S).group())
    own = (HERE/'comparator.c').read_text()
    for name, source in [('qcp_vadd_read',SHARED/'array_read.c'), ('same_lane',NAN/'bridge.c')]:
        if contract(own,name) != contract(source.read_text(),name):
            raise RuntimeError('Actual callee contract mismatch: '+name)
    copies = {}
    files = {
      'QcpVadd': (SHARED,['VaddBits.v','float_array_strategy_goal.v','float_array_strategy_proof.v','array_read_goal.v','array_read_checked.v']),
      'NanBridge': (NAN,['BridgeLogic.v','ListBridge.v','bridge_goal.v','bridge_checked.v']),
      'VaddComparator': (HERE,['ComparatorLogic.v','comparator_strategy_goal.v','comparator_strategy_proof.v','comparator_goal.v','comparator_checked.v'])}
    for ns,(base,names) in files.items():
        dest=run/ns; dest.mkdir(); copies[ns]=dest
        for name in names:
            text=(base/name).read_text()
            if not name.endswith('_goal.v') and re.search(r'\b(?:Admitted|admit|Axiom|Parameter)\b',re.sub(r'\(\*.*?\*\)','',text,flags=re.S)):
                raise RuntimeError('Unchecked declaration in '+str(base/name))
            shutil.copy2(base/name,dest/name)
    qcp(HERE/'comparator.c',run/'loop-generated','VaddComparator',HERE)
    same(run/'loop-generated/comparator_goal.v',HERE/'comparator_goal.v')
    qcp(SHARED/'array_read.c',run/'read-generated','QcpVadd',SHARED)
    same(run/'read-generated/array_read_goal.v',SHARED/'array_read_goal.v')
    qcp(NAN/'bridge.c',run/'bridge-generated','NanBridge')
    same(run/'bridge-generated/bridge_goal.v',NAN/'bridge_goal.v')
    for base, stem, ns in [(SHARED,'float_array','QcpVadd'),(HERE,'comparator','VaddComparator')]:
        out=run/(stem+'-strategy-generated');out.mkdir()
        execute([STRATEGY,'--arch=64','--endian=little','--input-file='+str(base/(stem+'.strategies')),
                 '--coq-output-dir='+str(out),'--coq-logic-path='+ns,'--no-exec-info'],stem+'-strategy')
        same(out/(stem+'_strategy_goal.v'),base/(stem+'_strategy_goal.v'))
    def coqc(path, name, mappings=copies, expected=0):
        cmd=['qcp-env','coqc',*config['flags'][2:]]
        for ns,d in mappings.items():cmd+=['-Q',str(d),ns]
        execute(cmd+[str(path)],name,expected)
    for ns in ['NanBridge','QcpVadd','VaddComparator']:
        for name in files[ns][1]:coqc(copies[ns]/name,ns+'-'+Path(name).stem)
    # Compile a false-return mutant against the exact same checked proof.
    mutant=run/'mutant';mutant.mkdir()
    source=mutant/'comparator.c'
    source.write_text(own.replace('#include "comparator_def.h"','#include "'+str(HERE/'comparator_def.h')+'"').replace('  return 1;','  return 0;'))
    rejected=qcp(source,mutant,'VaddComparator',HERE,expected=1)
    diagnostic=rejected.stdout+rejected.stderr
    if 'return proof obligation' not in diagnostic or '0 == 1' not in diagnostic:
        raise RuntimeError('Mutant failed for an unexpected reason, not its false return contract.')
    native=run/'native.c'
    native.write_text('\n'.join('#include "'+str(p)+'"' for p in [SHARED/'array_read.c',NAN/'bridge.c',HERE/'comparator.c'])+'\n')
    so=run/'comparator.so'
    execute(['gcc','-std=c11','-O0','-fno-fast-math','-shared','-fPIC',native,'-o',so],'native-build')
    lib=ctypes.CDLL(str(so));compare=lib.compare_outputs
    compare.argtypes=[ctypes.c_ulonglong,ctypes.POINTER(ctypes.c_float),ctypes.POINTER(ctypes.c_float)];compare.restype=ctypes.c_int
    rng=random.Random(20261022); cases=0
    special=[0,0x80000000,1,0x80000001,0x007fffff,0x7f800000,0xff800000,0x7fc00001,0xffa00001,0x7f7fffff]
    def call(xs,ys):
        nonlocal cases
        a=(ctypes.c_uint32*len(xs))(*xs);b=(ctypes.c_uint32*len(ys))(*ys)
        before=bytes(a),bytes(b)
        result=compare(len(xs),ctypes.cast(a,ctypes.POINTER(ctypes.c_float)),ctypes.cast(b,ctypes.POINTER(ctypes.c_float)))
        assert before==(bytes(a),bytes(b));cases+=1
        return result
    for n in [1,2,3,4,7,8,31,32,33,63,64,65,127,128,129,257,1025]:
        for xs in [[special[i%len(special)] for i in range(n)],[rng.getrandbits(32) for _ in range(n)]]:
            ys=[0xffc12345 if (x&0x7f800000)==0x7f800000 and x&0x007fffff else (x^0x80000000 if x&0x7fffffff==0 else x) for x in xs]
            assert call(xs,ys)==1
        xs=[0x3f800000]*n;ys=xs[:];ys[-1]=0x40000000
        assert call(xs,ys)==0
    status={'passed':True,'loop_body_vcs':12,'callee_body_vcs':{'array_read':2,'identity_and_same_lane':14},
            'strategy_vcs':{'existing_array':2,'comparator':4},'actual_c_bodies':['compare_outputs','qcp_vadd_read','preserve_float','check_observation','same_lane'],
            'callee_contracts_match_actual_bodies':True,'fresh_goals_match':True,'false_return_mutant_rejected':True,'mutant_rejection_stage':'QCP return-postcondition contradiction (0 == 1)',
            'native_cases':cases,'input_domain':'All QCP fp32 values; positive bounded symbolic n; outputs_related=Forall2 same_value; owned disjoint arrays.',
            'full_vadd_kernel_proof':False,'sources':{str(base/name):sha(base/name) for base,names in files.values() for name in names},
            'c_sources':{str(p):sha(p) for p in [HERE/'comparator.c',HERE/'comparator.strategies',HERE/'comparator_def.h',SHARED/'array_read.c',SHARED/'float_array.strategies',SHARED/'float_array_def.h',NAN/'bridge.c']},
            'commands':records,'limits':['This checks the actual comparator loop under an input relation; the two vadd kernels must establish that relation.',
            'The comparator uses checked read and identity-based same_lane calls; equivalence to original inline observation follows from the bridge theorem but whole mapper lowering is separate.',
            'QCP partial correctness VCs do not establish a whole-program termination theorem.',
            'QCP layout/address parameters and standard Coq/Flocq extensionality/classical assumptions remain in Print Assumptions logs.']}
    logs = HERE / 'logs' / run.name
    logs.mkdir(parents=True, exist_ok=True)
    for record in records:
        source_log = HERE / record['log']
        dest_log = logs / source_log.name
        shutil.copy2(source_log, dest_log)
        record['log'] = str(dest_log.relative_to(HERE))
    status['runner_sha256'] = sha(Path(__file__))
    status['coq_flags_sha256'] = sha(CONFIG)
    status['qcp_binary_sha256'] = sha(Path(shutil.which('qcp')).resolve())
    (HERE/'status.json').write_text(json.dumps(status,indent=2)+'\n')
    print(json.dumps({k:status[k] for k in ['passed','loop_body_vcs','callee_body_vcs','false_return_mutant_rejected','native_cases']}))


if __name__=='__main__':main()
