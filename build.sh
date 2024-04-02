cd paper
pandoc --bibliography article.bibtex --citeproc article.md -o article.pdf --from markdown --metadata-file=metadata.yaml --data-dir=../data --template eisvogel.tex --listings -F panflute