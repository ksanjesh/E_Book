import 'package:badges/badges.dart' as badge;
import 'package:e_book/json/home_json.dart';
import 'package:e_book/json/store_json.dart';
import 'package:e_book/pages/book_details_page.dart';
import 'package:e_book/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:line_icons/line_icons.dart';

class StorePage extends StatefulWidget {
  const StorePage({Key? key}) : super(key: key);

  @override
  State<StorePage> createState() => _StorePageState();
}

class _StorePageState extends State<StorePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body:getBody(),

    );
  }

  Widget getBody() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            children: [
              SizedBox(
                height: 15,
              ),
              getSearchAndCart(),
              SizedBox(height: 30,),
              getRecommendation(),
              SizedBox(height: 30,),
              getGenres(),
              SizedBox(height: 30,),
              getTrendingBooks(),


            ],
          ),
        ),
      ),
    );
  }

 Widget getSearchAndCart() {
    var size = MediaQuery
        .of(context)
        .size;
    return Row(
      children: [
        Container(
          width: size.width * 0.8,
          height: 40,
          decoration: BoxDecoration(
            color: grey.withOpacity(0.25),
            borderRadius: BorderRadius.circular(12),
          ),
          child: Padding(
            padding: const EdgeInsets.only(left: 10.0, right: 10),
            child: TextField(
              decoration: InputDecoration(
                  border: InputBorder.none, hintText: "Search"),
            ),
          ),
        ),
        Flexible(
          child: IconButton(
              onPressed: () {},
              icon: badge.Badge(
                //badgeStyle: BadgeStyle(badgeColor: primary),
                badgeContent: Text(
                  "3",
                  style: TextStyle(color: white),
                ),
                child: Icon(
                  LineIcons.shoppingBag,
                  size: 25,
                ),
              )),
        )
      ],
    );
 }

  Widget getRecommendation()  {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Recommendation",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Row(
              children: [
                Text(
                  "See all",
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  width: 3,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(recommendationsList.length, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          BookDetailPage(
                              img: recommendationsList[index]["img"],
                              title:recommendationsList[index]["title"],
                              subTitle:recommendationsList[index]["sub_title"],
                              price: recommendationsList[index]["price"],
                              page: recommendationsList[index]["page"],
                              authorName:recommendationsList[index]['author_name'],
                              rate: recommendationsList[index]["rate"].toString())));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 160,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        recommendationsList[index]['img']),
                                    fit: BoxFit.cover)),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: white, shape: BoxShape.circle),
                              child: Icon(
                                recommendationsList[index]["favourite"]
                                    ? LineIcons.heartAlt
                                    : LineIcons.heart,
                                size: 20,
                                color: danger,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 100,
                            child: Container(
                              height: 25,
                              width: 65,
                              decoration: BoxDecoration(
                                  color: primary,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(12),
                                      bottomRight: Radius.circular(12))),
                              child: Center(
                                  child: Text(
                                    "\$ " + recommendationsList[index]["price"],
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: white,
                                        fontWeight: FontWeight.w600),
                                  )),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          width: 120,
                          child: Text(
                            recommendationsList[index]["sub_title"],
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          width: 120,
                          child: Text(
                            recommendationsList[index]["title"],
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 13, color: black.withOpacity(0.5)),
                          )),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        width: 120,
                        child: Row(
                          children: [
                            RatingBar.builder(
                                ignoreGestures: true,
                                initialRating: recommendationsList[index]["rate"],
                                minRating: 1,
                                direction: Axis.horizontal,
                                itemSize: 14,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding: EdgeInsets.only(right: 2),

                                itemBuilder: (context, _) =>
                                    Icon(
                                      Icons.star,
                                      color: danger,
                                    ),
                                onRatingUpdate: (rating) {}),
                            Text("(${recommendationsList[index]["rate"]
                                .toString()})", style: TextStyle(
                                fontSize: 13,
                                color: danger,
                                fontWeight: FontWeight.w500
                            ),)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        )
      ],
    );
  }

 Widget getGenres() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Genres",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Row(
              children: [
                Text(
                  "See all",
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  width: 3,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                )
              ],
            )
          ],
        ),
        SizedBox(height: 15,),
        Wrap(
          runSpacing: 10,
          children: List.generate(storeTags.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10.0),
              child: Container(
                decoration: BoxDecoration(
                    color: storeTags[index]["color"],
                    borderRadius: BorderRadius.circular(12)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                      vertical: 6.0, horizontal: 10),
                  child: Text(storeTags[index]["label"], style: TextStyle(
                      fontSize: 12,
                      color: white
                  ),),
                ),
              ),
            );
          }),
        ),
      ],
    );
 }

  getTrendingBooks() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Tranding books",
              style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
            ),
            Row(
              children: [
                Text(
                  "See all",
                  style: TextStyle(fontSize: 14),
                ),
                SizedBox(
                  width: 3,
                ),
                Icon(
                  Icons.arrow_forward_ios,
                  size: 14,
                )
              ],
            )
          ],
        ),
        SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Row(
            children: List.generate(trendingBooks.length, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          BookDetailPage(
                              img: trendingBooks[index]["img"],
                              title:trendingBooks[index]["title"],
                              subTitle:trendingBooks[index]["sub_title"],
                              price: trendingBooks[index]["price"],
                              page: trendingBooks[index]["page"],
                              authorName:trendingBooks[index]['author_name'],
                              rate: trendingBooks[index]["rate"].toString())));
                },
                child: Padding(
                  padding: const EdgeInsets.only(right: 15.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Stack(
                        children: [
                          Container(
                            height: 160,
                            width: 120,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(12),
                                image: DecorationImage(
                                    image: NetworkImage(
                                        trendingBooks[index]['img']),
                                    fit: BoxFit.cover)),
                          ),
                          Positioned(
                            top: 10,
                            right: 10,
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: white, shape: BoxShape.circle),
                              child: Icon(
                                trendingBooks[index]["favourite"]
                                    ? LineIcons.heartAlt
                                    : LineIcons.heart,
                                size: 20,
                                color: danger,
                              ),
                            ),
                          ),
                          Positioned(
                            top: 100,
                            child: Container(
                              height: 25,
                              width: 65,
                              decoration: BoxDecoration(
                                  color: primary,
                                  borderRadius: BorderRadius.only(
                                      topRight: Radius.circular(12),
                                      bottomRight: Radius.circular(12))),
                              child: Center(
                                  child: Text(
                                    "\$ " + trendingBooks[index]["price"],
                                    style: TextStyle(
                                        fontSize: 14,
                                        color: white,
                                        fontWeight: FontWeight.w600),
                                  )),
                            ),
                          )
                        ],
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Container(
                          width: 120,
                          child: Text(
                            trendingBooks[index]["sub_title"],
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          )),
                      SizedBox(
                        height: 5,
                      ),
                      Container(
                          width: 120,
                          child: Text(
                            trendingBooks[index]["title"],
                            maxLines: 1,
                            style: TextStyle(
                                fontSize: 13, color: black.withOpacity(0.5)),
                          )),
                      SizedBox(
                        height: 6,
                      ),
                      Container(
                        width: 120,
                        child: Row(
                          children: [
                            RatingBar.builder(
                                ignoreGestures: true,
                                initialRating: trendingBooks[index]["rate"],
                                minRating: 1,
                                direction: Axis.horizontal,
                                itemSize: 14,
                                allowHalfRating: true,
                                itemCount: 5,
                                itemPadding: EdgeInsets.only(right: 2),

                                itemBuilder: (context, _) =>
                                    Icon(
                                      Icons.star,
                                      color: danger,
                                    ),
                                onRatingUpdate: (rating) {}),
                            Text("(${trendingBooks[index]["rate"]
                                .toString()})", style: TextStyle(
                                fontSize: 13,
                                color: danger,
                                fontWeight: FontWeight.w500
                            ),)
                          ],
                        ),
                      )
                    ],
                  ),
                ),
              );
            }),
          ),
        )
      ],
    );
  }
 }

