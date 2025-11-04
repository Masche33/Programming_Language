module type Str = sig

  val is_palindrome : string -> bool
  val anagram       : string -> string -> bool
  val is_anagram_in_list : string -> string list -> bool
  val (-) :string -> string -> string

end
