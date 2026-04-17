LATEXMK := latexmk

CV_SRC := cv.tex
RESUME_SRC := resume.tex

CV_PDF := cv.pdf
RESUME_PDF := resume.pdf

CV_RELEASE := Changyu (Thomason) Zhao - CV.pdf
RESUME_RELEASE := Changyu (Thomason) Zhao - Resume.pdf

.PHONY: all cv resume clean distclean release

all: cv resume

cv:
	$(LATEXMK) -xelatex -interaction=nonstopmode -halt-on-error $(CV_SRC)

resume:
	$(LATEXMK) -pdf -interaction=nonstopmode -halt-on-error $(RESUME_SRC)

clean:
	$(LATEXMK) -c $(CV_SRC)
	$(LATEXMK) -c $(RESUME_SRC)
	rm -f missfont.log

distclean:
	$(LATEXMK) -C $(CV_SRC)
	$(LATEXMK) -C $(RESUME_SRC)
	rm -f missfont.log "$(CV_RELEASE)" "$(RESUME_RELEASE)"

release: distclean all
	mv -f $(CV_PDF) "$(CV_RELEASE)"
	mv -f $(RESUME_PDF) "$(RESUME_RELEASE)"
