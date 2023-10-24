// Nilai umr adalah upah minimum regional
import 'dart:ffi';
import 'package:intl/intl.dart';

const umr = 3200000;
var numFormat = NumberFormat("#,000");
var dateFormat = DateFormat("yyyy-MM-dd");


// Kelas Employee mewakili seorang karyawan
abstract class Employee {
  String nip; // Nomor Induk Pegawai (NIP)
  String name; // Nama Karyawan
  String? address; // Alamat Karyawan (opsional)
  int tahunMasuk; // Tahun masuk karyawan
  int _gaji = umr; // Gaji awal karyawan, diinisialisasi dengan umr

  // Konstrukor Employee dengan parameter wajib NIP dan nama, serta tahunMasuk opsional
  Employee(this.nip, this.name, {this.tahunMasuk = 2015});

  // Metode untuk mencatat kehadiran karyawan
  // berdasarkan waktu masuk
  void presensi(DateTime jamMasuk) ;

  //   if (jamMasuk.hour > 8) {
  //     print("$name Datang terlambat");
  //   } else {
  //     print("$name Datang tepat waktu");
  //   }
  // 

  // Metode untuk mengembalikan deskripsi
  // karyawan dalam bentuk teks
  String deskripsi() {
    String teks = '''==========================
    NIP: $nip
    Nama: $name
    Gaji: ${numFormat.format(_gaji)}''';
    if (address != null) {
      teks += "\n Alamat: $address";
    }
    return teks;
  }

  // Properti untuk menghitung tunjangan berdasarkan tahun masuk
  int get tunjangan; 
  // => ((2023 - tahunMasuk) < 5) ? 500000 : 1000000;

  

  // Properti untuk menghitung gaji total (gaji utama + tunjangan)
  int get totalGaji => (_gaji + tunjangan);

  // Setter untuk mengatur gaji karyawan dengan validasi
  set gaji(int gaji) {
    if (gaji < umr) {
      _gaji = umr;
      print("Gaji $name, tidak boleh di bawah umr");
    } else {
      _gaji = totalGaji;
    }
  }
}

enum tipeJabatan { direktur, manajer, kabag}

class penjabat extends Employee {
  tipeJabatan jabatan; // Properti jabatan

  penjabat(super.nip, super.name, this.jabatan);

  @override
  void presensi(DateTime jamMasuk) {
    if (jamMasuk.hour > 10) {
      print("$name pada ${dateFormat.format(jamMasuk)} Datang terlambat");
    } else {
      print("$name pada ${dateFormat.format(jamMasuk)} Datang tepat waktu");
    }
  }

  @override
  // TODO: implement tunjangan
  int get tunjangan {
    if (jabatan == tipeJabatan.kabag) {
      return 1500000;
    } else if (jabatan == tipeJabatan.manajer) {
      return 2500000;
    } else if (jabatan == tipeJabatan.direktur) {
      return 5000000;
    } else {
      return 6000000;
    }
  }
 
  @override
  String deskripsi() {
    String teks = super.deskripsi();
    teks += "Jabatan = ${jabatan.name}";
    return teks;
  }

}

class stafBiasa extends Employee {

  stafBiasa (super.nip, super.name, {tahunMasuk = 2015});

  @override
  void presensi(DateTime jamMasuk) {
    if (jamMasuk.hour > 8) {
      print("$name Datang terlambat");
    } else {
      print("$name Datang tepat waktu");
    }
  }

  @override
  // TODO: implement tunjangan
  int get tunjangan => ((2023 - tahunMasuk) < 5) ? 500000 : 1000000;
 
}