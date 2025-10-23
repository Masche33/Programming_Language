clear;
rm ./main 2>/dev/null;

ocamlc -c TaylorADT.mli
ocamlc -c Taylor.ml

ocamlc -o main Taylor.cmo main.ml

rm *.cmo *.cmi;

if [[ $1 != '' ]]; then
  ./main
fi
