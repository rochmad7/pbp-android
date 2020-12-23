import 'package:flutter/material.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/views/popular_tab_view.dart';
import 'package:news_app/views/recent_tab_view.dart';
import 'package:news_app/views/trending_tab_view.dart';

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
                    Tab(text: "Popular"),
                    Tab(text: "Recent"),
                  ],
                ),
              ),
            ],
          ),
        ),
        body: TabBarView(
          children: [
            PopularTabView(),
            RecentTabView(),
          ],
        ),
      ),
    );
  }
}
