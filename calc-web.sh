#!/bin/bash

tmpfile=$(mktemp)

mkdir -p _site

cp -r css images _site

ls {about,contact}.md | sed s/.md//g | xargs -l -iREPLACE pandoc -f markdown -t html --template=templates/default.html REPLACE.md -o _site/REPLACE.html

mkdir -p _site/posts
find posts -name "*.md" | sed s/.md//g | xargs -l -IREPLACE pandoc -f markdown -t html --template=templates/default.html REPLACE.md -o _site/REPLACE.html

rm $tmpfile
