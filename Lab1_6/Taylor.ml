module Taylor = 
  struct

  let fact x = 
    let rec fact acc x =
    match x with
    | 0. -> acc
    | 1. -> acc
    | _ -> fact (x*.acc) (x-.1.)
  in fact 1. x;;

  let sin_approx_step x n = 
    ((-. 1.)**n ) /.
    (fact (2. *. n +. 1.)) *.
    x ** (2.*.n+.1.);;

  let cos_approx_step x n = 
    ((-. 1.)**n) /.
    (fact (2. *. n)) *.
    x ** (2.*.n)
  ;;

  let approx_value func x approx = 
    let rec approx_value acc x approx =
      match approx with
      | 0. -> acc *. (func x 0.)
      | _  -> approx_value (acc *. func x approx) x (approx-.1.)
    in approx_value 1. x approx;;

  let sin x approx = 
    approx_value sin_approx_step x approx;;  

 let cos x approx = 
    approx_value cos_approx_step x approx;;  




end;;
