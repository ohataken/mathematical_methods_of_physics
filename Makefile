mobile.tex:
	echo "" > tmp/$@
	cat src/header_mobile.tex >> tmp/$@
	cat src/content.tex >> tmp/$@
	cat src/footer_mobile.tex >> tmp/$@

%.dvi: %.tex
	docker run --rm -v $(CURDIR)/tmp:/workdir paperist/texlive-ja:alpine uplatex $<

%.pdf: %.dvi
	docker run --rm -v $(CURDIR)/tmp:/workdir paperist/texlive-ja:alpine dvipdfmx $<

