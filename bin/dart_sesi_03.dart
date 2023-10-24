// Mengimpor modul 'employee.dart' yang berisi definisi kelas Employee
import 'package:dart_sesi_03/employee.dart';
import 'package:dart_sesi_03/dummy_data.dart';

void main(List<String> arguments) {
  List<Employee> dataEmployee = genData(dummyData());

  // dataEmployee.add(penjabat("D33617", "Aziz Prana Lewu", tipeJabatan.direktur));
  // dataEmployee.add(penjabat("K90112", "Ki Prana Lewu", tipeJabatan.kabag));
  // dataEmployee[1].tahunMasuk = 2016;
  // dataEmployee.add(stafBiasa("M89182", "Alfath Presmi", tahunMasuk: 2020));

  dataEmployee[0].presensi(DateTime.parse('2023-10-15 09:58:30'));
  dataEmployee[1].presensi(DateTime.parse('2023-10-15 08:02:30'));
  dataEmployee[2].presensi(DateTime.parse('2023-10-15 09:01:30'));

  dataEmployee[0].gaji = 1500000;
  dataEmployee[1].gaji = 500000;
  dataEmployee[2].gaji = 4500000;

  dataEmployee[1].address = "Bandung Timur, Jawa Barat Indonesia";
  dataEmployee[2].address = "jl. Sukamenak no. 111b Kab. Bandung";

  for (var staff in dataEmployee) {
    print(staff.deskripsi());
  }

  // Membuat objek Employee untuk tiga staff dengan data yang berbeda
  // Employee staff1 = Employee("116007", "Usman");
  // Employee staff2 = Employee("116116", "Basir", tahunMasuk: 2016);
  // Employee staff3 = Employee("116221", "Bagas", tahunMasuk: 2020);

  // // Memanggil metode 'presensi' untuk mencatat kehadiran staf
  // staff1.presensi(DateTime.parse('2023-10-15 09:58:30'));
  // staff2.presensi(DateTime.parse('2023-10-15 08:02:30'));
  // staff3.presensi(DateTime.parse('2023-10-15 08:58:30'));

  // // Mengatur gaji staf
  // staff1.gaji = 500000;
  // staff2.gaji = 4500000;

  // // Mengatur alamat staf
  // staff1.address = "Bandung Timur, Jawa Barat Indonesia";
  // staff2.address = "jl. Sukamenak no. 111b Kab. Bandung";

  // // Mencetak deskripsi staf ke layar
  // print(staff1.deskripsi());
  // print(staff2.deskripsi());
  // print(staff3.deskripsi());
}

List<Employee> genData(var ListData) {
  List<Employee> data = [];
  for (var dataEmployee in ListData) {
    Employee employee;
    if (dataEmployee.containsKey('jabatan')) {
      employee = penjabat(dataEmployee['nip'], dataEmployee['name'], dataEmployee['jabatan']);
    } else {
      employee = stafBiasa(dataEmployee['nip'], dataEmployee['name']);
    }

    if (dataEmployee.containsKey('tahun_masuk')) {
      employee.tahunMasuk = dataEmployee['tahun_masuk'];
    }

    if (dataEmployee.containsKey('address')) {
      employee.address = dataEmployee['address'];
    }
    data.add(employee);
  }
  return data;
}
