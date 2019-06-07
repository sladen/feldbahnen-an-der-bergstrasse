#!/usr/bin/make -f

.SUFFIXES:
.SUFFIXES: .bib .pdf .tex

#%.pdf: %.latex
#	pdflatex $<
#	pdflatex $<
#	pdflatex $<
#	pdflatex $<

book.pdf: book.tex feldbahn.bib

.PHONY: all clean realclean

all: book.pdf

%.pdf: %.tex %.bbl
	pdflatex -interaction=nonstopmode $< -draftmode
	pdflatex -interaction=nonstopmode $<

%.bbl: %.aux
	bibtex $<

%.aux: %.bib
	pdflatex -interaction=nonstopmode book.tex -draftmode
	pdflatex -interaction=nonstopmode book.tex -draftmode

clean:
	rm -f *.aux *.lof *.log *.lot *.toc *.bbl *.blg

realclean: clean
	rm -f book.out
	rm -f book.pdf

