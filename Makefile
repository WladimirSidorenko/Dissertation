##################################################################
# Variables
BIBDIR := Bibliography
BIBFILE := bibliography.bib

MAIN_FILE = sidarenka_thesis.pdf

##################################################################
# Special Targets
.DELETE_ON_ERROR:

.PHONY: all thesis \
	clean clean_thesis

##################################################################
# Main Target
all: thesis

clean: clean_thesis
	-rm -f *.log *.aux *.out *.bbl *.lof *.blg

##################################################################
# Thesis
thesis: ${MAIN_FILE}

clean_thesis:
	-rm -f ${MAIN_FILE}

##################################################################
# Main Thesis File
${MAIN_FILE}: %.pdf: %.tex ${BIBFILE} $(wildcard *.tex)
	@set -e; \
	pdflatex -halt-on-error -output-directory ${@D} $< && bibtex $(basename $<) && \
	pdflatex -halt-on-error -output-directory ${@D} $< && pdflatex -halt-on-error \
	-output-directory ${@D} $<

