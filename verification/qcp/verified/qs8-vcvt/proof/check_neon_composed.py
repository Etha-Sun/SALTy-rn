#!/usr/bin/env python3
"""Fresh canonical nested byte tail and exact-expression composition bridge.
The source adapter is restricted to the three checked, side-effect-free frozen
source sites. This is C-shim correspondence, not an ISA/ABI refinement theorem.
"""
import argparse, hashlib, json, re, shutil, subprocess, tempfile, time
from pathlib import Path
CASE=Path(__file__).resolve().parent.parent
NS='Qs8I8Cvt'
def sha(p): return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def clean(s): return re.sub(r'\s+','',re.sub(r'/\*.*?\*/|//[^\n]*','',s,flags=re.S))
def source_guard():
    raw=(CASE/'impl/testNEON.c').read_text(); direct=(CASE/'shim/neon_composed.c').read_text();header=clean((CASE/'shim/neon_composed.h').read_text())
    sites=[('vst1_lane_u32((void*) output, vreinterpret_u32_s8(vy), 0);','vst1_lane_u32((void*)p,vreinterpret_u32_s8(value),0);',4),('vst1_lane_u16((void*) output, vreinterpret_u16_s8(vy), 0);','vst1_lane_u16((void*)p,vreinterpret_u16_s8(value),0);',2),('vst1_lane_s8(output, vy, 0);','qcp_s8_store_lane0(p,&value);',1)]
    payload=clean(direct);copies='int8x8_tvalue;'+''.join('value.s%d=v->s%d;'%(i,i)for i in range(8))
    for original,body,width in sites:
        if clean(raw).count(clean(original))!=1 or payload.count('{'+copies+clean(body)+'}')!=1:raise ValueError('Exact pure source/actual copied composition body mismatch: '+original)
    if re.findall(r'\bvst1_lane_(?:u32|u16|s8)\s*\(',raw)!=['vst1_lane_u32(','vst1_lane_u16(','vst1_lane_s8(']:raise ValueError('Unexpected nested source sites')
    macros=['#definevst1_lane_u32(p,a,lane)qcp_qcv_store4_##lane((int8_t*)(p),&(QCV_UNWRAP_U32_##a))','#definevst1_lane_u16(p,a,lane)qcp_qcv_store2_##lane((int8_t*)(p),&(QCV_UNWRAP_U16_##a))','#definevst1_lane_s8(p,a,lane)qcp_qcv_store1_##lane((p),&(a))']
    if any(header.count(m)!=1 for m in macros):raise ValueError('Borrowed source arguments must be captured once')
    if 'original_tail_store32(' in direct or 'original_tail_store16(' in direct:raise ValueError('Rejected indirect-byvalue composition reintroduced')
    return dict(exact_source_sites=3,actual_field_copy_assignments=24,arguments='output/vy are plain local reads; pointer arguments captured once, all eight input fields copied in real checked C before writes',canonical_nested_payload='direct original nested expression over the actual copied value in real borrowed adapter body; original nested leaf/provider bodies also checked',alias_frame='separation-logic Require/Ensure preserves the borrowed eight Char cells; universal cell/array equivalences; no side-effectful-expression claim')
def main():
    ap=argparse.ArgumentParser(description=__doc__);ap.add_argument('--config',required=True,type=Path);a=ap.parse_args();run=Path(tempfile.mkdtemp(prefix='composed-proof-',dir=CASE/'.build'));coq=run/'coq';coq.mkdir();records=[];s=dict(passed=False,vc_correct_passed=False,whole_kernel_verified=False,run_directory=str(run),records=records)
    def exe(label,cmd,budget=1800):
        cmd=['prlimit','--as=17179869184:17179869184','--',*map(str,cmd)];log=run/(label+'.log');t=time.monotonic()
        with log.open('w')as f:r=subprocess.run(cmd,cwd=run,stdout=f,stderr=f,timeout=budget)
        records.append(dict(label=label,command=cmd,exit_code=r.returncode,seconds=time.monotonic()-t,log_sha256=sha(log)))
        print(label,r.returncode,flush=True)
        if r.returncode:raise RuntimeError(label+': '+log.read_text()[-2500:])
    try:
        s['composition_scope']=source_guard()
        mods=['Model','Types','MemoryModel','NeonStoreModel','ComposedModel','ByteBridge','NeonFrame','S8ArraysStrategy','s8_arrays_strategy_proof','signed_tail_strategy_proof','ComposedBridge','SignedTailChecked','NeonComposedChecked']
        names=['proof/check_neon_composed.py','impl/testNEON.c','proof/repair.json']+[str(p.relative_to(CASE))for p in (CASE/'shim').glob('*')if p.is_file()]+['proof/c/s8_arrays.strategies']+['proof/coq/'+n+'.v'for n in mods]
        inputs={n:sha(CASE/n)for n in sorted(set(names))};s['input_sha256']=inputs
        tool=Path(shutil.which('qcp')).resolve().parent/'StrategyCheck';strategies=[]
        for stem,typ,module,count in [('s8_arrays','s8_arrays_Strategy_Correct','Qs8I8Cvt.S8ArraysStrategy.CheckedS8Arrays',2),('signed_tail','signed_tail_Strategy_Correct','Qs8I8Cvt.signed_tail_strategy_proof.CheckedSignedTailStrategy',2)]:
            out=run/('strategy-'+stem);out.mkdir();src=CASE/'proof/c'/(stem+'.strategies')
            if not src.exists():src=CASE/'shim'/(stem+'.strategies')
            exe(stem+'-strategy',[tool,'--arch=64','--endian=little','--no-exec-info','--input-file='+str(src),'--coq-output-dir='+str(out),'--coq-logic-path='+NS]);g=out/(stem+'_strategy_goal.v');shutil.copyfile(g,coq/g.name);fields=re.findall(r'^\s*Axiom (\w+)_correctness\s*:',g.read_text(),re.M);assert len(fields)==count
            strategies.append(dict(stem=stem,module_type=typ,checked_module=module,fields=fields,goal_sha256=sha(g)))
        units=[]
        for stem,count,module in [('signed_tail',41,'Qs8I8Cvt.SignedTailChecked.CheckedSignedTail'),('neon_composed',13,'Qs8I8Cvt.NeonComposedChecked.CheckedNeonComposed')]:
            out=run/(stem+'-generated');out.mkdir();cpp=run/(stem+'.c');exe(stem+'-cpp',['gcc','-E','-P','-CC','-nostdinc',CASE/'shim'/(stem+'.c'),'-o',cpp]);exe(stem+'-qcp',['qcp','--arch=64','--endian=little','--no-exec-info','--input-file='+str(cpp),'--coq-output-dir='+str(out),'--coq-logic-path='+NS,'-slp',CASE/'shim',NS,'-slp',CASE/'proof/c',NS]);g=out/(stem+'_goal.v');fields=re.findall(r'^Axiom proof_of_(\w+)\s*:',g.read_text(),re.M);assert len(fields)==count,(stem,len(fields));shutil.copyfile(g,coq/g.name);units.append(dict(stem=stem,fields=fields,checked_module=module,goal_sha256=sha(g),cpp_sha256=sha(cpp)))
        for n in mods:shutil.copyfile(CASE/'proof/coq'/(n+'.v'),coq/(n+'.v'))
        order=['Model','Types','MemoryModel','NeonStoreModel','ComposedModel','ByteBridge','NeonFrame','s8_arrays_strategy_goal','S8ArraysStrategy','s8_arrays_strategy_proof','signed_tail_strategy_goal','signed_tail_strategy_proof','ComposedBridge','signed_tail_goal','SignedTailChecked','neon_composed_goal','NeonComposedChecked'];flags=json.loads(a.config.read_text())['flags']+['-Q',str(coq),NS]
        for n in order:exe(n,[*flags,coq/(n+'.v')])
        gate=['Require Import '+ ' '.join(NS+'.'+n for n in ['NeonComposedChecked','SignedTailChecked','ComposedBridge'])+'.']
        for i,u in enumerate(units):
            gate+=['Module Unit%d : %s.%s_goal.VC_Correct := %s.'%(i,NS,u['stem'],u['checked_module'])]+['Print Assumptions Unit%d.proof_of_%s.'%(i,f)for f in u['fields']]
        for i,u in enumerate(strategies):
            gate+=['Module Strategy%d : %s.%s_strategy_goal.%s := %s.'%(i,NS,u['stem'],u['module_type'],u['checked_module'])]+['Print Assumptions Strategy%d.%s_correctness.'%(i,f)for f in u['fields']]
        math=re.findall(r'^Lemma (\w+)',(coq/'ComposedBridge.v').read_text(),re.M);assert len(math)==6
        gate+=['Print Assumptions '+NS+'.ComposedBridge.'+f+'.'for f in math];(coq/'ComposedGate.v').write_text('\n'.join(gate)+'\n');exe('ComposedGate',[*flags,coq/'ComposedGate.v']);order+=['ComposedGate']
        if inputs!={n:sha(CASE/n)for n in inputs}:raise ValueError('Source drift during fresh composition proof')
        s.update(passed=True,vc_correct_passed=True,checked_c_vcs=13,canonical_provider_c_vcs=41,units=units,strategies=strategies,bridge_lemmas=math,no_component_vo_reused=True,compiled_source_sha256={n:sha(coq/(n+'.v'))for n in order},final_gate_sha256=sha(coq/'ComposedGate.v'),final_assumptions_log_sha256=sha(run/'ComposedGate.log'),config_sha256=sha(a.config))
    except Exception as e:s['error']=str(e)
    (run/'status.json').write_text(json.dumps(s,indent=2)+'\n');dest=CASE/'proof/neon-composed-status.json'
    if dest.exists():old=dest.read_bytes();(CASE/'proof/history'/('neon-composed-status-'+hashlib.sha256(old).hexdigest()+'.json')).write_bytes(old)
    dest.write_text(json.dumps(s,indent=2)+'\n');print(json.dumps({k:s.get(k)for k in ['passed','run_directory','error']},indent=2));return 0 if s['passed'] else 1
if __name__=='__main__':raise SystemExit(main())
