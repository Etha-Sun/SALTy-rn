#!/usr/bin/env python3
"""Instantiate the checked VADD shape for original SUB/MUL/DIV kernels."""
from pathlib import Path
import argparse,hashlib,json,os,re,shutil,sys

QCP=Path(__file__).resolve().parents[1]
REPO=QCP.parents[1]
BASE=QCP/'verified/f32-vadd'
SHARED=QCP/'shared/c-shim/f32'
RUNTIME=QCP/'shared/runtime'
OPERATIONS={'f32-vsub':('sub','-'),'f32-vmul':('mul','*'),'f32-vdiv':('div','/')}
LEXER=re.compile(r'/\*.*?\*/|//[^\n]*|[A-Za-z_]\w*|[0-9][A-Za-z0-9_.]*|>>=|<<=|\.\.\.|->|\+\+|--|<<|>>|<=|>=|==|!=|&&|\|\||\+=|-=|\*=|/=|%=|&=|\|=|\^=|[^\s]',re.S)
def tokens(text):return [m.group() for m in LEXER.finditer(text) if not m.group().startswith(('/*','//'))]
def sha(path):return hashlib.sha256(path.read_bytes()).hexdigest()
def generate(name):
    operation,symbol=OPERATIONS[name]
    target=QCP/'candidates'/name
    assert not target.exists(), 'Refusing to overwrite existing candidate: '+str(target)
    target.mkdir(parents=True)
    mapping={'fp32_add':'fp32_'+operation,'vaddq_f32':'v'+operation+'q_f32',
             '__riscv_vfadd_vv_f32m8':'__riscv_vf'+operation+'_vv_f32m8',
             'qcp_byvalue_add':'qcp_byvalue_'+operation,'qcp_rvv_add_lane32':'qcp_rvv_'+operation+'_lane32',
             'f32_add':'f32_'+operation,'vadd_active_add':'vadd_active_'+operation}
    def specialize(text):
        for before,after in mapping.items():text=text.replace(before,after)
        text=re.sub(r'\breturn a\s*\+\s*b;', 'return a '+symbol+' b;',text)
        text=re.sub(r'(r\.s(\d+)\s*=\s*a\.s\2\s*)\+(\s*b\.s\2\s*;)',lambda m:m[1]+symbol+m[3],text)
        return text
    def mapped(source):
        source=source.resolve()
        for root,destination in [(BASE,target),(SHARED,target/'shim/proof'),(RUNTIME,target/'shim/runtime')]:
            if source.is_relative_to(root):return destination/source.relative_to(root)
        raise ValueError('Unsupported template dependency: '+str(source))
    sources=[]
    for folder in ['proof/coq','proof/c','proof/annotations','contracts']:
        sources += [p for p in (BASE/folder).rglob('*') if p.is_file() and p.suffix in ['.v','.h','.c','.json','.strategies']]
    sources += [BASE/'spec.c']+[BASE/'proof'/name for name in ['check.py','prepare.py','parallel.py','coverage.py','native.py']]
    sources += [p for root in [SHARED,RUNTIME] for p in root.rglob('*') if p.is_file() and p.suffix in ['.c','.h']]
    for source in sources:
        destination=mapped(source);destination.parent.mkdir(parents=True,exist_ok=True)
        text=specialize(source.read_text())
        if source==BASE/'spec.c':text=text.replace('/* VADD review entry:', '/* '+name.upper()+' review entry (VADD proof shape):')
        def include(match):
            resolved=(source.parent/match[1]).resolve()
            try: included=mapped(resolved)
            except ValueError:return match[0]
            return '#include "'+os.path.relpath(included,destination.parent)+'"'
        text=re.sub(r'#include\s+"([^"]+)"',include,text)
        if source==SHARED/'ByvalueRvv/frontend.h' and '#define XNN_OOB_READS' not in text:text+='\n#define XNN_OOB_READS\n'
        if source.name=='native.py':text=text.replace("REPO / 'verification/qcp/shared/runtime'","CASE / 'shim/runtime'")
        destination.write_text(text)
    audits=[]
    for side,filename,function in [('source','testNEON.c','test_neon'),('target','testRVV.c','test_rvv')]:
        original=REPO/'kernels'/side/(name+'.c')
        baseline=BASE/'impl'/filename
        before=baseline.read_text();after=original.read_text()
        old_tokens=tokens(specialize(before));new_tokens=tokens(after)
        assert [x for x in old_tokens if x!='XNN_OOB_READS']==[x for x in new_tokens if x!='XNN_OOB_READS'],name+': unsupported kernel structure'
        destination=target/'impl'/filename;destination.parent.mkdir(exist_ok=True);shutil.copyfile(original,destination)
        # Annotation offsets refer to the function, excluding leading comments.
        bt=tokens(before[before.index('void '+function):]);nt=tokens(after[after.index('void '+function):])
        indices={};j=0
        for i,token in enumerate(bt,1):
            if token=='XNN_OOB_READS':continue
            while nt[j]=='XNN_OOB_READS':j+=1
            expected=specialize(token);assert nt[j]==expected,(i,j,token,nt[j])
            indices[i]=j+1;j+=1
        patches=json.loads((BASE/'proof/annotations'/(function+'.json')).read_text())
        for patch in patches:
            at=patch['after_token']
            if at not in indices:
                at=max(k for k in indices if k<at)
            patch['after_token']=indices[at]
            if patch['text'] is None:
                while patch['after_token']<len(nt) and nt[patch['after_token']]=='XNN_OOB_READS':patch['after_token']+=1
            elif patch['text'] is not None:patch['text']=specialize(patch['text'])
        (target/'proof/annotations'/(function+'.json')).write_text(json.dumps(patches,indent=2)+'\n')
        audits.append({'original':str(original.relative_to(REPO)),'copy':'impl/'+filename,'sha256':sha(original),'byte_identical':sha(original)==sha(destination)})
    manifest=json.loads((BASE/'proof/manifest.json').read_text())
    for item in manifest['units']:
        item['path']=os.path.relpath(mapped((BASE/'proof'/item['path']).resolve()),target/'proof')
        if 'frontend' in item:item['frontend']=str(mapped(REPO/item['frontend']).relative_to(REPO))
    manifest['files']=[]
    for path in sorted(target.rglob('*')):
        if path.is_file() and path.suffix in ['.c','.h','.v','.json','.strategies']:
            manifest['files'].append({'path':str(path.relative_to(target)),'sha256':sha(path),'origin':'binary_family:'+name})
    (target/'proof/manifest.json').write_text(json.dumps(manifest,indent=2)+'\n')
    (target/'family.json').write_text(json.dumps({'family':'binary-f32-vadd-shape','operation':operation,'fp32_operator':'fp32_'+operation,'symbol':symbol,'template':'verification/qcp/verified/f32-vadd','template_manifest_sha256':sha(BASE/'proof/manifest.json'),'generator_sha256':sha(Path(__file__)),'originals':audits,'checked':False},indent=2)+'\n')
    (target/'README.zh-CN.md').write_text(f'''# {name} 候选验证包

来自已检查 VADD 形状的明确算术实例：`fp32_{operation}`，C 运算符 `{symbol}`。
`impl/` 两个文件逐字节复制原始 kernel；证明只插入注释，保持原调用和控制流。
`shim/` 是独立且需审查的运算特定实现及契约，不修改公共 shim。
历史 `vadd_values` / `rvv_add` 文件名保留，但模型定义实际使用 `fp32_{operation}`，
不是把减乘除解释成加法。RVV 非活动通道仍返回 +0。
公开后置条件仍是相同运算模型的输出等价性；完整 binary32/NaN/Inf/±0，
无有限值、除数非零或新的公理前提。保留 VADD 的内存、VLEN 和 store 宏左值边界。

生成不等于验证。运行 `python3 proof/check.py --jobs 32`，只有新生成 VC 与本包
实例化目标严格一致、全部本地 Coq 依赖重新编译及 FinalCheck 通过，才算检查成功。
`python3 proof/native.py` 是另行有限回归，不替代证明。
''')
    print(target,flush=True)
    return target

if __name__=='__main__':
    parser=argparse.ArgumentParser();parser.add_argument('kernel',choices=OPERATIONS)
    generate(parser.parse_args().kernel)
