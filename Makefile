SRC = $(wildcard *.tex)

PDFS = $(SRC:.tex=.pdf)
PYTHON ?= python

all:	pdf

en:	clean xelatex resume.tex

zh_CN:	resume-zh_CN.pdf

pdf:	$(PDFS)

resume-zh_CN.pdf: resume-zh_CN.tex resume.cls $(wildcard *.sty fonts/Main/*.otf fonts/zh_CN-Adobe/*.otf) build_resume.py
	"$(PYTHON)" build_resume.py

%.pdf:  %.tex
	xelatex $<

ifeq ($(OS),Windows_NT)
  # on Windows
  RM = cmd //C del
else
  # on Unix/Linux
  RM = rm -f
endif

clean:
	$(RM) *.log *.aux *.bbl *.blg *.synctex.gz *.out *.toc *.lof *.idx *.ilg *.ind *.pdf
