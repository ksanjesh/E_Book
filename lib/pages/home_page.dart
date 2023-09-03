import 'package:badges/badges.dart' as badge;
import 'package:e_book/json/home_json.dart';
import 'package:e_book/pages/book_details_page.dart';
import 'package:e_book/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:line_icons/line_icons.dart';
import '../json/favourite_json.dart';


class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    var size = MediaQuery
        .of(context)
        .size;
    return SafeArea(
      child: SingleChildScrollView(
        padding: EdgeInsets.all(15),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "Hello, Sanjesh",
                  style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
                ),
                CircleAvatar(
                  backgroundImage: NetworkImage(profileUrl),
                )
              ],
            ),
            SizedBox(
              height: 30,
            ),
            Row(
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
            ),
            SizedBox(
              height: 15,
            ),
            getSectionQuote(),
            SizedBox(
              height: 30,
            ),
            getReadyTodaySection(),
            SizedBox(
              height: 30,
            ),
            getSpecialForYou(),
          ],
        ),
      ),
    );
  }

  Widget getSectionQuote() {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(
          color: primary.withOpacity(0.3),
          borderRadius: BorderRadius.circular(12)),
      child: Padding(
        padding: EdgeInsets.all(20),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              "Quote of the day",
              style: TextStyle(fontSize: 17, fontWeight: FontWeight.bold),
            ),
            SizedBox(
              height: 10,
            ),
            Text(
              "I'd rather have roses on the table than diamonds on the neck.",
              style: TextStyle(
                  fontSize: 15, height: 1.5, fontWeight: FontWeight.w500),
            ),
            SizedBox(
              height: 10,
            ),
            Align(
              alignment: Alignment.centerRight,
              child: Text(
                "Emma Goldman",
                style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
              ),
            )
          ],
        ),
      ),
    );
  }

  Widget getReadyTodaySection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Ready Today",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 20),
        ),
        SizedBox(
          height: 15,
        ),
        Container(
          width: double.infinity,
          height: 150,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12),
              image: DecorationImage(
                  image: NetworkImage(readyToday), fit: BoxFit.cover)),
        ),
        SizedBox(
          height: 15,
        ),
        Text(
          "Top 10 books for self development",
          style: TextStyle(fontWeight: FontWeight.w600, fontSize: 15),
        ),
        SizedBox(
          height: 15,
        ),
        Wrap(
          children: List.generate(tags.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(right: 10.0, bottom: 10),
              child: Container(
                decoration: BoxDecoration(
                    color: tags[index]["color"],
                    borderRadius: BorderRadius.circular(12)),
                child: Padding(
                  padding:
                  const EdgeInsets.symmetric(vertical: 6.0, horizontal: 12),
                  child: Text(
                    tags[index]["label"],
                    style: TextStyle(fontSize: 12, color: white),
                  ),
                ),
              ),
            );
          }),
        )
      ],
    );
  }

  Widget getSpecialForYou() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Speciel for you",
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
            children: List.generate(specialForYouJson.length, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.push(context, MaterialPageRoute(
                      builder: (context) =>
                          BookDetailPage(
                              img: specialForYouJson[index]["img"],
                              title: specialForYouJson[index]["title"],
                              subTitle: specialForYouJson[index]["sub_title"],
                              price: specialForYouJson[index]["price"],
                              page: specialForYouJson[index]["page"],
                              authorName: specialForYouJson[index]['author_name'],
                              rate: specialForYouJson[index]["rate"].toString())));
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
                                        specialForYouJson[index]['img']),
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
                              child: InkWell(
                                onTap: (){
                                  setState(() {
                                    specialForYouJson[index]["favourite"] = !specialForYouJson[index]["favourite"];
                                    if(specialForYouJson[index]["favourite"] == true){
                                      favouriteBooks.add(specialForYouJson[index]);

                                    } else if (specialForYouJson[index]["favourite"]== false){
                                      favouriteBooks.remove(specialForYouJson[index]);
                                    }
                                  });
                                },
                                child: Icon(
                                  specialForYouJson[index]["favourite"]
                                      ? LineIcons.heartAlt
                                      : LineIcons.heart,
                                  size: 20,
                                  color: danger,
                                ),
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
                                    "\$ " + specialForYouJson[index]["price"],
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
                            specialForYouJson[index]["sub_title"],
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
                            specialForYouJson[index]["title"],
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
                                initialRating: specialForYouJson[index]["rate"],
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
                            Text("(${specialForYouJson[index]["rate"]
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
