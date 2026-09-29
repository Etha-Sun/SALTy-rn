#!/usr/bin/env python3
"""Produce an address-by-address ledger; never infer proof from import."""
import hashlib, json, re
from pathlib import Path
from probe import HERE, STUDY, OLD, inventory, configure

def read_result(name):
    p=HERE/'results'/(name+'.json')
    return json.loads(p.read_text()) if p.exists() else {}

def main():
    configure();rows=inventory()
    picks={'neon_addv':'0x2105dc','neon_uadalp8':'0x2105bc','neon_uadalp16':'0x2105c4',
           'neon_load':'0x210604','neon_mul':'0x210630','rvv_load':'0x800001ca',
           'rvv_widen':'0x800001d2','rvv_add':'0x800001d6',
           'rvv_load_platform':'0x800001ca','rvv_load_symbolic':'0x800001ca',
           'rvv_add_allvl':'0x800001d6','rvv_widen_allvl':'0x800001d2',
           'neon_load_ram':'0x210604','neon_load_unaligned':'0x210604'}
    replay=read_result('replay');checks={r['name']:r for r in replay.get('checks',[])}
    records=[]
    rank={'not_attempted':0,'extraction_timeout':1,'extraction_failed':1,
          'trace_and_coq_generated':2,'coq_import_checked':3,
          'first_lane_property_proved_zero_destination':4,'instruction_property_proved':5}
    for name,address in picks.items():
        row=next(r for r in rows if r['address']==address)
        previous_stage=row['stage'];previous_evidence=row.get('evidence')
        extraction=read_result('extract-'+name)
        imp=read_result('coq-import-'+name)
        row['stage']='extraction_timeout' if extraction.get('exit_code') is None else 'extraction_failed'
        if extraction.get('exit_code')==0:row['stage']='trace_and_coq_generated'
        source=HERE/'generated'/name/f'a{address[2:]}.v'
        expected=replay.get('sha256',{}).get(str(source.relative_to(STUDY))) or imp.get('input_sha256',{}).get(str(source))
        fresh=source.exists() and expected==hashlib.sha256(source.read_bytes()).hexdigest()
        if imp.get('exit_code')==0 and fresh:row['stage']='coq_import_checked'
        if name=='neon_addv' and fresh and checks.get('proof-NeonProof',{}).get('exit_code')==0 and checks.get('proof-NeonProof',{}).get('no_extra_axioms') and checks.get('proof-NeonProof',{}).get('source_sha256')==hashlib.sha256((HERE/'NeonProof.v').read_bytes()).hexdigest():
            row['stage']='instruction_property_proved'
        pair=read_result('proof-NeonPairProof')
        if name=='neon_uadalp8' and fresh and pair.get('exit_code')==0 and pair.get('no_extra_axioms') and pair.get('source_sha256')==hashlib.sha256((HERE/'NeonPairProof.v').read_bytes()).hexdigest():
            row['stage']='instruction_property_proved'
        for probe,stem in [('neon_uadalp16','NeonWordProof'),('neon_load_ram','NeonLoadProof')]:
            proof=read_result('proof-'+stem)
            if name==probe and fresh and proof.get('exit_code')==0 and proof.get('no_extra_axioms') and proof.get('source_sha256')==hashlib.sha256((HERE/(stem+'.v')).read_bytes()).hexdigest():
                row['stage']='instruction_property_proved'
        rv=read_result('attempt-RvvProof')
        if name=='rvv_widen' and fresh and rv.get('exit_code')==0 and rv.get('no_extra_axioms') and rv.get('source_sha256')==hashlib.sha256((HERE/'RvvProof.v').read_bytes()).hexdigest():
            row['stage']='first_lane_property_proved_zero_destination'
        row['evidence']=name
        r=dict(name=name,address=address,opcode=row['opcode'],stage=row['stage'],seconds=extraction.get('seconds'))
        for suffix in ['isla','v']:
            path=HERE/'generated'/name/(f'a{address[2:]}.{suffix}')
            if path.exists():r[suffix+'_bytes']=path.stat().st_size;r[suffix+'_lines']=len(path.read_text().splitlines())
        records.append(r)
        row.setdefault('profiles',[]).append({'name':name,'stage':r['stage']})
        if rank.get(previous_stage,0)>rank.get(row['stage'],0):
            row['stage']=previous_stage;row['evidence']=previous_evidence
    old=json.loads((OLD/'results/replay.json').read_text())
    for address,theorem,key in [('0x800001c6','vsetvl_arbitrary_remaining','vsetvl_arbitrary_remaining_proved'),
                                ('0x800001ea','vredsum_full64','vredsum_64_lanes_proved')]:
        row=next(r for r in rows if r['address']==address)
        if old.get(key):row['stage']='previous_instruction_property_proved';row['evidence']=theorem
    # Repeated opcode is only a reuse candidate; its actual incoming state
    # and all trace assumptions have not been discharged at that location.
    opcodes={r['opcode']:r for r in rows if r['stage'] not in ['not_attempted','extraction_timeout','extraction_failed']}
    for row in rows:
        if row['stage']=='not_attempted' and row['opcode'] in opcodes:
            row['reuse_candidate']=opcodes[row['opcode']]['address']
    (HERE/'results/inventory.json').write_text(json.dumps(rows,indent=2)+'\n')
    (HERE/'results/coverage.json').write_text(json.dumps(dict(instructions=rows,probes=records),indent=2)+'\n')
    md='# 指令接入与证明覆盖表\n\n自动生成：`python3 research/sail-tooling-gap/bridge-audit/audit.py`。\n\n'
    md+='这里只报告本目录实际测试与之前两条 RVV 定理；“未尝试”不表示上游工具不支持。相同 opcode 只标注复用候选，仍须验证该位置的配置和前置条件。地址表展示完成度最高的配置，并在括号中注明该配置；不表示所有配置均已证明。\n\n'
    md+='| 探针 | 地址 | 状态 | Isla 字节 / 行 | Coq 字节 / 行 | 提取秒数 |\n|---|---|---|---|---|---|\n'
    for r in records:
        md+=f"| {r['name']} | `{r['address']}` | {r['stage']} | {r.get('isla_bytes','—')} / {r.get('isla_lines','—')} | {r.get('v_bytes','—')} / {r.get('v_lines','—')} | {r.get('seconds','—')} |\n"
    md+='\n状态说明：`coq_import_checked` 只表示 trace 数据能被 Coq 接受；只有标记 `proved` 的行有对应行为定理。加载超时输出的 0 字节文件不是有效 trace。RVV 扩宽的定理若完成，只覆盖第一 lane，且目的寄存器预置零。\n'
    for isa in ['neon','rvv']:
        rr=[r for r in rows if r['isa']==isa]
        md+=f'\n## {isa.upper()}：{len(rr)} 条静态指令\n\n| 地址 | opcode | 反汇编 | 状态 / 复用候选 |\n|---|---|---|---|\n'
        for r in rr:
            state=r['stage']+(f" ({r['evidence']})" if r.get('profiles') else '')+(f"; 相同 opcode：{r['reuse_candidate']}" if 'reuse_candidate' in r else '')
            md+=f"| `{r['address']}` | `{r['opcode']}` | `{r['asm']}` | {state} |\n"
    (HERE/'COVERAGE.zh-CN.md').write_text(md)
    files=[f for f in HERE.rglob('*') if f.is_file() and
           (f.suffix in {'.py','.v','.isla','.toml','.json','.md','.dump','.smt2','.log','.ml','.sh','.jsonl'} or f.name=='META') and
           f.name!='manifest.json']
    (HERE/'results/manifest.json').write_text(json.dumps({
        'description':'Current deliverable hashes; proof-check-time hashes remain in replay.json.',
        'sha256':{str(f.relative_to(HERE)):hashlib.sha256(f.read_bytes()).hexdigest() for f in sorted(files)}},indent=2)+'\n')
    print(json.dumps({'neon_instructions':sum(r['isa']=='neon' for r in rows),'rvv_instructions':sum(r['isa']=='rvv' for r in rows),'probes':records},indent=2))

if __name__=='__main__':main()
