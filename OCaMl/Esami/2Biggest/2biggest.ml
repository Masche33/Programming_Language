let biggest l =
  let rec biggest b bb l = 
    match l with 
    | hd::tl when (hd > b) -> biggest hd b tl
    | hd::tl               -> biggest b bb tl 
    | []                   -> (b, bb)
  in if((List.length l) < 2) then raise (Invalid_argument "List too short")
                             else biggest (List.nth l 0) (List.nth l 0) l;;

let p_res l = Printf.printf "%d %d\n" (fst l) (snd l)

let numeri = [1; 2; 3; 4; 5; 6; 7; 8; 9; 10];;

p_res (biggest numeri);;
