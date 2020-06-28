# Makefile
prefix ?= /usr/local
version = txt2man-1.7.1
date = 2020-06-28
BIN = src2man bookman txt2man
MAN1 = src2man.1 txt2man.1 bookman.1

all: $(MAN1)

install: $(MAN1)
	mkdir -p $(prefix)/bin $(prefix)/share/man/man1
	cp $(BIN) $(prefix)/bin/
	cp $(MAN1) $(prefix)/share/man/man1

clean:
	rm -f *.1 *.txt *.ps *.pdf *.html

%.1:%.txt; ./txt2man -s 1 -t $* -r $(version) -d $(date) $< > $@
%.txt:%; ./$< -h 2>&1 > $@
%.html:%.1; rman -f HTML $< > $@
%.ps:%.1; groff -man $< > $@
%.pdf:%.ps; ps2pdf $< > $@
