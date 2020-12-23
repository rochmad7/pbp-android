part of 'services.dart';

class PostServices {
  static Future<ApiReturnValue<List<Post>>> getPosts(
      {http.Client client}) async {
    client ??= http.Client();

    String url = baseURLAPI + 'post';

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
