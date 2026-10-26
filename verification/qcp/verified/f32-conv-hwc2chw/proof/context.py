"""Explicit relocatable case context. Importing a tool cannot mutate the case."""
from pathlib import Path
import hashlib,json,importlib.util,sys
NS='HwcConv'
CASE=None
ROOT=None
def require(value,message):
 if not value:raise ValueError(message)
def configure(case):
 global CASE,ROOT
 CASE=Path(case).resolve();require((CASE/'impl').is_dir()and(CASE/'proof/coq').is_dir(),'Incomplete case directory')
 ROOT=next((p for p in CASE.parents if(p/'.git').exists()),None);require(ROOT is not None,'Case must reside in audited repository')
 if str(CASE/'proof')not in sys.path:sys.path.insert(0,str(CASE/'proof'))
 return CASE
def sha(p):return hashlib.sha256(Path(p).read_bytes()).hexdigest()
def read(p):return json.loads(Path(p).read_text())
def case_path(relative):
 require(CASE is not None,'Configure --case first');require(not Path(relative).is_absolute(),'Case-relative source required')
 p=(CASE/relative).resolve();require(p.is_relative_to(ROOT),'Source escapes repository');return p

def load(name,path):
 spec=importlib.util.spec_from_file_location(name,path);m=importlib.util.module_from_spec(spec);spec.loader.exec_module(m)
 if hasattr(m,'configure'):m.configure(CASE)
 return m
