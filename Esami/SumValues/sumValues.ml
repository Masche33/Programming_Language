let rec sumValues ?(acc = []) ?(count = 0) l = 
  match l with
  | hd::tl when(hd <> 0) -> sumValues ~acc:acc ~count:(count+hd) tl
  | hd::tl when(hd = 0)  -> sumValues ~acc:(count::acc) tl 
  | [] | _               -> List.rev (count::acc);;

 let () = List.iter (fun x -> Printf.printf "%d " x) (sumValues [1; 2; 3; 0; 4; 5; 0; 0; 6; 6]); 
          Printf.printf "\n";; 

 (*To compile: ocamlc -o ./sv sumValues.ml; rm *.cmo *.cmi; ./sv*)
