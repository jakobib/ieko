.SUFFIXES: .md .html

OPTIONS=-s --template ieko.html --css isko.css -F filter.pl -F pwcite\
	--include-before=ieko-head.html\
	--toc --toc-depth=6\
	-F pandoc-citeproc\
	-M link-citations=true\
	-M csl=chicago-author-date.csl\

.PHONY: build

build: database.html README.html
	@mkdir -p build 
	@cp database.html build
	@cp README.html build/index.html
	@cp isko.css build
	@cp *.jpg build
	@cp *.png build

database.html: database.md wikicite-references.json

.md.html:
	pandoc ${OPTIONS} -o $@ $< ieko-foot.yaml
