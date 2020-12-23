part of 'models.dart';

class Kategori extends Equatable {
  final int idkategori;
  final String nama;

  Kategori({this.idkategori, this.nama});

  factory Kategori.fromJson(Map<String, dynamic> data) {
    return Kategori(
      idkategori: data["idkategori"],
      nama: data["nama"],
    );
  }

  Kategori copyWith({
    int idkategori,
    String nama,
  }) {
    return Kategori(
        idkategori: idkategori ?? this.idkategori, nama: nama ?? this.nama);
  }

  @override
  List<Object> get props => [idkategori, nama];
}

// Our demo Kategori

List<Kategori> mockCategories = [
  Kategori(
    idkategori: 1,
    nama: "Berita",
  ),
  Kategori(
    idkategori: 2,
    nama: "Ilmu Pengetahuan",
  ),
  Kategori(
    idkategori: 3,
    nama: "Olahraga",
  ),
  Kategori(
    idkategori: 4,
    nama: "Prestasi",
  ),
  Kategori(
    idkategori: 5,
    nama: "Lain",
  ),
];
