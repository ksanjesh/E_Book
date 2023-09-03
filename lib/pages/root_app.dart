import 'package:e_book/json/root_app_json.dart';
import 'package:e_book/pages/favourit_page.dart';
import 'package:e_book/pages/home_page.dart';
import 'package:e_book/pages/my_book_page.dart';
import 'package:e_book/pages/store_page.dart';
import 'package:e_book/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:salomon_bottom_bar/salomon_bottom_bar.dart';

class RootApp extends StatefulWidget {
  const RootApp({Key? key}) : super(key: key);

  @override
  State<RootApp> createState() => _RootAppState();
}

class _RootAppState extends State<RootApp> {
  int pageIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      bottomNavigationBar: getFooter(),
      body: getBody(),
    );
  }
  Widget getBody(){
    return IndexedStack(
      index: pageIndex,
      children: [
        HomePage(),
        MyBookPage(),
        StorePage(),
        FavouritePage(),

      ],
    );

  }

 Widget getFooter() {
    return SalomonBottomBar(
      currentIndex: pageIndex,
      onTap: (index){
        setState(() {
          pageIndex = index;
        });

      },
      //selectedItemColor: primary,
        items: List.generate(4, (index){
          return SalomonBottomBarItem(icon: Icon(rootAppJson[index]["icon"]), title: Text(rootAppJson[index]["text"]));
        })
    );
 }
}
