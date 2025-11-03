let rec countNumber ?(acc = []) ?(count = 1) l = 
  match l with 
  | hd::se::tl when (hd=se) -> countNumber ~acc:acc ~count:(count+1) (se::tl) 
  | hd::tl     -> countNumber ~acc:((hd, count)::acc) ~count:1 tl
  | []         -> List.rev acc;; 


let test_list =     [1;1;1;2;3;3;0];;
let test_excpeted = [(1,3);(2,1);(3,2);(0,1)];;

let main = test_excpeted = (countNumber test_list);;

let () = Printf.printf "%b\n" main;;
let () = List.iter (fun x -> Printf.printf "%d %d; " (fst x) (snd x)) (countNumber test_list); Printf.printf "\n";;
