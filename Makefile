.SUFFIXES: .md .html

OPTIONS=-s --template ieko.html --css isko.css --filter=filter.pl\
	--include-before=ieko-head.html --include-after=ieko-foot.html \
	--toc --toc-depth=6\
	--bibliography=bibliography.bib\
	--bibliography=wikicite-references-expanded.json\
	-M link-citations=true\
	-M csl=chicago-author-date.csl

.PHONY: build wikicite-references.json

build: database.html README.html
	mkdir -p build 
	cp database.html build
	cp README.html build/index.html
	cp isko.css build
	cp *.jpg build
	cp *.png build
	cp *.svg build
	cp *.js build

wikicite-references.json:
	./wikicite.sh

wikicite-references-expanded.json: wikicite-references.json
	node ./expand-references.js $< > $@

database.html: database.md wikicite-references-expanded.json

.md.html:
	pandoc ${OPTIONS} -o $@ $<


