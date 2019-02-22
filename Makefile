.SUFFIXES: .md .html

OPTIONS=-s --template ieko.html --css isko.css -F filter.pl -F pwcite\
	--include-before=ieko-head.html\
	--toc --toc-depth=6\
	-F pandoc-citeproc\
	-M link-citations=true\
	-M csl=chicago-author-date.csl\

.PHONY: build

build: README.html
	./build.sh database
	@cp README.html build/index.html

.md.html:
	pandoc ${OPTIONS} -o $@ $< ieko-foot.yaml
