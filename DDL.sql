CREATE TABLE rapid_test (
    id_rapid CHAR(10) PRIMARY KEY NOT NULL,
    no_ktp CHAR(16) NOT NULL,
    tanggal_tes DATE,
    hasil_1 SMALLINT,
    tanggal_2 DATE,
    hasil_2 SMALLINT,
    tanggal_3 DATE,
    hasil_3 SMALLINT
);
 
CREATE TABLE pcr_swab (
    id_swab CHAR(10) PRIMARY KEY NOT NULL,
    no_ktp CHAR(16) NOT NULL,
    tanggal_tes DATE,
    hasil SMALLINT
);
 
CREATE TABLE pasien (
    no_ktp CHAR(16) PRIMARY KEY NOT NULL,
    id_rapid CHAR(10) REFERENCES rapid_test(id_rapid),
    id_swab CHAR(10) REFERENCES pcr_swab(id_swab),
    nama VARCHAR(20),
    jenis_kelamin CHAR(1),
    umur INTEGER,
    no_telp VARCHAR(15),
    status VARCHAR(10)
);
 
ALTER TABLE rapid_test ADD CONSTRAINT fk_no_ktp FOREIGN KEY (no_ktp) REFERENCES pasien(no_ktp);
ALTER TABLE pcr_swab ADD CONSTRAINT fk_no_ktp2 FOREIGN KEY (no_ktp) REFERENCES pasien(no_ktp);
 
CREATE TABLE dokter (
    id_dokter CHAR(10) PRIMARY KEY NOT NULL,
    nama VARCHAR(20),
    no_telp VARCHAR(15),
    status VARCHAR(10)
);
 
CREATE TABLE obat (
    id_obat CHAR(10) PRIMARY KEY NOT NULL,
    nama VARCHAR(20),
    stok INTEGER,
    harga INTEGER
);
 
CREATE TABLE perawat (
    id_perawat CHAR(10) PRIMARY KEY NOT NULL,
    nama VARCHAR(20),
    no_telp VARCHAR(15),
    status VARCHAR(10)
);
 
CREATE TABLE kamar (
    id_kamar CHAR(10) PRIMARY KEY NOT NULL,
    nama VARCHAR(20),
    harga INTEGER,
    status VARCHAR(10)
);
 
CREATE TABLE rawat_inap (
    id_inap CHAR(10) PRIMARY KEY NOT NULL,
    id_rekam CHAR(10) NOT NULL,
    id_kamar CHAR(10) REFERENCES kamar(id_kamar) NOT NULL,
    id_perawat CHAR(10) REFERENCES perawat(id_perawat) NOT NULL,
    tanggal_masuk DATE,
    tanggal_keluar DATE
);
 
CREATE TABLE pembayaran (
    id_bayar CHAR(10) PRIMARY KEY NOT NULL,
    id_rekam CHAR(10) NOT NULL,
    biaya_total INTEGER,
    metode VARCHAR(10),
    status VARCHAR(10),
    tanggal DATE
);
 
CREATE TABLE rekam_medis (
    id_rekam CHAR(10) PRIMARY KEY NOT NULL,
    id_inap CHAR(10) REFERENCES rawat_inap(id_inap),
    id_bayar CHAR(10) REFERENCES pembayaran(id_bayar),
    no_ktp CHAR(16) REFERENCES pasien(no_ktp) NOT NULL,
    id_dokter CHAR(10) REFERENCES dokter(id_dokter) NOT NULL,
    tanggal DATE,
    diagnosa VARCHAR(200)
);
 
ALTER TABLE rawat_inap ADD CONSTRAINT fk_id_rekam FOREIGN KEY (id_rekam) REFERENCES rekam_medis(id_rekam);
ALTER TABLE pembayaran ADD CONSTRAINT fk_id_rekam2 FOREIGN KEY (id_rekam) REFERENCES rekam_medis(id_rekam);
 
CREATE TABLE diresepkan (
    id_obat CHAR(10) REFERENCES obat(id_obat) NOT NULL,
    id_rekam CHAR(10) REFERENCES rekam_medis(id_rekam) NOT NULL,
    CONSTRAINT pk_diresepkan PRIMARY KEY (id_obat, id_rekam)
);
