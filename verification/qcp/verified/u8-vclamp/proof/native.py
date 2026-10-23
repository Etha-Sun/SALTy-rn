"""Actual public caller, independent scalar oracle, both RVV variants and negative control."""
from pathlib import Path
import concurrent.futures, json, os, shutil, subprocess, time
from sources import CASE, render_unit, sha

def run_native(parent, jobs=16):
    assert jobs >= 16
    out=parent/'native';out.mkdir()
    units={u['name']:u for u in json.loads((CASE/'proof/units.json').read_text())}
    rendered={}
    for name in ['neon','rvv_original','rvv_repaired','public']:
        entry,raw=render_unit(units[name],out/name);rendered[name]=raw or entry
    shutil.copyfile(CASE/'shim/harness.c',out/'harness.c')
    repair=rendered['rvv_repaired'].read_text()
    first='vacc = __riscv_vmaxu_vx_u8m8(vacc, voutput_min, vl);\n    vacc = __riscv_vminu_vx_u8m8(vacc, voutput_max, vl);'
    assert repair.count(first)==1
    wrong='vacc = __riscv_vminu_vx_u8m8(vacc, voutput_max, vl);\n    vacc = __riscv_vmaxu_vx_u8m8(vacc, voutput_min, vl);'
    mutant=out/'rvv_repaired/wrong.c';mutant.write_text(repair.replace(first,wrong))
    flags=['gcc','-std=c11','-O2','-g','-fsanitize=address,undefined','-fno-omit-frame-pointer']
    records=[]
    def command(label,cmd,expected=0):
        start=time.monotonic();log=out/(label+'.log')
        with log.open('w')as stream:
            try:rc=subprocess.run(list(map(str,cmd)),cwd=out,stdout=stream,stderr=subprocess.STDOUT,timeout=180).returncode
            except subprocess.TimeoutExpired:rc=124
        record=dict(label=label,command=list(map(str,cmd)),exit=rc,expected_exit=expected,
                    seconds=time.monotonic()-start,log_sha256=sha(log))
        records.append(record);assert rc==expected,record
    sources=[
        ('neon',rendered['neon'],['-Dqcp_assert=neon_assert','-Dqcp_u8_min=neon_min','-Dqcp_u8_max=neon_max']),
        ('packed',out/'rvv_original/packed_impl.c',[]),
        ('repaired',rendered['rvv_repaired'],['-Dqcp_assert=rvv_assert','-D__riscv_vsetvl_e8m8=monitored_vsetvl']),
        ('original',rendered['rvv_original'],['-Dqcp_assert=rvv_assert']),
        ('balanced',rendered['rvv_original'],['-Dqcp_assert=original_assert','-Dtest_rvv=test_original','-D__riscv_vsetvl_e8m8=balanced_vsetvl']),
        ('caller',rendered['public'],[]),
        ('wrong',mutant,['-Dqcp_assert=rvv_assert','-D__riscv_vsetvl_e8m8=monitored_vsetvl'])]
    with concurrent.futures.ThreadPoolExecutor(max_workers=jobs)as pool:
        list(pool.map(lambda item:command('compile-'+item[0],[*flags,*item[2],'-c',item[1],'-o',out/(item[0]+'.o')]),sources))
    common=[out/(n+'.o')for n in ['neon','packed','balanced','caller']]
    for name,object_name,extra in [('repaired','repaired',['-DEXPECT_CAPPED_AVL']),
                                  ('original','original',[]),('negative','wrong',['-DEXPECT_CAPPED_AVL'])]:
        command('link-'+name,[*flags,*extra,out/'harness.c',*common,out/(object_name+'.o'),'-o',out/name.replace('original','original-test').replace('repaired','repaired-test')])
        binary=out/name.replace('original','original-test').replace('repaired','repaired-test')
        command('run-'+name,(['env','ASAN_OPTIONS=detect_leaks=0',binary]if name=='negative'else[binary]),2 if name=='negative'else 0)
    result=dict(passed=True,records=records,cases_per_variant=65536,positive_variants=['original','repaired'],
                wrong_phase_negative_control_rejected=True,ASan_UBSan=True,independent_scalar_oracle=True,
                alternate_legal_VL_policy=True,formal_proof=False,
                source_sha256={str(p.relative_to(out)):sha(p)for p in out.rglob('*')if p.suffix in ['.c','.h']})
    (out/'result.json').write_text(json.dumps(result,indent=2)+'\n')
    return result
