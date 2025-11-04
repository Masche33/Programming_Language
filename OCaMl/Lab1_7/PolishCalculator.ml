module Calculator(S: StackADT.Stack) =
  struct
 
    type operator = Plus  |
                    Minus |
                    Mult  |
                    Div   |
                    Pow   

    type token = Operator of operator| 
                 Number of int

    type expr = token S.stack

    exception IllegalToken

    let pow b e =
      let rec pow acc b e =
        match e with 
        | 0 -> acc
        | _ -> pow (acc*b) b (e-1)
      in pow 1 b e;;


    let operation o b a =
     match o with 
     | Plus  -> a + b
     | Minus -> a - b
     | Mult  -> a * b
     | Div   -> a / b
     | Pow   -> pow a b
 
    let eval_token t s =
      match t with
      | Operator o -> S.push (operation o (S.top s) (S.top (S.pop s))) (S.pop (S.pop s))
      | Number i   -> S.push i s

    let parseToken t =
      match t with 
      | "+"  -> Operator Plus
      | "-"  -> Operator Minus
      | "*"  -> Operator Mult
      | "/"  -> Operator Div
      | "**" -> Operator Pow
      | _    ->       
                try
                  Number (int_of_string t)
                with Failure _ ->
                  raise IllegalToken

    let parseString s =
      let rec parseString acc l = 
        match l with 
        | hd::tl -> parseString ((parseToken hd)::acc) tl 
        | []     -> List.rev acc
      in parseString [] (String.split_on_char ' ' s)
 

    let eval l =
      let rec eval s l =
        match l with
        | hd::tl -> eval (eval_token hd s) tl
        | []     -> s
      in S.top (eval (S.empty ()) l);;
 
   let eval_string s = eval (parseString s)

  end
