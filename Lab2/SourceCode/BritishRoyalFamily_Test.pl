% Load tri thuc
:- ['British_Royal_family.pl'].
:- writeln('Go cau_1., cau_2., ... cau_78. de xem cau hoi va cau tra loi').

% Parent 
cau_1 :- 
    writeln('Ai la cha/me cua Prince William ?'),
    parent(Parent, 'Prince William') -> writeln(Parent); writeln('Khong biet!').
    % Cau tra loi: Prince Charles
cau_2 :- 
    writeln('Cha/me cua Prince Harry la ai ?'),
    parent(Parent, 'Prince Harry') -> writeln(Parent); writeln('Khong biet!').
    % Cau tra loi: Prince Charles
cau_3 :- 
    writeln('Ai la cha/me cua Queen Elizabeth II?'),
    parent(Parent, 'Queen Elizabeth II') -> writeln(Parent); writeln('Khong biet!').
    % Cau tra loi: Khong biet!
% Deceased
cau_4 :-
    writeln('Ai da mat trong hoang gia Anh?'),
    findall(Person, deceased(Person), List),
    ( List \= [] -> 
        format('Nhung nguoi da qua doi trong hoang gia Anh: ~w~n', [List]) 
    ; 
        writeln('Chua co ai qua doi')
    ).
    % Cau tra loi: Nhung nguoi da qua doi trong hoang gia Anh: [Queen Elizabeth II,Philip Duke,Princess Diana]
cau_5 :- 
    writeln('Queen Elizabeth II da qua doi chua?'),
    deceased('Queen Elizabeth II') -> writeln('Da qua doi'); writeln('Chua qua doi').
    % Cau tra loi: Da qua doi
cau_6 :- 
    writeln('Duke of Edinburgh da mat chua?'),
    deceased('Philip Duke') -> writeln('Da qua doi'); writeln('Chua qua doi').
    % Cau tra loi: Da qua doi
% Male
cau_7 :-
    writeln('Ai la nam trong hoang gia Anh?'),
    findall(Person, male(Person), List),
    ( List \= [] -> 
        format('Nhung nguoi gioi tinh nam trong hoang gia Anh: ~w~n', [List]) 
    ; 
        writeln('Hoang gia Anh khong co nam')
    ).
    % Cau tra loi: Nhung nguoi gioi tinh nam trong hoang gia Anh: [Philip Duke,Prince Charles,Mark Phillips,Prince Andrew,Prince Edward,Timothy Laurence,Jack Brooksbank,August Brooksbank,James,Prince William,Prince Harry,Peter Phillips,Mike Tindall,Prince George,Prince Louis,Archie Harrison,Lucas,Edoardo Mapelli Mozzi]
cau_8 :- 
    writeln('Hoang tu George co phai la nam khong?'),
    male('Prince George') -> writeln('Dung'); writeln('Sai').
cau_9 :- 
    writeln('Prince Harry co phai la nam khong?'),
    male('Prince Harry') -> writeln('Dung'); writeln('Sai').
    % Cau tra loi: Dung
% Married
cau_10 :- 
    writeln('Ai la vo/chong cua Prince Charles?'),
    married('Prince Charles',Person) -> writeln(Person); writeln('Khong biet!').
    % Cau tra loi: Camilla Duchess
cau_11 :- 
    writeln('Nu hoang Elizabeth II co ket hon voi Duke of Edinburgh khong?'),
    married('Queen Elizabeth II','Philip Duke') -> writeln('Co!'); writeln('Khong!').
    % Cau tra loi: Co!
cau_12 :- 
    writeln('Princess Charlotte da ket hon chua?'),
    married('Princess Charlotte',Person)-> writeln(Person); writeln('Chua ket hon!').
    % Cau tra loi: Chua ket hon!
% Female
cau_13 :- 
    writeln('Ai la nu trong hoang gia Anh?'),
    findall(Person, female(Person), List),
    ( List \= [] -> 
        format('Nhung nguoi gioi tinh nu trong hoang gia Anh: ~w~n', [List]) 
    ; 
        writeln('Hoang gia Anh khong co nu')
    ).
    % Cau tra loi: Nhung nguoi gioi tinh nu trong hoang gia Anh: [Queen Elizabeth II,Princess Diana,Princess Anne,Sarah Ferguson,Sophie Countess,Camilla Duchess,Princess Beatrice,Princess Eugenie,Lady Louise,Catherine Duchess,Meghan Duchess,Autumn Phillips,Zara Tindall,Princess Charlotte,Lilibet Diana,Savannah,Isla,Mia,Lena,Sienna Elizabeth Mapelli Mozzi]
cau_14 :- 
    writeln('Princess Charlotte co phai la nu khong?'),
    (female('Princess Charlotte') -> writeln('Dung'); writeln('Sai')).
    % Cau tra loi: Dung
cau_15 :- 
    writeln('Nu hoang Elizabeth II co phai la nu khong?'),
    (female('Queen Elizabeth II') -> writeln('Dung'); writeln('Sai')).
    % Cau tra loi: Dung
% Divorced
cau_16 :- 
    writeln('Ai da ly hon trong hoang gia Anh?'),
    findall(Person1, divorced(Person1, _Person2), List),
    ( List \= [] -> 
        format('Nhung nguoi da tung ly hon trong hoang gia Anh: ~w~n', [List]) 
    ; 
        writeln('Hoang gia Anh chua co ai da tung ly hon')
    ).
    % Cau tra loi: Nhung nguoi da tung ly hon trong hoang gia Anh: [Prince Charles,Princess Diana,Peter Phillips,Autumn Phillips,Princess Anne,Mark Phillips,Prince Andrew,Sarah Ferguson]
cau_17 :- 
    writeln('Princess Diana co ly hon voi Prince Charles khong?'),
    ( divorced('Princess Diana', 'Prince Charles') ->
        writeln('Dung') 
    ; 
        writeln('Sai')
    ).
    % Cau tra loi: Dung
cau_18 :- 
    writeln('Co ai trong hoang gia tung ly hon khong?'),
    findall(Person1, divorced(Person1, _Person2), List),
    ( List \= [] -> 
        writeln('Hoang gia Anh co nguoi da tung ly hon')
    ; 
        writeln('Hoang gia Anh chua co ai da tung ly hon')
    ).
    % Cau tra loi: Hoang gia Anh co nguoi da tung ly hon
% Husband
cau_19 :- 
    writeln('Ai la chong cua Queen Elizabeth II?'),
    husband(Person, 'Queen Elizabeth II') -> writeln(Person); writeln('Khong biet!').
    % Cau tra loi: Philip Duke
cau_20 :- 
    writeln('Duke of Cambridge la chong cua ai?'),
    husband('Prince William', Wife) -> writeln(Wife); writeln('Khong biet!').
    % Cau tra loi: Catherine Duchess
cau_21 :- 
    writeln('Ai la chong trong hoang gia Anh?'),
    findall(Husband, husband(Husband, _Wife), List),
    ( List \= [] -> 
        format('Nhung nguoi la chong trong hoang gia Anh: ~w~n', [List]) 
    ; 
        writeln('Khong co!')
    ).
    % Cau tra loi: Nhung nguoi la chong trong hoang gia Anh: [Philip Duke,Prince Charles,Prince Edward,Timothy Laurence,Jack Brooksbank,Prince William,Prince Harry,Mike Tindall,Edoardo Mapelli Mozzi]
% Wife
cau_22 :- 
    writeln('Ai la vo cua Prince Charles?'),
    wife(Person, 'Prince Charles') -> writeln(Person); writeln('Khong biet!').
    % Cau tra loi: Camilla Duchess
cau_23 :- 
    writeln('Nu hoang Elizabeth II co phai la vo cua Duke of Edinburgh khong?'),
    wife('Queen Elizabeth II','Philip Duke') -> writeln('Dung'); writeln('Sai').
    % Cau tra loi: Dung
cau_24 :- 
    writeln('Ai la vo trong hoang gia Anh?'),
    findall(Wife, wife(Wife, _Husband), List),
    ( List \= [] -> 
        format('Nhung nguoi la vo trong hoang gia Anh: ~w~n', [List]) 
    ; 
        writeln('Khong co!')
    ).
    % Cau tra loi: Nhung nguoi la vo trong hoang gia Anh: [Queen Elizabeth II,Princess Anne,Sophie Countess,Camilla Duchess,Princess Beatrice,Princess Eugenie,Catherine Duchess,Meghan Duchess,Zara Tindall]
% Father
cau_25 :- 
    writeln('Ai la cha cua Prince William?'),
    father(Person, 'Prince William') -> writeln(Person); writeln('Khong biet!').
    % Cau tra loi: Prince Charles
cau_26 :- 
    writeln('Hoang tu Charles co phai la cha cua Prince George khong?'),
    father('Prince Charles','Prince George') -> writeln('Dung'); writeln('Sai').
    % Cau tra loi: Sai
cau_27 :- 
    writeln('Ai la cha cua Philip Duke?'),
    father(Person, 'Philip Duke') -> writeln(Person); writeln('Khong biet!').
    % Cau tra loi: Khong biet!
% Mother
cau_28 :- 
    writeln('Ai la me cua Prince William?'),
    mother(Person, 'Prince William') -> writeln(Person); writeln('Khong biet!').
    % Cau tra loi: Princess Diana
cau_29 :- 
    writeln('Princess Diana co phai la me cua Prince Harry khong?'),
    mother('Princess Diana','Prince Harry') -> writeln('Dung'); writeln('Sai').
    % Cau tra loi: Dung
cau_30 :- 
    writeln('Ai la me trong hoang gia Anh?'),
    findall(Mother, mother(Mother, _Child), RawList),
    sort(RawList, List), % Loai bo cac gia tri trung lap
    ( List \= [] -> 
        format('Nhung nguoi la me trong hoang gia Anh: ~w~n', [List]) 
    ; 
        writeln('Khong co!')
    ).
    % Cau tra loi: Nhung nguoi la me trong hoang gia Anh: [Autumn Phillips,Catherine Duchess,Meghan Duchess,Princess Anne,Princess Beatrice,Princess Diana,Princess Eugenie,Queen Elizabeth II,Sarah Ferguson,Sophie Countess,Zara Tindall]
% Child
cau_31 :- 
    writeln('Ai la con cua Queen Elizabeth II?'),
    findall(Child, child(Child, 'Queen Elizabeth II'), List),
    ( List \= [] -> 
        format('Nhung nguoi con cua Queen Elizabeth II: ~w~n', [List]) 
    ; 
        writeln('Khong co!')
    ).
    % Cau tra loi: Nhung nguoi con cua Queen Elizabeth II: [Prince Charles,Princess Anne,Prince Andrew,Prince Edward]
cau_32 :- 
    writeln('Princess Anne co phai la con cua Nu hoang Elizabeth II khong?'),
    child('Princess Anne','Queen Elizabeth II') -> writeln('Dung'); writeln('Sai').
    % Cau tra loi: Dung
cau_33 :- 
    writeln('Hoang tu Edward co phai la con cua Duke of Edinburgh khong?'),
    child('Prince Edward','Philip Duke') -> writeln('Dung'); writeln('Sai').
    % Cau tra loi: Dung
% Son
cau_34 :- 
    writeln('Ai la con trai cua Queen Elizabeth II?'),
    findall(Son, son(Son, 'Queen Elizabeth II'), List),
    ( List \= [] -> 
        format('Nhung nguoi con trai cua Queen Elizabeth II: ~w~n', [List]) 
    ; 
        writeln('Khong co!')
    ).
    % Cau tra loi: Nhung nguoi con trai cua Queen Elizabeth II: [Prince Charles,Prince Andrew,Prince Edward]
cau_35 :- 
    writeln('Lucas co phai la con trai cua Duke of Edinburgh khong?'),
    son('Lucas','Philip Duke') -> writeln('Dung'); writeln('Sai').
    % Cau tra loi: Sai
cau_36 :- 
    writeln('Co bao nhieu con trai trong gia dinh hoang gia?'),
    findall(Son, son(Son, _Parent), RawList),
    sort(RawList, List), % Loai bo cac gia tri trung lap
    ( List \= [] -> 
        format('Nhung nguoi con trai trong hoang gia Anh: ~w~n', [List]) 
    ; 
        writeln('Khong co!')
    ).
    % Cau tra loi: Nhung nguoi con trai trong hoang gia Anh: [Archie Harrison,August Brooksbank,James,Lucas,Peter Phillips,Prince Andrew,Prince Charles,Prince Edward,Prince George,Prince Harry,Prince Louis,Prince William]
% Daughter
cau_37 :- 
    writeln('Ai la con gai cua Queen Elizabeth II?'),
    findall(Daughter, daughter(Daughter, 'Queen Elizabeth II'), List),
    ( List \= [] -> 
        format('Nhung nguoi con gai cua Queen Elizabeth II: ~w~n', [List]) 
    ; 
        writeln('Khong co!')
    ).
    % Cau tra loi: Nhung nguoi con gai cua Queen Elizabeth II: [Princess Anne]
cau_38 :- 
    writeln('Princess Anne co phai la con gai cua Duke of Edinburgh khong?'),
    child('Princess Anne','Philip Duke') -> writeln('Dung'); writeln('Sai').
    % Cau tra loi: Dung
cau_39 :- 
    writeln('Co bao nhieu con gai trong gia dinh hoang gia?'),
    findall(Daughter, daughter(Daughter, _Parent), RawList),
    sort(RawList, List), % Loai bo cac gia tri trung lap
    ( List \= [] -> 
        format('Nhung nguoi con gai trong hoang gia Anh: ~w~n', [List]) 
    ; 
        writeln('Khong co!')
    ).
    % Cau tra loi: Nhung nguoi con gai trong hoang gia Anh: [Isla,Lady Louise,Lena,Lilibet Diana,Mia,Princess Anne,Princess Beatrice,Princess Charlotte,Princess Eugenie,Savannah,Sienna Elizabeth Mapelli Mozzi,Zara Tindall]
% Grandparent
cau_40 :- 
    writeln('Ai la ong/ba cua Prince George?'),
    grandparent(GP, 'Prince George') -> writeln(GP); writeln('Khong biet!').
    % Cau tra loi: Prince Charles
cau_41 :- 
    writeln('Queen Elizabeth II co phai la ba cua ai khong?'),
    grandparent('Queen Elizabeth II', GC) -> writeln(GC); writeln('Khong biet!').
    % Cau tra loi: Prince William
cau_42 :- 
    writeln('Ai la ong/ba cua Prince Harry?'),
    grandparent(GP, 'Prince Harry') -> writeln(GP); writeln('Khong biet!').
    % Cau tra loi: Queen Elizabeth II
% Grandmother
cau_43 :- 
    writeln('Ai la ba cua Princess Charlotte?'),
    grandmother(GM, 'Princess Charlotte') -> writeln(GM); writeln('Khong biet!').
    % Cau tra loi: Princess Diana
cau_44 :- 
    writeln('Queen Elizabeth II co phai la ba cua ai?'),
    grandmother('Queen Elizabeth II', GC) -> writeln(GC); writeln('Khong biet!').
    % Cau tra loi: Prince William
cau_45 :- 
    writeln('Ai la ba cua Prince Louis?'),
    grandmother(GM, 'Prince Louis') -> writeln(GM); writeln('Khong biet!').
    % Cau tra loi: Princess Diana
% Grandfather
cau_46 :- 
    writeln('Ai la ong cua Prince Harry?'),
    grandfather(GF, 'Prince Harry') -> writeln(GF); writeln('Khong biet!').
    % Cau tra loi: Philip Duke
cau_47 :- 
    writeln('Cong tuoc Philip co phai la ong cua ai?'),
    grandfather('Philip Duke', GC) -> writeln(GC); writeln('Khong biet!').
    % Cau tra loi: Prince William
cau_48 :- 
    writeln('Ai la ong cua Prince George?'),
    grandfather(GF, 'Prince George') -> writeln(GF); writeln('Khong biet!').
    % Cau tra loi: Prince Charles
% Grandchild
cau_49 :- 
    writeln('Ai la chau cua Queen Elizabeth II?'),
    grandchild(GC, 'Queen Elizabeth II') -> writeln(GC); writeln('Khong biet!').
    % Cau tra loi: Prince William
cau_50 :- 
    writeln('Prince Harry la chau cua ai?'),
    grandchild('Prince Harry', GP)  -> writeln(GP); writeln('Khong biet!').
    % Cau tra loi: Queen Elizabeth II
cau_51 :- 
    writeln('Ai la chau cua Prince Andrew?'),
    grandchild(GC, 'Prince Andrew')  -> writeln(GC); writeln('Khong biet!').
     % Cau tra loi: Sienna Elizabeth Mapelli Mozzi
% Grandson
cau_52 :- 
    writeln('Ai la chau trai cua Queen Elizabeth II?'),
    findall(GS, grandson(GS, 'Queen Elizabeth II'), RawList),
    sort(RawList, List), % Loai bo cac gia tri trung lap
    ( List \= [] -> 
        format('Nhung nguoi chau trai cua Queen Elizabeth II: ~w~n', [List]) 
    ; 
        writeln('Khong co!')
    ).
    % Cau tra loi: Nhung nguoi chau trai cua Queen Elizabeth II: [James,Peter Phillips,Prince Harry,Prince William]
cau_53 :- 
    writeln('Prince George la chau trai cua ai?'),
    findall(GP, grandson('Prince George', GP), RawList),
    sort(RawList, List), % Loai bo cac gia tri trung lap
    ( List \= [] -> 
        format('Ong ba cua Prince George: ~w~n', [List]) 
    ; 
        writeln('Khong co!')
    ).
    % Cau tra loi: Ong ba cua Prince George: [Prince Charles,Princess Diana]
cau_54 :- 
    writeln('Ai la chau trai cua Prince William?'),
    findall(GS, grandson(GS, 'Prince William'), RawList),
    sort(RawList, List), % Loai bo cac gia tri trung lap
    ( List \= [] -> 
        format('Nhung nguoi chau trai cua Prince William: ~w~n', [List]) 
    ; 
        writeln('Khong co!')
    ).
    % Cau tra loi: Khong co!
% Granddaughter
cau_55 :- 
    writeln('Ai la chau gai cua Queen Elizabeth II?'),
    findall(GD, granddaughter(GD, 'Queen Elizabeth II'), RawList),
    sort(RawList, List), % Loai bo cac gia tri trung lap
    ( List \= [] -> 
        format('Nhung nguoi chau gai cua Queen Elizabeth II: ~w~n', [List]) 
    ; 
        writeln('Khong co!')
    ).
    % Cau tra loi: Nhung nguoi chau gai cua Queen Elizabeth II: [Lady Louise,Princess Beatrice,Princess Eugenie,Zara Tindall]
cau_56 :- 
    writeln('Princess Charlotte la chau gai cua ai?'),
    findall(GP, granddaughter('Princess Charlotte', GP), RawList),
    sort(RawList, List), % Loai bo cac gia tri trung lap
    ( List \= [] -> 
        format('Ong ba cua Princess Charlotte: ~w~n', [List]) 
    ; 
        writeln('Khong co!')
    ).
    % Cau tra loi: Ong ba cua Princess Charlotte: [Prince Charles,Princess Diana]
cau_57 :- 
    writeln('Co bao nhieu chau gai trong hoang gia?'),
    findall(GD, granddaughter(GD, _GP), RawList),
    sort(RawList, List), % Loai bo cac gia tri trung lap
    ( List \= [] -> 
        format('Nhung nguoi chau gai trong hoang gia: ~w~n', [List]) 
    ; 
        writeln('Khong co!')
    ).
    % Cau tra loi: Nhung nguoi chau gai trong hoang gia: [Isla,Lady Louise,Lena,Lilibet Diana,Mia,Princess Beatrice,Princess Charlotte,Princess Eugenie,Savannah,Sienna Elizabeth Mapelli Mozzi,Zara Tindall]
% Sibling
cau_58 :- 
    writeln('Ai la anh/chi/em cua Prince William?'),
    findall(Sib, sibling(Sib, 'Prince William'), RawList),
    sort(RawList, List), % Loai bo cac gia tri trung lap
    ( List \= [] -> 
        format('Anh/chi/em cua Prince William: ~w~n', [List]) 
    ; 
        writeln('Khong co!')
    ).
    % Cau tra loi: Anh/chi/em cua Prince William: [Prince Harry]
cau_59 :- 
    writeln('Prince Harry co phai la em cua Prince William khong?'),
    sibling('Prince Harry', 'Prince William') -> writeln('Dung'); writeln('Sai').
    % Cau tra loi: Dung
cau_60 :- 
    writeln('Co bao nhieu anh chi em trong hoang gia?'),
    findall(Sib, sibling(Sib, _Person), RawList),
    sort(RawList, List), % Loai bo cac gia tri trung lap
    ( List \= [] -> 
        format('Nhung nguoi chau gai trong hoang gia: ~w~n', [List]) 
    ; 
        writeln('Khong co!')
    ).
    % Cau tra loi: Nhung nguoi chau gai trong hoang gia:[Archie Harrison,Isla,James,Lady Louise,Lena,Lilibet Diana,Lucas,Mia,Peter Phillips,Prince Andrew,Prince Charles,Prince Edward,Prince George,Prince Harry,Prince Louis,Prince William,Princess Anne,Princess Beatrice,Princess Charlotte,Princess Eugenie,Savannah,Zara Tindall]
% Brother
cau_61 :- 
    writeln('Ai la anh/em trai cua Princess Anne?'),
    findall(Bro, brother('Princess Anne', Bro), RawList),
    sort(RawList, List), % Loai bo cac gia tri trung lap
    ( List \= [] -> 
        format('Anh/em trai cua Princess Anne: ~w~n', [List]) 
    ; 
        writeln('Khong co!')
    ).
    % Cau tra loi: Anh/em trai cua Princess Anne: [Prince Andrew,Prince Charles,Prince Edward]
cau_62 :- 
    writeln('Prince Edward co phai la em trai cua Prince Charles khong?'),
    brother('Prince Edward', 'Prince Charles') -> writeln('Dung'); writeln('Sai').
    % Cau tra loi: Dung
cau_63 :- 
    writeln('Anh/em trai cua Lucas la ai?'),
    findall(Bro, brother('Lucas', Bro), RawList),
    sort(RawList, List), % Loai bo cac gia tri trung lap
    ( List \= [] -> 
        format('Anh/em trai cua Lucas: ~w~n', [List]) 
    ; 
        writeln('Khong co!')
    ).
    % Cau tra loi: Khong co!
% Sister
cau_64 :- 
    writeln('Ai la chi/em gai cua Prince Charles?'),
    findall(Sis, sister('Prince Charles', Sis), RawList),
    sort(RawList, List), % Loai bo cac gia tri trung lap
    ( List \= [] -> 
        format('Chi/em gai cua Prince Charles: ~w~n', [List]) 
    ; 
        writeln('Khong co!')
    ).
    % Cau tra loi: Chi/em gai cua Prince Charles: [Princess Anne]
cau_65 :- 
    writeln('Princess Anne co phai la chi gai cua Prince Edward khong?'),
    sister('Princess Anne', 'Prince Edward') -> writeln('Dung'); writeln('Sai').
    % Cau tra loi: Sai
cau_66 :- 
    writeln('Ai la chi/em gai cua Queen Elizabeth II?'),
    findall(Sis, sister('Queen Elizabeth II', Sis), RawList),
    sort(RawList, List), % Loai bo cac gia tri trung lap
    ( List \= [] -> 
        format('Chi/em gai cua Queen Elizabeth II: ~w~n', [List]) 
    ; 
        writeln('Khong co!')
    ).
    % Cau tra loi: Khong co!
% Aunt
cau_67 :- 
    writeln('Ai la di/co cua Prince George?'),
    findall(Aunt, aunt(Aunt, 'Prince George'), RawList),
    sort(RawList, List), % Loai bo cac gia tri trung lap
    ( List \= [] -> 
        format('Di/co cua Prince George: ~w~n', [List]) 
    ; 
        writeln('Khong co!')
    ).
    % Cau tra loi: Di/co cua Prince George: [Meghan Duchess]
cau_68 :- 
    writeln('Princess Anne co phai la di cua Hoang tu Harry khong?'),
    aunt('Princess Anne', 'Prince Harry') -> writeln('Dung'); writeln('Sai').
    % Cau tra loi: Dung
cau_69 :- 
    writeln('Ai la di/co trong hoang gia?'),
    findall(Aunt, aunt(Aunt, _N), RawList),
    sort(RawList, List), % Loai bo cac gia tri trung lap
    ( List \= [] -> 
        format('Di/co trong hoang gia: ~w~n', [List]) 
    ; 
        writeln('Khong co!')
    ).
    % Cau tra loi: Di/co trong hoang gia: [Camilla Duchess,Catherine Duchess,Meghan Duchess,Princess Anne,Princess Beatrice,Princess Eugenie,Sophie Countess,Zara Tindall]
% Uncle
cau_70 :- 
    writeln('Ai la chu/cau cua Princess Charlotte?'),
    findall(Uncle,uncle(Uncle,'Princess Charlotte'), RawList),
    sort(RawList, List), % Loai bo cac gia tri trung lap
    ( List \= [] -> 
        format('Chu/cau cua Princess Charlotte: ~w~n', [List]) 
    ; 
        writeln('Khong co!')
    ).
    % Cau tra loi: Chu/cau cua Princess Charlotte: [Prince Harry]
cau_71 :- 
    writeln('Prince Andrew co phai la chu cua Prince George khong?'),
    uncle('Prince Andrew','Prince George') -> writeln('Dung'); writeln('Sai').
    % Cau tra loi: Sai
cau_72 :- 
    writeln('Ai la chu/cau trong hoang gia?'),
    findall(Uncle,uncle(Uncle,_N), RawList),
    sort(RawList, List), % Loai bo cac gia tri trung lap
    ( List \= [] -> 
        format('Chu/cau cua hoang gia: ~w~n', [List]) 
    ; 
        writeln('Khong co!')
    ).
    % Cau tra loi: Chu/cau cua hoang gia: [Camilla Duchess,Edoardo Mapelli Mozzi,Jack Brooksbank,Peter Phillips,Prince Andrew,Prince Charles,Prince Edward,Prince Harry,Prince William,Sophie Countess]
% Niece
cau_73 :- 
    writeln('Ai la chau gai cua Princess Anne?'),
    findall(Niece,niece(Niece,'Princess Anne'), RawList),
    sort(RawList, List), % Loai bo cac gia tri trung lap
    ( List \= [] -> 
        format('Chau gai cua Princess Anne: ~w~n', [List]) 
    ; 
        writeln('Khong co!')
    ).
    % Cau tra loi: Chau gai cua Princess Anne: [Lady Louise,Princess Beatrice,Princess Eugenie]
cau_74 :- 
    writeln('Princess Charlotte co phai la chau gai cua Prince Andrew khong?'),
    niece('Princess Charlotte','Prince Andrew') -> writeln('Dung'); writeln('Sai').
    % Cau tra loi: Sai
cau_75 :- 
    writeln('Ai la chau gai trong hoang gia?'),
    findall(Niece,niece(Niece,_U), RawList),
    sort(RawList, List), % Loai bo cac gia tri trung lap
    ( List \= [] -> 
        format('Chau gai trong hoang gia: ~w~n', [List]) 
    ; 
        writeln('Khong co!')
    ).
    % Cau tra loi: Chau gai trong hoang gia: [Isla,Lady Louise,Lena,Lilibet Diana,Mia,Princess Beatrice,Princess Charlotte,Princess Eugenie,Savannah,Sienna Elizabeth Mapelli Mozzi,Zara Tindall]
% Nephew
cau_76 :- 
    writeln('Ai la chau trai cua Duke of Edinburgh ?'),
    findall(Nephew,nephew(Nephew,'Philip Duke'), RawList),
    sort(RawList, List), % Loai bo cac gia tri trung lap
    ( List \= [] -> 
        format('Chau trai cua Duke of Edinburgh: ~w~n', [List]) 
    ; 
        writeln('Khong co!')
    ).
    % Cau tra loi: Khong co!
cau_77 :- 
    writeln('Prince George co phai la chau trai cua Princess Anne khong ?'),
    nephew('Prince George','Princess Anne') -> writeln('Dung'); writeln('Sai').
    % Cau tra loi: Sai
cau_78 :- 
    writeln('Ai la chau trai trong hoang gia?'),
    findall(Nephew,nephew(Nephew,_U), RawList),
    sort(RawList, List), % Loai bo cac gia tri trung lap
    ( List \= [] -> 
        format('Chau trai trong hoang gia: ~w~n', [List]) 
    ; 
        writeln('Khong co!')
    ).
    % Cau tra loi: Chau trai trong hoang gia: [Archie Harrison,August Brooksbank,James,Lucas,Peter Phillips,Prince George,Prince Harry,Prince Louis,Prince William]