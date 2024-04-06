--Department 
INSERT INTO Department (MaKhoa, TenKhoa) VALUES
('K1', 'Khoa A'),
('K2', 'Khoa B'),
('K3', 'Khoa C');

--DepartmentSubject
INSERT INTO DepartmentSubject (MaBoMon, TenBoMon, MaKhoa) VALUES
('BM1', 'Bộ môn X', 'K1'),
('BM2', 'Bộ môn Y', 'K2'),
('BM3', 'Bộ môn Z', 'K3');

--Major
INSERT INTO Major (MaNganh, TenNganh, MaBoMon) VALUES
('N1', 'Ngành P', 'BM1'),
('N2', 'Ngành Q', 'BM2'),
('N3', 'Ngành R', 'BM3');

--StudentMajor
INSERT INTO StudentMajor (MaSinhVien, MaNganh, NgayDangKy) VALUES
('SV1', 'N1', '2023-01-01'),
('SV2', 'N2', '2023-02-15'),
('SV3', 'N3', '2023-03-20');

--Student
INSERT INTO Student (MaSinhVien, HoTen, NamNhapHoc) VALUES
('SV1', 'Nguyễn A', 2023),
('SV2', 'Trần B', 2023),
('SV3', 'Lê C', 2023);

--Course
INSERT INTO Course (MaMon, TenMon, MaNganh, SoTinChi) VALUES
('MH1', 'Môn X', 'N1', 3),
('MH2', 'Môn Y', 'N2', 4),
('MH3', 'Môn Z', 'N3', 3);

--StudentCourse
INSERT INTO StudentCourse (MaMon, MaSinhVien, DiemChuyenCan, DiemGiuaKy, DiemCuoiKy) VALUES
('MH1', 'SV1', 8.5, 7.0, 9.0),
('MH2', 'SV2', 9.0, 8.5, 8.0),
('MH3', 'SV3', 7.5, 8.0, 7.5);


