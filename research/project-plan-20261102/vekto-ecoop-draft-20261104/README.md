# Vekto: ECOOP working draft

2026-11-04. English LaTeX draft; no Abstract, as requested by the author.

The nine-part narrative revision restores the author's nine-part narrative, following renewed review of SALTyRN and TopoVerus. `author-input/INTRODUCTION-PROMPT.zh-CN.md` preserves the author's original prompt, subsequent feedback, and eight writing rules. `author-input/INTRODUCTION-RESET-CONTEXT.zh-CN.md` records the working context and lessons from prior revisions. `review/intro-narrative-reset-20261104/REVIEW.zh-CN.md` contains each revised Chinese translation, the corresponding original prompt paragraph, and the English text. Earlier revisions remain under `review/`; they do not represent the latest author requirements. Other manuscript sections retain their previous text.

## Read and edit

- `vekto-draft.pdf`: compiled review copy.
- `main.tex`: Overleaf main document, using the official LIPIcs class in anonymous mode.
- `sections/introduction.tex`: the nine-paragraph Introduction.
- `sections/example.tex`: the evidence-backed but incomplete maximum example.
- `sections/guarantee.tex`: observations, contracts, partial correctness, memory obligations, and trust boundaries.
- `sections/evaluation.tex`: planned experiments, with unmeasured results left as red TODOs.
- `sections/related.tex`: initial related-work comparison.
- `CLAIM-AUDIT.zh-CN.md`: Chinese explanation of factual corrections and open issues.
- `QCP-GUARANTEE-AUDIT.zh-CN.md`: source and literature evidence for the current proof scope.

Use `\todo{...}` for unresolved statements or results. `\tool` expands to Vekto. The `\fix` and `\new` margin markers are available. Code listings are editable text, not screenshots. Tables are LaTeX. No synthetic performance values are used in this draft.

The document is a working manuscript, not a submission-ready paper. The example reuses archived measurements and counterexample records; no proof or kernel benchmark was rerun for this writing task. Its repaired final optimized target still needs a complete proof. The main 35-kernel evaluation remains pending. Historical intermediate-target proofs do not count toward that cohort.

## Compile

Upload the source archive to Overleaf, select `main.tex`, and use pdfLaTeX. Locally, with a complete TeX Live installation:

```sh
bash build.sh
```

The build runs pdfLaTeX, BibTeX, and two further pdfLaTeX passes. Dependencies include the standard LIPIcs packages, listings, booktabs, xcolor, and xspace. The official class and its PDF assets, plus `plainurl.bst`, are bundled. The bibliography style and class are unmodified.

The server's minimal TinyTeX installation needed extra packages in `/tmp/vekto-texmf`. Local validation used its installed LaTeX tools directory ahead of newer CTAN tools to match the preloaded 2025-11-01 format. These temporary environment paths are not required on Overleaf or a coherent full TeX Live installation. No shared toolchain was updated.

## Evidence and provenance

`evidence/source-manifest.json` records original local paths and hashes for copied implementation/model files. The other evidence files preserve archived counterexample and performance records. These files document a candidate example, not a self-contained proof artifact or full benchmark reproduction package. Full source and model context remains in the project repository.

Official template: <https://submission.dagstuhl.de/styles/download-tag/lipics/v2021.1.3/authors/zip>.
Conference requirements: <https://2027.ecoop.org/track/ecoop-2027-technical-papers>.
Bibliography style: <https://mirrors.ctan.org/biblio/bibtex/contrib/urlbst.zip>.

The official template archive, guidelines, sample, and license are preserved under `vendor/`. Author metadata retains the supplied incomplete email; complete it before submission. Anonymous mode currently suppresses that metadata in the PDF. Add the Abstract only when the author requests it.

## Validation

The PDF was compiled successfully and selected pages were visually inspected. Final compilation has no undefined references, missing citations, or overfull boxes. A few underfull paragraph/page warnings remain. The citations and substantive corrections are documented in the Chinese audit; the bibliography is initial coverage, not a systematic novelty survey.

Latest prose revision: `review/intro-flow-20261104/REVIEW.zh-CN.md` records paragraph flow, the Keagan comparison, human semantic review, final-manuscript tense with pending results marked, and the concise reward-hacking sentence.
