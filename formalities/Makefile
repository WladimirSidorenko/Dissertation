##################################################################
# Variables
APPLICATION_FILE := application.pdf
DECLARATION_FILE := declaration.pdf
COMMITTEE_FILE := committee.pdf
PUBLICATIONS_FILE := publications.pdf
REVIEWERS_FILE := reviewers.pdf

##################################################################
# Special Targets
.DELETE_ON_ERROR:

.PHONY: all application declaration committee publications reviewers \
	clean clean_application clean_declaration clean_committee \
	clean_publications clean_reviewers

##################################################################
# Main Target
all: application committee declaration reviewers

clean: clean_application clean_committee clean_declaration \
	clean_reviewers
	-rm -f *.lot *.log *.aux *.out *.bbl *.lof *.blg

##################################################################
# Application
application: ${APPLICATION_FILE}

clean_application:
	-rm -f ${APPLICATION_FILE}

##################################################################
# Committee
committee: ${COMMITTEE_FILE}

clean_committee:
	-rm -f ${COMMITTEE_FILE}

##################################################################
# Declaration
declaration: ${DECLARATION_FILE}

clean_declaration:
	-rm -f ${DECLARATION_FILE}

##################################################################
# Publications
publications: ${PUBLICATIONS_FILE}

clean_publications:
	-rm -f ${PUBLICATIONS_FILE}

##################################################################
# Publications
reviewers: ${REVIEWERS_FILE}

clean_reviewers:
	-rm -f ${REVIEWERS_FILE}

##################################################################
# PDF Files
%.pdf: %.tex
	@set -e; \
	pdflatex -halt-on-error -output-directory ${@D} $< && \
	pdflatex -halt-on-error -output-directory ${@D} $<
