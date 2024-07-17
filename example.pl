dog(jackson).
dog(dexter).

boy(sami).
boy(kristofer).
girl(enella).
girl(ninni).
girl(lena).

siblings(kristofer, ninni).
siblings(enella, sami).

parent_child(ninni, enella).
parent_child(ninni, sami).
parent_child(lena, ninni).

uncle_nephew(X, Y) :-
    siblings(X, Z),
    parent_child(Z, Y).

loves(jackson, dexter).
loves(dexter, jackson) :- loves(jackson, dexter).
loves(jackson, squirrels).

hates(dexter, cats) :- hates(jackson, cats).

get_grandparent :-
	parent_child(X, Z),
	parent_child(Y, X),
    format("~w ~s ~w's grandparent.", [Y, "is", Z]).


what_grade(5) :-
    write('Go to kindergarden').
what_grade(6) :-
    write('Go to 1st grade').
what_grade(Other) :-
    Grade is Other - 5,
    format('Go to grade ~w.', [Grade]).

customer(john, smith, 20.55).
customer(sally, smith, 120.55).

get_customer_balance(FName, LName) :-
	customer(FName, LName, Bal),
	format("~w ~w's balance is $~2f", [FName, LName, Bal]).

double_digit(X, Y) :-
	Y is X * 2.

say_hi :- 
    write('What is your name?'),
    read(X),
    format('Hi ~w', [X]).

fav_char :-
    write('What is your favorite character?'),
    get(X),
    format('The ASCII value ~w is ', [X]),
    put(X).


write_to_file(Filename, TextBody) :-
    open(Filename, write, Stream),
    write(Stream, TextBody), nl,
    close(Stream).

read_file(Filename) :-
    open(Filename, read, Stream),
    get_char(Stream, Char1),
    process_stream(Char1, Stream),
    close(Stream).

process_stream(end_of_file, _) :- !.

process_stream(Char, Stream) :-
    write(Char),
    get_char(Stream, Char2),
    process_stream(Char2, Stream).
