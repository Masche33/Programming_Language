clear

rm ./count 2>/dev/null

ocamlc -o ./count count.ml

rm *.cmo *.cmi  2>/dev/null
