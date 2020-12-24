part of 'pages.dart';

class RecentTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(
      builder: (_, state) {
        if (state is PostLoaded) {
          return ListView.builder(
            itemCount: state.posts.length,
            scrollDirection: Axis.vertical,
            physics: BouncingScrollPhysics(),
            shrinkWrap: true,
            itemBuilder: (context, index) {
              var post = state.posts[index];

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
                  margin: EdgeInsets.symmetric(horizontal: 18.0, vertical: 8.0),
                  child: SecondaryCard(post: post),
                ),
              );
            },
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      },
    );
  }
}
