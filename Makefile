%.tex:
	echo "" > tmp/$@
	cat src/header_$*.tex >> tmp/$@
	cat src/content.tex >> tmp/$@
	cat src/footer_$*.tex >> tmp/$@

%.dvi: %.tex
	docker run --rm -v $(CURDIR)/tmp:/workdir paperist/texlive-ja:alpine uplatex $<

%.pdf: %.dvi
	docker run --rm -v $(CURDIR)/tmp:/workdir paperist/texlive-ja:alpine dvipdfmx $<

