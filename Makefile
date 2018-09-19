.SUFFIXES: .md .html

OPTIONS=-s --template ieko.html --css isko.css --filter=filter.pl\
	--include-before=ieko-head.html --include-after=ieko-foot.html \
	--toc --toc-depth=6

.PHONY: build

build: database.html README.html
	mkdir -p build 
	cp database.html build
	cp README.html build/index.html
	cp isko.css build
	cp *.jpg build

database.html: database.md

.md.html:
	pandoc ${OPTIONS} -o $@ $<
