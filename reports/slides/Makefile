SLIDES := $(patsubst %.md,%.pdf,$(wildcard *.md))

BIB = $(HOME)/Dropbox/Research/bib/bibliography-temp.bib
all : $(SLIDES)

%.pdf : %.md
	pandoc $^ -t beamer --slide-level 2 -o $@ -H header.tex \
	--filter pandoc-citeproc \
	--bibliography=$(BIB)

clobber : 
	rm -f $(SLIDES)
