part of 'services.dart';

class KomentarServices {
  static Future<ApiReturnValue<List<Komentar>>> getComments(int idpost,
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURLAPI + 'komentar?idpost=' + idpost.toString();

    var response = await client.get(url, headers: {
      "Content-Type": "application/json",
    });

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Silahkan coba lagi");
    }

    var data = jsonDecode(response.body);

    List<Komentar> categories = (data['komentar'] as Iterable)
        .map((e) => Komentar.fromJson(e))
        .toList();

    return ApiReturnValue(value: categories);
  }
}
