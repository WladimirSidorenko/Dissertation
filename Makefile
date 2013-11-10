##################################################################
# Variables
BIBDIR := Bibliography

MAIN_FILE = sidarenka_thesis.pdf
LITERATURE_OVERVIEW = ${BIBDIR}/literature_overview.pdf

##################################################################
# Special Targets
.DELETE_ON_ERROR:

.PHONY: all clean

##################################################################
all: ${MAIN_FILE} ${LITERATURE_OVERVIEW}

${MAIN_FILE} ${LITERATURE_OVERVIEW}: %.pdf: %.tex
	@set -e; \
	pdflatex -halt-on-error -output-directory ${@D} $< && bibtex $(basename $<) && \
	pdflatex -halt-on-error -output-directory ${@D} $< && pdflatex -halt-on-error \
	-output-directory ${@D} $<

clean:
	-rm -f ${MAIN_FILE} ${LITERATURE_OVERVIEW}
