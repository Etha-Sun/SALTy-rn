#!/usr/bin/env python3
"""Refresh the repair summary from actual original/repaired replay records."""
import hashlib
import json
from pathlib import Path
HERE=Path(__file__).resolve().parent
CASE=HERE.parent
sha=lambda p:hashlib.sha256(p.read_bytes()).hexdigest()
def main():
 original=json.loads((HERE/'original-replay-status.json').read_text())
 repaired=json.loads((HERE/'repaired-replay-status.json').read_text())
 old=json.loads((HERE/'history/original-121-case-replay-status.json').read_text())
 assert original['replay_passed'] and repaired['replay_passed'] and repaired['counterexamples']==[]
 assert original['cases']==repaired['cases']==275 and len(original['counterexamples'])==154
 assert old['cases']==121 and len(old['counterexamples'])==44
 for replay in [original,repaired]:
  for relative,digest in replay['input_hashes'].items():
   assert sha(CASE/relative)==digest,'Replay input changed: '+relative
 first=original['counterexamples'][0]
 after=next(x for x in repaired['representative_results'] if x['pattern']==first['pattern'])
 status={'schema':1,'kernel':CASE.name,'status':'in-progress','implementation_variant':'repaired','implementation_status':'repaired_native_checked',
 'whole_kernel_proved':False,'qcp_c_vcs_proved':0,'scope':'User-authorized direct RVV implementation repair with original counterexamples retained; native C-shim regression only, no completed QCP proof or hardware execution.',
 'known_prior_frama_c_issue':True,'repair_record':'repair.json','repair_record_sha256':sha(HERE/'repair.json'),
 'native_replay_passed':True,'cases':repaired['cases'],'counterexample_count':0,'primitive_checks':repaired['primitive_checks'],
 'asan_ubsan_checked':True,'patch_exact_application_checked':True,'wrong_result_rejected':True,
 'minimal_original_counterexample':first,'same_input_after_repair':after,
 'original_variant':{'status':'counterexample','cases':original['cases'],'counterexamples':len(original['counterexamples']),'evidence':'original-replay-status.json','sha256':sha(HERE/'original-replay-status.json')},
 'historical_original_evidence':{'cases':121,'counterexamples':44,'evidence':'history/original-121-case-replay-status.json','sha256':sha(HERE/'history/original-121-case-replay-status.json'),'preserved_without_modification':True},
 'repaired_variant':{'status':'repaired_native_checked','cases':repaired['cases'],'counterexamples':0,'evidence':'repaired-replay-status.json','sha256':sha(HERE/'repaired-replay-status.json')},
 'replay_status':'replay-status.json','replay_status_sha256':sha(HERE/'replay-status.json'),
 'originals':'originals.json','semantics':'semantics.json','repaired_variant_used':True,
 'limitations':['No complete QCP proof','No real Arm/RVV execution','NaN payload/sign and floating exception flags/traps are outside the observation','The added unconditional RVV addition may change exception flags']}
 (HERE/'status.json').write_text(json.dumps(status,ensure_ascii=False,indent=2)+'\n')
 print(json.dumps({'kernel':CASE.name,'implementation_status':status['implementation_status'],'cases':status['cases'],'counterexamples':0}))
if __name__=='__main__':main()
