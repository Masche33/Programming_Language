module Strings = (Str.Str: StrADT.Str);;
open Strings 

let test exp value number =
  if exp = value then
    Printf.printf "\027[32mTEST %d: PASSED\027[0m " number
  else
    Printf.printf "\027[31mTEST %d: FAILED\027[0m " number
;;

let execute_tests tests test_type = 
  let rec execute_tests counter = function
    | hd::tl -> test (fst hd) (snd hd) counter; execute_tests (counter+1) tl
    | []     -> ()
  in Printf.printf "%s:\n\n" test_type; execute_tests 1 tests; Printf.printf "\n---------------\n";;



let test_pal = [
  (is_palindrome "level!", true);          
  (is_palindrome "Rise to vote, sir.", true);    
  (is_palindrome "Do geese see God?", true);    
  (is_palindrome "anna", true);           
  (is_palindrome "civic", true);          
  (is_palindrome "kayak", true);          
  (is_palindrome "radar", true);          
  (is_palindrome "computer", false);      
  (is_palindrome "racecar", true);        
  (is_palindrome "banana", false)         
];;

let test_minus = [
  (("Functional Programming"-"gnim"), "Fuctoal Prora");
  (("MixedCASE"-"ACE"), "MixedS");
  (("NoChange"-"xyz"), "NoChange");
  (("AAAAAA"-"A"), "");
  (("Test123"-"123"), "Test");
  (("CaseSensitive"-"sS"), "Caeenitive");
  (("Space Test"-" "), "SpaceTest");
  (("Hello World"-"lo"), "He Wrd");
  (("Symbols!?"-"!?"), "Symbols");
  (("UpperLower"-"Ue"), "pprLowr");
];;

let test_anagram = [
  (anagram "ANNA" "NANA", true);
  (anagram "Roma" "Amor", false);
  (anagram "Cane" "Nace", false);
  (anagram "listen" "silent", true);
  (anagram "evil" "vile", true);
  (anagram "Anna" "Mina", false);
  (anagram "Casa" "Cassa", false);
  (anagram "Dog" "Gods", false);
  (anagram "abc" "def", false);
  (anagram "test" "sett", true);
];;

let test_anagram_list = [
  (is_anagram_in_list "ANNA" ["NANA"; "PROVA"; "RIPROVA"], true);
  (is_anagram_in_list "roma" ["amor"; "casa"; "mare"], true);
  (is_anagram_in_list "cane" ["nace"; "lupo"; "gatto"], true);
  (is_anagram_in_list "listen" ["silent"; "noise"; "sound"], true);
  (is_anagram_in_list "evil" ["vile"; "live"; "veil"], true);
  (is_anagram_in_list "anna" ["mina"; "otto"; "gioco"], false);
  (is_anagram_in_list "casa" ["cassa"; "cane"; "gatto"], false);
  (is_anagram_in_list "dog" ["god"; "good"; "doom"], true);
  (is_anagram_in_list "abc" ["def"; "ghi"; "jkl"], false);
  (is_anagram_in_list "newyork" ["wokyenr"; "roma"; "londra"], true);
];;

execute_tests test_pal "Palindrome testing";;
execute_tests test_minus "Minus testing";;
execute_tests test_anagram "Anagram testing";;
execute_tests test_anagram_list "Anagram list testing";;

