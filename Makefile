MAILTO   ?= noreply@example.com
FULLNAME ?= John Doe
LINKEDIN ?= foobar

.EXPORT_ALL_VARIABLES:

.PHONY: all
all: CV.pdf CV_es.pdf CV.png CV_es.png

%.png: %.pdf
	convert -density 300 $< \
		-background white \
		-alpha remove -alpha off -quality 90 \
		$@

%.pdf: %.tex about.tex education.tex setup.tex
	pdflatex --enable-pipes --shell-escape $<
	pdfinfo $@ | awk '/Pages:/ && $$2 != 1 { exit(1) }' # fail on >1 page

.PHONY: clean
clean: ; rm -vf *.pdf *.aux *.log *.out *.png
