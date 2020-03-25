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
SELECT * FROM nhan_vien WHERE HoTen LIKE 'H%' or HoTen LIKE '%T' AND length(HoTen)<=15 ;

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
SELECT HoTen, TenLoaiKhach, hop_dong.IDHopDong, TenDichVu, NgayLamHopDong, NgayKetThuc,(ChiPhiThue + SoLuong*dich_vu_di_kem.Gia) AS 'Tổng Tiền' FROM khach_hang 
LEFT JOIN loai_khach ON khach_hang.IDLoaiKhach=loai_khach.IDLoaiKhach
INNER JOIN hop_dong ON khach_hang.IDKhachHang=hop_dong.IDKhachHang
INNER JOIN dich_vu ON hop_dong.IDDichVu=dich_vu.IDDichVu
INNER JOIN hop_dong_chi_tiet ON hop_dong.IDHopDong=hop_dong_chi_tiet.IDHopDong
INNER JOIN dich_vu_di_kem ON hop_dong_chi_tiet.IDDichVuDiKem=dich_vu_di_kem.IDDichVuDiKem;

-- Task6.Hiển thị IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu của tất cả các loại Dịch vụ chưa từng được Khách hàng thực hiện đặt từ quý 1 của năm 2019 (Quý 1 là tháng 1, 2, 3).
SELECT hop_dong.IDDichVu, TenDichVu, DienTich, ChiPhiThue, TenLoaiDichVu FROM dich_vu
INNER JOIN loai_dich_vu ON dich_vu.IDLoaiDichVu=loai_dich_vu.IDLoaiDichVu 
INNER JOIN hop_dong  ON hop_dong.IDDichVu=dich_vu.IDDichVu
WHERE NOT EXISTS( 
SELECT IDDichVu
FROM hop_dong 
WHERE hop_dong.IDDichVu=dich_vu.IDDichVu
AND YEAR(hop_dong.NgayLamHopDong) >= 2019 );

-- Task7.	Hiển thị thông tin IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu 
-- của tất cả các loại dịch vụ đã từng được Khách hàng đặt phòng trong năm 2018 nhưng chưa từng được Khách hàng đặt phòng  trong năm 2019.
SELECT DISTINCT hop_dong.IDDichVu, TenDichVu, DienTich, SoNguoiToiDa, ChiPhiThue, TenLoaiDichVu FROM dich_vu
INNER JOIN loai_dich_vu ON dich_vu.IDLoaiDichVu=loai_dich_vu.IDLoaiDichVu 
INNER JOIN hop_dong  ON hop_dong.IDDichVu=dich_vu.IDDichVu
WHERE NOT EXISTS( 
SELECT IDDichVu
FROM hop_dong 
WHERE hop_dong.IDDichVu=dich_vu.IDDichVu
AND YEAR(hop_dong.NgayLamHopDong) = 2019 );


-- Task8.Hiển thị thông tin HoTenKhachHang có trong hệ thống, với yêu cầu HoThenKhachHang không trùng nhau.
-- Cách 1:
SELECT DISTINCT HoTen FROM khach_hang ;

-- Cách 2:
SELECT HoTen
FROM khach_hang
GROUP BY HoTen
HAVING COUNT(HoTen) >= 1;

-- Cách 3:
SELECT HoTen
FROM khach_hang
UNION 
SELECT HoTen
FROM khach_hang;


-- Task9.	Thực hiện thống kê doanh thu theo tháng, nghĩa là tương ứng với mỗi tháng trong năm 2019 thì sẽ có bao nhiêu khách hàng thực hiện đặt phòng.
SELECT MONTH(NgayLamHopDong) AS thang, SUM(TongTien) AS 'Doanh Thu' 
FROM hop_dong 
WHERE YEAR(NgayLamHopDong)=2019 
GROUP BY thang;

-- Task10.	Hiển thị thông tin tương ứng với từng Hợp đồng thì đã sử dụng bao nhiêu Dịch vụ đi kèm. 
-- Kết quả hiển thị bao gồm IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, SoLuongDichVuDiKem (được tính dựa trên việc count các IDHopDongChiTiet).
SELECT hop_dong.IDHopDong, NgayLamHopDong, NgayKetthuc, TienDatCoc, COUNT(IDHopDongChiTiet) AS SoLuongDichVuDiKem 
FROM hop_dong
INNER JOIN hop_dong_chi_tiet ON hop_dong.IDHopDong=hop_dong_chi_tiet.IDHopDong
GROUP BY IDHopDong;



-- Task11.	Hiển thị thông tin các Dịch vụ đi kèm đã được sử dụng bởi những Khách hàng có TenLoaiKhachHang là “Diamond” và có địa chỉ là “Vinh” hoặc “Quảng Ngãi”.
SELECT dvdk.IDDichVuDiKem,TenDichVuDiKem,Gia,DonVi,TrangThaiKhaDung,kh.IDKhachHang,lk.TenLoaiKhach,kh.DiaChi
FROM khach_hang kh
INNER JOIN hop_dong hd ON kh.IDKhachHang=hd.IDKhachHang
INNER JOIN loai_khach lk ON kh.IDLoaiKhach=lk.IDLoaiKhach
INNER JOIN hop_dong_chi_tiet hdct ON hd.IDHopDong=hdct.IDHopDong
INNER JOIN dich_vu_di_kem dvdk ON hdct.IDDichVuDiKem=dvdk.IDDichVuDiKem
WHERE TenLoaiKhach LIKE 'Diamond' AND (DiaChi LIKE '%Quảng Trị%' OR DiaChi LIKE '%vinh%');


-- Task12.	Hiển thị thông tin IDHopDong, TenNhanVien, TenKhachHang, SoDienThoaiKhachHang, TenDichVu,
--  SoLuongDichVuDikem (được tính dựa trên tổng Hợp đồng chi tiết), TienDatCoc của tất cả các dịch vụ đã 
--  từng được khách hàng đặt vào 3 tháng cuối năm 2019 nhưng chưa từng được khách hàng đặt vào 6 tháng đầu năm 2019.
SELECT distinct hd.IDHopDong, nv.HoTen, kh.HoTen, kh.SDT, TenDichVu, COUNT(hdct.SoLuong) AS SoLuongDichVuDikem , TienDatCoc, NgayLamHopDong
FROM khach_hang kh
INNER JOIN hop_dong hd ON kh.IDKhachHang=hd.IDKhachHang
INNER JOIN nhan_vien nv ON nv.IDNhanVien=hd.IDNhanVien
INNER JOIN hop_dong_chi_tiet hdct ON hd.IDHopDong=hdct.IDHopDong
INNER JOIN dich_vu dv ON dv.IDDichVu=hd.IDDichVu
WHERE EXISTS(
SELECT IDDichVu
FROM hop_dong hd
WHERE hd.IDDichVu=dv.IDDichVu
AND YEAR(hd.NgayLamHopDong) =2019 AND MONTH (hd.NgayLamHopDong) >9) 
AND 
NOT EXISTS( 
SELECT IDDichVu
FROM hop_dong hd
WHERE hd.IDDichVu=dv.IDDichVu
AND MONTH(hd.NgayLamHopDong) <7 )
GROUP BY IDHopDongChiTiet;

-- 13.	Hiển thị thông tin các Dịch vụ đi kèm được sử dụng nhiều nhất bởi các Khách hàng đã đặt phòng. (Lưu ý là có thể có nhiều dịch vụ có số lần sử dụng nhiều như nhau).
SELECT *
FROM dich_vu_di_kem 
WHERE  IDDichVuDiKem IN(
         SELECT IDDichVuDiKem
		 FROM hop_dong_chi_tiet 
         GROUP BY IDDichVuDiKem
         HAVING COUNT(IDDichVuDiKem)=(
                      SELECT MAX(SL)
                      FROM ( SELECT IDDichVuDiKem,COUNT(IDDichVuDiKem) AS SL
                             FROM hop_dong_chi_tiet
                             GROUP BY IDDichVuDiKem
                      
                      ) a
         )

);
-- 14.	Hiển thị thông tin tất cả các Dịch vụ đi kèm chỉ mới được sử dụng một lần duy nhất. Thông tin hiển thị bao gồm IDHopDong, TenLoaiDichVu, TenDichVuDiKem, SoLanSuDung.
SELECT IDHopDong, TenDichVuDiKem, COUNT(hdct.IDDichVuDiKem) AS SoLanSuDung 
FROM hop_dong_chi_tiet hdct
RIGHT JOIN dich_vu_di_kem dvdk ON hdct.IDDichVuDiKem =dvdk.IDDichVuDiKem
GROUP BY dvdk.IDDichVuDiKem
HAVING SoLanSuDung=1;

-- 15.	Hiển thi thông tin của tất cả nhân viên bao gồm IDNhanVien, HoTen, TrinhDo, TenBoPhan, SoDienThoai, DiaChi mới chỉ lập được tối đa 3 hợp đồng từ năm 2018 đến 2019.
SELECT nv.IDNhanVien, HoTen, TrinhDo, TenBoPhan, SDT, DiaChi,COUNT(hd.IDHopDong) AS SLHĐ
FROM nhan_vien nv
LEFT JOIN hop_dong hd ON nv.IDNhanVien=hd.IDNhanVien
INNER JOIN trinh_do td ON nv.IDTrinhDo=td.IDTrinhDo
INNER JOIN bo_phan bp ON bp.IDBoPhan = nv.IDBoPhan
WHERE YEAR(hd.NgayLamHopDong)= 2018 OR YEAR(hd.NgayLamHopDong)= 2019
GROUP BY nv.IDNhanVien
HAVING SLHĐ<=3;

-- 16.	Xóa những Nhân viên chưa từng lập được hợp đồng nào từ năm 2017 đến năm 2019.
DELETE FROM nhan_vien 
WHERE IDNhanVien NOT IN (
SELECT IDNhanVien
FROM hop_dong hd
WHERE YEAR(hd.NgayLamHopDong) BETWEEN 2017 AND 2019
GROUP BY nhan_vien.IDNhanVien
);
-- 17.	Cập nhật thông tin những khách hàng có TenLoaiKhachHang từ  Platinium lên Diamond, chỉ cập nhật những khách hàng đã từng đặt phòng với tổng Tiền thanh toán trong năm 2019 là lớn hơn 10.000.000 VNĐ.
UPDATE khach_hang kh
SET IDLoaiKhach= 2  
WHERE IDLoaiKhach = 1
AND idKhachHang IN(SELECT IDLoaiKhach
from hop_dong hd
where year(NgayLamHopDong)=2019
group by IDKhachHang
having SUM(TongTien)>10000000);
-- 18.	Xóa những khách hàng có hợp đồng trước năm 2016 (chú ý ràngbuộc giữa các bảng).

-- 19.	Cập nhật giá cho các Dịch vụ đi kèm được sử dụng trên 10 lần trong năm 2019 lên gấp đôi.

-- 20.	Hiển thị thông tin của tất cả các Nhân viên và Khách hàng có trong hệ thống, thông tin hiển thị bao gồm ID (IDNhanVien, IDKhachHang), HoTen, Email, SoDienThoai, NgaySinh, DiaChi.




