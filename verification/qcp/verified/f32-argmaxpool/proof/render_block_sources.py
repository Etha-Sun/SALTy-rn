#!/usr/bin/env python3
"""Insert proof annotations into live ordinary C, rejecting runtime token drift.

No private build directory is needed to render either translation unit. A plan
contains comments and a token identity guard, never an alternative runtime body.
The complete kernel certificate is issued separately after a full fresh replay.
"""
from pathlib import Path
import argparse,hashlib,json,re
C=Path(__file__).resolve().parents[1]
TOKEN_PATTERN=r'[A-Za-z_]\w*|(?:\d+(?:\.\d*)?)|>>=|<<=|==|!=|<=|>=|\+\+|--|&&|\|\||->|\+=|-=|\S'
PREFIX={'rvv':['kernel_frontend.h','borrowed_bindings.h','rvv_update_into.h','optional_memory.h','rvv_block32.h'],'block32':['rvv_block32.h','rvv_block32_stage.h']}

def lex(source):
    clean=re.sub(r'/\*.*?\*/|//[^\n]*',lambda m:' '*len(m[0]),source,flags=re.S)
    return list(re.finditer(TOKEN_PATTERN,clean))

def render(unit):
    """Return raw frontend TU and annotated TU, both built from live source."""
    assert unit in PREFIX
    plan=json.loads((C/'proof/annotation-plans'/(unit+'.json')).read_text())
    source=(C/plan['runtime_source']).read_text()
    assert source.count(plan['function_start'])==1
    source=source[source.index(plan['function_start']):]
    # Existing Where/function-contract comments are restored by the complete
    # captured plan below. Keep every runtime token and every ordinary comment.
    raw=re.sub(r'/\*@.*?\*/',lambda m:' '*len(m[0]),source,flags=re.S)
    matches=lex(raw);tokens=[m[0]for m in matches]
    assert tokens==plan['all_runtime_tokens'],('live runtime drift',unit)
    assert hashlib.sha256(json.dumps(tokens,separators=(',',':')).encode()).hexdigest()==plan['runtime_token_sha256']
    additions={}
    for block in plan['annotations']:
        i=block['before_token'];assert 0<=i<=len(matches)
        comment=block['annotation'];assert re.fullmatch(r'/\*@(?:(?!\*/).)*\*/',comment,re.S)
        position=matches[i].start()if i<len(matches)else len(raw)
        additions.setdefault(position,[]).append(comment)
    annotated=raw
    for position,blocks in sorted(additions.items(),reverse=True):
        annotated=annotated[:position]+'\n'+'\n'.join(blocks)+'\n'+annotated[position:]
    assert [m[0]for m in lex(annotated)]==tokens
    prefix=''.join('#include "'+str(C/'shim'/name)+'"\n'for name in PREFIX[unit])
    return prefix+raw,prefix+annotated

def main():
    p=argparse.ArgumentParser(description=__doc__);p.add_argument('--unit',choices=sorted(PREFIX),required=True);p.add_argument('--outdir',type=Path,required=True);a=p.parse_args()
    raw,annotated=render(a.unit);a.outdir.mkdir(parents=True,exist_ok=True)
    (a.outdir/'raw.c').write_text(raw);(a.outdir/'annotated.c').write_text(annotated)
    print(json.dumps({'prepared':True,'whole_kernel_verified':False,'unit':a.unit,'runtime_tokens_identical':True,'live_runtime_source':str(C/json.loads((C/'proof/annotation-plans'/(a.unit+'.json')).read_text())['runtime_source'])}))
if __name__=='__main__':main()
