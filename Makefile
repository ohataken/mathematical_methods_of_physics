mobile.tex:
	echo "" > mobile.tex
	cat src/header_mobile.tex >> mobile.tex
	cat src/content.tex >> mobile.tex
	cat src/footer_mobile.tex >> mobile.tex

mobile.dvi: mobile.tex
	docker run --rm -v $(CURDIR):/workdir paperist/texlive-ja:alpine uplatex mobile.tex

mobile.pdf: mobile.dvi
	docker run --rm -v $(CURDIR):/workdir paperist/texlive-ja:alpine dvipdfmx mobile.dvi

