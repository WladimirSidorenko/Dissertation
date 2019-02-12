##################################################################
# Variables
APPLICATION_FILE := application.pdf
DECLARATION_FILE := declaration.pdf
COMMITTEE_LIST_FILE := committee_list.pdf

##################################################################
# Special Targets
.DELETE_ON_ERROR:

.PHONY: all application declaration \
	clean clean_application clean_declaration

##################################################################
# Main Target
all: application declaration committee_list

clean: clean_application clean_declaration
	-rm -f *.lot *.log *.aux *.out *.bbl *.lof *.blg

##################################################################
# Application
application: ${APPLICATION_FILE}

clean_application:
	-rm -f ${APPLICATION_FILE}

##################################################################
# Declaration
declaration: ${DECLARATION_FILE}

clean_declaration:
	-rm -f ${DECLARATION_FILE}

##################################################################
# Committee
committee_list: ${COMMITTEE_LIST_FILE}

clean_committee_list:
	-rm -f ${COMMITTEE_LIST_FILE}

##################################################################
# PDF Files
%.pdf: %.tex
	@set -e; \
	pdflatex -halt-on-error -output-directory ${@D} $< && \
	pdflatex -halt-on-error -output-directory ${@D} $<
