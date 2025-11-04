clear
rm ./main 2>/dev/null

ocamlc -c MatrixADT.mli
ocamlc -c Matrix.ml

ocamlc -o ./main  Matrix.cmo ./main.ml 

rm *.cmo *.cmi
if [[ $1 != '' ]]; then
  ./main
fi

