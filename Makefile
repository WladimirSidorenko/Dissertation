##################################################################
# Variables
BIBDIR := Bibliography
BIBFILE := bibliography.bib

MAIN_FILE = sidarenka_thesis.pdf
LITERATURE_OVERVIEW = ${BIBDIR}/literature_overview.pdf

##################################################################
# Special Targets
.DELETE_ON_ERROR:

.PHONY: all thesis literature_overview \
	clean clean_thesis clean_literature_overview

##################################################################
# Main Target
all: thesis literature_overview

clean: clean_thesis clean_literature_overview
	-rm -f *.log *.aux *.out *.bbl *.lof *.blg

##################################################################
# Thesis
thesis: ${MAIN_FILE}

clean_thesis:
	-rm -f ${MAIN_FILE}

##################################################################
# Literature Overview
literature_overview: ${LITERATURE_OVERVIEW}

clean_literature_overview:
	-rm -f ${LITERATURE_OVERVIEW}

##################################################################
# Thesis and Literature Overview Rule
${MAIN_FILE} ${LITERATURE_OVERVIEW}: %.pdf: %.tex ${BIBFILE} $(wildcard *.tex)
	@set -e; \
	pdflatex -halt-on-error -output-directory ${@D} $< && bibtex $(basename $<) && \
	pdflatex -halt-on-error -output-directory ${@D} $< && pdflatex -halt-on-error \
	-output-directory ${@D} $<

