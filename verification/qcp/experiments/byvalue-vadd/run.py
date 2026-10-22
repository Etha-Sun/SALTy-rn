#!/usr/bin/env python3
"""Generate VCs for the original C with proof comments and check the value shim."""
from pathlib import Path
import argparse
import hashlib
import json
import re
import resource
import subprocess
import tempfile
from generate import generate

HERE = Path(__file__).resolve().parent
QCP = HERE.parents[1]
WORKSPACE = HERE.parents[5]


def sha(path):
    return hashlib.sha256(path.read_bytes()).hexdigest()


def main():
    parser = argparse.ArgumentParser()
    parser.add_argument('--stage', choices=['shim', 'neon'], default='shim')
    parser.add_argument('--timeout', type=int, default=60)
    args = parser.parse_args()
    resource.setrlimit(resource.RLIMIT_CORE, (0, 0))
    generate()
    build = HERE / '.build'
    build.mkdir(exist_ok=True)
    out = Path(tempfile.mkdtemp(prefix=args.stage+'-', dir=build))
    records = []

    def execute(command, label, cwd=None):
        command = list(map(str, command))
        with (out / (label+'.log')).open('w') as log:
            try:
                result = subprocess.run(command, cwd=cwd, stdout=log, stderr=log, timeout=args.timeout)
                code = result.returncode
            except subprocess.TimeoutExpired:
                code = 124
        records.append({'command':command, 'exit_code':code, 'log':label+'.log'})
        return code
    unit = out / (args.stage+'_unit.c')
    code = execute(['gcc','-E','-P','-CC','-nostdinc',HERE/(args.stage+'.c'),'-o',unit], 'preprocess')
    assert code == 0
    paths = [(QCP/'shared/vadd','QcpVadd'), (HERE.parent/'vadd-neon','QcpNeon'),
             (HERE.parent/'vadd-neon-loop','QcpNeonLoop')]
    command = ['qcp','--arch=64','--endian=little','--no-float-finite-vc','--no-exec-info',
               '--input-file='+str(unit),'--coq-output-dir='+str(out),'--coq-logic-path=ByValue']
    for folder, namespace in paths:
        command += ['-slp',str(folder),namespace]
    code = execute(command, 'qcp')
    checked = False
    count = None
    if code == 0:
        goal = out / (args.stage+'_unit_goal.v')
        count = len(re.findall(r'^Axiom proof_of_',goal.read_text(),re.M))
        if args.stage == 'shim':
            config = json.loads((WORKSPACE/'research/qcp-shim-vadd/results/coq-flags.json').read_text())
            flags = config['flags'][2:]
            for folder, namespace in [(paths[0][0],'QcpVadd'), (paths[1][0]/'proofs','QcpNeon'),
                                      (paths[2][0]/'proofs','QcpNeonLoop'), (out,'ByValue')]:
                flags += ['-Q',str(folder),namespace]
            proof = HERE/'shim_checked.v'
            assert not re.search(r'\b(?:Admitted|admit|Axiom|Parameter)\b',proof.read_text())
            assert execute(['qcp-env','coqc',*flags,goal],'goal-coqc',config['cwd']) == 0
            # Output artifacts stay in this run, alongside its goal.
            copied = out/'shim_checked.v'
            copied.write_bytes(proof.read_bytes())
            assert execute(['qcp-env','coqc',*flags,copied],'proof-coqc',config['cwd']) == 0
            checked = True
    status = {'stage':args.stage, 'generation_exit_code':code, 'c_vcs':count,
              'shim_checked':checked, 'full_kernel_proved':False, 'run_directory':str(out),
              'commands':records, 'sources':{f:sha(HERE/f) for f in
                ['generate.py','shim.h','shim.c','neon.c','shim_checked.v']}}
    (HERE/(args.stage+'-status.json')).write_text(json.dumps(status,indent=2)+'\n')
    print(json.dumps({k:v for k,v in status.items() if k not in ['commands','sources']}),flush=True)
    if code:
        raise SystemExit(code)


if __name__ == '__main__':
    main()
