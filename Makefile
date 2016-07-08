all : html pdf

html: buttondown.css resume-developer.md
	#pandoc -H buttondown.css resume.md >/var/www/resume.html
	pandoc -H buttondown.css resume-developer.md >/var/www/resume-developer.html

resume.tex : buttondown.css 
	#pandoc --standalone -t context resume.md -o resume.tex
	pandoc --standalone -t context resume-developer.md -o resume-developer.tex

word: buttondown.css resume-developer.md
	#pandoc -H buttondown.css resume.md -o resume.docx
	pandoc -H buttondown.css resume-developer.md -o resume-developer.docx
	cp resume*.docx /var/www/

pdf : resume.tex
	#context resume.tex
	context resume-developer.tex
	cp resume*.pdf /var/www/

clean :
	rm *.tex
	rm *.tuc
	rm *.log
