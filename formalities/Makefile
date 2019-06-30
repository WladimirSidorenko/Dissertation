##################################################################
# Variables
ABSTRACT_FILE := abstract.pdf
APPLICATION_FILE := application.pdf
COMMITTEE_FILE := committee.pdf
CV_FILE := cv.pdf
DECLARATION_FILE := declaration.pdf
PUBLICATIONS_FILE := publications.pdf
REVIEWERS_FILE := reviewers.pdf
SUMMARY_FILE := summary.pdf
THESES_FILE := theses.pdf

##################################################################
# Special Targets
.DELETE_ON_ERROR:

.PHONY: all application committee cv declaration publications reviewers \
	summary theses \
	clean clean_application clean_committee clean_cv \
	clean_declaration clean_publications clean_reviewers \
	clean_summary clean_theses

##################################################################
# Main Target
all: abstract application committee cv declaration publications reviewers summary \
	theses

clean: clean_abstract clean_application clean_committee clean_cv clean_declaration \
	clean_publications clean_reviewers clean_summary clean_theses
	-rm -f *.lot *.log *.aux *.out *.bbl *.lof *.blg

##################################################################
# Application
abstract: ${ABSTRACT_FILE}

clean_abstract:
	-rm -f ${ABSTRACT_FILE}

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

clean_publications:
	-rm -f ${PUBLICATIONS_FILE}

##################################################################
# Reviewers
reviewers: ${REVIEWERS_FILE}

clean_reviewers:
	-rm -f ${REVIEWERS_FILE}

##################################################################
# Summary
summary: ${SUMMARY_FILE}

clean_summary:
	-rm -f ${SUMMARY_FILE}

##################################################################
# Theses
theses: ${THESES_FILE}

clean_theses:
	-rm -f ${THESES_FILE}

##################################################################
# PDF + BibTeX Files
${PUBLICATIONS_FILE} ${SUMMARY_FILE}: %.pdf: %.tex ../bibliography.bib
	set -e; \
	pdflatex -halt-on-error -output-directory ${@D} $< && \
	bibtex $(basename $<) && \
	pdflatex -halt-on-error -output-directory ${@D} $< && \
	pdflatex -halt-on-error -output-directory ${@D} $<

##################################################################
# PDF Files
%.pdf: %.tex
	@set -e; \
	pdflatex -halt-on-error -output-directory ${@D} $< && \
	pdflatex -halt-on-error -output-directory ${@D} $<
