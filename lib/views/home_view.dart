part of 'pages.dart';

class HomeView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: PreferredSize(
          preferredSize: Size.fromHeight(48.0),
          child: Column(
            children: [
              Align(
                alignment: Alignment.topLeft,
                child: TabBar(
                  labelColor: Colors.black,
                  unselectedLabelColor: kGrey1,
                  unselectedLabelStyle: kNonActiveTabStyle,
                  indicatorSize: TabBarIndicatorSize.label,
                  isScrollable: true,
                  indicatorColor: Colors.white,
                  labelStyle: kActiveTabStyle.copyWith(fontSize: 25.0),
                  tabs: [
                    Tab(text: "Recent"),
                    Tab(text: "Popular"),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            RecentTabView(),
            PopularTabView(),
          ],
        ),
      ),
    );
  }
}
