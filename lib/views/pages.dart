import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:flutter_html/html_parser.dart';
import 'package:flutter_html/style.dart';
import 'package:material_design_icons_flutter/material_design_icons_flutter.dart';
import 'package:news_app/constants.dart';
import 'package:news_app/cubit/cubit.dart';
import 'package:news_app/models/models.dart';
import 'package:news_app/widgets/widgets.dart';
import 'package:share/share.dart';
import 'package:url_launcher/url_launcher.dart';
import './categories_list.dart' as categoriesList;
import 'package:http/http.dart' as http;
import 'package:flutter_remote_icon/flutter_remote_icon.dart';
import 'package:supercharged/supercharged.dart';

part 'account_view.dart';
part 'home_view.dart';
part 'category_view.dart';
part 'search_view.dart';
part 'read_posts_view.dart';
part 'recent_tab_view.dart';
part 'popular_tab_view.dart';
part 'trending_tab_view.dart';
part 'category_posts_view.dart';
part 'package:news_app/bottomNav.dart';
