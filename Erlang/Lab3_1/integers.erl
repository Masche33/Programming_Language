-module(integers).
-export([
        factors/1,
        is_balanced/1
        ]).

factors(1) -> [1];         
factors(N) -> factors(N, 2, []).

factors(1, _, Acc)                    -> lists:reverse(Acc);
factors(N, F, Acc) when N rem F =:= 0 -> factors(N div F, 2, [F | Acc]);
factors(N, F, Acc)                    -> factors(N, F + 1, Acc).

is_balanced(N)    -> is_balanced(N, 1).
is_balanced(0, _)            -> true;
is_balanced(N, _) when N < 0 -> false;
is_balanced(N, A)            -> is_balanced(N - A, A + 1). 
