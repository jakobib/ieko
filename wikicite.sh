#!/bin/bash -e

sources=*.md
bibliography=bibliograpy.json
citation_js=./node_modules/citation-js/bin/cmd.js
references=wikicite-references.json

# extract citation keys from sources
pandoc -t json $sources \
	| jq -r '..|objects|select(.t=="Cite")|.c[0][].citationId' \
    | sort | uniq > citekeys

# merge new citation keys into citekeys.csv
tempfile=$(mktemp)
join -t , -j 1 -a 1 -a 2 citekeys.csv citekeys > $tempfile
mv $tempfile citekeys.csv

[ -f "$references" ] || echo [] > $references

# load Wikidata items listed in citekeys.csv but not in $references
diff --new-line-format="" --unchanged-line-format="" \
    <(awk -F , '{print $1;print $2}' citekeys.csv | grep '^Q[1-9][0-9]*$' | sort) \
    <(jq -r .[].id $references | grep '^Q[1-9][0-9]*$' | sort) \
    | $citation_js > references.tmp

# merge into $references
jq -sS '[.[][]]' references.tmp $references > $tempfile
mv $tempfile $references
rm references.tmp

echo "number of references: " $(jq length $references)

# use expand-$references to set note field and duplicate items with citekey-aliases
