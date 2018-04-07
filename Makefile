all : html

html: README.md
	mkdir -p output
	generate-md --layout github --input ./README.md --output ./output	

clean :
	rm -f *.tex
	rm -f *.tuc
	rm -f *.log
	rm -Rf output
