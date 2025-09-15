%%%%%%%%%%%%%%%%% necessary functions %%%%%%%%%%%%%%%
% appending
append([], List, List).
append([H|T], List, [H|R]) :- append(T, List, R).

% satisfies if either IS the value or is an appropriate subgenre.
satisfies(X, X).
satisfies(X, Y) :- is_subgenre(X, Y).


% note: add feature of prefers artist 
%%%%%%%%%%%%%%%%% converting requirements %%%%%%%%%%%%%%
timescale(0, X) :- prefers(before, X), not prefers(after, _).
timescale(X, 9999) :- prefers(after, X), not prefers(before, _).
timescale(X, Y) :- prefers(before, X), prefers(after, Y).
timescale(0, 2000) :- prefers('old').
timescale(2020, 9999) :- prefers('new').



%%%%%%%%%%%%%%%% queries %%%%%%%%%%%%

get_artists(Query) :- 
    findall(require(Prop, X), require(Prop, X), R), 
    findall(not_require(Prop, X), not_require(Prop, X), R2),
    findall(timescale(B, E),timescale(B, E), R3),
    append(R, R2, RP),
    append(RP, R3, Requirements), 
    findall(X, query(Requirements, name, X), Query).
    %query(Requirements, name, Query).

% run query
query(Requirements, Prop, Val) :- satisfying_recommendation(ID, Requirements), artist(ID, Prop, Val).


% get an artist that meets required preferencees
satisfying_recommendation(ID, []). 
satisfying_recommendation(ID, [require(Prop, X) | T]) :- 
    artist(ID, Prop, Value), satisfies(Value, X), satisfying_recommendation(ID, T).
satisfying_recommendation(ID, [not_require(Prop, Values) | T]) :- 
   artist(ID), artist(ID, Prop, Value), not satisfies(Value, Values), satisfying_recommendation(ID, T).
satisfying_recommendation(ID, [timescale(Begin, End) | T]) :- 
    artist(ID), artist(ID, founded, Decade), Decade >= Begin, Decade =< End, satisfying_recommendation(ID, T).
