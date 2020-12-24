part of 'models.dart';

class Kategori extends Equatable {
  final int idKategori;
  final String nama;
  final String icon;
  final String iconColor;

  Kategori({
    this.idKategori,
    this.nama,
    this.icon,
    this.iconColor,
  });

  factory Kategori.fromJson(Map<String, dynamic> data) {
    return Kategori(
      idKategori: int.parse(data["idkategori"].toString()),
      nama: data["nama"],
      icon: data["icon"],
      // icon: XIconData.fromUri("material://Icons.work"),
      iconColor: data["icon_color"],
    );
  }

  Kategori copyWith({
    int idKategori,
    String nama,
    String icon,
    String iconColor,
  }) {
    return Kategori(
      idKategori: idKategori ?? this.idKategori,
      nama: nama ?? this.nama,
      icon: icon ?? this.icon,
      iconColor: iconColor ?? this.iconColor,

    );
  }

  @override
  List<Object> get props => [
    idKategori,
    nama,
    icon,
    iconColor
  ];
}
