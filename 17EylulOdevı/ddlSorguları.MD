1-)
Bölüm → Öğrenci = 1'e çok (1:N)
Öğrenci N ←→ N Ders

DDL sorguları
CREATE TABLE Bolum (
    BolumID INT PRIMARY KEY,
    BolumAdi VARCHAR(100) NOT NULL
);
CREATE TABLE Ogrenci (
    OgrenciID INT PRIMARY KEY,
    Ad VARCHAR(50) NOT NULL,
    Soyad VARCHAR(50) NOT NULL,
    BolumID INT NOT NULL,

    FOREIGN KEY (BolumID) REFERENCES Bolum(BolumID)
);
CREATE TABLE Ders (
    DersID INT PRIMARY KEY,
    DersAdi VARCHAR(100) NOT NULL,
    Kredi INT NOT NULL
);


CREATE TABLE OgrenciDers (
    OgrenciID INT,
    DersID INT,

    PRIMARY KEY (OgrenciID, DersID),

    FOREIGN KEY (OgrenciID) REFERENCES Ogrenci(OgrenciID) ON DELETE CASCADE,
    FOREIGN KEY (DersID) REFERENCES Ders(DersID) ON DELETE CASCADE
);


