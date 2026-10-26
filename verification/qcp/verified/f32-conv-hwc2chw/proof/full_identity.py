"""Independent package audit adapter. No proof is executed or credited."""
from pathlib import Path
import package_checks

def identity(case,work,handoff=None):
 result=package_checks.audit_package(Path(case))
 if handoff is not None:
  package_checks.require(result==handoff['package_checks'],'Frozen package repair/native/SDK identity drift')
  package_checks.check_inputs(Path(case),handoff['frozen_source_sha256'])
 return result
