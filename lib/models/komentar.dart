part of 'models.dart';

class Komentar extends Equatable {
  final int idKomentar;
  final int idPost;
  final String isi;
  final String nama;
  final DateTime tglInsert;

  Komentar({this.idKomentar, this.idPost, this.isi, this.nama, this.tglInsert});

  factory Komentar.fromJson(Map<String, dynamic> data) {
    return Komentar(
      idKomentar: data["idkomentar"],
      idPost: data["idpost"],
      isi: data["isi"],
      nama: data["nama"],
      tglInsert: data["tgl_insert"],
    );
  }

  Komentar copyWith(
      {int idKomentar,
      int idPost,
      String isi,
      String nama,
      DateTime tglInsert}) {
    return Komentar(
        idKomentar: idKomentar ?? this.idKomentar,
        idPost: idPost ?? this.idPost,
        isi: isi ?? this.isi,
        nama: nama ?? this.nama,
        tglInsert: tglInsert ?? this.tglInsert);
  }

  @override
  List<Object> get props => [idKomentar, idPost, isi, nama, tglInsert];
}

// Our demo Komentar

List<Komentar> mockComments = [
  Komentar(
    idKomentar: 1,
    idPost: 1,
    isi: "Hello World, testing komentar",
    nama: "Rochmad",
  ),
  Komentar(
    idKomentar: 2,
    idPost: 2,
    isi: "Artikelnya sangat menarik",
    nama: "Husni",
  ),
  Komentar(
    idKomentar: 3,
    idPost: 2,
    isi: "Terimakasih, semoga bermanfaat",
    nama: "Fatah",
  ),
  Komentar(
    idKomentar: 4,
    idPost: 2,
    isi: "Mantap",
    nama: "Rizqi",
  ),
  Komentar(
    idKomentar: 5,
    idPost: 3,
    isi: "Ide bagus undip",
    nama: "Husni",
  ),
  Komentar(
    idKomentar: 6,
    idPost: 4,
    isi: "Inikah kelakuan mahasiswa sekarang?",
    nama: "Rochmad",
  ),
];
