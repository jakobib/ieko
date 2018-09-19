.SUFFIXES: .md .html

OPTIONS=-s --template ieko.html --css isko.css --filter=filter.pl\
	--include-before=ieko-head.html --include-after=ieko-foot.html \
	--toc --toc-depth=6

build/index.html: database.html
	mkdir -p build 
	cp $< $@
	cp ieko-*.html build
	cp isko.css build
	cp *.jpg build

database.html: database.md

.md.html:
	pandoc ${OPTIONS} -o $@ $<
