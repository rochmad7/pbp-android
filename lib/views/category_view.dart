part of 'pages.dart';

class CategoryView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[200],
      body: BlocBuilder<KategoriCubit, KategoriState>(
        builder: (_, state) {
          if (state is KategoriLoaded) {
            List<Kategori> kategori = state.kategori.toList();
            return GridView(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3, mainAxisSpacing: 25.0),
              padding: const EdgeInsets.all(10.0),
              children: kategori
                  .map(
                    (e) => GridTile(
                      footer: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: <Widget>[
                            Flexible(
                              child: SizedBox(
                                height: 16.0,
                                width: 130.0,
                                child: Text(
                                  e.nama,
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
                                                XIconData.fromUri(e.icon),
                                                // Icons.emoji_events,
                                                size: 40.0,
                                                color: e.iconColor.toColor(),
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
                                    builder: (_) => CategoryPostsView(
                                          kategori: e,
                                        )));
                          },
                        ),
                      ),
                    ),
                  )
                  .toList(),
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
