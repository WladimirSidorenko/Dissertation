##################################################################
# Variables
MAIN_FILE = sidarenka_thesis.pdf

##################################################################
# Special Targets
.DELETE_ON_ERROR:

.PHONY: all

##################################################################
all: ${MAIN_FILE}

${MAIN_FILE}: $(basename $(MAIN_FILE)).tex
	set -e; \
	pdflatex -halt-on-error $< && bibtex $(basename $<) && pdflatex -halt-on-error $<
