%             Facts
% Truong bo mon
truong_bo_mon('PGS.TS. Nguyen Dinh Thuc','Cong nghe tri thuc').
truong_bo_mon('GS.TS. Le Hoai Bac','Khoa hoc may tinh').
truong_bo_mon('PGS.TS. Ly Quoc Ngoc','Thi giac may tinh').
truong_bo_mon('PGS.TS. Nguyen Van Vu','Cong nghe phan mem').
truong_bo_mon('TS. Tran Trung Dung','Mang may tinh va vien thong').
truong_bo_mon('TS. Pham Nguyen Cuong','He thong thong tin').
truong_bo_mon('PGS.TS. Huynh Van Tuan','Vat ly tin hoc').
truong_bo_mon('TS. Vu Quang Tuyen','Vat ly ly thuyet').
truong_bo_mon('PGS.TS. Tran Quang Trung','Vat ly chat ran').
truong_bo_mon('TS. Vu Do Huy Cuong','Co hoc').
truong_bo_mon('PGS.TS. Mai Hoang Bien','Dai so').
truong_bo_mon('TS. Nguyen Thuy Vy','Di truyen').
truong_bo_mon('PGS.TS. Nguyen Duc Hoang','Vi sinh').
truong_bo_mon('PGS.TS. Ngo Dai Nghiep','Sinh hoa').
% Giao vien thuoc cac phong ban
giao_vien('TS. Tran Thai Son','Phong Dao tao').
giao_vien('ThS. Le Van Lai','Phong Dao tao').
giao_vien('ThS. Pham Thi Thuan','Phong Dao tao').
giao_vien('ThS. Nguyen Thi Ngoc Han','Phong Cong tac sinh vien').
giao_vien('ThS. Nguyen Thi Tham','Phong Cong tac sinh vien').
giao_vien('ThS. Tran Quoc Dat','Phong Cong tac sinh vien').
% Bo mon thuoc nganh
bo_mon_thuoc_nganh('Cong nghe tri thuc','Cong nghe thong tin - He dai tra').
bo_mon_thuoc_nganh('Khoa hoc may tinh','Cong nghe thong tin - He dai tra').
bo_mon_thuoc_nganh('Thi giac may tinh','Cong nghe thong tin - He dai tra').
bo_mon_thuoc_nganh('Cong nghe phan mem','Cong nghe thong tin - He dai tra').
bo_mon_thuoc_nganh('Mang may tinh va vien thong','Cong nghe thong tin - He dai tra').
bo_mon_thuoc_nganh('He thong thong tin','Cong nghe thong tin - He dai tra').
bo_mon_thuoc_nganh('Cong nghe tri thuc','Cong nghe thong tin - Tang cuong Tieng Anh').
bo_mon_thuoc_nganh('Khoa hoc may tinh','Cong nghe thong tin - Tang cuong Tieng Anh').
bo_mon_thuoc_nganh('Thi giac may tinh','Cong nghe thong tin - Tang cuong Tieng Anh').
bo_mon_thuoc_nganh('Cong nghe phan mem','Cong nghe thong tin - Tang cuong Tieng Anh').
bo_mon_thuoc_nganh('Mang may tinh va vien thong','Cong nghe thong tin - Tang cuong Tieng Anh').
bo_mon_thuoc_nganh('He thong thong tin','Cong nghe thong tin - Tang cuong Tieng Anh').
bo_mon_thuoc_nganh('Vat ly tin hoc','Vat ly hoc').
bo_mon_thuoc_nganh('Vat ly ly thuyet','Vat ly hoc').
bo_mon_thuoc_nganh('Vat ly chat ran','Vat ly hoc').
bo_mon_thuoc_nganh('Co hoc','Toan-Tin hoc').
bo_mon_thuoc_nganh('Dai so','Toan-Tin hoc').
bo_mon_thuoc_nganh('Di truyen','Sinh hoc').
bo_mon_thuoc_nganh('Vi sinh','Sinh hoc').
bo_mon_thuoc_nganh('Sinh hoa','Sinh hoc').
% Nganh thuoc khoa
nganh_thuoc_khoa('Cong nghe thong tin - He dai tra','Cong nghe thong tin').
nganh_thuoc_khoa('Cong nghe thong tin - Tang cuong Tieng Anh','Cong nghe thong tin').
nganh_thuoc_khoa('Cong nghe thong tin - Chuong trinh tien tien','Cong nghe thong tin').
nganh_thuoc_khoa('Vat ly hoc','Vat ly - Vat ly ky thuat').
nganh_thuoc_khoa('Vat ly y khoa','Vat ly - Vat ly ky thuat').
nganh_thuoc_khoa('Toan-Tin hoc','Toan').
nganh_thuoc_khoa('Khoa hoc du lieu','Toan').
nganh_thuoc_khoa('Sinh hoc','Sinh hoc').
nganh_thuoc_khoa('Cong nghe sinh hoc','Sinh hoc').
% Khoa truc thuoc truong
khoa_truc_thuoc('Cong nghe thong tin','HCMUS').
khoa_truc_thuoc('Vat ly - Vat ly ky thuat','HCMUS').
khoa_truc_thuoc('Toan','HCMUS').
khoa_truc_thuoc('Sinh hoc','HCMUS').
% Phong ban truc thuoc truong
phongban_truc_thuoc('Phong Dao tao','HCMUS').
phongban_truc_thuoc('Phong Khao thi','HCMUS').
phongban_truc_thuoc('Phong Cong tac sinh vien','HCMUS').
% Ca nhan duoc khen thuong
khen_thuong_ca_nhan('GS.TS. Le Hoai Bac').
khen_thuong_ca_nhan('PGS.TS. Nguyen Van Vu').
% Khen thuong (ca nhan) trong viec
khen_thuong('PGS.TS Ngo Dai Nghiep','Khen thuong trong viec giang day mon Nhap mon nganh Sinh hoc – Cong nghe Sinh hoc (Nam hoc 2021-2022)').
khen_thuong('TS. Nguyen Thuy Vy','Khen thuong trong viec giang day mon Nhap mon nganh Sinh hoc – Cong nghe Sinh hoc (Nam hoc 2021-2022)').



%             Rules
% Truong bo mon thuoc nganh
truongbm_thuoc_nganh(TBM,Nganh) :-
  truong_bo_mon(TBM,BM),
  bo_mon_thuoc_nganh(BM,Nganh).
% Truong bo mon thuoc khoa
truongbm_thuoc_khoa(TBM,Khoa) :-
  truongbm_thuoc_nganh(TBM,Nganh),
  nganh_thuoc_khoa(Nganh,Khoa).
% Truong bo mon thuoc truong
truongbm_thuoc_truong(TBM,Truong) :-
  truongbm_thuoc_khoa(TBM,Khoa),
  khoa_truc_thuoc(Khoa,Truong).
% Bo mon thuoc khoa
bo_mon_thuoc_khoa(BM,Khoa) :-
  bo_mon_thuoc_nganh(BM,Nganh),
  nganh_thuoc_khoa(Nganh,Khoa).
% Bo mon thuoc truong
bo_mon_thuoc_truong(BM,Truong) :-
  bo_mon_thuoc_khoa(BM,Khoa),
  khoa_truc_thuoc(Khoa,Truong).
% Nganh thuoc truong
nganh_thuoc_truong(Nganh,Truong):-
  nganh_thuoc_khoa(Nganh,Khoa),
  khoa_truc_thuoc(Khoa,Truong).
% Truong bm thuoc cung khoa
truongbm_cung_khoa(TBM1,TBM2, Khoa) :-
  truongbm_thuoc_khoa(TBM1,Khoa),
  truongbm_thuoc_khoa(TBM2,Khoa),
  TBM1 \= TBM2.
% Truong bm thuoc cung nganh
truongbm_cung_nganh(TBM1,TBM2, Nganh):-
  truongbm_thuoc_nganh(TBM1,Nganh),
  truongbm_thuoc_nganh(TBM2,Nganh),
  TBM1 \= TBM2.
% Truong bm cung truong
truongbm_cung_truong(TBM1,TBM2):-
  truongbm_thuoc_truong(TBM1,Truong),
  truongbm_thuoc_truong(TBM2,Truong),
  TBM1 \= TBM2.
% Bo mon cung khoa
bm_cung_khoa(BM1,BM2, Khoa):-
  bo_mon_thuoc_khoa(BM1,Khoa),
  bo_mon_thuoc_khoa(BM2,Khoa),
  BM1 \= BM2.
% Bo mon cung truong
bm_cung_truong(BM1,BM2):-
  bo_mon_thuoc_truong(BM1,Truong),
  bo_mon_thuoc_truong(BM2,Truong),
  BM1 \= BM2.
% Bo mon cung nganh
bm_cung_nganh(BM1,BM2, Nganh):-
  bo_mon_thuoc_nganh(BM1,Nganh),
  bo_mon_thuoc_nganh(BM2,Nganh),
  BM1 \= BM2.
% Nganh cung khoa
nganh_cung_khoa(Nganh1,Nganh2, Khoa):-
  nganh_thuoc_khoa(Nganh1,Khoa),
  nganh_thuoc_khoa(Nganh2,Khoa),
  Nganh1 \= Nganh2.
%  Nganh cung truong
nganh_cung_truong(Nganh1,Nganh2):-
  nganh_thuoc_truong(Nganh1,Truong),
  nganh_thuoc_truong(Nganh2,Truong),
  Nganh1 \= Nganh2.
% Khoa cung truong
khoa_cung_truong(Khoa1,Khoa2):-
  khoa_truc_thuoc(Khoa1,Truong),
  khoa_truc_thuoc(Khoa2,Truong),
  Khoa1 \= Khoa2.
% Phong ban cung truong
pb_cung_truong(PB1,PB2):-
  phongban_truc_thuoc(PB1,Truong),
  phongban_truc_thuoc(PB2,Truong),
  PB1 \= PB2.
% Giao vien cung phong ban
gv_cung_phongban(GV1,GV2, Phongban):-
  giao_vien(GV1,Phongban),
  giao_vien(GV2,Phongban),
  GV1 \= GV2.
% Giao vien duoc khen thuong trong cung viec giang day
gv_khen_thuong_cung_viec_giang_day(GV1,GV2, Giai):-
  khen_thuong(GV1,Giai),
  khen_thuong(GV2,Giai),
  GV1 \= GV2.
% Truong co khoa 
truong_co_khoa(Truong,Khoa) :-
  khoa_truc_thuoc(Khoa,Truong).
%. Truong co bo mon
truong_co_bm(Truong,BM):-
  khoa_truc_thuoc(Khoa,Truong),
  nganh_thuoc_khoa(Nganh,Khoa),
  bo_mon_thuoc_nganh(BM,Nganh).
% Truong co nganh
truong_co_nganh(Truong,Nganh):-
  khoa_truc_thuoc(Khoa,Truong),
  nganh_thuoc_khoa(Nganh,Khoa).
% Truong co truong bo mon (Co the dung de lay ten truong bo mon cua truong)
truong_co_tbm(Truong,BM,TBM):-
  khoa_truc_thuoc(Khoa,Truong),
  nganh_thuoc_khoa(Nganh,Khoa),
  bo_mon_thuoc_nganh(BM,Nganh),
  truong_bo_mon(TBM,BM).
