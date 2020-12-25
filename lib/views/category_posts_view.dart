part of 'pages.dart';

class CategoryPostsView extends StatefulWidget {
  CategoryPostsView({this.kategori});

  final kategori;

  @override
  _CategoryPostsViewState createState() =>
      _CategoryPostsViewState(kategori: this.kategori);
}

class _CategoryPostsViewState extends State<CategoryPostsView> {
  final kategori;
  _CategoryPostsViewState({this.kategori});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(builder: (_, state) {
      if (state is PostLoaded) {
        List<Post> items = state.posts
            .where((element) => element.idKategori == kategori.idKategori)
            .toList();

        return Material(
          child: Column(
            children: <Widget>[
              SafeArea(
                child: Container(
                  padding: EdgeInsets.symmetric(vertical: 10),
                  child: Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 10,
                      ),
                      CircleButton(
                        icon: Icons.arrow_back_ios,
                        onTap: () => Navigator.pop(context),
                      ),
                      Container(
                        width: MediaQuery.of(context).size.width * 0.8,
                        child: Text(
                          'Kategori ' + kategori.nama,
                          style: TextStyle(
                            fontSize: 20.0,
                            fontWeight: FontWeight.bold,
                          ),
                          textAlign: TextAlign.left,
                          maxLines: 1,
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 15.0),
                      ),
                    ],
                  ),
                ),
              ),
              (items.length != 0)
                  ? Expanded(
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
                                  builder: (context) => ReadPostView(
                                      post: post, komentar: komentar),
                                ),
                              );
                            },
                            child: Container(
                              width: double.infinity,
                              height: 300.0,
                              margin: EdgeInsets.only(
                                  left: 18.0,
                                  right: 18.0,
                                  bottom: 8,
                                  top: (items[index] == state.posts.first)
                                      ? 0
                                      : 8.0),
                              child: PrimaryCard(post: post),
                            ),
                          );
                        },
                      ),
                    )
                  : Column(
                      children: [
                        SizedBox(height: 10.0),
                        Container(
                          margin: EdgeInsets.symmetric(horizontal: 16),
                          padding: EdgeInsets.symmetric(vertical: 16),
                          color: Colors.black12,
                          width: double.infinity,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(MdiIcons.alert),
                                SizedBox(width: 5),
                                Text("Artikel tidak ditemukan")
                              ]),
                        ),
                      ],
                    )
            ],
          ),
        );
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
