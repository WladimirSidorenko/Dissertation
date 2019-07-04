##################################################################
# Variables
SRC_FILE := sidarenka_phd_presentation.ipynb
CSS_FILE := custom.css
PRESENTATION_FILE := $(addsuffix .slides.html, $(basename $(SRC_FILE)))

##################################################################
# Special Targets
.DELETE_ON_ERROR:

.PHONY: all presentation \
	clean clean_presentation

##################################################################
# Main Target
all: presentation

clean: clean_presentation

##################################################################
# Presentation
presentation: ${PRESENTATION_FILE} ${CSS_FILE}

PRESENTATION_FILE:
	jupyter nbconvert $< --to slides --reveal-prefix reveal.js \
	--SlidesExporter.reveal_theme=sky --post serve

clean_presentation:
	-rm -f ${PRESENTATION_FILE}
