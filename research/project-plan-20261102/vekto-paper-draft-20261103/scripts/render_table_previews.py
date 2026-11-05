"""Render the actual compiled LaTeX tables for Markdown readers."""
from pathlib import Path
import pymupdf

ROOT = Path(__file__).resolve().parents[1]
OUT = ROOT / 'tables/previews'
OUT.mkdir(exist_ok=True)
for lang in ['en','zh']:
    doc = pymupdf.open(ROOT / f'tables/tables.{lang}.pdf')
    names = ['scope','setup','kernels','extension']
    if len(doc) != len(names):
        raise ValueError('Table pagination changed; inspect and update the preview page mapping.')
    for i,name in enumerate(names):
        page = doc[i]
        boxes = [pymupdf.Rect(b[:4]) for b in page.get_text('blocks')
                 if not (b[4].strip().isdigit() and b[1] > .8*page.rect.height)]
        boxes.extend(d['rect'] for d in page.get_drawings())
        clip = boxes[0]
        for r in boxes[1:]:
            clip |= r
        clip = pymupdf.Rect(clip.x0-5,clip.y0-5,clip.x1+5,clip.y1+5) & page.rect
        page.get_pixmap(matrix=pymupdf.Matrix(2.4,2.4),clip=clip).save(OUT / f'{name}.{lang}.png')
print('Rendered eight previews from the compiled LaTeX tables.')
