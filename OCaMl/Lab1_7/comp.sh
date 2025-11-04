clear;
rm ./main 2>/dev/null;

ocamlc -c StackADT.mli
ocamlc -c Stack.ml
ocamlc -c PolishCalculator.ml
# main.ml va messo per ultimo altrimenti il comando non compila
ocamlc -o main Stack.cmo  PolishCalculator.cmo main.ml

rm *.cmo *.cmi;

if [[ $1 != '' ]]; then
  ./main
fi
