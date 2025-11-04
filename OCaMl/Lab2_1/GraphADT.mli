module type Graph = 
  sig
  

  type 'a graph

  val empty : unit -> 'a graph
  val isEmpty : 'a graph -> bool

  val add_node : 'a -> 'a graph -> 'a graph
  val add_arc : 'a -> 'a -> 'a graph -> 'a graph

  val adjacent : 'a -> 'a graph -> 'a list
  val contains_node : 'a -> 'a graph -> bool
  val contains_arc : 'a -> 'a -> 'a graph -> bool
  val p_graph : int graph -> unit
  val dfs : 'a graph -> 'a -> 'a graph
end
