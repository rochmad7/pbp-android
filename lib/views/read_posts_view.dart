part of 'pages.dart';

class ReadPostView extends StatelessWidget {
  final Post post;
  ReadPostView({this.post});
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
                    onTap: () {},
                  ),
                  CircleButton(
                    icon: Icons.favorite_border,
                    onTap: () {},
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
                  icon: Icons.remove_red_eye,
                  total: "15",
                ),
                SizedBox(width: 15.0),
                Status(
                  icon: Icons.favorite_border,
                  total: "20",
                ),
              ],
            ),
            SizedBox(height: 12.0),
            Text(post.judul, style: kTitleCard.copyWith(fontSize: 28.0)),
            SizedBox(height: 15.0),
            Row(
              children: [
                Text("15 Desember", style: kDetailContent),
                SizedBox(width: 5.0),
                SizedBox(
                  width: 10.0,
                  child: Divider(
                    color: kBlack,
                    height: 1.0,
                  ),
                ),
                SizedBox(width: 5.0),
                Text(
                  post.namaPenulis,
                  style: kDetailContent.copyWith(color: Colors.black),
                ),
              ],
            ),
            SizedBox(height: 15.0),
            Text(
              post.isiPost,
              style: descriptionStyle,
            ),
            Html(
              data: post.isiPost,
              //Optional parameters:
              style: {
                "html": Style(
                  backgroundColor: Colors.white,
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
            // Html(
            //   data: post.isiPost,
            //   //Optional parameters:
            //   onLinkTap: (url) {
            //     // open url in a webview
            //   },
            //   style: {
            //     "div": Style(
            //       block: Block(
            //         margin: EdgeInsets.all(16),
            //         border: Border.all(width: 6),
            //         backgroundColor: Colors.grey,
            //       ),
            //       textStyle: TextStyle(
            //         color: Colors.red,
            //       ),
            //     ),
            //   },
            //   onImageTap: (src) {
            //     // Display the image in large form.
            //   },
            // ),
            SizedBox(height: 25.0)
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
