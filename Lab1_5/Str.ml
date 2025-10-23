module Str = struct
 
  let explode s = List.init (String.length s) (String.get s);;
  let implode l = String.of_seq (List.to_seq l);;
  
  let punteggiatura = " .,!?;";;
  
  let (-) s1 s2 = 
    let rec minus res s1 s2 = 
      match s1 with 
      | hd::tl when (String.contains s2 hd) -> minus res tl s2
      | hd::tl when not (String.contains s2 hd) -> minus (hd::res) tl s2
      | hd::tl -> List.rev (hd::res)
      | []     -> List.rev (res)
    in implode(minus [] (explode (s1)) s2);;

  let is_palindrome str =
    let is_palindrome str =
    (implode (List.rev (explode str)))=str
    in is_palindrome ((String.lowercase_ascii str)-punteggiatura);;

  let anagram s1 s2 = 
    let rec anagram l1 l2 =
      match l1, l2 with
      | hd::tl, [] | [], hd::tl -> false
      | hd1::[], hd2::[] -> hd1=hd2
      | hd1::tl1, hd2::tl2 when (hd1 <> hd2) -> false
      | hd1::tl1, hd2::tl2 when (hd1 = hd2) -> anagram tl1 tl2
      | _,_ -> false
  in anagram (List.sort Char.compare (explode s1)) (List.sort Char.compare (explode s2));;

  let is_anagram_in_list s l = 
    let rec is_anagram_in_list acc s = function
    | hd::tl -> is_anagram_in_list ((anagram s hd)||acc) s tl
    | []     -> acc
    in is_anagram_in_list false s l;;



end
