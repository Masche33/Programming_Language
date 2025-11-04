clear
rm ./temp 2>/dev/null
ocamlc -o ./temp ./temp.ml
rm *.cmo *.cmi 2>/dev/null
