prefix ?= /usr/local

install: txt2man.1
	cp -p txt2man $(prefix)/bin/
	cp -p txt2man.1 $(prefix)/man/man1

txt2man.1 txt2man.man: txt2man
	./txt2man -h | ./txt2man -t txt2man >$@

txt2man.ps: txt2man.man
	groff -man txt2man.man > txt2man.ps

txt2man.html: txt2man.man
	rman -f HTML txt2man.man > txt2man.html
