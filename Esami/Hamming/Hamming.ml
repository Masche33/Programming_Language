let hamming s1 s2 = 
  let format l = (List.length l, l) (* Formats output*)
  in format ( List.filter (fun x -> ((fst x)<>(snd x))) (* Filters out all the equal chars*) 
            ( List.map2   (fun x y -> (x,y))  (*Fun that creates the tuple given two elements*)
                          (List.of_seq (String.to_seq s1)) (*List of chars first string*)
                          (List.of_seq (String.to_seq s2)))) (*List of chars second string*);;
