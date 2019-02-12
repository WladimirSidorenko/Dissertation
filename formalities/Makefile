##################################################################
# Variables
APPLICATION_FILE := application.pdf
COMMITTEE_FILE := committee.pdf
CV_FILE := cv.pdf
DECLARATION_FILE := declaration.pdf
PUBLICATIONS_FILE := publications.pdf
REVIEWERS_FILE := reviewers.pdf

##################################################################
# Special Targets
.DELETE_ON_ERROR:

.PHONY: all application committee cv declaration publications reviewers \
	clean clean_application clean_committee clean_cv \
	clean_declaration clean_publications clean_reviewers

##################################################################
# Main Target
all: application committee cv declaration publications reviewers

clean: clean_application clean_committee clean_cv clean_declaration \
	clean_publications clean_reviewers
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
# CV
cv: ${CV_FILE}

clean_cv:
	-rm -f ${CV_FILE}

##################################################################
# Declaration
declaration: ${DECLARATION_FILE}

clean_declaration:
	-rm -f ${DECLARATION_FILE}

##################################################################
# Publications
publications: ${PUBLICATIONS_FILE}

${PUBLICATIONS_FILE}: %.pdf: %.tex ../bibliography.bib
	set -e; \
	pdflatex -halt-on-error -output-directory ${@D} $< && \
	bibtex $(basename $<) && \
	pdflatex -halt-on-error -output-directory ${@D} $< && \
	pdflatex -halt-on-error -output-directory ${@D} $<

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
