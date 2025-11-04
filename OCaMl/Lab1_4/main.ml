module FileSystem = (Freq.FileSystem: FreqADT.FileSystem);;
module Frequency  = (Freq.Frequency : FreqADT.Frequency);; 
open FileSystem;;
open Frequency;;


Printf.printf "MAIN: TEST\n";;

let d = load_file "Dante.txt";;

let rec p_divine = function
  | []     -> Printf.printf "\n"
  | hd::tl -> Printf.printf "%s\n" hd; p_divine tl;;

let d_str = accumulate_list d;;
let d_token = tokenize_lines d_str;;

Printf.printf "LOADING FINISHED\n";;

let words = add_words d_token (Frequency.empty());;

print_fields (sort_fields words);;

