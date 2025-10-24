module Graph = struct
 
  type 'a graph = Graph of 'a list * ('a * 'a ) list

  let empty () = 
    Graph([], [])

  let isEmpty = function
  | Graph([],[]) -> true
  | _            -> false
  
  let add_in_list v l = 
    let rec add_in_list acc v = function
    | hd::tl when (hd<>v) -> add_in_list (hd::acc) v tl
    | hd::tl when (hd=v)  -> List.append (List.rev(hd::acc)) tl
    | [] | _::_           -> List.rev (v::acc)
  in add_in_list [] v l;;

  let add_node n = function
  | Graph(ns, arcs) -> Graph((add_in_list n ns), arcs)

  let add_arc a b = function
  | Graph(ns, arcs) -> Graph((add_in_list b (add_in_list a ns)), add_in_list (a,b) arcs)

  let adjacent a = function
  | Graph(_,arcs) -> List.map snd (List.filter (fun x -> fst(x) = a) arcs)

  let is_in_list n l =
    let rec is_in_list = function
    | hd::tl when (hd = n) -> true
    | hd::tl when (hd<> n) -> is_in_list tl
    | [] | _               -> false
  in is_in_list l

  let contains_node n = function
  | Graph(ns,_) -> is_in_list n ns

  let contains_arc a b = function
  | Graph(_,arc) -> is_in_list (a,b) arc

  let p_graph = function
  | Graph(ns, ars) -> List.iter (fun x -> Printf.printf "%d " x) ns;
                      Printf.printf "\n";
                      List.iter (fun x -> Printf.printf "(%d %d) " (fst x) (snd x)) ars;
                      Printf.printf "\n"

  let dfs g v = 
    let rec dfs g v ng = function
    | hd::tl when     (contains_node hd ng) -> dfs g v ng tl
    | hd::tl when not (contains_node hd ng) -> dfs g v (add_arc v hd (dfs g hd (add_node hd ng) (adjacent hd g))) tl
    | [] | _::_     -> ng 
  in dfs g v (empty()) (adjacent v g) 
  
  
end
