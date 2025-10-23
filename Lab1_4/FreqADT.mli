module type FileSystem = sig
  val load_file : string -> string list
  val accumulate_list :  string list -> string
  val tokenize_lines: string -> string list  
end

module type Frequency = sig
  
  type field
  val empty : unit -> field list
  val get_word : string -> field list -> field
  val add_word : string -> field list -> field list
  val add_words : string list -> field list -> field list

  val print_fields : field list -> unit

  val sort_fields : field list -> field list
end

