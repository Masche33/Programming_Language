module Polish = PolishCalculator.Calculator(Stack.UnboundStack);;

open Polish;;

Printf.printf "Prova\n";;

let test exp value number =
  if exp = value then
    Printf.printf "\027[32mTEST %d: PASSED\027[0m \n" number
  else
    Printf.printf "\027[31mTEST %d: FAILED\027[0m \n" number
;;

let execute_tests tests test_type = 
  let rec execute_tests counter = function
    | hd::tl -> test (fst hd) (snd hd) counter; execute_tests (counter+1) tl
    | []     -> ()
  in Printf.printf "%s:\n" test_type; execute_tests 1 tests; Printf.printf "\n---------------\n";;

let eval_test = [
  ((eval [Number 1; Number 1; Number 1; Operator Plus; Operator Plus]), 3);
  ((eval [Number 1; Number 2; Operator Plus; Number 3; Operator Div]) , 1);
  ((eval [Number 2; Number 3; Operator Pow]) , 8);
];;
let parse_test = [
  (parseString "1 2 +", [Number 1; Number 2; Operator Plus])
];;
let string_eval_test = [
  (eval_string "1 2 +", 3);
  (eval_string "10 4 3 + 2 * -", (-4));
  (eval_string "3 4 2 * 1 5 - 2 3 ** ** / +", 3)
];;


execute_tests eval_test "EVAL";;
execute_tests parse_test "PARSE";;
execute_tests string_eval_test "STRING EVAL";;
