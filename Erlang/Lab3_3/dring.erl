-module(dring).
-export([
         start/3,
         loop/1
        ]).

%[
% Start fa partire il primo di N processi che deve mandare M messaggi
% Il processo n > 1 fa partire il prossimo e gli manda un messaggio(?)
%]
start(M, N, Message) -> Pid = spawn(dring, loop, [none]),
                        Pid ! {spawn_next, M - 1, Pid, Pid, {Message, M - 1, N, N}},
                        io:format("Start (~p) spawned (~p)~n", [self(), Pid]).

loop(Destination) ->
  receive
    {spawn_next, 0, PrevPid, FPid, Mess}    -> PrevPid ! {set_next, FPid},
                                               io:format("Last spawned~n"),
                                               FPid ! {token_message, Mess},
                                               loop(Destination);
    {spawn_next, Rem, PrevPid, FPid, Mess}  -> Pid = spawn(dring, loop, [none]),
                                               Pid ! {spawn_next, Rem - 1, Pid, FPid, Mess},
                                               PrevPid ! {set_next, Pid}, % Tell to prev i am next
                                               io:format("Process (~p) spawned (~p)~n", [self(), Pid]),
                                               loop(Destination);
     {set_next, NextDestination}            -> io:format("Process (~p) linked to (~p)~n", [self(), NextDestination]),
                                               loop(NextDestination);
     {token_message, {_, 0, _, _}}          -> io:format("FINISHED~n"),
                                               Destination ! {exit};
     {token_message, {Message, M, 0, Max}}  -> io:format("~p~n", [Message]),
                                               Destination ! {token_message, {Message, M - 1, Max, Max}},
                                               loop(Destination);
     {token_message, {Message, M, N, Max}}  -> io:format("~p~n", [Message]),
                                               Destination ! {token_message, {Message, M, N - 1, Max}},
                                               loop(Destination);
     {exit}                                 -> io:format("~p Exiting~n", [self()]),
                                               Destination ! {exit}
  end.
