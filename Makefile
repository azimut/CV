MAILTO ?= noreply@example.com
FULLNAME ?= John Doe
LINKEDIN ?= foobar
DEPS := about.tex education.tex setup.tex

.EXPORT_ALL_VARIABLES:

.PHONY: all
all: CV.pdf CV_es.pdf

%.pdf: %.tex $(DEPS)
	pdflatex --enable-pipes --shell-escape $<

.PHONY: clean
clean: ; rm -vf *.pdf
