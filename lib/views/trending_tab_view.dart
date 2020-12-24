part of 'pages.dart';

class TrendingTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PostCubit, PostState>(
      builder: (_, state) {
        if (state is PostLoaded) {
          return ListView.builder(
            itemCount: state.posts.length,
            scrollDirection: Axis.vertical,
            shrinkWrap: true,
            physics: BouncingScrollPhysics(),
            itemBuilder: (context, index) {
              var post = state.posts[index];

              return InkWell(
                onTap: () async{
                  List<Komentar> komentar = await context.read<KomentarCubit>().getComments(post.idPost);
                  Navigator.push(
                    context,
                    MaterialPageRoute(
                      builder: (context) => ReadPostView(post: post,komentar: komentar),
                    ),
                  );
                },
                child: Container(
                  width: double.infinity,
                  height: 300.0,
                  margin:
                      EdgeInsets.symmetric(horizontal: 18.0, vertical: 12.0),
                  child: PrimaryCard(post: post),
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
