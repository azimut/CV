MAILTO ?= noreply@example.com
FULLNAME ?= John Doe
LINKEDIN ?= foobar

.EXPORT_ALL_VARIABLES:

CV.pdf: CV.tex
	pdflatex --enable-pipes --shell-escape CV.tex

.PHONY: clean
clean: ; rm -f CV.pdf
