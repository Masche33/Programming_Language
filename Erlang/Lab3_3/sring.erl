-module(sring).
-export([
        start/3,
        loop/1
        ]).

% Crea N processi che mandino M 'messaggi'.
%
start(M, N, Message) -> Pids = spawn_processes(N, []),
                        ring_connection(Pids, hd(Pids)),
                        hd(Pids) ! {token_message, {Message, M, N, N}}.

ring_connection([H], H1)      -> H ! {set_next, H1};
ring_connection([H | TL], H1) -> H ! {set_next, hd(TL)}, 
                                 ring_connection(TL, H1).

spawn_processes(0, Acc) -> Acc;
spawn_processes(M, Acc) -> spawn_processes(M-1, [spawn(sring, loop, [none])|Acc]).

loop(Destination) -> 
  receive
    {set_next, NextDestination}           -> loop(NextDestination);
    {token_message, {_, 0, _, _}}         -> io:format("FINE~n"),
                                             Destination ! {exit};
    {token_message, {Message, M, 0, Max}} -> io:format("Proc: ~p, Num: ~p '~p'~n", [0, M, Message]), 
                                             Destination ! {token_message, {Message, M-1, Max, Max}},
                                             loop(Destination);
    {token_message, {Message, M, N, Max}} -> io:format("Proc: ~p, Num: ~p '~p'~n", [N, M, Message]),
                                             Destination ! {token_message, {Message, M, N-1, Max}},
                                             loop(Destination);
    {exit}                                -> io:format("KILLING MYSELF~n"), 
                                             Destination ! {exit}
  end.
