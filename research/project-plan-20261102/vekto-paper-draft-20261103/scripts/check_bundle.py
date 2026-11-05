"""Check package identity, self-contained links, and generated table consistency."""
from pathlib import Path
import csv
import json
import re

ROOT = Path(__file__).resolve().parents[1]
inventory = json.loads((ROOT/'data/source-inventory.json').read_text())
assert len(inventory['kernels']) == 35
assert len({x['path'] for x in inventory['kernels']}) == 35
assert all(x['proof_status']=='not_run' for x in inventory['kernels'])
for lang, filename in [('en','paper.en.md'),('zh','paper.zh-CN.md')]:
    text = (ROOT/filename).read_text()
    assert '{{TABLE_' not in text
    assert all(x['path'] in text for x in inventory['kernels'])
    for name in ['scope','setup','kernels','extension']:
        src = (ROOT/f'tables/{name}.{lang}.tex').read_text().strip()
        assert src in text, (lang,name,'table source drift')
    prose = re.sub(r'```.*?```','',text,flags=re.S)
    # Quoted editorial bullet lists use Markdown syntax, not dash-joined clauses.
    prose = re.sub(r'^> - ', '', prose, flags=re.M)
    assert not re.search('[\u2013\u2014]| --- | - ',prose), filename
    assert 'ycsun@berkeley' in text and 'Vekto' in text
for md in ROOT.rglob('*.md'):
    text = re.sub(r'```.*?```','',md.read_text(),flags=re.S)
    for link in re.findall(r'!?\[[^\]]*\]\(([^)]+)\)',text):
        if link.startswith(('https://','http://','#','mailto:')):
            continue
        target = (md.parent/link.split('#')[0]).resolve()
        assert target.is_relative_to(ROOT.resolve()), (md,link,'outside package')
        assert target.exists(), (md,link,'missing file')
with (ROOT/'data/performance-synthetic.csv').open() as f:
    data = list(csv.DictReader(f))
assert len(data)==35 and all(x['data_kind']=='synthetic' for x in data)
for figure in json.loads((ROOT/'figures/figure_catalog.json').read_text()):
    assert all((ROOT/f).is_file() for f in figure['exports'])
for lang in ['en','zh']:
    log = (ROOT/f'tables/tables.{lang}.log')
    if log.exists():
        s=log.read_text()
        assert not re.search(r'Overfull|Missing character|^!',s,re.M),log
    assert (ROOT/f'tables/tables.{lang}.pdf').is_file()
print('PASS: 35 source identities, bilingual table consistency, local dependencies, synthetic-data separation, and TeX diagnostics.')
