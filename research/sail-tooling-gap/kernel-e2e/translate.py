#!/usr/bin/env python3
"""Extract every actual kernel instruction, retaining loops as address maps.

No algorithm recognition or replacement semantics. Profiles describe explicit
architectural preconditions whose reachability must be proved separately.
"""
import argparse, json, os, re, sys
from pathlib import Path

HERE=Path(__file__).resolve().parent
AUDIT=HERE.parent/'bridge-audit'
sys.path.insert(0,str(AUDIT))
import probe
probe.HERE=HERE
UP,OLD,ENV,STUDY=probe.UP,probe.OLD,probe.ENV,probe.STUDY
NAMESPACE='Kernel'

def setup():
    for d in ['logs','results','configs','generated','dumps','bin']:
        (HERE/d).mkdir(exist_ok=True)
    wrapper=(AUDIT/'bin/isla-footprint').read_text()
    (HERE/'bin/isla-footprint').write_text(wrapper)
    (HERE/'bin/isla-footprint').chmod(0o755)
    arm=(AUDIT/'configs/arm.toml').read_text()
    arm=arm.replace('"HCR_EL2" = "0x0000000080000000"','"HCR_EL2" = "0x0000000080001000"')
    arm=arm.replace('"PSTATE.EL" = "0b10"','"PSTATE.EL" = "0b01"')
    arm=arm.replace('"SCTLR_EL1" = "0x0000000004000002"','"SCTLR_EL1" = "0x0000000004000000"')
    (HERE/'configs/neon-el1-normal.toml').write_text(arm)
    rv=(AUDIT/'configs/rvv16-load-symbolic.toml').read_text()
    rv=rv.replace('misa = "{ bits = 0x8000000000200100 }"','misa = "{ bits = 0x8000000000200104 }"')
    rv=re.sub(r'^(vl|vtype) = .*\n','',rv,flags=re.M)
    rv=rv.replace('[registers.defaults]','[registers.defaults]\nrv_enable_rvc = true')
    # Sequential address-announcement hook: Sail's C runtime also returns unit
    # here (lib/rts.c:349); the separate platform_write_mem remains a real
    # memory write. Upstream Islaris likewise supplies a constant for this hook.
    rv=rv.replace('[const_primops]', '[const_primops]\nplatform_write_mem_ea = "()"')
    (HERE/'configs/rvv-scalar.toml').write_text(rv)
    for name,vtype,vl in [('loop',0x93,None),('init',0xd3,64),('seed',0xd0,8),('finish',0xd3,64)]:
        extra=f'vtype = "{{ bits = 0x{vtype:016x} }}"\n'
        if vl is not None:extra+=f'vl = "0x{vl:016x}"\n'
        (HERE/'configs'/f'rvv-{name}.toml').write_text(rv.replace('[registers.defaults]','[registers.defaults]\n'+extra))

def profile(row):
    a=int(row['address'],16); cons=[]
    if row['isa']=='neon':
        cfg='neon-el1-normal'
        # Bound addresses, not the input length or data. The table load near
        # 0x200230 is within this flat address domain as well.
        if a in [0x210604,0x210620]:
            cons=['bvuge R1 0x0000000000200000','bvule R1 0x0000000083fffff0']
        if a==0x2105b0:
            cons=['bvuge (bvadd R1 R8) 0x0000000000200000','bvule (bvadd R1 R8) 0x0000000083fffff0']
        if a==0x21062c:
            cons=['bvuge R8 0x0000000000200000','bvule R8 0x0000000083ffffe0']
        if a in [0x2105e0,0x2105ec]:
            cons=['bvuge R2 0x0000000000200000','bvule R2 0x0000000083fffffc']
    else:
        cfg='rvv-scalar'
        # The snapshot reads old LMUL even on vsetvli. Keep old vtype
        # symbolic where both the first entry and the loop backedge reach it.
        if a==0x800001bc:
            cons=['= vtype.bits 0x00000000000000d3']
        if a in [0x800001c6,0x800001dc]:
            cons=['or (= vtype.bits 0x0000000000000093) (= vtype.bits 0x00000000000000d3)']
        if a==0x800001e4:
            cons=['= vtype.bits 0x00000000000000d0']
        if a==0x800001c0:cfg='rvv-init'
        if a==0x800001e0:cfg='rvv-seed'
        if a in [0x800001ea,0x800001ee]:cfg='rvv-finish'
        if a in [0x800001ca,0x800001d2,0x800001d6]:
            cfg='rvv-loop';cons=['bvule vl 0x0000000000000040']
        if a==0x800001ca:
            cons+=['bvuge x11 0x0000000080000000','bvule x11 0x0000000083ffffc0']
        if a in [0x800001e8,0x800001f4]:
            cons+=['bvuge x12 0x0000000080000000','bvule x12 0x0000000083fffffc',
                   '= (bvand x12 0x0000000000000003) 0x0000000000000000']
    return cfg,cons

def extract(row,timeout):
    isa=row['isa'];address=row['address'][2:];cfg,cons=profile(row)
    config=HERE/'configs'/(cfg+'.toml')
    relative=os.path.relpath(config,UP/'_build/install/default/etc/islaris')
    dump=HERE/'dumps'/f'{isa}-{address}.dump'
    dump.write_text(f'//@isla-config: {relative}\n'+''.join(f'//@constraint: {c}\n' for c in cons)+
                    f"{address}: {int(row['opcode'],16):0{len(row['bytes'])}x}  {row['asm']}\n")
    dest=HERE/'generated'/isa;dest.mkdir(exist_ok=True)
    env=os.environ.copy();env['PATH']=str(HERE/'bin')+os.pathsep+env['PATH']
    r=probe.run(f'extract-{isa}-{address}',[UP/'_build/default/frontend/main.exe','-d','-a',
                'aarch64' if isa=='neon' else 'riscv64','-s','--coqdir='+NAMESPACE+'.'+isa,
                '-o',dest,dump],timeout=timeout,env=env)
    r.update(profile=cfg,constraints=cons,opcode=row['opcode'],address=row['address'],
             config_sha256=probe.sha(config),dump_sha256=probe.sha(dump))
    (HERE/'results'/f'extract-{isa}-{address}.json').write_text(json.dumps(r,indent=2)+'\n')
    if r['exit_code']==0:
        r=probe.run(f'import-{isa}-{address}',[ENV,'coqc','-Q',UP/'_build/default/theories','isla',
                      '-Q',HERE/'generated',NAMESPACE,dest/f'a{address}.v'],timeout=600)
    return r['exit_code']==0

def build_map(isa,rows):
    dest=HERE/'generated'/isa
    selected=[r for r in rows if r['isa']==isa]
    missing=[r['address'] for r in selected if not (dest/f"a{r['address'][2:]}.vo").exists()]
    if missing:return {'isa':isa,'complete_import':False,'missing':missing}
    s='From isla Require Import opsem.\n'
    s+=''.join(f"Require Import {NAMESPACE}.{isa}.a{r['address'][2:]}.\n" for r in selected)
    s+=f'\nDefinition {isa}_kernel : gmap Z isla_trace := list_to_map [\n'
    s+=';\n'.join(f"  ({int(r['address'],16)}%Z, a{r['address'][2:]})" for r in selected)+'].\n'
    s+=f'\nLemma {isa}_kernel_size : size {isa}_kernel = {len(selected)}%nat.\nProof. vm_compute. reflexivity. Qed.\n'
    (dest/'Kernel.v').write_text(s)
    result=probe.run('map-'+isa,[ENV,'coqc','-Q',UP/'_build/default/theories','isla',
               '-Q',HERE/'generated',NAMESPACE,dest/'Kernel.v'],timeout=600)
    result.update(isa=isa,instructions=len(selected),complete_import=result['exit_code']==0,
                  functional_correctness_proved=False,arbitrary_length_equivalence_proved=False)
    (HERE/'results'/f'kernel-{isa}.json').write_text(json.dumps(result,indent=2)+'\n')
    return result

def main():
    p=argparse.ArgumentParser();p.add_argument('isa',choices=['neon','rvv'])
    p.add_argument('--only',nargs='*');p.add_argument('--timeout',type=int,default=1800)
    p.add_argument('--resume',action='store_true');a=p.parse_args()
    setup();rows=probe.inventory()
    selected=[r for r in rows if r['isa']==a.isa and (not a.only or r['address'] in a.only)]
    # Produce the rest of the actual CFG before the most expensive symbolic load.
    selected.sort(key=lambda r:(int(r['address'],16)==0x800001ca,int(r['address'],16)))
    failed=[]
    for row in selected:
        address=row['address'][2:]
        done=HERE/'results'/f'import-{a.isa}-{address}.json'
        source=HERE/'generated'/a.isa/f'a{address}.v'
        if a.resume and done.exists() and source.exists():
            prior=json.loads(done.read_text())
            if prior.get('exit_code')==0 and prior.get('input_sha256',{}).get(str(source))==probe.sha(source):continue
        if not extract(row,a.timeout):failed.append(row['address'])
    result=build_map(a.isa,rows)
    print(json.dumps(dict(failed=failed,map=result)),flush=True)
    return int(bool(failed))
if __name__=='__main__':raise SystemExit(main())
