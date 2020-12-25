part of 'pages.dart';

class SearchView extends StatefulWidget {
  @override
  _SearchViewState createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  TextEditingController keywordController = TextEditingController();

  List<Post> posts;
  var items = List<Post>();
  bool isLoading = false;

  @override
  void initState() {
    isLoading = true;
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
        items.clear();
        items.addAll(posts);
        isLoading = false;
      });
    }
  }

  void filterSearchResults(String query) {
    List<Post> dummySearchList = List<Post>();
    dummySearchList.addAll(posts);
    if (query.isNotEmpty) {
      List<Post> dummyListData = List<Post>();
      dummySearchList.forEach((item) {
        if (containsIgnoreCase(item.judul, query)) {
          dummyListData.add(item);
        }
      });
      setState(() {
        items.clear();
        items.addAll(dummyListData);
      });
      return;
    } else {
      setState(() {
        items.clear();
        items.addAll(posts);
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              onChanged: (value) {
                filterSearchResults(value);
              },
              controller: keywordController,
              decoration: InputDecoration(
                  labelText: "Cari Artikel",
                  hintText: "Cari Artikel",
                  prefixIcon: Icon(Icons.search),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.all(Radius.circular(25.0)))),
            ),
          ),
          (isLoading)
              ? Column(
                  children: [
                    SizedBox(height: 30),
                    Center(
                      child: CircularProgressIndicator(),
                    ),
                  ],
                )
              : (items.length != 0)
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
                              height: 145.0,
                              margin: EdgeInsets.symmetric(
                                  horizontal: 18.0, vertical: 8.0),
                              child: SecondaryCard(post: post),
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
  }

  @override
  void dispose() {
    super.dispose();
  }
}
