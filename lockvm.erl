-module(lockvm).
-export([lock/0, heart/0]).

lock() ->
    io:format("Starting heartbeat.~n", []),
    {ok, _} = timer:apply_interval(500, lockvm, heart, []),
    timer:sleep(2000),
    io:format("Locking the VM~n", []),
    Count = erlang:system_info(schedulers),
    lists:foreach(
        fun(_) -> spawn(fun() -> sleepy:sleep() end) end,
        lists:seq(1, Count)
    ),
    timer:sleep(1000).

heart() ->
    io:format("Tick~n", []).
