%%%%% 
%%% KNOWLEDGE OF ARTISTS  %%%%
%%%%%%

artist(0).
artist(1). 
artist(2).
artist(3).
artist(4).
artist(5).
artist(6).
artist(7). 
artist(8).
artist(9). 
artist(10).


property(name).
property(genre).
property(founded).
property(length).
property(location).
property(currently_active).

artist(0, name, 'acid bath').
artist(0, genre, 'metal').
artist(0, founded, 1991).
artist(0, style, 'mixed').
artist(0, length, 'medium').
artist(0, location, 'usa').

artist(1, name, 'alice in chains').
artist(1, genre, 'grunge').
artist(1, founded, 1987).
artist(1, style, 'slow').
artist(1, length, 'medium').
artist(1, location, 'usa').

artist(2, name, 'bauhaus').
artist(2, genre, 'gothic rock').
artist(2, founded, 1978).
artist(2, style, 'mixed').
artist(2, length, 'long').
artist(2, location, 'uk').

artist(3, name, 'death grips').
artist(3, genre, 'experimental').
artist(3, founded, 2010).
artist(3, style, 'mixed').
artist(3, length, 'short').
artist(3, location, 'usa').

artist(4, name, 'depeche mode').
artist(4, genre, 'new wave').
artist(4, founded, 1980).
artist(4, style, 'slow').
artist(4, length, 'long').
artist(4, location, 'uk').

artist(5, name, 'kmfdm').
artist(5, genre, 'industrial rock').
artist(5, founded, 1984).
artist(5, style, 'mixed').
artist(5, length, 'medium').
artist(5, location, 'germany').

artist(6, name, 'machine girl').
artist(6, genre, 'breakcore').
artist(6, founded, 2012).
artist(6, style, 'fast').
artist(6, length, 'short').
artist(6, location, 'usa').

artist(7, name, 'mindless self indulgence').
artist(7, genre, 'electronic').
artist(7, founded, 1997).
artist(7, style, 'fast').
artist(7, length, 'short').
artist(7, location, 'usa').

artist(8, name, 'ministry').
artist(8, genre, 'industrial rock').
artist(8, founded, 1981).
artist(8, style, 'fast').
artist(8, length, 'long').
artist(8, location, 'usa').

artist(9, name, 'skinny puppy').
artist(9, genre, 'electro-industrial').
artist(9, founded, 1982).
artist(9, style, 'mixed').
artist(9, length, 'long').
artist(9, location, 'canada').

artist(10, name, 'tool').
artist(10, genre, 'progressive metal').
artist(10, founded, 1990).
artist(10, style, 'slow').
artist(10, length, 'long').
artist(10, location, 'usa').

artist(11, name, 'tricky').
artist(11, genre, 'trip-hop').
artist(11, founded, 1995).
artist(11, style, 'slow').
artist(11, length, 'medium').
artist(11, location, 'uk').

artist(12, name, 'type o negative').
artist(12, genre, 'gothic metal').
artist(12, founded, 1989).
artist(12, style, 'mixed').
artist(12, length, 'long').
artist(12, location, 'usa').

artist(13, name, 'vnv nation').
artist(13, genre, 'electropop').
artist(13, founded, 1990).
artist(13, style, 'fast').
artist(13, length, 'medium').
artist(13, location, 'uk').

artist(14, name, 'duran duran').
artist(14, genre, 'new wave').
artist(14, founded, 1978).
artist(14, style, 'mixed').
artist(14, length, 'medium').
artist(14, location, 'uk').

artist(15, name, 'nirvana').
artist(15, genre, 'grunge').
artist(15, founded, 1987).
artist(15, style, 'mixed').
artist(15, length, 'short').
artist(15, location, 'usa').

% artists who are not inactive are currently active
artist(ID, currently_active, yes) :- artist(ID), not -active(ID). 
artist(ID, currently_active, no) :- artist(ID), -active(ID).

% list of currently inactive artists
-active(9).
-active(2).
-active(0).
-active(15).
-active(12).

%% genre classifications

% labelling subgenres
is_subgenre('ebm', 'industrial').
is_subgenre('electro-industrial', 'industrial').
is_subgenre('industrial rock', 'industrial').
is_subgenre('industrial metal', 'industrial').

is_subgenre('breakcore', 'electronic').
is_subgenre('electro-industrial', 'electronic').
is_subgenre('ebm', 'electronic').
is_subgenre('experimental', 'electronic').

is_subgenre('death metal', 'metal').
is_subgenre('metalcore', 'metal').
is_subgenre('progressive metal', 'metal').
is_subgenre('gothic metal', 'metal').

is_subgenre('gothic rock', 'goth').

% artists are part of subgenres
is_subgenre(X, Y) :- is_subgenre(X, Z), is_subgenre(Z, Y).

