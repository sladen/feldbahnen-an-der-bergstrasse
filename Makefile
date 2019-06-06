#!/usr/bin/make -f

%.pdf: %.latex
	pdflatex $<

all: book.pdf

.PHONY: all