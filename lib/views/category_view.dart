part of 'pages.dart';

class CategoryView extends StatelessWidget {

  // List<Kategori> categories;
  // var items = List<Kategori>();

  // @override
  // void initState() {
  //   fetchData();
  //   super.initState();
  // }
  //
  // void fetchData() async {
  //   final response = await http.get(baseURLAPI + 'kategori');
  //   if (response.statusCode == 200) {
  //     setState(() {
  //       var data = jsonDecode(response.body);
  //       print(data['kategori'][0]['icon']);
  //
  //       categories =
  //           (data['kategori'] as Iterable).map((e) => Kategori.fromJson(e)).toList();
  //       print(categories);
  //     });
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: BlocBuilder<KategoriCubit, KategoriState>(
        builder: (_, state) {
      if (state is KategoriLoaded) {
        // print(state.kategori[0].icon);
        return GridView.builder(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 3, mainAxisSpacing: 25.0),
          padding: const EdgeInsets.all(10.0),
          itemCount: state.kategori.length,
          itemBuilder: (BuildContext context, int index) {
            return GridTile(
              footer: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Flexible(
                      child: SizedBox(
                        height: 16.0,
                        width: 130.0,
                        child: Text(
                          state.kategori[index].nama,
                          maxLines: 1,
                          textAlign: TextAlign.center,
                          overflow: TextOverflow.ellipsis,
                        ),
                      ),
                    )
                  ]),
              child: Container(
                height: 500.0,
                child: GestureDetector(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 100.0,
                        width: 100.0,
                        child: Row(
                          children: <Widget>[
                            Stack(
                              children: <Widget>[
                                SizedBox(
                                  child: Container(
                                    child: CircleAvatar(
                                      backgroundColor: Colors.white,
                                      radius: 40.0,
                                      child: Icon(
                                        XIconData.fromUri(state.kategori[index].icon),
                                        // Icons.emoji_events,
                                          size: 40.0,
                                          color: state.kategori[index].iconColor.toColor(),
                                          // color: Colors.grey,
                                    ),
                        ),
                                    padding: const EdgeInsets.only(
                                        left: 10.0, right: 10.0),
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  onTap: () {
                    Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (_) =>
                            CategoryPostsView(
                              kategori: state.kategori[index],
                        )));
                  },
                ),
              ),
            );
          },
        );
      } else {
        return Container(
          margin: EdgeInsets.only(top: 50),
          child: Center(
            child: CircularProgressIndicator(),
          ),
        );
      }
        },
      ),
    );
  }
}
