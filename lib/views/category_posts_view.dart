part of 'pages.dart';

class CategoryPostsView extends StatefulWidget {
  CategoryPostsView({this.kategori});

  final kategori;

  @override
  _CategoryPostsViewState createState() =>
      _CategoryPostsViewState(kategori: this.kategori);
}

class _CategoryPostsViewState extends State<CategoryPostsView> {
  _CategoryPostsViewState({this.kategori});

  final kategori;

  List<Post> posts;
  var items = List<Post>();

  @override
  void initState() {
    fetchData();
    super.initState();
  }

  void fetchData() async {
    final response = await http.get(baseURLAPI + 'post');
    if (response.statusCode == 200) {
      setState(() {
        var data = jsonDecode(response.body);

        posts =
            (data['post'] as Iterable).map((e) => Post.fromJson(e)).toList();
        print(posts);
      });
    }
  }

  // void filterCategoryPosts(int idKategori) {
  //   List<Post> dummySearchList = List<Post>();
  //   dummySearchList.addAll(posts);
  //   if (idKategori != null) {
  //     List<Post> dummyListData = List<Post>();
  //     dummySearchList.forEach((item) {
  //       // if (containsIgnoreCase(item.judul, idKategori)) {
  //       //   dummyListData.add(item);
  //       // }
  //     });
  //     setState(() {
  //       items.clear();
  //       items.addAll(dummyListData);
  //     });
  //     return;
  //   } else {
  //     setState(() {
  //       items.clear();
  //       items.addAll(posts);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(builder: (_, state) {
      if (state is PostLoaded) {
        List<Post> items = state.posts
            .where((element) => element.idKategori == kategori.idKategori)
            .toList();

        if (items.length != 0) {
          return Material(
            child: Column(
              children: <Widget>[
                SafeArea(
                  child: Row(
                    children: [
                      CircleButton(
                        icon: Icons.arrow_back_ios,
                        onTap: () => Navigator.pop(context),
                      ),
                      Container(
                        child: Text(
                          'Kategori ' + kategori.nama,
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                          maxLines: 2,
                        ),
                        margin: EdgeInsets.only(top: 10.0),
                        padding: EdgeInsets.all(15.0),
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                ),
                Expanded(
                  child: ListView.builder(
                    itemCount: items.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      var post = items[index];
                      return InkWell(
                        onTap: () async {
                          List<Komentar> komentar = await context
                              .read<KomentarCubit>()
                              .getComments(post.idPost);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ReadPostView(post: post, komentar: komentar),
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: 145.0,
                          margin: EdgeInsets.symmetric(
                              horizontal: 18.0, vertical: 8.0),
                          child: SecondaryCard(post: post),
                        ),
                      );
                    },
                  ),
                ),
              ],
            ),
          );
        } else {
          return Material(
            child: Column(
              children: <Widget>[
                SafeArea(
                  child: Row(
                    children: [
                      CircleButton(
                        icon: Icons.arrow_back_ios,
                        onTap: () => Navigator.pop(context),
                      ),
                      Container(
                        child: Text(
                          'Kategori ' + kategori.nama,
                          style: TextStyle(
                            fontSize: 30.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.center,
                        ),
                        margin: EdgeInsets.only(top: 10.0),
                        padding: EdgeInsets.all(15.0),
                        alignment: Alignment.center,
                      ),
                    ],
                  ),
                ),
                Container(
                  child: Center(
                    child: Text("Tidak ada post"),
                  ),
                ),
              ],
            ),
          );
        }
      } else {
        return Center(
          child: CircularProgressIndicator(),
        );
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
  }
}
