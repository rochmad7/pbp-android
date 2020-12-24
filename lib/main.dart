import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:get/get.dart';
import 'package:news_app/views/pages.dart';
import 'package:news_app/cubit/cubit.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
        providers: [
          BlocProvider(create: (_) => KomentarCubit()),
          BlocProvider(
              create: (_) =>
                  PostCubit()..getPosts(idKategori: null, keyword: null)),
          BlocProvider(
              create: (_) =>
                  KategoriCubit()..getKategori()),
        ],
        child: GetMaterialApp(
          title: 'PBP Android',
          debugShowCheckedModeBanner: false,
          theme: ThemeData(
            visualDensity: VisualDensity.adaptivePlatformDensity,
          ),
          home: BottomNav(),
        ));
  }
}
