part of 'pages.dart';

class PopularTabView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return RefreshIndicator(
      onRefresh: () async {
        await context.read<PostCubit>().getPosts();
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
                  if (state is PostLoaded) {
                    return ListView.builder(
                      itemCount: state.posts.length,
                      scrollDirection: Axis.horizontal,
                      shrinkWrap: true,
                      itemBuilder: (context, index) {
                        var posts = state.posts[index];
                        return InkWell(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) => ReadPostView(post: posts),
                              ),
                            );
                          },
                          child: Container(
                            margin: EdgeInsets.only(right: 12.0),
                            child: PrimaryCard(post: posts),
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
                    itemCount: state.posts.length,
                    scrollDirection: Axis.vertical,
                    shrinkWrap: true,
                    physics: ScrollPhysics(),
                    itemBuilder: (context, index) {
                      var recent = state.posts[index];
                      return InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => ReadPostView(post: recent),
                            ),
                          );
                        },
                        child: Container(
                          width: double.infinity,
                          height: 135.0,
                          margin: EdgeInsets.symmetric(
                              horizontal: 18.0, vertical: 8.0),
                          child: SecondaryCard(post: recent),
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
            ),
          ],
        ),
      ),
    );
  }
}
