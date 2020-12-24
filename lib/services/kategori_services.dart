part of 'services.dart';

class KategoriServices {
  static Future<ApiReturnValue<List<Kategori>>> getKategori(
      {http.Client client}) async {
    client ??= http.Client();
    String url = baseURLAPI + 'kategori';

    var response = await client.get(url, headers: {
      "Content-Type": "application/json",
    });

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Silahkan coba lagi");
    }

    var data = jsonDecode(response.body);

    List<Kategori> categories =
        (data['kategori'] as Iterable).map((e) => Kategori.fromJson(e)).toList();

    return ApiReturnValue(value: categories);
  }
}
