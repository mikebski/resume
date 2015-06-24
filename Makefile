all : html pdf

html: buttondown.css resume.md
	pandoc -H buttondown.css resume.md >/var/www/resume.html

pdf : resume.tex
	context resume.tex
	mv resume.pdf /var/www/

resume.tex : buttondown.css resume.md
	pandoc --standalone -t context resume.md -o resume.tex
