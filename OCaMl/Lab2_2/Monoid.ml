module Monoid =
  struct

    let rec is_identity_valid list operation identity =
      match list with
      | hd::tl when ((operation hd identity)<> hd) -> false
      | hd::tl when ((operation hd identity) = hd) -> is_identity_valid tl operation identity
      | [] | _                                            -> true

    let is_monoid list operation identity =
      (is_identity_valid list operation identity) 

    (*is_monoid [false; true] (fun a b -> a || b) false;;*)
    (*is_monoid [true] (fun a b -> a || b) false;;*)
    (*is_monoid [1;2;3;4;5;6;7;8;9] (fun a b -> (a * b)) 1;;*)
    
  end
