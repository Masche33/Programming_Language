clear;
rm ./main 2>/dev/null

ocamlc -c StrADT.mli
ocamlc -c Str.ml

ocamlc -o main Str.cmo main.ml

rm *.cmo *.cmi;

if [[ $1 != '' ]]; then
  ./main
fi
