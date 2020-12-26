part of 'pages.dart';

class ReadPostView extends StatelessWidget {
  final Post post;
  final List<Komentar> komentar;
  ReadPostView({this.post, this.komentar});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(65.0),
        child: Center(
          child: SafeArea(
            child: Padding(
              padding: EdgeInsets.fromLTRB(18.0, 15.0, 18.0, 0),
              child: Row(
                children: [
                  CircleButton(
                    icon: Icons.arrow_back_ios,
                    onTap: () => Navigator.pop(context),
                  ),
                  Spacer(),
                  CircleButton(
                    icon: Icons.share,
                    onTap: () {
                      final RenderBox box = context.findRenderObject();
                      Share.share(
                          post.judul + "\n" + baseURLPostDetail + post.slug,
                          subject: baseURLPostDetail + post.slug,
                          sharePositionOrigin:
                              box.localToGlobal(Offset.zero) & box.size);
                    },
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Container(
        padding: EdgeInsets.symmetric(horizontal: 18.0),
        child: ListView(
          children: [
            SizedBox(height: 12.0),
            Hero(
              tag: 12,
              child: Container(
                height: 220.0,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(15.0),
                  image: DecorationImage(
                    image: NetworkImage(post.fileGambar),
                    fit: BoxFit.fill,
                  ),
                ),
              ),
            ),
            SizedBox(height: 15.0),
            Row(
              children: [
                Container(
                  padding: EdgeInsets.symmetric(
                    horizontal: 12.0,
                    vertical: 15.0,
                  ),
                  decoration: BoxDecoration(
                    border: Border.all(color: kGrey3, width: 1.0),
                    borderRadius: BorderRadius.circular(25.0),
                  ),
                  child: Row(
                    children: [
                      CircleAvatar(
                        radius: 5.0,
                        backgroundColor: kGrey3,
                      ),
                      SizedBox(width: 6.0),
                      Text(
                        post.namaKategori,
                        style: kCategoryTitle,
                      ),
                    ],
                  ),
                ),
                Spacer(),
                Status(
                  icon: Icons.comment,
                  total: post.jmlhKomentar.toString(),
                ),
                SizedBox(width: 15.0),
              ],
            ),
            SizedBox(height: 12.0),
            Text(post.judul, style: kTitleCard.copyWith(fontSize: 28.0)),
            SizedBox(height: 15.0),
            Row(
              children: [
                Text(
                    convertDate(post.tglInsert, true) +
                        " at " +
                        convertTime(post.tglInsert),
                    style: kDetailContent),
                SizedBox(width: 5.0),
                SizedBox(
                  width: 10.0,
                  child: Divider(
                    color: kBlack,
                    height: 1.0,
                  ),
                ),
              ],
            ),
            SizedBox(height: 5.0),
            Row(
              children: [
                Text(
                  "Posted By: ",
                  style: kDetailContent.copyWith(
                      color: Colors.black, fontSize: 12),
                ),
                Text(
                  post.namaPenulis,
                  maxLines: 1,
                  style: kDetailContent.copyWith(color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 15.0),
            Html(
              data: post.isiPost,
              //Optional parameters:
              style: {
                "*": Style(
                    margin: EdgeInsets.all(0), padding: EdgeInsets.all(0)),
                "html": Style(
                  backgroundColor: Colors.white,
                ),
                "p": Style(
                  fontSize: FontSize.large,
                  lineHeight: 1.5,
                ),
                "table": Style(
                  backgroundColor: Color.fromARGB(0x50, 0xee, 0xee, 0xee),
                ),
                "tr": Style(
                  border: Border(bottom: BorderSide(color: Colors.grey)),
                ),
                "th": Style(
                  padding: EdgeInsets.all(6),
                  backgroundColor: Colors.grey,
                ),
                "td": Style(
                  padding: EdgeInsets.all(6),
                ),
                "var": Style(fontFamily: 'serif'),
              },
              customRender: {
                "flutter":
                    (RenderContext context, Widget child, attributes, _) {
                  return FlutterLogo(
                    style: (attributes['horizontal'] != null)
                        ? FlutterLogoStyle.horizontal
                        : FlutterLogoStyle.markOnly,
                    textColor: context.style.color,
                    size: context.style.fontSize.size * 5,
                  );
                },
              },
              onLinkTap: (url) async => await launch(url),
              onImageTap: (src) {
                print(src);
              },
              onImageError: (exception, stackTrace) {
                print(exception);
              },
            ),
            SizedBox(height: 25.0),
            Text("Komentar",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)),
            BlocBuilder<KomentarCubit, KomentarState>(
              builder: (_, state) {
                if (state is KomentarLoaded) {
                  if (state.comments.length == 0) {
                    return Column(
                      children: [
                        SizedBox(height: 10.0),
                        Container(
                          padding: EdgeInsets.symmetric(vertical: 16),
                          color: Colors.black12,
                          width: double.infinity,
                          child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Icon(MdiIcons.alert),
                                SizedBox(width: 5),
                                Text("Belum ada komentar")
                              ]),
                        ),
                      ],
                    );
                  } else {
                    return ListView.builder(
                      itemCount: komentar.length,
                      scrollDirection: Axis.vertical,
                      shrinkWrap: true,
                      physics: BouncingScrollPhysics(),
                      itemBuilder: (context, index) {
                        var comment = komentar[index];
                        return Comment(
                          komentar: comment,
                        );
                      },
                    );
                  }
                } else {
                  return Center(
                    child: CircularProgressIndicator(),
                  );
                }
              },
            ),
            SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}

class Status extends StatelessWidget {
  final IconData icon;
  final String total;
  Status({this.icon, this.total});
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Icon(icon, color: kGrey2),
        SizedBox(width: 4.0),
        Text(total, style: kDetailContent),
      ],
    );
  }
}
