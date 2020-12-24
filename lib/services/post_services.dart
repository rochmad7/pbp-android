part of 'services.dart';

class PostServices {
  static Future<ApiReturnValue<List<Post>>> getPosts(
      {int idKategori, String keyword, http.Client client}) async {
    client ??= http.Client();
    String url;
    if (keyword != null) {
      url = baseURLAPI + 'post?keyword=' + keyword;
    } else if (idKategori != null) {
      url = baseURLAPI + 'post?idkategori=' + idKategori.toString();
    } else {
      url = baseURLAPI + 'post';
    }

    var response = await client.get(url, headers: {
      "Content-Type": "application/json",
    });

    if (response.statusCode != 200) {
      return ApiReturnValue(message: "Silahkan coba lagi");
    }

    var data = jsonDecode(response.body);

    List<Post> categories =
        (data['post'] as Iterable).map((e) => Post.fromJson(e)).toList();

    return ApiReturnValue(value: categories);
  }
}
