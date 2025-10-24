clear;
rm ./main 2>/dev/null;

ocamlc -c GraphADT.mli
ocamlc -c Graph.ml

ocamlc -o ./main Graph.cmo main.ml

rm *.cmo *.cmi 2>/dev/null;

if [[ $1 != '' ]]; then
  ./main
fi
