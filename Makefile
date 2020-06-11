## Markdown extension (e.g. md, markdown, mdown).
MEXT = md

## Bibliography Location
BIB = bib/bibliography.bib

## All markdown files in the working directory except for README.md
README = README.md
SRC = $(filter-out $(README),$(wildcard *.$(MEXT)))

PDFS = $(patsubst %.md,%.pdf,$(SRC))

## Pandoc options to use for all document types
OPTIONS = markdown+simple_tables+table_captions+yaml_metadata_block+smart
SLIDES_DIR = reports/slides

.PHONY: all

all: $(PDFS) slides

%.pdf: %.md config/metadata.yml config/current-date.lua
	pandoc -r $(OPTIONS) \
	-s \
	--pdf-engine=pdflatex \
	-F pandoc-crossref \
	config/metadata.yml \
	--lua-filter=config/current-date.lua \
	-o $@ $<
# 	--template=$(PREFIX)/templates/latex.template \
# 	--csl=$(PREFIX)/csl/$(CSL).csl \
 	--filter pandoc-citeproc \
 	--bibliography=$(BIB) 

slides:
	$(MAKE) -C $(SLIDES_DIR)


clean:
	rm -f *.pdf

