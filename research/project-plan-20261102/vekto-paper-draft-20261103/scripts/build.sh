#!/usr/bin/env bash
set -euo pipefail
cd "$(dirname "$0")/.."
python3 scripts/build_tables.py
python3 scripts/render_figures.py
(
  cd tables
  pdflatex -interaction=nonstopmode -halt-on-error tables.en.tex
  pdflatex -interaction=nonstopmode -halt-on-error tables.en.tex
  xelatex -interaction=nonstopmode -halt-on-error tables.zh.tex
  xelatex -interaction=nonstopmode -halt-on-error tables.zh.tex
)
python3 scripts/render_table_previews.py
python3 scripts/check_bundle.py
