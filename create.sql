--Department 
CREATE TABLE Department (
    MaKhoa VARCHAR(10) PRIMARY KEY,
    TenKhoa VARCHAR(100)
);

--DepartmentSubject
CREATE TABLE DepartmentSubject (
    MaBoMon VARCHAR(10) PRIMARY KEY,
    TenBoMon VARCHAR(100),
    MaKhoa VARCHAR(10),
    FOREIGN KEY (MaKhoa) REFERENCES Department(MaKhoa)
);

--Major 
CREATE TABLE Major (
    MaNganh VARCHAR(10) PRIMARY KEY,
    TenNganh VARCHAR(100),
    MaBoMon VARCHAR(10),
    FOREIGN KEY (MaBoMon) REFERENCES DepartmentSubject(MaBoMon)
);

--StudentMajor
CREATE TABLE StudentMajor (
    MaSinhVien VARCHAR(10),
    MaNganh VARCHAR(10),
    NgayDangKy DATE,
    PRIMARY KEY (MaSinhVien, MaNganh),
    FOREIGN KEY (MaNganh) REFERENCES Major(MaNganh)
);

--Student
CREATE TABLE Student (
    MaSinhVien VARCHAR(10) PRIMARY KEY,
    HoTen VARCHAR(100),
    NamNhapHoc INT
);

--Course 
CREATE TABLE Course (
    MaMon VARCHAR(10) PRIMARY KEY,
    TenMon VARCHAR(100),
    MaNganh VARCHAR(10),
    SoTinChi INT,
    FOREIGN KEY (MaNganh) REFERENCES Major(MaNganh)
);

--StudentCourse 
CREATE TABLE StudentCourse (
    MaMon VARCHAR(10),
    MaSinhVien VARCHAR(10),
    DiemChuyenCan FLOAT,
    DiemGiuaKy FLOAT,
    DiemCuoiKy FLOAT,
    PRIMARY KEY (MaMon, MaSinhVien),
    FOREIGN KEY (MaMon) REFERENCES Course(MaMon),
    FOREIGN KEY (MaSinhVien) REFERENCES Student(MaSinhVien)
);