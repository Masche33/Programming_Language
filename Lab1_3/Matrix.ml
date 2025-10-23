module Matrix =
  struct
    type matrix = int list * (int * int)

    let zeroes x y = 
      ((List.init (x*y) (fun x -> 0)), (x,y))

    let identity n =
      ((List.init (n*n) (fun x -> if(x mod (n+1)=0)then 1 else 0)),(n,n))

    let init n =
      (List.init (n*n) (fun x -> x),(n,n))
  
    let get_by_position x y (l, (w, _)) = 
      List.nth l (y*w+x)

    let transpose (l, (x,y)) =
      (List.init (x*y) (fun j -> 
        get_by_position (j / y) (j mod y) (l, (x,y))  
      ), (y,x))
    
    let prod x y (m1, (x1, y1)) (m2, (x2,y2)) = 
      let rec proc acc count =
      match count with
      | (-1) -> acc
      | _ -> proc (acc + 
                  ((List.nth m1 (y * x1 + count)) * 
                  (List.nth m2 (count * x2 + x)))) 
                  (count-1) 
      in proc 0 (x1-1)
      
    let (+) (m1,(x,y)) (m2,(_,_)) =
      ((List.map2 (fun a b -> a + b) m1 m2),(x,y))

    let ( * ) (m1, (a,b)) (m2, (c, d)) =
      (List.init (b*c) (fun x -> prod (x mod c) (x / c) (m1, (a,b)) (m2, (c, d))), (b,c))

  end
