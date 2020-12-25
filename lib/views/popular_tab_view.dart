part of 'pages.dart';

class PopularTabView extends StatelessWidget {
  final int batas = 5;

  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await context
            .read<PostCubit>()
            .getPosts(idKategori: null, keyword: null);
      },
      child: Container(
        child: ListView(
          children: [
            Container(
              width: double.infinity,
              height: 300.0,
              padding: EdgeInsets.only(left: 18.0),
              child: BlocBuilder<PostCubit, PostState>(
                builder: (_, state) {
                  if (state is PostInitial) {
                    return Center(
                      child: SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(),
                      ),
                    );
                  } else {
                    PostLoaded postLoaded = state as PostLoaded;

                    return ListView.builder(
                      itemCount: batas,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var post = postLoaded.posts[index];
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
                            margin: EdgeInsets.only(right: 12.0),
                            child: PrimaryCard(post: post),
                          ),
                        );
                      },
                    );
                  }
                },
              ),
            ),
            SizedBox(height: 25.0),
            Align(
              alignment: Alignment.topLeft,
              child: Padding(
                padding: EdgeInsets.only(left: 19.0),
                child: Text("BASED ON YOUR READING HISTORY",
                    style: kNonActiveTabStyle),
              ),
            ),
            BlocBuilder<PostCubit, PostState>(
              builder: (_, state) {
                if (state is PostLoaded) {
                  return ListView.builder(
                    itemCount: state.posts.length - batas,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      var post = state.posts[index + batas];
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
          ],
        ),
      ),
    );
  }
}
