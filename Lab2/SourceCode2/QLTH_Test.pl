% Load tri thuc
:- ['QLTH.pl'].
:- writeln('Go cau_1., cau_2., ... cau_90. de xem cau hoi va cau tra loi').
%   Truong bo mon
cau_1 :-
  writeln('Cau hoi: Truong bo mon Cong nghe phan mem la ai ?'),
  writeln('Cau tra loi:'),
  truong_bo_mon(TBM,'Cong nghe phan mem') -> writeln(TBM); writeln('Khong biet!').
  % Cau tra loi: PGS.TS. Nguyen Van Vu
cau_2 :-
  writeln('Cau hoi: Ai la truong bo mon cua bo mon Cong nghe tri tue nhan tao?'),
  writeln('Cau tra loi:'),
  truong_bo_mon(TBM,'Cong nghe tri tue nhan tao') -> writeln(TBM); writeln('Khong biet!').
  % Cau tra loi: Khong biet!
cau_3 :-
  writeln('Cau hoi: Bo mon nao do PGS.TS. Nguyen Dinh Thuc lam truong bo mon?'),
  writeln('Cau tra loi:'),
  truong_bo_mon('PGS.TS. Nguyen Dinh Thuc',BM) -> writeln(BM); writeln('Khong biet!').
  % Cau tra loi: Cong nghe tri thuc
%    Giao vien thuoc phong ban
cau_4:-
  writeln('Cau hoi: Thay/co nao thuoc Phong Dao tao?'),
  writeln('Cau tra loi:'),
  findall(GV, giao_vien(GV, 'Phong Dao tao'), List),
   ( List \= [] -> 
        format('Nhung thay/co thuoc Phong Dao tao: ~w~n', [List]) 
    ; 
        writeln('Phong Dao tao khong co giao vien nao')
    ).
    % Cau tra loi: Nhung thay/co thuoc Phong Dao tao: [TS. Tran Thai Son,ThS. Le Van Lai,ThS. Pham Thi Thuan]
cau_5 :-
  writeln('Cau hoi: ThS. Nguyen Thi Ngoc Han thuoc phong ban nao?'),
  writeln('Cau tra loi:'),
  giao_vien('ThS. Nguyen Thi Ngoc Han',PB) -> writeln(PB); writeln('Khong biet!').
  % Cau tra loi: Phong Cong tac sinh vien
cau_6 :-
  writeln('Cau hoi: TS. Tran Thai Son co thuoc vao phong ban nao khong?'),
  writeln('Cau tra loi:'),
  giao_vien('TS. Tran Thai Son',PB) -> writeln(PB); writeln('Khong biet!').
  % Cau tra loi: Phong Dao tao
%    Bo mon thuoc nganh
cau_7:-
  writeln('Cau hoi: Bo mon nao thuoc nganh Cong nghe thong tin - He dai tra?'),
  writeln('Cau tra loi:'),
  findall(BM, bo_mon_thuoc_nganh(BM, 'Cong nghe thong tin - He dai tra'), List),
   ( List \= [] -> 
        format('Nhung bo mon thuoc nganh Cong nghe thong tin - He dai tra: ~w~n', [List]) 
    ; 
        writeln('Khong co bo mon nao thuoc nganh Cong nghe thong tin - He dai tra')
    ).
    % Cau tra loi: Nhung bo mon thuoc nganh Cong nghe thong tin - He dai tra: [Cong nghe tri thuc,Khoa hoc may tinh,Thi giac may tinh,Cong nghe phan mem,Mang may tinh va vien thong,He thong thong tin]
cau_8 :-
  writeln('Cau hoi: Bo mon Cong nghe phan mem thuoc nganh nao?'),
  writeln('Cau tra loi:'),
  findall(N, bo_mon_thuoc_nganh('Cong nghe phan mem', N), List),
   ( List \= [] -> 
        format('Bo mon Cong nghe phan mem thuoc nhung nganh: ~w~n', [List]) 
    ; 
        writeln('Khong biet!')
    ).
    % Cau tra loi: Bo mon Cong nghe phan mem thuoc nhung nganh: [Cong nghe thong tin - He dai tra,Cong nghe thong tin - Tang cuong Tieng Anh]
cau_9 :-
  writeln('Cau hoi: Bo mon Vi sinh co thuoc nganh Toan khong ?'),
  writeln('Cau tra loi:'),
  bo_mon_thuoc_nganh('Vi sinh', 'Toan') -> writeln('Co!'); writeln('Khong!').
  % Cau tra loi: Khong!
%    Nganh thuoc khoa
cau_10:-
  writeln('Cau hoi: Nganh Cong nghe thong tin - Tang cuong Tieng Anh thuoc khoa nao?'),
  writeln('Cau tra loi:'),
  nganh_thuoc_khoa('Cong nghe thong tin - Tang cuong Tieng Anh',Khoa) -> (writeln('Nganh Cong nghe thong tin - Tang cuong Tieng Anh thuoc khoa: '),
  writeln(Khoa)); writeln('Khong biet!').
  % Cau tra loi: Cong nghe thong tin
cau_11 :-
  writeln('Cau hoi: Nganh nao thuoc khoa Cong nghe thong tin?'),
  writeln('Cau tra loi:'),
  findall(N, nganh_thuoc_khoa(N, 'Cong nghe thong tin'), List),
   ( List \= [] -> 
        format('Nhung nganh thuoc khoa Cong nghe thong tin: ~w~n', [List]) 
    ; 
        writeln('Khong biet!')
    ).
    % Nhung nganh thuoc khoa Cong nghe thong tin: [Cong nghe thong tin - He dai tra,Cong nghe thong tin - Tang cuong Tieng Anh,Cong nghe thong tin - Chuong trinh tien tien]
cau_12:-
  writeln('Cau hoi: Nganh Vat ly ky thuat thuoc khoa nao?'),
  writeln('Cau tra loi:'),
  nganh_thuoc_khoa('Vat ly ky thuat',Khoa) -> (writeln('Nganh Vat ly ky thuat thuoc khoa: '),
  writeln(Khoa)); writeln('Khong biet!').
  % Cau tra loi: Khong biet!
%    Khoa truc thuoc truong
cau_13 :-
  writeln('Cau hoi: Khoa nao thuoc truong HCMUS?'),
  writeln('Cau tra loi:'),
  findall(K, khoa_truc_thuoc(K, 'HCMUS'), List),
   ( List \= [] -> 
        format('Nhung khoa thuoc truong HCMUS: ~w~n', [List]) 
    ; 
        writeln('Khong biet!')
    ).
    % Cau tra loi: Nhung khoa thuoc truong HCMUS: [Cong nghe thong tin,Vat ly - Vat ly ky thuat,Toan,Sinh hoc]
cau_14:-
  writeln('Cau hoi: Khoa Sinh hoc co thuoc truong HCMUS khong?'),
  writeln('Cau tra loi:'),
  khoa_truc_thuoc('Sinh hoc', 'HCMUS') -> writeln('Co!'); writeln('Khong!').
  % cau tra loi: Co!
cau_15:-
  writeln('Cau hoi: Khoa Hoa co thuoc truong HCMUS khong?'),
  writeln('Cau tra loi:'),
  khoa_truc_thuoc('Hoa', 'HCMUS') -> writeln('Co!'); writeln('Khong biet!').
  % Cau tra loi: Khong biet!
%    Phong ban truc thuoc truong
cau_16 :-
  writeln('Cau hoi: Phong ban nao thuoc truong HCMUS?'),
  writeln('Cau tra loi:'),
  findall(PB, phongban_truc_thuoc(PB, 'HCMUS'), List),
   ( List \= [] -> 
        format('Nhung phong ban thuoc truong HCMUS: ~w~n', [List]) 
    ; 
        writeln('Khong biet!')
    ).
   % Cau tra loi: Nhung phong ban thuoc truong HCMUS: [Phong Dao tao,Phong Khao thi,Phong Cong tac sinh vien]
cau_17:-
  writeln('Cau hoi: Phong Cong tac sinh vien thuoc truong HCMUS khong?'),
  writeln('Cau tra loi:'),
  phongban_truc_thuoc('Phong Cong tac sinh vien', 'HCMUS') -> writeln('Co!'); writeln('Khong!').
  % Cau tra loi: Co!
cau_18:-
  writeln('Cau hoi: Giao vu co thuoc truong HCMUS khong??'),
  writeln('Cau tra loi:'),
  phongban_truc_thuoc('Giao vu', 'HCMUS') -> writeln('Co!'); writeln('Khong biet!').
  % Cau tra loi: Khong biet!
%    Ca nhan duoc khen thuong
cau_19 :-
  writeln('Cau hoi: Thay/co nao duoc khen thuong?'),
  writeln('Cau tra loi:'),
  findall(GV, khen_thuong_ca_nhan(GV), List),
   ( List \= [] -> 
        format('Nhung thay/co duoc khen thuong: ~w~n', [List]) 
    ; 
        writeln('Khong biet!')
    ).
  % Cau tra loi: Nhung thay/co duoc khen thuong: [GS.TS. Le Hoai Bac,PGS.TS. Nguyen Van Vu]
cau_20:-
  writeln('Cau hoi: TS. Vu Do Huy Cuong co duoc khen thuong khong?'),
  writeln('Cau tra loi:'),
  khen_thuong_ca_nhan('TS. Vu Do Huy Cuong') -> writeln('Co!'); writeln('Khong!').
  % Cau tra loi: Khong!
cau_21:-
  writeln('Cau hoi: Co ai duoc khen thuong khong?'),
  writeln('Cau tra loi:'),
  khen_thuong_ca_nhan(_GV) -> writeln('Co!'); writeln('Khong!').
  % Cau tra loi: Co!
%    Khen thuong (ca nhan) trong viec
cau_22 :-
  writeln('Cau hoi: Thay/co nao duoc khen thuong giai Giang vien xuat sac?'),
  writeln('Cau tra loi:'),
  findall(GV, khen_thuong(GV, 'Giang vien xuat sac'), List),
   ( List \= [] -> 
        format('Nhung thay/co duoc khen thuong giai Giang vien xuat sac: ~w~n', [List]) 
    ; 
        writeln('Khong biet!')
    ).
    % Cau tra loi: Khong biet!
cau_23:-
  writeln('Cau hoi: PGS.TS. Nguyen Dinh Thuc duoc khen thuong giai nao khong?'),
  writeln('Cau tra loi:'),
  khen_thuong('PGS.TS. Nguyen Dinh Thuc', Giai)
 -> (writeln('Giai thuong cua PGS.TS. Nguyen Dinh Thuc: '),
  writeln(Giai)); writeln('Khong biet!').
  % Cau tra loi: Khong biet!
cau_24:-
  writeln('Cau hoi: Co ai duoc khen thuong ve bat ky giai nao khong?'),
  writeln('Cau tra loi:'),
  findall((GV,Giai),khen_thuong(GV, Giai),List),
 ( List \= [] -> 
        format('Nhung thay/co duoc khen thuong va cac giai thuong: ~w~n', [List]) 
    ; 
        writeln('Khong biet!')
    ).
  % Cau tra loi: Nhung thay/co duoc khen thuong va cac giai thuong: [(PGS.TS Ngo Dai Nghiep,Khen thuong trong viec giang day mon Nhap mon nganh Sinh hoc – Cong nghe Sinh hoc (Nam hoc 2021-2022)),(TS. Nguyen Thuy Vy,Khen thuong trong viec giang day mon Nhap mon nganh Sinh hoc – Cong nghe Sinh hoc (Nam hoc 2021-2022))]
%    Truong bo mon thuoc nganh
cau_25:-
  writeln('Cau hoi: PGS.TS. Nguyen Dinh Thuc thuoc nganh nao?'),
  writeln('Cau tra loi:'),
  findall(Nganh, truongbm_thuoc_nganh('PGS.TS. Nguyen Dinh Thuc', Nganh), List),
  ( List \= []
 -> (writeln('PGS.TS. Nguyen Dinh Thuc thuoc nganh: '),
  writeln(List)); writeln('Khong biet!')
  ).
  % Cau tra loi: PGS.TS. Nguyen Dinh Thuc thuoc nganh: [Cong nghe thong tin - He dai tra,Cong nghe thong tin - Tang cuong Tieng Anh]
cau_26:-
  writeln('Cau hoi: Nganh Toan-Tin hoc co truong bo mon nao?'),
  writeln('Cau tra loi:'),
  findall(TBM, truongbm_thuoc_nganh(TBM, 'Toan-Tin hoc'), List),
  ( List \= []
 -> (writeln('Nganh Toan-Tin hoc co nhung truong bo mon: '),
  writeln(List)); writeln('Khong biet!')
  ).
  % Cau tra loi: Nganh Toan-Tin hoc co nhung truong bo mon: [TS. Vu Do Huy Cuong,PGS.TS. Mai Hoang Bien]
cau_27:-
  writeln('Cau hoi: Truong bo mon Khoa hoc may tinh co thuoc nganh Toan-tin hoc khong?'),
  writeln('Cau tra loi:'),
  (truong_bo_mon(TBM,'Khoa hoc may tinh'), truongbm_thuoc_nganh(TBM, 'Toan-Tin hoc')) -> writeln('Co!'); writeln('Khong!').
  % Cau tra loi: Khong!
%    Truong bo mon thuoc khoa
cau_28:-
  writeln('Cau hoi: Truong bo mon nao thuoc khoa Sinh hoc?'),
  writeln('Cau tra loi:'),
  findall(TBM, truongbm_thuoc_khoa(TBM, 'Sinh hoc'), List),
  ( List \= []
 -> (writeln('Truong bo mon thuoc khoa Sinh: '),
  writeln(List)); writeln('Khong biet!')
  ).
  % Cau tra loi: Truong bo mon thuoc khoa Sinh: [TS. Nguyen Thuy Vy,PGS.TS. Nguyen Duc Hoang,PGS.TS. Ngo Dai Nghiep]
cau_29 :-
  writeln('Cau hoi: GS.TS. Le Hoai Bac thuoc khoa nao?'),
  writeln('Cau tra loi:'),
  truongbm_thuoc_khoa('GS.TS. Le Hoai Bac',K) -> writeln(K); writeln('Khong biet!').
  % Cau tra loi: Cong nghe thong tin
cau_30 :-
  writeln('Cau hoi: TS. Tran Trung Dung thuoc khoa Toan dung khong?'),
  writeln('Cau tra loi:'),
  truongbm_thuoc_khoa('TS. Tran Trung Dung','Toan') -> writeln('Dung!'); writeln('Khong!').
  % Cau tra loi: Khong!
%    Truong bo mon thuoc truong
cau_31:-
  writeln('Cau hoi: Nhung ai la truong bo mon cua truong HCMUS?'),
  writeln('Cau tra loi:'),
  findall(TBM, truongbm_thuoc_truong(TBM, 'HCMUS'), RawList),
  sort(RawList, List),
  ( List \= []
 -> (writeln('Nhung truong bo mon thuoc truong HCMUS: '),
  writeln(List)); writeln('Khong biet!')
  ).
  % Cau tra loi:Nhung truong bo mon thuoc truong HCMUS: [GS.TS. Le Hoai Bac,PGS.TS. Huynh Van Tuan,PGS.TS. Ly Quoc Ngoc,PGS.TS. Mai Hoang Bien,PGS.TS. Ngo Dai Nghiep,PGS.TS. Nguyen Dinh Thuc,PGS.TS. Nguyen Duc Hoang,PGS.TS. Nguyen Van Vu,PGS.TS. Tran Quang Trung,TS. Nguyen Thuy Vy,TS. Pham Nguyen Cuong,TS. Tran Trung Dung,TS. Vu Do Huy Cuong,TS. Vu Quang Tuyen]
cau_32 :-
  writeln('Cau hoi: PGS.TS. Nguyen Dinh Thuc thuoc truong nao?'),
  writeln('Cau tra loi:'),
  truongbm_thuoc_truong('PGS.TS. Nguyen Dinh Thuc',T) -> format('PGS.TS. Nguyen Dinh Thuc thuoc truong: ~w~n',T); writeln('Khong biet!').
  % Cau tra loi: PGS.TS. Nguyen Dinh Thuc thuoc truong: HCMUS
cau_33 :-
  writeln('Cau hoi: PGS.TS. Tran Quang Trung co phai la truong bo mon cua truong DHKHTN khong?'),
  writeln('Cau tra loi:'),
  truongbm_thuoc_truong('TS. Tran Trung Dung','HCMUS') -> writeln('Dung!'); writeln('Sai!').
  % Cau tra loi: Dung!
%    Bo mon thuoc khoa
cau_34:-
  writeln('Cau hoi: Bo mon nao thuoc khoa Cong nghe thong tin?'),
  writeln('Cau tra loi:'),
  findall(BM, bo_mon_thuoc_khoa(BM, 'Cong nghe thong tin'), RawList),
  sort(RawList, List),
  ( List \= []
 -> (writeln('Nhung bo mon thuoc khoa Cong nghe thong tin: '),
  writeln(List)); writeln('Khong biet!')
  ).
  % Cau tra loi: Nhung bo mon thuoc khoa Cong nghe thong tin: [Cong nghe phan mem,Cong nghe tri thuc,He thong thong tin,Khoa hoc may tinh,Mang may tinh va vien thong,Thi giac may tinh]
cau_35 :-
  writeln('Cau hoi: Bo mon Cong nghe phan mem thuoc khoa nao?'),
  writeln('Cau tra loi:'),
  bo_mon_thuoc_khoa('Cong nghe phan mem',K) -> format('Cong nghe phan mem thuoc khoa: ~w~n',K); writeln('Khong biet!').
  % Cau tra loi: Cong nghe phan mem thuoc khoa: Cong nghe thong tin
cau_36 :-
  writeln('Cau hoi: Bo mon Di truyen thuoc khoa Vat ly - Vat ly ky thuat dung khong?'),
  writeln('Cau tra loi:'),
  bo_mon_thuoc_khoa('Di truyen','Vat ly - Vat ly ky thuat') -> writeln('Dung!'); writeln('Sai!').
  % Cau tra loi: Sai!
%    Bo mon thuoc truong
cau_37:-
  writeln('Cau hoi: Bo mon nao thuoc truong HCMUS?'),
  writeln('Cau tra loi:'),
  findall(BM, bo_mon_thuoc_truong(BM, 'HCMUS'), RawList),
  sort(RawList, List),
  ( List \= []
 -> (writeln('Nhung bo mon thuoc truong HCMUS: '),
  writeln(List)); writeln('Khong biet!')
  ).
  % Cau tra loi: Nhung bo mon thuoc truong HCMUS: [Co hoc,Cong nghe phan mem,Cong nghe tri thuc,Dai so,Di truyen,He thong thong tin,Khoa hoc may tinh,Mang may tinh va vien thong,Sinh hoa,Thi giac may tinh,Vat ly chat ran,Vat ly ly thuyet,Vat ly tin hoc,Vi sinh]
cau_38 :-
  writeln('Cau hoi: Bo mon He thong thong tin thuoc truong nao?'),
  writeln('Cau tra loi:'),
  bo_mon_thuoc_truong('He thong thong tin',T) -> format('He thong thong tin thuoc truong: ~w~n',T); writeln('Khong biet!').
  % Cau tra loi: He thong thong tin thuoc truong: HCMUS
cau_39 :-
  writeln('Cau hoi: Bo mon Di truyen thuoc truong HCMUS dung khong?'),
  writeln('Cau tra loi:'),
  bo_mon_thuoc_truong('Di truyen','HCMUS') -> writeln('Dung!'); writeln('Sai!').
  % Cau tra loi: Dung!
%    Nganh thuoc truong
cau_40 :-
  writeln('Cau hoi: Nganh nao duoc dao tao tai truong HCMUS?'),
  writeln('Cau tra loi:'),
  findall(N, nganh_thuoc_truong(N, 'HCMUS'), RawList),
  sort(RawList, List),
  ( List \= []
 -> (writeln('Nhung nganh duoc dao tao tai truong HCMUS: '),
  writeln(List)); writeln('Khong biet!')
  ).
  % Cau tra loi: Nhung nganh duoc dao tao tai truong HCMUS: [Cong nghe sinh hoc,Cong nghe thong tin - Chuong trinh tien tien,Cong nghe thong tin - He dai tra,Cong nghe thong tin - Tang cuong Tieng Anh,Khoa hoc du lieu,Sinh hoc,Toan-Tin hoc,Vat ly hoc,Vat ly y khoa]
cau_41 :-
  writeln('Cau hoi: Nganh Toan-Tin hoc thuoc truong nao?'),
  writeln('Cau tra loi:'),
  nganh_thuoc_truong('Toan-Tin hoc',T) -> format('Nganh Toan-Tin hoc thuoc truong: ~w~n',T); writeln('Khong biet!').
  % Cau tra loi: Nganh Toan-Tin hoc thuoc truong: HCMUS
cau_42 :-
  writeln('Cau hoi: Nganh Hoa hoc thuoc truong DHKHTN dung khong?'),
  writeln('Cau tra loi:'),
  nganh_thuoc_truong('Hoa hoc','HCMUS') -> writeln('Dung!'); writeln('Khong biet!').
  % Cau tra loi: Khong biet!
%    Truong bo mon thuoc cung khoa
cau_43 :-
  writeln('Cau hoi: PGS.TS. Nguyen Dinh Thuc va truong bo mon nao khac cung thuoc khoa?'),
  writeln('Cau tra loi:'),
  findall(TBM2, truongbm_cung_khoa('PGS.TS. Nguyen Dinh Thuc', TBM2), RawList),
  sort(RawList, List),
  ( List \= []
 -> (writeln('Nhung truong bo mon cung khoa voi PGS.TS. Nguyen Dinh Thuc: '),
  writeln(List)); writeln('Khong biet!')
  ).
  % Cau tra loi: Nhung truong bo mon cung khoa voi PGS.TS. Nguyen Dinh Thuc:[GS.TS. Le Hoai Bac,PGS.TS. Ly Quoc Ngoc,PGS.TS. Nguyen Van Vu,TS. Pham Nguyen Cuong,TS. Tran Trung Dung]
cau_44 :-
  writeln('Cau hoi: Hai truong bo mon nao cung thuoc khoa Toan?'),
  writeln('Cau tra loi:'),
  truongbm_cung_khoa(TBM1,TBM2,'Toan') -> format('Hai truong bo mon cung thuoc khoa Toan la: ~w~n',(TBM1,TBM2)); writeln('Khong biet!').
  % Cau tra loi:Hai truong bo mon cung thuoc khoa Toan la: TS. Vu Do Huy Cuong,PGS.TS. Mai Hoang Bien
cau_45 :-
  writeln('Cau hoi: Truong bo mon Khoa hoc may tinh va truong bo mon Di truyen co cung khoa khong?'),
  writeln('Cau tra loi:'),
  (truong_bo_mon(TBM1,'Khoa hoc may tinh'),truong_bo_mon(TBM2,'Di truyen'), truongbm_cung_khoa(TBM1,TBM2,_K)) -> writeln('Co!'); writeln('Khong!').
  % Cau tra loi: Khong!
%    Truong bo mon cung nganh
cau_46 :-
  writeln('Cau hoi: TS. Vu Do Huy Cuong cung nganh voi truong bo mon nao?'),
  writeln('Cau tra loi:'),
  findall(TBM2, truongbm_cung_nganh('TS. Vu Do Huy Cuong', TBM2, _Nganh), List),
  ( List \= []
 -> format('TS. Vu Do Huy Cuong cung nganh voi cac truong bo mon: ~w~n',List)
  ; writeln('Khong biet!')
  ).
  % Cau tra loi: TS. Vu Do Huy Cuong cung nganh voi cac truong bo mon: PGS.TS. Mai Hoang Bien
cau_47 :- 
  writeln('Cau hoi: Hai truong bo mon bat ky nao cung thuoc nganh Vat ly y khoa?'),
  writeln('Cau tra loi:'),
  truongbm_cung_nganh(TBM1,TBM2,'Vat ly y khoa') -> format('Hai truong bo mon cung thuoc nganh Vat ly y khoa la: ~w~n',(TBM1,TBM2)); writeln('Khong biet!').
  % Cau tra loi: Khong biet!
cau_48 :- 
  writeln('Cau hoi: Hai truong bo mon PGS.TS. Ngo Dai Nghiep va PGS.TS. Mai Hoang Bien co cung nganh khong?'),
  writeln('Cau tra loi:'),
  truongbm_cung_nganh('PGS.TS. Ngo Dai Nghiep','PGS.TS. Mai Hoang Bien',_N) -> format('Hai truong bo mon cung thuoc mot nganh.'); writeln('Hai truong bo mon khong thuoc mot nganh.').
  % Cau tra loi: Hai truong bo mon khong thuoc mot nganh.
%    Truong bo mon cung truong
cau_49 :-
    writeln('Cau hoi: TS. Pham Nguyen Cuong cung truong voi nhung truong bo mon nao?'),
    writeln('Cau tra loi:'),
    findall(TBM2, truongbm_cung_truong('TS. Pham Nguyen Cuong', TBM2), RawList),
    sort(RawList, List),
    ( List \= []
    -> format('TS. Pham Nguyen Cuong cung truong voi cac truong bo mon: ~w~n', [List])
    ; writeln('Khong biet!')
    ).
    % Cau tra loi: TS. Pham Nguyen Cuong cung truong voi cac truong bo mon:[GS.TS. Le Hoai Bac,PGS.TS. Huynh Van Tuan,PGS.TS. Ly Quoc Ngoc,PGS.TS. Mai Hoang Bien,PGS.TS. Ngo Dai Nghiep,PGS.TS. Nguyen Dinh Thuc,PGS.TS. Nguyen Duc Hoang,PGS.TS. Nguyen Van Vu,PGS.TS. Tran Quang Trung,TS. Nguyen Thuy Vy,TS. Tran Trung Dung,TS. Vu Do Huy Cuong,TS. Vu Quang Tuyen]
cau_50 :-
  writeln('Cau hoi: Truong bo mon Khoa hoc may tinh va truong bo mon Di truyen co cung truong khong?'),
  writeln('Cau tra loi:'),
  (truong_bo_mon(TBM1,'Khoa hoc may tinh'),truong_bo_mon(TBM2,'Di truyen'), truongbm_cung_truong(TBM1,TBM2)) -> writeln('Co!'); writeln('Khong!').
  % Cau tra loi: Co!
cau_51 :-
  writeln('Cau hoi: Hai truong bo mon bat ki cung truong la nhung ai?'),
  writeln('Cau tra loi:'),
  truongbm_cung_truong(TBM1,TBM2) -> format('Hai truong bo mon bat ki cung truong: ~w~n',(TBM1,TBM2)); writeln('Khong!').
  % Cau tra loi: Hai truong bo mon bat ki cung truong: PGS.TS. Nguyen Dinh Thuc,GS.TS. Le Hoai Bac
%    Bo mon cung khoa
cau_52 :-
  writeln('Cau hoi: Bo mon Cong nghe phan mem va bo mon nao khac cung thuoc khoa Cong nghe thong tin?'),
  writeln('Cau tra loi:'),
  findall(BM2, bm_cung_khoa('Cong nghe phan mem', BM2, 'Cong nghe thong tin'), RawList),
  sort(RawList, List),
  ( List \= []
  -> format('Bo mon Cong nghe phan mem cung thuoc khoa Cong nghe thong tin voi cac bo mon: ~w~n', [List])
  ; writeln('Khong biet!')
  ).
  % Cau tra loi: Bo mon Cong nghe phan mem cung thuoc khoa Cong nghe thong tin voi cac bo mon: [Cong nghe tri thuc,He thong thong tin,Khoa hoc may tinh,Mang may tinh va vien thong,Thi giac may tinh]
cau_53 :-
    writeln('Cau hoi: Hai bo mon bat ki nao thuoc cung mot khoa?'),
    writeln('Cau tra loi:'),
    ( bm_cung_khoa(BM1, BM2, K) 
    -> format('Bo mon ~w va bo mon ~w cung thuoc khoa ~w~n', [BM1, BM2, K])
    ; writeln('Khong biet!')
    ).
    % Cau tra loi: Bo mon Cong nghe tri thuc va bo mon Khoa hoc may tinh cung thuoc khoa Cong nghe thong tin
cau_54 :-
  writeln('Cau hoi: Bo mon Di truyen va bo mon Vat ly tin hoc co cung khoa khong?'),
  writeln('Cau tra loi:'),
  bm_cung_khoa('Di truyen', 'Vat ly tin hoc', _K) 
  -> writeln('Hai bo mon cung khoa!')
  ; writeln('Hai bo mon khong cung khoa!').
  % Cau tra loi: Hai bo mon khong cung khoa!
%    Bo mon cung truong
cau_55 :-
  writeln('Cau hoi: Bo mon Sinh hoa duoc to chuc day cung truong voi cac bo mon nao?'),
  writeln('Cau tra loi:'),
  findall(BM2, bm_cung_truong('Sinh hoa', BM2), RawList),
  sort(RawList, List),
  ( List \= []
  -> format('Bo mon Sinh hoa duoc to chuc day cung truong voi cac bo mon: ~w~n', [List])
  ; writeln('Khong biet!')
  ).
  % Cau tra loi: Bo mon Sinh hoa duoc to chuc day cung truong voi cac bo mon: [Co hoc,Cong nghe phan mem,Cong nghe tri thuc,Dai so,Di truyen,He thong thong tin,Khoa hoc may tinh,Mang may tinh va vien thong,Thi giac may tinh,Vat ly chat ran,Vat ly ly thuyet,Vat ly tin hoc,Vi sinh]
cau_56 :-
  writeln('Cau hoi: Hai bo mon bat ky nao thuoc cung truong HCMUS?'),
  writeln('Cau tra loi:'),
  ( bm_cung_truong(BM1, BM2) 
  -> format('Bo mon ~w va bo mon ~w cung thuoc truong DHKHTN.~n', [BM1, BM2])
  ; writeln('Khong biet!')
  ).
  % Cau tra loi: Bo mon Cong nghe tri thuc va bo mon Khoa hoc may tinh cung thuoc truong DHKHTN
cau_57 :-
  writeln('Cau hoi: Bo mon Vi sinh cung duoc to chuc giang day tai DHKHTN cung voi bo mon Vat ly chat ran dung khong?'),
  writeln('Cau tra loi:'),
  bm_cung_truong('Vi sinh','Vat ly chat ran') -> writeln('Dung!'); writeln('Sai!').
  % Cau tra loi: Dung!
%    Bo mon cung nganh
cau_58 :-
  writeln('Cau hoi: Hai bo mon nao thuoc cung nganh Toan-Tin hoc?'),
  writeln('Cau tra loi:'),
  ( bm_cung_nganh(BM1, BM2, 'Toan-Tin hoc') 
  -> format('Bo mon ~w va bo mon ~w cung thuoc nganh Toan-Tin hoc.', [BM1, BM2])
  ; writeln('Khong biet!')
  ).
  % Cau tra loi: Bo mon Co hoc va bo mon Dai so cung thuoc nganh Toan-Tin hoc.
cau_59 :-
  writeln('Cau hoi: Bo mon Sinh hoa va bo mon nao khac thuoc cung nganh Sinh hoc?'),
  writeln('Cau tra loi:'),
  findall(BM2, bm_cung_nganh('Sinh hoa', BM2, 'Sinh hoc'), List),
  ( List \= []
  -> format('Bo mon Sinh hoa duoc to chuc day cung nganh Sinh hoc voi cac bo mon: ~w~n', [List])
  ; writeln('Khong biet!')
  ).
  % Cau tra loi: Bo mon Sinh hoa duoc to chuc day cung nganh Sinh hoc voi cac bo mon: [Di truyen,Vi sinh]
cau_60:-
  writeln('Cau hoi: Hai bo mon Co hoc va bo mon Vat ly tin hoc co cung nganh voi nhau khong?'),
  writeln('Cau tra loi: '),
  bm_cung_nganh('Co hoc','Vat ly tin hoc',_N) -> writeln('Co!'); writeln('Khong!').
  % Cau tra loi:  Khong!
%    Nganh cung khoa
cau_61 :-
  writeln('Cau hoi: Nganh Sinh hoc co cung khoa voi nhung nganh nao?'),
  writeln('Cau tra loi:'),
  findall(N2, nganh_cung_khoa('Sinh hoc', N2, _K), List),
  ( List \= []
  -> format('Nganh Sinh hoc cung khoa voi nhung nganh: ~w~n', [List])
  ; writeln('Khong biet!')
  ).
  % Cau tra loi: Nganh Sinh hoc cung khoa voi nhung nganh: [Cong nghe sinh hoc]
cau_62 :-
  writeln('Cau hoi: Hai nganh nao thuoc cung mot khoa?'),
  writeln('Cau tra loi:'),
  ( nganh_cung_khoa(N1, N2, K) 
  -> format('Nganh ~w va nganh ~w cung thuoc khoa ~w.~n', [N1, N2,K])
  ; writeln('Khong biet!')
  ).
  % Cau tra loi: Nganh Cong nghe thong tin - He dai tra va nganh Cong nghe thong tin - Tang cuong Tieng Anh cung thuoc khoa Cong nghe thong tin.
cau_63:-
  writeln('Cau hoi: Hai nganh Cong nghe thong tin - He dai tra va nganh Cong nghe thong tin - Chuong trinh tien tien co cung khoa voi nhau khong?'),
  writeln('Cau tra loi: '),
  nganh_cung_khoa('Cong nghe thong tin - He dai tra','Cong nghe thong tin - Chuong trinh tien tien',_K) -> writeln('Co!'); writeln('Khong!').
  % Cau tra loi: Co!
%    Nganh cung truong
cau_64 :-
  writeln('Cau hoi: Nganh Sinh hoc thuoc cung truong DHKHTN voi nhung nganh nao?'),
  writeln('Cau tra loi:'),
  findall(N2, nganh_cung_truong('Sinh hoc', N2), List),
  ( List \= []
  -> format('Nganh Sinh hoc cung truong voi nhung nganh: ~w~n', [List])
  ; writeln('Khong biet!')
  ).
  % Cau tra loi: Nganh Sinh hoc cung truong voi nhung nganh: [Cong nghe thong tin - He dai tra,Cong nghe thong tin - Tang cuong Tieng Anh,Cong nghe thong tin - Chuong trinh tien tien,Vat ly hoc,Vat ly y khoa,Toan-Tin hoc,Khoa hoc du lieu,Cong nghe sinh hoc]
cau_65 :-
  writeln('Cau hoi: Hai nganh nao thuoc cung truong DHKHTN?'),
  writeln('Cau tra loi:'),
  ( nganh_cung_truong(N1, N2) 
  -> format('Nganh ~w va nganh ~w cung thuoc truong DHKHTN.~n', [N1, N2])
  ; writeln('Khong biet!')
  ).
  % Cau tra loi: Nganh Cong nghe thong tin - He dai tra va nganh Cong nghe thong tin - Tang cuong Tieng Anh cung thuoc truong DHKHTN.
cau_66:-
  writeln('Cau hoi: Hai nganh Cong nghe thong tin - He dai tra va nganh Vat ly y khoa co cung truong voi nhau khong?'),
  writeln('Cau tra loi: '),
  nganh_cung_truong('Cong nghe thong tin - He dai tra','Vat ly y khoa') -> writeln('Co!'); writeln('Khong!').
  % Cau tra loi: Co!
%    Khoa cung truong
cau_67 :-
    writeln('Cau hoi: Khoa Vat ly - Vat ly ky thuat thuoc cung truong DHKHTN voi nhung khoa nao?'),
    writeln('Cau tra loi:'),
    findall(K2, khoa_cung_truong('Vat ly - Vat ly ky thuat', K2), List),
    ( List \= []
    -> format('Khoa Vat ly - Vat ly ky thuat thuoc cung truong DHKHTN voi nhung khoa: ~w~n', [List])
    ; writeln('Khong biet!')
    ).
  % Cau tra loi: Khoa Vat ly - Vat ly ky thuat thuoc cung truong DHKHTN voi nhung khoa: [Cong nghe thong tin,Toan,Sinh hoc]
cau_68 :-
  writeln('Cau hoi: Hai khoa nao thuoc cung truong DHKHTN?'),
  writeln('Cau tra loi:'),
  ( khoa_cung_truong(K1, K2) 
  -> format('Khoa ~w va khoa ~w cung thuoc truong DHKHTN.~n', [K1, K2])
  ; writeln('Khong biet!')
  ).
  % Cau tra loi: Khoa Cong nghe thong tin va khoa Vat ly - Vat ly ky thuat cung thuoc truong DHKHTN.
cau_69:-
  writeln('Cau hoi: Co khoa nao thuoc cung truong voi khoa Toan khong?'),
  writeln('Cau tra loi: '),
  khoa_cung_truong('Toan',_K) -> writeln('Co!'); writeln('Khong!').
  % Cau tra loi: Co!
%    Phong ban cung truong
cau_70 :-
  writeln('Cau hoi: Phong ban nao cung truong voi Phong Dao tao?'),
  writeln('Cau tra loi:'),
  findall(PB, pb_cung_truong('Phong Dao tao', PB), List),
  ( List \= []
  -> format('Phong Dao tao thuoc cung truong DHKHTN voi nhung phong ban: ~w~n', [List])
  ; writeln('Khong biet!')
  ).
  % Cau tra loi: Phong Dao tao thuoc cung truong DHKHTN voi nhung phong ban:[Phong Khao thi,Phong Cong tac sinh vien]
cau_71 :-
  writeln('Cau hoi: Hai phong ban nao thuoc cung truong DHKHTN?'),
  writeln('Cau tra loi:'),
  ( pb_cung_truong(PB1, PB2) 
  -> format('~w va ~w cung thuoc truong DHKHTN.~n', [PB1, PB2])
  ; writeln('Khong biet!')
  ).
  % Cau tra loi: Phong Dao tao va Phong Khao thi cung thuoc truong DHKHTN.
cau_72:-
  writeln('Cau hoi: Phong Khao thi va Phong Dao tao cung thuoc DHKHTN dung khong?'),
  writeln('Cau tra loi: '),
  pb_cung_truong('Phong Khao thi','Phong Dao tao') -> writeln('Dung!'); writeln('Sai!').
  % Cau tra loi: Dung!
%    Giao vien cung phong ban
cau_73 :-
  writeln('ThS. Le Van Lai va ThS. Pham Thi Thuan co cung lam viec trong mot phong ban khong?'),
  writeln('Cau tra loi: '),
  gv_cung_phongban('ThS. Le Van Lai','ThS. Pham Thi Thuan', _PB) -> writeln('Dung'); writeln('Sai').
  % Cau tra loi: Dung
cau_74 :-
  writeln('Cau hoi: Nhung thay/co nao cung phong voi ThS. Tran Quoc Dat?'),
  writeln('Cau tra loi:'),
  findall(GV2, gv_cung_phongban('ThS. Tran Quoc Dat', GV2, _PB), List),
  ( List \= []
  -> format('Nhung thay/co cung phong voi ThS. Tran Quoc Dat: ~w~n', [List])
  ; writeln('Khong biet!')
  ).
  % Cau tra loi: Nhung giao vien cung phong voi ThS. Tran Quoc Dat: [ThS. Nguyen Thi Ngoc Han,ThS. Nguyen Thi Tham]
cau_75 :-
  writeln('Cau hoi: Nhung thay/co cung thuoc Phong Khao thi?'),
  writeln('Cau tra loi:'),
  findall((GV1,GV2), gv_cung_phongban(GV1, GV2, 'Phong Khao thi'), List),
  ( List \= []
  -> format('Nhung thay/co cung thuoc Phong Khao thi: ~w~n', [List])
  ; writeln('Khong biet!')
  ).
  % Cau tra loi: Khong biet!
% Giao vien duoc khen thuong trong cung viec giang day
cau_76 :-
  writeln('Cau hoi: Nhung giang vien nao duoc khen thuong trong cung mot viec giang day?'),
  writeln('Cau tra loi:'),
  findall((GV1,GV2), gv_khen_thuong_cung_viec_giang_day(GV1, GV2, _G), List),
  ( List \= []
  -> format('Nhung giang vien duoc khen thuong trong cung mot viec giang day: ~w~n', [List])
  ; writeln('Khong biet!')
  ).
  % Cau tra loi: Nhung giang vien duoc khen thuong trong cung mot viec giang day: [(PGS.TS Ngo Dai Nghiep,TS. Nguyen Thuy Vy),(TS. Nguyen Thuy Vy,PGS.TS Ngo Dai Nghiep)]
cau_77 :-
  writeln('Cau hoi: Mot giai thuong bat ky nao co hai giang vien cung duoc nhan?'),
  writeln('Cau tra loi:'),
  ( gv_khen_thuong_cung_viec_giang_day(_GV1, _GV2,Giai) 
  -> format('Mot giai thuong bat ky co hai giang vien cung duoc nhan: ~w', Giai)
  ; writeln('Khong biet!')
  ).
  % Cau tra loi: Mot giai thuong bat ky co hai giang vien cung duoc nhan: Khen thuong trong viec giang day mon Nhap mon nganh Sinh hoc – Cong nghe Sinh hoc (Nam hoc 2021-2022).
cau_78 :-
    writeln('ThS. Le Van Lai va ThS. Pham Thi Thuan co cung duoc nhan giai thuong trong viec giang day khong?'),
    writeln('Cau tra loi:'),
    ( gv_khen_thuong_cung_viec_giang_day('ThS. Le Van Lai', 'ThS. Pham Thi Thuan', GiaiThuong) ->
        format('Co! Ca hai cung duoc nhan giai thuong: ~w.~n', [GiaiThuong])
    ; 
        writeln('Khong!')
    ).
  % Cau tra loi: Khong!
%    Truong co khoa
cau_79 :-
    writeln('Cau hoi: Truong DHKHTN co nhung khoa nao?'),
    writeln('Cau tra loi:'),
    findall(K, truong_co_khoa('HCMUS', K), List),
    ( List \= []
    -> format('Nhung khoa thuoc truong DHKHTN: ~w~n', [List])
    ; writeln('Khong co thong tin!')
    ).
    % Cau tra loi: Nhung khoa thuoc truong DHKHTN: [Cong nghe thong tin,Vat ly - Vat ly ky thuat,Toan,Sinh hoc]
cau_80 :-
  writeln('Truong DHKHTN co khoa Kinh te khong?'),
  writeln('Cau tra loi:'),
  truong_co_khoa('HCMUS', 'Kinh te') ->
  writeln('Co!'); writeln('Khong!').
    % Cau tra loi: Khong!
cau_81 :-
  writeln('Truong DHKHTN co khoa Cong nghe thong tin khong?'),
  writeln('Cau tra loi:'),
  truong_co_khoa('HCMUS', 'Cong nghe thong tin') ->
  writeln('Co!'); writeln('Khong!').
  % Cau tra loi: Co!
%  Truong co bo mon
cau_82 :-
    writeln('Cau hoi: Truong DHKHTN co nhung bo mon nao?'),
    writeln('Cau tra loi:'),
    findall(BM, truong_co_bm('HCMUS', BM), RawList),
    sort(RawList, List),
    ( List \= []
    -> format('Nhung bo mon thuoc truong DHKHTN: ~w~n', [List])
    ; writeln('Khong co thong tin!')
    ).
    % Cau tra loi: Nhung bo mon thuoc truong DHKHTN: [Co hoc,Cong nghe phan mem,Cong nghe tri thuc,Dai so,Di truyen,He thong thong tin,Khoa hoc may tinh,Mang may tinh va vien thong,Sinh hoa,Thi giac may tinh,Vat ly chat ran,Vat ly ly thuyet,Vat ly tin hoc,Vi sinh]
cau_83 :-
  writeln('Truong DHKHTN co bo mon Viet Nam hoc khong?'),
  writeln('Cau tra loi:'),
  truong_co_bm('HCMUS', 'Viet Nam hoc') ->
  writeln('Co!'); writeln('Khong!').
    % Cau tra loi: Khong!
cau_84 :-
  writeln('Truong DHKHTN co bo mon Vi sinh khong?'),
  writeln('Cau tra loi:'),
  truong_co_bm('HCMUS', 'Vi sinh') ->
  writeln('Co!'); writeln('Khong!').
  % Cau tra loi: Co!
%    Truong co nganh
cau_85 :-
    writeln('Cau hoi: Truong DHKHTN co nhung nganh nao?'),
    writeln('Cau tra loi:'),
    findall(N, truong_co_nganh('HCMUS', N), List),
    ( List \= []
    -> format('Nhung nganh thuoc truong DHKHTN: ~w~n', [List])
    ; writeln('Khong co thong tin!')
    ).
    % Cau tra loi: Nhung nganh thuoc truong DHKHTN: [Cong nghe thong tin - He dai tra,Cong nghe thong tin - Tang cuong Tieng Anh,Cong nghe thong tin - Chuong trinh tien tien,Vat ly hoc,Vat ly y khoa,Toan-Tin hoc,Khoa hoc du lieu,Sinh hoc,Cong nghe sinh hoc]
cau_86 :-
  writeln('Truong DHKHTN co nganh Tieng Anh thuong mai khong?'),
  writeln('Cau tra loi:'),
  truong_co_nganh('HCMUS', 'Tieng Anh thuong mai') ->
  writeln('Co!'); writeln('Khong!').
    % Cau tra loi: Khong!
cau_87 :-
  writeln('Truong DHKHTN co nganh Khoa hoc du lieu khong?'),
  writeln('Cau tra loi:'),
  truong_co_nganh('HCMUS', 'Khoa hoc du lieu') ->
  writeln('Co!'); writeln('Khong!').
  % Cau tra loi: Co!
%    Truong co truong bo mon (Co the dung de lay ten truong bo mon cua truong)
cau_88 :-
  writeln('Cau hoi: Truong DHKHTN co nhung truong bo mon nao?'),
  writeln('Cau tra loi:'),
  findall(TBM, truong_co_tbm('HCMUS',_BM,TBM), RawList),
  sort(RawList, List),
  ( List \= []
  -> format('Nhung truong bo mon thuoc truong DHKHTN: ~w~n', [List])
  ; writeln('Khong co thong tin!')
  ).
  % Cau tra loi: Nhung truong bo mon thuoc truong DHKHTN: [GS.TS. Le Hoai Bac,PGS.TS. Huynh Van Tuan,PGS.TS. Ly Quoc Ngoc,PGS.TS. Mai Hoang Bien,PGS.TS. Ngo Dai Nghiep,PGS.TS. Nguyen Dinh Thuc,PGS.TS. Nguyen Duc Hoang,PGS.TS. Nguyen Van Vu,PGS.TS. Tran Quang Trung,TS. Nguyen Thuy Vy,TS. Pham Nguyen Cuong,TS. Tran Trung Dung,TS. Vu Do Huy Cuong,TS. Vu Quang Tuyen]
cau_89 :-
  writeln('Truong bo mon Vat ly ly thuyet cua truong DHKHTN?'),
  writeln('Cau tra loi:'),
  truong_co_tbm('HCMUS', 'Vat ly ly thuyet',TBM) ->
  writeln(TBM); writeln('Khong biet!').
  % Cau tra loi: TS. Vu Quang Tuyen
cau_90:-
  writeln('Truong DHKHTN co truong bo mon Kinh te khong?'),
  writeln('Cau tra loi:'),
  truong_co_tbm('HCMUS', 'Kinh te',_TBM) -> writeln('Co!'); writeln('Khong!').
  % Cau tra loi: Khong!