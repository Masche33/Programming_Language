module type Stack =
  sig
    type 'a stack
 
    val empty : unit -> 'a stack
    val isEmpty: 'a stack -> bool 

    val push : 'a -> 'a stack -> 'a stack
    val pop  : 'a stack -> 'a stack
    val top  : 'a stack -> 'a

    exception EmptyStackException
  end
