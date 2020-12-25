part of 'pages.dart';

class PopularTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await context
            .read<PostCubit>()
            .getPosts(idKategori: null, keyword: null);
      },
      child: ListView(
        children: [
          BlocBuilder<PostCubit, PostState>(builder: (_, state) {
            if (state is PostLoaded) {
              List<Post> posts = state.posts.sortedBy((a, b) {
                var aj = a.jmlhKomentar;
                var bj = b.jmlhKomentar;
                return bj.compareTo(aj);
              }).toList();
              return ListView(
                scrollDirection: Axis.vertical,
                physics: BouncingScrollPhysics(),
                shrinkWrap: true,
                children: posts
                    .map(
                      (e) => InkWell(
                        onTap: () async {
                          List<Komentar> komentar = await context
                              .read<KomentarCubit>()
                              .getComments(e.idPost);
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) =>
                                  ReadPostView(post: e, komentar: komentar),
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: 145.0,
                          margin: EdgeInsets.symmetric(
                              horizontal: 18.0, vertical: 8.0),
                          child: SecondaryCard(post: e),
                        ),
                      ),
                    )
                    .toList(),
              );
            } else {
              return Center(
                child: CircularProgressIndicator(),
              );
            }
          }),
        ],
      ),
    );
  }
}
