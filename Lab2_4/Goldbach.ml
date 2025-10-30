module Goldbach =
  struct
    
    exception NotGoldbachNumberException;;


    (*int -> bool*)
    let is_goldbach x =
      (x > 5) && ((x mod 2) == 0) 
    
    (*int -> bool*)
    let is_prime x =
      let rec is_prime x div = 
        match x mod div with
        | 0 when (div = 1) -> true
        | 0 when (div <>1) -> false
        | _                -> is_prime x  (div-1) 
      in if(x < 2) then false else is_prime x (x/2)
    
    (*int -> int -> bool*)
    let is_goldbach_couple p n =
      (is_prime p) && (is_prime (n-p))

    (*int -> (int * int)*)
    let goldbach x = 
      let rec goldbach n x = 
        match is_goldbach_couple n x with
        | true  -> (n, (x-n))
        | false -> goldbach (n+2) x
      in if(is_goldbach x) then goldbach 3 x
                           else raise NotGoldbachNumberException;;
    
    (*int -> int -> (int * (int * int)) list*)
    let goldbach_list n m =
      let rec goldbach_list acc n m =
      match n with
      | _ when (n <= m) -> goldbach_list ((n,(goldbach n))::acc) (n+2) m
      | _              -> List.rev acc
      in if(is_goldbach n) then goldbach_list [] n m
                           else if( n < 3) then goldbach_list [] 6 m
                           else goldbach_list [] (n+1) m
  end
