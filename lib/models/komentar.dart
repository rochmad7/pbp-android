part of 'models.dart';

class Komentar extends Equatable {
  final int idKomentar;
  final int idPost;
  final int idPenulis;
  final String isi;
  final String nama;
  final DateTime tglInsert;

  Komentar({
    this.idKomentar,
    this.idPost,
    this.idPenulis,
    this.isi,
    this.nama,
    this.tglInsert,
  });

  factory Komentar.fromJson(Map<String, dynamic> data) {
    return Komentar(
      idKomentar: int.parse(data["idkomentar"].toString()),
      idPost: int.parse(data["idpost"].toString()),
      idPenulis: int.parse(data["idpenulis"].toString()),
      isi: data["isi"],
      nama: data["nama"],
      tglInsert: DateTime.parse(data["tgl_insert"].toString()),
    );
  }

  Komentar copyWith({
    int idKomentar,
    int idPost,
    int idPenulis,
    String isi,
    String nama,
    DateTime tglInsert,
  }) {
    return Komentar(
        idKomentar: idKomentar ?? this.idKomentar,
        idPost: idPost ?? this.idPost,
        idPenulis: idPenulis ?? this.idPenulis,
        isi: isi ?? this.isi,
        nama: nama ?? this.nama,
        tglInsert: tglInsert ?? this.tglInsert);
  }

  @override
  List<Object> get props => [
        idKomentar,
        idPost,
        idPenulis,
        isi,
        nama,
        tglInsert,
      ];
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
