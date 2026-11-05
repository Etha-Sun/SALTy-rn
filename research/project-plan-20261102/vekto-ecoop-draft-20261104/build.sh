#!/usr/bin/env bash
set -euo pipefail
cd -- "$(dirname -- "$0")"
mkdir -p build
pdflatex -interaction=nonstopmode -halt-on-error -output-directory=build main.tex
BIBINPUTS=".:${BIBINPUTS:-}" BSTINPUTS=".:${BSTINPUTS:-}" bibtex build/main
pdflatex -interaction=nonstopmode -halt-on-error -output-directory=build main.tex
pdflatex -interaction=nonstopmode -halt-on-error -output-directory=build main.tex
cp build/main.pdf vekto-draft.pdf
