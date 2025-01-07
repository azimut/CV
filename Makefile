MAILTO   ?= noreply@example.com
FULLNAME ?= John Doe
LINKEDIN ?= foobar

.EXPORT_ALL_VARIABLES:

.PHONY: all
all: CV.pdf CV_es.pdf

%.pdf: %.tex about.tex education.tex setup.tex
	pdflatex --enable-pipes --shell-escape $<

.PHONY: clean
clean: ; rm -vf *.pdf *.aux *.log *.out
