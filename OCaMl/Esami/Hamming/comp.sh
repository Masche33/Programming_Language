clear
rm ./main 2>/dev/null

ocamlc -c Hamming.ml
ocamlc -o ./main Hamming.cmo main.ml

rm *.cmo *.cmi 2>/dev/null

./main
