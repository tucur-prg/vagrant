% erlc hello.erl
% erl -noshell -s hello hello_world -s init stop
-module(hello).
-export([hello_world/0]).

hello_world()->io:fwrite("Hello World~n").
