/var/www/resume.html: buttondown.css resume.md
	pandoc -H buttondown.css resume.md >/var/www/resume.html
