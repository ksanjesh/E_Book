import 'package:blurrycontainer/blurrycontainer.dart';
import 'package:e_book/json/home_json.dart';
import 'package:e_book/pages/play_now_page.dart';
import 'package:e_book/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:line_icons/line_icons.dart';

class BookDetailPage extends StatefulWidget {
  final String img;
  final String title;
  final String subTitle;
  final String price;
  final String page;
  final String authorName;
  final String rate;

  const BookDetailPage(
      {Key? key, required this.img, required this.title, required this.subTitle, required this.price, required this.page, required this.authorName, required this.rate})
      : super(key: key);

  @override
  State<BookDetailPage> createState() => _BookDetailPageState();
}

class _BookDetailPageState extends State<BookDetailPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(preferredSize: Size.fromHeight(130),
        child: getAppBar(),),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      elevation: 0,
      automaticallyImplyLeading: false,
      backgroundColor: white,
      flexibleSpace: Stack(
        children: [
          Container(
            width: double.infinity,
            height: 190,
            decoration: BoxDecoration(
                image: DecorationImage(
                    image: NetworkImage(widget.img), fit: BoxFit.cover)
            ),
          ),
          Container(
            width: double.infinity,
            height: 190,
            child: Stack(
              children: [
                BlurryContainer(

                  child: Padding(
                    padding: EdgeInsets.only(top: 30),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            IconButton(onPressed: () {
                              Navigator.pop(context);
                            },
                                icon: Icon(Icons.arrow_back_ios, size: 22,
                                  color: white,)),
                            Row(
                              children: [
                                IconButton(onPressed: () {},
                                    icon: Icon(Icons.bookmark, color: white,)),
                                IconButton(
                                    onPressed: () {
                                      Navigator.push(context, MaterialPageRoute(
                                          builder: (context) =>
                                              PlayNowPage(
                                                  img: widget.img,
                                                  title: widget.title,
                                                  subTitle: widget.subTitle)));
                                    },
                                    icon: Icon(
                                      Icons.headphones, color: white,)),
                                IconButton(onPressed: () {
                                  getBottomSheetSetting();
                                },
                                    icon: Icon(Icons.settings, color: white,)),
                              ],
                            )
                          ],
                        ),
                        SizedBox(
                          height: 20,),
                        Padding(
                          padding: const EdgeInsets.only(left: 15, right: 15),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.title, style: TextStyle(
                                  fontSize: 18,
                                  fontWeight: FontWeight.w600,
                                  color: white
                              ),),
                              SizedBox(height: 8,),
                              Text(widget.subTitle, style: TextStyle(
                                  fontSize: 16,
                                  color: white
                              ),),
                            ],
                          ),
                        ),

                      ],

                    ),
                  ),
                )

              ],
            ),
          )
        ],
      ),
    );
  }

  Widget getBody() {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(15.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: 10,),
            getFirstSection(),
            SizedBox(
              height: 30,
            ),
            getSecondSection(),
            SizedBox(
              height: 30,
            ),
            getThirdSection(),
            SizedBox(
              height: 30,

            ),
            getFourthSection(),
          ],
        ),
      ),
    );
  }

  Widget getFirstSection() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Column(
          children: [
            Text("\$" + widget.price, style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17
            ),),
            Text("price", style: TextStyle(
                fontSize: 14,
                color: black.withOpacity(0.5)
            ),)
          ],
        ),
        Column(
          children: [
            Text(widget.page, style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17
            ),),
            Text("pages", style: TextStyle(
                fontSize: 14,
                color: black.withOpacity(0.5)
            ),)
          ],
        ),
        Column(
          children: [
            Text(widget.rate, style: TextStyle(
                fontWeight: FontWeight.w600,
                fontSize: 17
            ),),
            Text("Rating", style: TextStyle(
                fontSize: 14,
                color: black.withOpacity(0.5)
            ),)
          ],
        )
      ],
    );
  }

  Widget getSecondSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text("Abouut", style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold
        ),),
        SizedBox(
          height: 15,
        ),
        RichText(
            text: TextSpan(
                text: "  It has survived not only five centuries,"
                    " but also the leap into electronic typesetting, "
                    "remaining essentially unchanged. It was popularised in the 1960s with the release "
                    "of Letraset sheets containing Lorem Ipsum passages, and more recently with desktop publishing software like Aldus PageMaker"
                    " including versions of Lorem Ipsum.",
                style: TextStyle(
                    color: Colors.black,
                    fontWeight: FontWeight.w500,
                    fontSize: 15,
                    height: 1.5

                ),
                children: [
                  TextSpan(
                      text: "more", style: TextStyle(
                      fontSize: 15,
                      fontWeight: FontWeight.w500,
                      height: 1.5,
                      color: primary
                  )
                  ),

                ]
            )),
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
        SizedBox(height: 15,),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Row(
              children: [
                CircleAvatar(
                  backgroundImage: NetworkImage(profileUrl),
                ),
                SizedBox(width: 10,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(widget.authorName, style: TextStyle(
                        fontSize: 15,
                        fontWeight: FontWeight.w600
                    ),),
                    Text("1890-1900", style: TextStyle(
                        fontSize: 13,
                        color: black.withOpacity(0.5)
                    ),)
                  ],

                ),

              ],
            ),
            Row(
              children: [
                Text("32 Books", style: TextStyle(
                    fontSize: 13,
                    color: black.withOpacity(0.6)
                ),),
                SizedBox(width: 3),
                Icon(Icons.arrow_forward_ios, size: 14,)
              ],
            )
          ],
        )
      ],
    );
  }

  Widget getThirdSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Center(
          child: Text("Reviews", style: TextStyle(
              fontSize: 20,
              fontWeight: FontWeight.bold
          ),),
        ),
        SizedBox(height: 15,),
        Column(
          children: List.generate(reviewsPeople.length, (index) {
            return Padding(
              padding: const EdgeInsets.only(bottom: 20),
              child: Column(
                children: [
                  Row(
                    children: [
                      CircleAvatar(
                        backgroundImage: NetworkImage(
                            reviewsPeople[index]["img"]),
                      ),
                      SizedBox(width: 10,),
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(reviewsPeople[index]["name"], style: TextStyle(
                              fontSize: 15,
                              fontWeight: FontWeight.w600
                          ),),
                          SizedBox(height: 3,),
                          RatingBar.builder(
                              ignoreGestures: true,
                              initialRating: reviewsPeople[index]['rate'],
                              minRating: 1,
                              direction: Axis.horizontal,
                              allowHalfRating: true,
                              itemCount: 5,
                              itemSize: 14,
                              itemPadding: EdgeInsets.only(right: 2),
                              itemBuilder: (context, _) =>
                                  Icon(Icons.star, color: danger,),
                              onRatingUpdate: (Rating) {

                              })
                        ],
                      )
                    ],
                  ),
                  RichText(
                      text: TextSpan(
                          text: reviewsPeople[index]["text"],
                          style: TextStyle(
                              color: Colors.black.withOpacity(0.5),
                              fontWeight: FontWeight.w500,
                              fontSize: 14,
                              height: 1.5

                          ),
                          children: [
                            TextSpan(
                                text: "more", style: TextStyle(
                                fontSize: 15,
                                fontWeight: FontWeight.w500,
                                height: 1.5,
                                color: primary
                            )
                            ),

                          ]
                      )),

                ],
              ),
            );
          }),
        )
      ],
    );
  }

  Widget getFourthSection() {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "Similar books",
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
            children: List.generate(similarBooksJson.length, (index) {
              return GestureDetector(
                onTap: () {
                  Navigator.pushReplacement(context, MaterialPageRoute(
                      builder: (context) =>
                          BookDetailPage(
                              img: similarBooksJson[index]["img"],
                              title: similarBooksJson[index]["title"],
                              subTitle: similarBooksJson[index]["sub_title"],
                              price: similarBooksJson[index]["price"],
                              page: similarBooksJson[index]["page"],
                              authorName: similarBooksJson[index]['author_name'],
                              rate: similarBooksJson[index]["rate"]
                                  .toString())));
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
                                        similarBooksJson[index]['img']),
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
                                specialForYouJson[index]["favourite"]
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
                                    "\$ " + similarBooksJson[index]["price"],
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
                            similarBooksJson[index]["sub_title"],
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
                            similarBooksJson[index]["title"],
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
                            Text("(${similarBooksJson[index]["rate"]
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

  getBottomSheetSetting() {
    List themes = [
      Color(0xFFFFFFFF),
      Color(0xFFA8C1D2),
      Color(0xff000000),


    ];
    showModalBottomSheet(context: context, builder: (_) =>
        SingleChildScrollView(
          child: Container(
            width: double.infinity,
            height: 250,
            decoration: BoxDecoration(
                color: primary.withOpacity(0.15)
            ),
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 25, vertical: 15),
              child: Column(
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: List.generate(3, (index) {
                          if (index == 0) {
                            return Padding(
                              padding: const EdgeInsets.only(right: 8.0),
                              child: Container(
                                width: 40,
                                height: 40,
                                decoration: BoxDecoration(
                                    color: themes[index],
                                    shape: BoxShape.circle,
                                    border: Border.all(
                                        color: black.withOpacity(0.7),
                                        width: 0.5
                                    )
                                ),
                              ),
                            );
                          }
                          return Padding(
                            padding: const EdgeInsets.only(right: 8.0),
                            child: Container(
                              width: 30,
                              height: 30,
                              decoration: BoxDecoration(
                                  color: themes[index],
                                  shape: BoxShape.circle
                              ),
                            ),
                          );
                        }),
                      ),
                      Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                color: primary,
                                shape: BoxShape.circle
                            ),
                            child: Center(
                              child: Text("TT", style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17
                              ),),
                            ),
                          ),
                          SizedBox(
                            width: 12,
                          ),
                          Container(
                            width: 30,
                            height: 30,
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: primary
                                ),
                                shape: BoxShape.circle
                            ),
                            child: Center(
                              child: Text("Tt", style: TextStyle(
                                  fontWeight: FontWeight.w600,
                                  fontSize: 17
                              ),),
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                  SizedBox(height: 30,),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Container(
                          width: double
                              .infinity,
                          height: 4,
                          decoration: BoxDecoration(
                              color: black.withOpacity(0.1)
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Container(
                          width: 150,
                          height: 4,
                          decoration: BoxDecoration(
                              color: primary
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 145),
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: primary
                          ),

                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Aa", style: TextStyle(
                          fontSize: 13,
                          color: black.withOpacity(0.8)
                      ),),
                      Text("Aa", style: TextStyle(
                          fontSize: 20,
                          color: black.withOpacity(0.8)
                      ),)

                    ],
                  ),
                  SizedBox(height: 30,),
                  Stack(
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Container(
                          width: double
                              .infinity,
                          height: 4,
                          decoration: BoxDecoration(
                              color: black.withOpacity(0.1)
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(top: 4.0),
                        child: Container(
                          width: 150,
                          height: 4,
                          decoration: BoxDecoration(
                              color: primary
                          ),
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.only(left: 145),
                        child: Container(
                          width: 12,
                          height: 12,
                          decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: primary
                          ),

                        ),
                      )
                    ],
                  ),
                  SizedBox(height: 5,),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Icon(Icons.light_mode, color: black.withOpacity(0.6),
                        size: 18,),
                      Icon(Icons.light_mode, color: black.withOpacity(0.6),
                        size: 28,)

                    ],
                  )
                ],
              ),
            ),
          ),
        )
    );
  }
}
