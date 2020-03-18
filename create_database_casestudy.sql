CREATE DATABASE caseStudyDatabase;

/*KHỞI TẠO CÁC TABLE ĐƠN */

CREATE TABLE caseStudyDatabase.vi_tri
(IDViTri INT PRIMARY KEY,
TenViTri VARCHAR(45)
);
CREATE TABLE caseStudyDatabase.trinh_do
(IDTrinhDo INT PRIMARY KEY,
TrinhDo VARCHAR(45)
);
CREATE TABLE caseStudyDatabase.bo_phan
(IDBoPhan INT PRIMARY KEY,
TenBoPhan VARCHAR(45)
);
CREATE TABLE caseStudyDatabase.dich_vu_di_kem
(IDDichVuDiKem INT PRIMARY KEY,
TenDichVuDiKem VARCHAR(45),
Gia INT,
DonVi INT,
TrangThaiKhaDung VARCHAR(45)
);
CREATE TABLE caseStudyDatabase.loai_khach
(IDLoaiKhach INT PRIMARY KEY,
TenLoaiKhach VARCHAR(45)
);
CREATE TABLE caseStudyDatabase.kieu_thue
(IDKieuThue INT PRIMARY KEY,
TenKieuThue VARCHAR(45),
Gia INT
);
CREATE TABLE caseStudyDatabase.loai_dich_vu
(IDLoaiDichVu INT PRIMARY KEY,
TenLoaiDichVu VARCHAR(45)
);
/*KHỞI TẠO TABLE CÓ KHÓA PHỤ*/

CREATE TABLE caseStudyDatabase.nhan_vien
(IDNhanVien INT PRIMARY KEY,
HoTen VARCHAR(45),
IDViTri INT,
IDTrinhDo INT,
IDBoPhan INT,
NgaySinh DATE,
SoCMND INT,
Luong INT,
SDT INT,
Email VARCHAR(45),
DiaChi VARCHAR(45),
FOREIGN KEY (IDViTri) REFERENCES vi_tri(IDViTri),
FOREIGN KEY (IDTrinhDo) REFERENCES trinh_do(IDTrinhDo),
FOREIGN KEY (IDBoPhan) REFERENCES bo_phan(IDBoPhan)
);

CREATE TABLE caseStudyDatabase.khach_hang
(IDKhachHang INT PRIMARY KEY,
IDLoaiKhach INT,
HoTen VARCHAR(45),
NgaySinh DATE,
SoCMND INT,
SDT INT,
Email VARCHAR(45),
DiaChi VARCHAR(45),
FOREIGN KEY (IDLoaiKhach) REFERENCES loai_khach(IDLoaiKhach)
);

CREATE TABLE caseStudyDatabase.dich_vu
(IDDichVu INT PRIMARY KEY,
TenDichVu VARCHAR(45),
DienTich INT,
SoTang INT,
SoNguoiToiDa INT,
ChiPhiThue INT,
IDKieuThue INT,
IDLoaiDichVu INT,
TrangThai VARCHAR(45),
FOREIGN KEY (IDKieuThue) REFERENCES kieu_thue(IDKieuThue),
FOREIGN KEY (IDLoaiDichVu) REFERENCES loai_dich_vu(IDLoaiDichVu)
);

CREATE TABLE caseStudyDatabase.hop_dong
(IDHopDong INT PRIMARY KEY,
IDNhanVien INT,
IDKhachHang INT,
IDDichVu INT,
NgayLamHopDong DATE,
NgayKetThuc DATE,
TienDatCoc INT,
TongTien INT,
FOREIGN KEY (IDNhanVien) REFERENCES nhan_vien(IDNhanVien),
FOREIGN KEY (IDKhachHang) REFERENCES khach_hang(IDKhachHang),
FOREIGN KEY (IDDichVu) REFERENCES dich_vu(IDDichVu)
);

CREATE TABLE caseStudyDatabase.hop_dong_chi_tiet
(IDHopDongChiTiet INT PRIMARY KEY,
IDHopDong INT,
IDDichVuDiKem INT,
SoLuong INT,
FOREIGN KEY (IDHopDong) REFERENCES hop_dong(IDHopDong),
FOREIGN KEY (IDDichVuDiKem) REFERENCES dich_vu_di_kem(IDDichVuDiKem)
);

/*Thêm Dữ Liệu*/
use caseStudyDatabase;
SET SQL_SAFE_UPDATES = 0;
delete from hop_dong_chi_tiet;
delete from hop_dong;
delete from dich_vu;
delete from loai_dich_vu;
delete from kieu_thue;
delete from khach_hang;
delete from loai_khach;
delete from dich_vu_di_kem;
delete from nhan_vien;
delete from bo_phan;
delete from trinh_do;
delete from vi_tri;

insert into vi_tri(IDViTri,TenViTri) value(1,'nhân viên bán hàng'),(2,'giám đốc');

insert into trinh_do(IDTrinhDo, TrinhDo) value(1, 'đại học'),(2, 'cao đẳng');

insert into bo_phan(IDBoPhan, TenBoPhan) value(1, 'bán hàng'),(2, 'quảng lý');

insert into nhan_vien(IDNhanVien, HoTen, IDViTri, IDTrinhDo, IDBoPhan, NgaySinh, SoCMND, Luong, SDT, Email, DiaChi) value
(1, 'Nguyễn Văn A',1,1,1,'1990/10/10',123456789,7000000,0123456789,'nguyenvana@gmail.com', 'sơn trà đà nẵng'),
(2, 'Hồ Văn B',1,1,1,'1990/10/10',123456799,8000000,0123456799,'hovanb@gmail.com', 'sơn trà đà nẵng'),
(3, 'Trần Tuấn Anh Kiệt',1,1,1,'1990/10/10',123456999,5000000,0123456999,'trantuananhkiet@gmail.com', 'sơn trà đà nẵng');

insert into dich_vu_di_kem(IDDichVuDiKem,TenDichVuDiKem,Gia,DonVi,TrangThaiKhaDung) 
value(1,'massage',1,2000,'trạng thái không biết'),
(2,'karaoke',2,1000,'trạng thái không biết'),
(3,'thức ăn',3,3000,'trạng thái không biết'),
(4,'nước uống',4,4000,'trạng thái không biết'),
(5,'thuê xe di chuyển tham quan resort',5,1000,'trạng thái không biết');

insert into loai_khach(IDLoaiKhach,TenLoaiKhach) value(1,'Diamond'),(2,'Platinium'),(3,'Gold'),(4,'Silver'),(5,'Member');

insert into khach_hang(IDKhachHang,IDLoaiKhach,HoTen,NgaySinh,SoCMND,SDT,Email,DiaChi)
value(1,1,'Hồ Văn Quốc A','2010/11/10',123456781,0123456781,'hovanquoca123@gmail.com','trần cao vân đà nẵng việt nam'),
(2,1,'Hồ Văn Quốc B','1990/11/10',123456721,0123456782,'hovanquo42cb@gmail.com','trần cao vân quãng trị việt nam'),
(3,1,'Hồ Văn Quốc C','1900/11/10',123456783,0123456783,'hovanqu4ocv@gmail.com','trần cao vân việt nam'),
(4,2,'Hồ Văn','1990/11/10',123456784,0123456784,'hovan@gmail.com','trần cao vân vinh việt nam'),
(5,3,'Hồ Văn Quốc D','1991/11/10',123456785,0123456785,'hovanffquocd@gmail.com','trần cao vân quảng ngãi việt nam'),
(6,1,'Nguyễn Văn A','1992/11/10',123456786,0123456786,'nguyen12ffvana@gmail.com','trần cao vân vinh việt nam'),
(7,1,'Nguyễn Văn A','1992/11/10',123456786,0123456786,'nguyenssssvana@gmail.com','trần cao vân quảng ngãi việt nam');

insert into	kieu_thue(IDKieuThue,TenKieuThue,Gia)value (1,'thuê theo năm',3650),(2,'thuê theo tháng',300),(3,'thuê theo ngày',10),(4,'thuê theo giờ',1);

insert into loai_dich_vu(IDLoaiDichVu,TenLoaiDichVu) value(1,'Villa'),(2,'House'),(3,'Room');

insert into dich_vu(IDDichVu,TenDichVu,DienTich,SoNguoiToiDa,ChiPhiThue,IDKieuThue,IDLoaiDichVu,TrangThai)
value(1,'tên dịch vụ 1', 10, 5, 1, 1, 1,'trống'),(2,'tên dịch vụ 2', 20, 10, 2, 2, 2,'trống'),(3,'tên dịch vụ 3', 30, 15, 3, 3, 3,'trống'),(4,'tên dịch vụ 4', 40, 20, 4, 4, 1,'trống');

insert into hop_dong(IDHopDong,IDNhanVien,IDKhachHang,IDDichVu,NgayLamHopDong,NgayKetThuc,TienDatCoc,TongTien)
value (1, 1, 1, 1, '2020/03/12', '2021/03/12', 500, 1000),
 (2, 1, 1, 1, '2018/03/12', '2019/03/12', 100, 3000),
 (3, 2, 2, 2, '2018/03/12', '2018/04/12', 200, 1600),
 (4, 3, 2, 2, '2019/03/12', '2019/04/12', 300, 1500),
 (5, 2, 2, 3, '2019/11/12', '2019/12/12', 50, 2000),
 (6, 1, 5, 3, '2019/10/12', '2019/10/12', 30, 7000);

insert into hop_dong_chi_tiet(IDHopDongChiTiet,IDHopDong,IDDichVuDiKem,SoLuong)
value(1,1,1,2),
(2,2,1,3),
(3,1,2,3),
(4,6,1,3),
(5,6,2,3),
(6,6,3,3),
(7,5,4,3),
(8,5,2,3);

/*Thực Hiện Truy Vấn */
use caseStudyDatabase;

-- Task2.Hiển thị thông tin của tất cả nhân viên có trong hệ thống có tên bắt đầu là một trong các ký tự “H”, “T” hoặc “K” và có tối đa 15 ký tự.
SELECT * FROM nhan_vien WHERE HoTen LIKE 'H%' or HoTen LIKE '%T' AND length(HoTen)<15 ;

-- Task3.Hiển thị thông tin của tất cả khách hàng có độ tuổi từ 18 đến 50 tuổi và có địa chỉ ở “Đà Nẵng” hoặc “Quảng Trị”.
SELECT * FROM khach_hang WHERE (DATEDIFF(CURDATE(),NgaySinh)/ 365)>18 AND DiaChi LIKE '%Đà Nẵng%'OR DiaChi LIKE '%Quảng Trị%' ;

-- Task4.Đếm xem tương ứng với mỗi khách hàng đã từng đặt phòng bao nhiêu lần. Kết quả hiển thị được sắp xếp tăng dần theo số lần đặt phòng của khách hàng.
--  Chỉ đếm những khách hàng nào có Tên loại khách hàng là “Diamond”.
SELECT HoTen,COUNT(*) AS so_lan_dat_phong 
FROM khach_hang 
INNER JOIN hop_dong ON khach_hang.IDKhachHang=hop_dong.IDKhachHang
INNER JOIN loai_khach ON khach_hang.IDLoaiKhach=loai_khach.IDLoaiKhach
where TenLoaiKhach='Diamond'
group by HoTen;

-- Task5.Hiển thị IDKhachHang, HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc, TongTien 
-- (Với TongTien được tính theo công thức như sau: ChiPhiThue + SoLuong*Gia, với SoLuong và Giá là từ bảng DichVuDiKem) 
-- cho tất cả các Khách hàng đã từng đặt phỏng. (Những Khách hàng nào chưa từng đặt phòng cũng phải hiển thị ra).
SELECT HoTen, TenLoaiKhach, IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc,ChiPhiThue + SoLuong*Gia AS 'Tổng Tiền' FROM khachhang 
INNER JOIN loai_khach ON khach_hang.IDLoaiKhach=loai_khach.IDLoaiKhach
INNER JOIN hop_dong ON khach_hang.IDKhachHang=hop_dong.IDKhachHang
INNER JOIN dich_vu ON hop_dong.IDDichVu=dich_vu.IDDichVu
INNER JOIN hop_dong_chi_tiet ON hop_dong.IDHopDong=hop_dongchitiet.IDHopDong
