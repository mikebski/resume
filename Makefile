all : html pdf

html: buttondown.css resume.md resume-developer.md
	pandoc -H buttondown.css resume.md >/var/www/resume.html
	pandoc -H buttondown.css resume-developer.md >/var/www/resume-developer.html

resume.tex : buttondown.css resume.md
	pandoc --standalone -t context resume.md -o resume.tex
	pandoc --standalone -t context resume-developer.md -o resume-developer.tex

word: buttondown.css resume.md
	pandoc -H buttondown.css resume.md -o resume.docx
	pandoc -H buttondown.css resume-developer.md -o resume-developer.docx
	mv resume*.docx /var/www/

pdf : resume.tex
	context resume.tex
	context resume-developer.tex
	mv resume*.pdf /var/www/

clean :
	rm *.tex
	rm *.tuc
	rm *.log
