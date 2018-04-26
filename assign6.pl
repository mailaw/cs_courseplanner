
course(compilers).
course(languages).
course(distributed).
course(db).
course(networking).
course(grammars).
course(os).
course(security).
course(software).
course(web).

prereq(compilers,languages).
prereq(languages,grammars).
prereq(distributed,networking).
prereq(networking,os).
prereq(security,os).
prereq(security,db).
prereq(software,web).
prereq(software,db).

time(compilers,9).
time(db,10).
time(distributed,11).
time(grammars,8).
time(languages,12).
time(networking,9).
time(os,13).
time(security,14).
time(software,13).
time(web,10).

effort(compilers,5).
effort(db,2).
effort(distributed,3).
effort(grammars,1).
effort(languages,1).
effort(networking,3).
effort(os,5).
effort(security,4).
effort(software,4).
effort(web,2).

proj(compilers,1).
proj(db,1).
proj(distributed,0).
proj(grammars,0).
proj(languages,0).
proj(networking,0).
proj(os,0).
proj(security,1).
proj(software,1).
proj(web,1).


%Take 3 courses as input
plan(X,Y,Z):-
    course(X),
    course(Y),
    course(Z),

    %courses are not prerequisite of each other
    not(prereq(X,Y)),
    not(prereq(Y,X)),
    not(prereq(X,Z)),
    not(prereq(Z,X)),
    not(prereq(Y,Z)),
    not(prereq(Z,Y)),

    %dont meet at the same time
    time(X,T1),
    time(Y,T2),
    time(Z,T3),
    not(T1=T2),
    not(T2=T3),
    not(T1=T3),

    isEffort(X,Y,Z),
    numProject(X,Y,Z).

%helper for effort less than or equal to 10
isEffort(X,Y,Z):-
   effort(X,E1),
   effort(Y,E2),
   effort(Z,E3),

   E is E1+E2+E3,
   E=<10.

%where N is the number of project courses and cannot be mroe than 1
numProject(X,Y,Z):-
   proj(X,N1),
   proj(Y,N2),
   proj(Z,N3),
   N is N1+N2+N3,
   N<2.
