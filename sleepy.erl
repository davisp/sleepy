-module(sleepy).
-export([sleep/0]).
-on_load(start/0).

start() ->
    erlang:load_nif("sleepy", 0).

sleep() ->
    nif_error(?LINE).

nif_error(Line) ->
    exit({nif_not_loaded,module,?MODULE,line,Line}).
