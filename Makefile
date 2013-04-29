# Makefile for Sample SIGCSE (double-blind-style) paper

PAPERNAME=sample
TARGETWEBDIR=${HOME}/public_html/${PAPERNAME}

# This target lists all the other targets we want to be triggered by default
# when we type "make" or "make all"

all: blind notblind copy-to-web

# This target says that the "copy-to-web" rule depends on the "blind" target
# and the "notblind" target, i.e. that those targets should be followed first.

copy-to-web: blind notblind

# This target runs the latex commands to create the blind.pdf 
# file, the version of the paper for double-blind reviewing.

blind:  blind.tex
	- /bin/rm -f *.dvi *.aux
	latex blind.tex
	- bibtex blind
	latex blind.tex
	latex blind.tex
	dvips blind.dvi -t letter -P pdf -G0
	ps2pdf blind.ps

copy-to-web: blind notblind
	- mkdir -p -m 755 ${TARGETWEBDIR}
	- cp blind.pdf ${TARGETWEBDIR}
	- chmod 755 ${TARGETWEBDIR}/blind.pdf
	- cp notblind.pdf ${TARGETWEBDIR}
	- chmod 755 ${TARGETWEBDIR}/notblind.pdf

notblind:  notblind.tex
	- /bin/rm -f *.dvi *.aux
	latex notblind.tex
	- bibtex notblind
	latex notblind.tex
	latex notblind.tex
	dvips notblind.dvi -t letter -P pdf -G0
	ps2pdf notblind.ps

clean:
	- /bin/rm -f *.dvi *.aux *.ps *.blg *.bbl *.log *.bak *.pdf

