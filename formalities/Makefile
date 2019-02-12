##################################################################
# Variables
APPLICATION_FILE := application.pdf
AUTHORSHIP_STATEMENT_FILE := authorship_statement.pdf
EXCLUSIVITY_DECLARATION_FILE := exclusivity_declaration.pdf
SUBJECT_DECLARATION_FILE := subject_declaration.pdf

##################################################################
# Special Targets
.DELETE_ON_ERROR:

.PHONY: all application authorship_statement exclusivity_declaration subject_declaration \
	clean clean_application clean_authorship_statement clean_exclusivity_declaration \
	clean_subject_declaration

##################################################################
# Main Target
all: application authorship_statement exclusivity_declaration subject_declaration

clean: clean_application clean_authorship_statement clean_exclusivity_declaration \
	clean_subject_declaration
	-rm -f *.lot *.log *.aux *.out *.bbl *.lof *.blg

##################################################################
# Application
application: ${APPLICATION_FILE}

clean_application:
	-rm -f ${APPLICATION_FILE}

##################################################################
# Authorship Statement
authorship_statement: ${AUTHORSHIP_STATEMENT_FILE}

clean_authorship_statement:
	-rm -f ${AUTHORSHIP_STATEMENT_FILE}

##################################################################
# Exclusivity Declaration
exclusivity_declaration: ${EXCLUSIVITY_DECLARATION_FILE}

clean_exclusivity_declaration:
	-rm -f ${EXCLUSIVITY_DECLARATION_FILE}

##################################################################
# Subject Declaration
subject_declaration: ${SUBJECT_DECLARATION_FILE}

clean_subject_declaration:
	-rm -f ${SUBJECT_DECLARATION_FILE}

##################################################################
# PDF Files
%.pdf: %.tex
	@set -e; \
	pdflatex -halt-on-error -output-directory ${@D} $< && \
	pdflatex -halt-on-error -output-directory ${@D} $<
