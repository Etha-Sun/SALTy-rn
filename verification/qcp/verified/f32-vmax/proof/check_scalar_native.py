#!/usr/bin/env python3
"""Check the new formal C bodies against the existing independent literal table."""
from pathlib import Path
import hashlib
import json
import subprocess
import tempfile

HERE = Path(__file__).resolve().parent
CASE = HERE.parent
run = Path(tempfile.mkdtemp(prefix='scalar-native-', dir=CASE / '.build'))
text = (CASE / 'shim/harness.c').read_text()
start = text.index('struct known ')
end = text.index('static void require', start)
table = text[start:end]
assert '0x7fc12345' in table and 'left-snan-positive' in table, 'Independent NaN/sNaN table changed'
source = '''#include <stdint.h>
#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <math.h>
float qcp_fmax_arm(float,float);
float qcp_fmax_rvv(float,float);
float qcp_fmax_rvv_add(float,float);
int qcp_fmax_rvv_ne(float,float);
static uint32_t bits(float x){uint32_t b;memcpy(&b,&x,4);return b;}
static float value(uint32_t b){float x;memcpy(&x,&b,4);return x;}
''' + table + '''
int main(void) {
 size_t checks=0;
 for(size_t i=0;i<sizeof(known)/sizeof(known[0]);i++) {
  const struct known *v=known+i;float a=value(v->a),b=value(v->b);
  if(bits(qcp_fmax_arm(a,b))!=v->amax || bits(qcp_fmax_rvv(a,b))!=v->rmax) {
   fprintf(stderr,"max bit oracle: %s\\n",v->name);return 1;
  }
  if(qcp_fmax_rvv_ne(a,b)!=(a!=b)) {fprintf(stderr,"ne oracle: %s\\n",v->name);return 2;}
  checks+=3;
  if(isnan(a)||isnan(b)) {
   if(bits(qcp_fmax_rvv_add(a,b))!=0x7fc00000U){fprintf(stderr,"canonical add: %s\\n",v->name);return 3;}
   checks++;
  }
 }
 if(bits(qcp_fmax_rvv_add(1.0f,2.0f))!=0x40400000U ||
    bits(qcp_fmax_rvv_add(value(0x7f800000U),value(0xff800000U)))!=0x7fc00000U ||
    bits(qcp_fmax_rvv_add(value(0x80000000U),value(0x80000000U)))!=0x80000000U) return 4;
 checks+=3;
 printf("{\\"passed\\":true,\\"checks\\":%zu}\\n",checks);return 0;
}
'''
(run / 'driver.c').write_text(source)
command = ['gcc', '-std=c11', '-O1', '-g', '-fno-pie', '-no-pie', '-fno-omit-frame-pointer',
           '-fno-fast-math', '-ffp-contract=off', '-frounding-math',
           '-fsanitize=address,undefined', '-fno-sanitize-recover=all',
           str(CASE / 'shim/bits.c'), str(CASE / 'shim/scalar_primitives.c'),
           str(run / 'driver.c'), '-lm', '-o', str(run / 'driver')]
records = []
status = {'passed': False, 'whole_kernel_proved': False,
          'scope': 'Finite regression of new scalar shim C against literal expected bits; not hardware execution',
          'run_directory': str(run), 'records': records}
try:
    for label, cmd in [('build', command), ('run', [str(run / 'driver')])]:
        result = subprocess.run(cmd, cwd=run, capture_output=True, text=True, timeout=120)
        (run / (label + '.log')).write_text(result.stdout + result.stderr)
        records.append({'command': cmd, 'exit_code': result.returncode})
        if result.returncode:
            raise RuntimeError(result.stdout + result.stderr)
    status.update(json.loads(result.stdout.strip()))
except Exception as error:
    status['error'] = str(error)
    print(error)
finally:
    paths = [CASE / 'shim/bits.c', CASE / 'shim/bits.h', CASE / 'shim/formal_model.h',
             CASE / 'shim/scalar_primitives.c', CASE / 'shim/harness.c', Path(__file__)]
    status['sources_sha256'] = {str(p.relative_to(CASE)): hashlib.sha256(p.read_bytes()).hexdigest() for p in paths}
    (run / 'status.json').write_text(json.dumps(status, indent=2) + '\n')
    (HERE / 'scalar-native-status.json').write_text(json.dumps(status, indent=2) + '\n')
print(json.dumps({k: status[k] for k in ['passed', 'run_directory']}))
raise SystemExit(not status['passed'])
