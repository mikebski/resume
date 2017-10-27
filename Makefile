all : html pdf

html: buttondown.css README.md
	#pandoc -H buttondown.css resume.md >/var/www/resume.html
	pandoc -H buttondown.css README.md >~/Documents/resume.html

resume.tex : buttondown.css 
	#pandoc --standalone -t context resume.md -o resume.tex
	pandoc --standalone -t context README.md -o resume.tex

word: buttondown.css README.md
	#pandoc -H buttondown.css resume.md -o resume.docx
	pandoc -H buttondown.css README.md -o resume.docx
	cp resume*.docx ~/Documents/

pdf : resume.tex
	#context resume.tex
	context resume.tex
	cp resume*.pdf ~/Documents/

clean :
	rm *.tex
	rm *.tuc
	rm *.log
