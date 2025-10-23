rm ./main 2>/dev/null

ocamlc -c FreqADT.mli
ocamlc -c Freq.ml

ocamlc -o main Freq.cmo main.ml

rm *.cmo *.cmi;

if [[ $1 != '' ]]; then
  ./main
fi

