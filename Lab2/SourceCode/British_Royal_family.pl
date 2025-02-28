%             Facts                
% Male 
male('Philip Duke').
male('Prince Charles').
male('Mark Phillips').
male('Prince Andrew').
male('Prince Edward').
male('Timothy Laurence').
male('Jack Brooksbank').
male('August Brooksbank').
male('James').
male('Prince William').
male('Prince Harry').
male('Peter Phillips').
male('Mike Tindall').
male('Prince George').
male('Prince Louis').
male('Archie Harrison').
male('Lucas').
male('Edoardo Mapelli Mozzi').
% Female
female('Queen Elizabeth II').
female('Princess Diana').
female('Princess Anne').
female('Sarah Ferguson').
female('Sophie Countess').
female('Camilla Duchess').
female('Princess Beatrice').
female('Princess Eugenie').
female('Lady Louise').
female('Catherine Duchess').
female('Meghan Duchess').
female('Autumn Phillips').
female('Zara Tindall').
female('Princess Charlotte').
female('Lilibet Diana').
female('Savannah').
female('Isla').
female('Mia').
female('Lena').
female('Sienna Elizabeth Mapelli Mozzi').
% Deceased 
deceased('Queen Elizabeth II').
deceased('Philip Duke').
deceased('Princess Diana').
% Divorced 
divorced('Prince Charles','Princess Diana').
divorced('Princess Diana','Prince Charles').
divorced('Peter Phillips','Autumn Phillips').
divorced('Autumn Phillips','Peter Phillips').
divorced('Princess Anne','Mark Phillips').
divorced('Mark Phillips','Princess Anne').
divorced('Prince Andrew','Sarah Ferguson').
divorced('Sarah Ferguson','Prince Andrew').
% Married
married('Queen Elizabeth II','Philip Duke').
married('Philip Duke','Queen Elizabeth II').
married('Prince Charles','Camilla Duchess').
married('Camilla Duchess','Prince Charles').
married('Princess Anne','Timothy Laurence').
married('Timothy Laurence','Princess Anne').
married('Prince Edward','Sophie Countess').
married('Sophie Countess','Prince Edward').
married('Princess Beatrice','Edoardo Mapelli Mozzi').
married('Edoardo Mapelli Mozzi','Princess Beatrice').
married('Princess Eugenie','Jack Brooksbank').
married('Jack Brooksbank','Princess Eugenie').
married('Prince William','Catherine Duchess').
married('Catherine Duchess','Prince William').
married('Prince Harry','Meghan Duchess').
married('Meghan Duchess','Prince Harry').
married('Zara Tindall','Mike Tindall').
married('Mike Tindall','Zara Tindall').
% Parent
parent('Queen Elizabeth II','Prince Charles').
parent('Queen Elizabeth II','Princess Anne').
parent('Queen Elizabeth II','Prince Andrew').
parent('Queen Elizabeth II','Prince Edward').
parent('Philip Duke','Prince Charles').
parent('Philip Duke','Princess Anne').
parent('Philip Duke','Prince Andrew').
parent('Philip Duke','Prince Edward').
parent('Prince Charles','Prince William').
parent('Prince Charles','Prince Harry').
parent('Princess Diana','Prince William').
parent('Princess Diana','Prince Harry').
parent('Princess Anne','Peter Phillips').
parent('Princess Anne','Zara Tindall').
parent('Mark Phillips','Peter Phillips').
parent('Mark Phillips','Zara Tindall').
parent('Prince Andrew','Princess Beatrice').
parent('Prince Andrew','Princess Eugenie').
parent('Sarah Ferguson','Princess Beatrice').
parent('Sarah Ferguson','Princess Eugenie').
parent('Prince Edward','Lady Louise').
parent('Prince Edward','James').
parent('Sophie Countess','Lady Louise').
parent('Sophie Countess','James').
parent('Princess Beatrice','Sienna Elizabeth Mapelli Mozzi').
parent('Edoardo Mapelli Mozzi','Sienna Elizabeth Mapelli Mozzi').
parent('Princess Eugenie','August Brooksbank').
parent('Jack Brooksbank','August Brooksbank').
parent('Prince William','Prince George').
parent('Prince William','Princess Charlotte').
parent('Prince William','Prince Louis').
parent('Catherine Duchess','Prince George').
parent('Catherine Duchess','Princess Charlotte').
parent('Catherine Duchess','Prince Louis').
parent('Prince Harry','Archie Harrison').
parent('Prince Harry','Lilibet Diana').
parent('Meghan Duchess','Archie Harrison').
parent('Meghan Duchess','Lilibet Diana').
parent('Peter Phillips','Savannah').
parent('Peter Phillips','Isla').
parent('Autumn Phillips','Savannah').
parent('Autumn Phillips','Isla').
parent('Zara Tindall','Mia').
parent('Zara Tindall','Lena').
parent('Zara Tindall','Lucas').
parent('Mike Tindall','Mia').
parent('Mike Tindall','Lena').
parent('Mike Tindall','Lucas').
%             Rules                
husband(Person, Wife) :-
    male(Person),
    married(Person,Wife).
wife(Person, Husband) :-
    female(Person),
    married(Person,Husband).
father(Parent,Child) :-
    male(Parent),
    parent(Parent,Child).
mother(Parent,Child) :-
    female(Parent),
    parent(Parent,Child).
child(Child,Parent) :- 
    parent(Parent,Child).
son(Child,Parent) :- 
    parent(Parent,Child),
    male(Child).
daughter(Child,Parent) :- 
    parent(Parent,Child),
    female(Child).
grandparent(GP,GC) :-
    parent(P,GC),
    parent(GP,P).
grandmother(GM,GC) :-
    parent(P,GC),
    parent(GM,P),
    female(GM).
grandfather(GF,GC) :-
    parent(P,GC),
    parent(GF,P),
    male(GF).
grandchild(GC,GP) :-
    parent(P,GC),
    parent(GP,P).
grandson(GS,GP) :-
    parent(P,GS),
    parent(GP,P),
    male(GS).
granddaughter(GD,GP) :-
    parent(P,GD),
    parent(GP,P),
    female(GD).
% Anh/chi/em ruot chung cha hoac me hoac ca hai
sibling(Person1,Person2) :-
    parent(Parent,Person1),
    parent(Parent,Person2),
    Person1 \= Person2.
brother(Person,Sibling) :-
    sibling(Person,Sibling),
    male(Sibling).
sister(Person,Sibling) :-
    sibling(Person,Sibling),
    female(Sibling).
% chi/em cua cha/me hoac vo chu
aunt(Person, NieceNephew) :-
    (   parent(P, NieceNephew),
        sister(P, Person)
    );
    (   parent(P, NieceNephew),
        brother(P, Uncle),
        married(Uncle, Person)
    ).
% Anh/em cua cha/me hoac chong di
uncle(Person, NieceNephew) :-
    (   parent(P, NieceNephew),
        brother(P, Person)
    );
    (   parent(P, NieceNephew),
        married(Person, Wife),
        sister(Wife, P)
    ).
niece(Person, AuntUncle) :-
    (   uncle(AuntUncle, Person);
        aunt(AuntUncle, Person)
    ),
    female(Person).

nephew(Person, AuntUncle) :-
    (   uncle(AuntUncle, Person);
        aunt(AuntUncle, Person)
    ),
    male(Person).
