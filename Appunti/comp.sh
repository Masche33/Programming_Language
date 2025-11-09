pdflatex -shell-escape Appunti.tex;

if [[ $1 != "" ]]; then
rm *.aux *.log *.toc;
rm -fr _minted-Appunti;
fi
clear
