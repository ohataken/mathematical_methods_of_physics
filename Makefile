mobile.tex:
	echo "" > $@
	cat src/header_mobile.tex >> $@
	cat src/content.tex >> $@
	cat src/footer_mobile.tex >> $@

%.dvi: %.tex
	docker run --rm -v $(CURDIR):/workdir paperist/texlive-ja:alpine uplatex $<

%.pdf: %.dvi
	docker run --rm -v $(CURDIR):/workdir paperist/texlive-ja:alpine dvipdfmx $<

