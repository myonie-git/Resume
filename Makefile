MAIN   = resume-zh_CN
TEX    = xelatex
FLAGS  = -interaction=nonstopmode -halt-on-error
DEPS   = $(MAIN).tex resume.cls $(wildcard *.sty fonts/Main/*.otf fonts/zh_CN-Adobe/*.otf)

.PHONY: all pdf zh_CN preview clean distclean

all: pdf

pdf zh_CN: $(MAIN).pdf

$(MAIN).pdf: $(DEPS)
	$(TEX) $(FLAGS) $(MAIN).tex

# 生成每页的 PNG 预览（需要 pdftoppm）
preview: $(MAIN).pdf
	pdftoppm -r 110 -png $(MAIN).pdf $(MAIN)

# 只清理中间文件，保留 PDF
clean:
	rm -f *.log *.aux *.out *.toc *.synctex.gz *.bbl *.blg

# 连 PDF 和预览图一起清理
distclean: clean
	rm -f $(MAIN).pdf $(MAIN)-*.png
