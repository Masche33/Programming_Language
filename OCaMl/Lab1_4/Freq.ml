module FileSystem = struct

  let load_file f_name =
    let ic = open_in f_name in
      let rec read_lines acc =
        try
          let line = input_line ic in
          read_lines (line :: acc)
        with End_of_file ->
          close_in ic;
          List.rev acc
    in
    read_lines []
 
  let accumulate_list lines =
    String.concat "" lines;;

  let tokenize_lines str =
    String.split_on_char ' ' str;;

end

module Frequency = struct
 
  type field = {word: string; frequency: int};;

  let empty () : field list= [];;

  let rec get_word str fields = 
      match fields with
      | hd::tl when (hd.word = str) -> hd
      | hd::tl when (hd.word <> str) -> get_word str tl
      | [] | _::_                    ->  {word=str; frequency=0}

  let increment f = 
    {word=f.word; frequency=f.frequency+1}

  let add_word str fields =
    let rec add_word_field acc str fields = 
      match fields with
      | hd::tl when (hd.word = str)  ->  add_word_field (acc) str tl
      | hd::tl when (hd.word <> str) ->  add_word_field (hd::acc) str tl
      | [] | _::_                    ->  List.rev  (acc)
    in add_word_field (increment((get_word str fields))::[]) str fields;; 

  let rec add_words lst fields =
    match lst with
    | hd::tl -> add_words tl (add_word hd fields)
    | []     -> fields;;

  let print_fields fields =
    List.iter (fun {word; frequency} ->
      Printf.printf "%s : %d\n" word frequency
    ) fields

  let sort_fields field =
    List.sort (fun a b -> b.frequency - a.frequency) field;;


end

