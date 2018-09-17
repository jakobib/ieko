.SUFFIXES: .md .html

OPTIONS=-s --template ieko.html --css isko.css --filter=filter.pl\
	--include-before=ieko-head.html --include-after=ieko-foot.html \
	--toc --toc-depth=6

database.html: database.md

.md.html:
	pandoc ${OPTIONS} -o $@ $<
