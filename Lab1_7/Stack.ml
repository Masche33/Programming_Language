module UnboundStack =
  struct

    type 'a stack = 'a list

    exception EmptyStackException

    let empty () = []
    let isEmpty s = s =[];;


    let push e s = e::s;;
    let pop = function
    | hd::tl -> tl
    | []     -> raise EmptyStackException
    let top = function
    | hd::tl -> hd
    | []     -> raise EmptyStackException
  end
