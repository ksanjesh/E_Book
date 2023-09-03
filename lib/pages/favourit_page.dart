// import 'package:badges/badges.dart';
import 'package:badges/src/badge.dart' as badge;

import 'package:e_book/json/home_json.dart';

import 'package:e_book/pages/book_details_page.dart';
import 'package:e_book/theme/colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_rating_bar/flutter_rating_bar.dart';
import 'package:line_icons/line_icons.dart';
import '../json/favourite_json.dart';

class FavouritePage extends StatefulWidget {
  const FavouritePage({Key? key}) : super(key: key);


  @override
  State<FavouritePage> createState() => _FavouritePageState();
}

class _FavouritePageState extends State<FavouritePage> {

  @override
  void initState() {
    // TODO: implement initState

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      body: getBody(),
    );
  }

  Widget getBody() {
    return SafeArea(
      child: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(height: 10,),
              getSearchAndCart(),
              SizedBox(
                height: 30,
              ),
              getFavoriteList()
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
                // badgeStyle: badge.BadgeStyle(badgeColor: primary),
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

  Widget getFavoriteList() {
    var size = MediaQuery
        .of(context)
        .size;
    return Wrap(
        spacing: 15,
        runSpacing: 20,
        children: List.generate(favouriteBooks.length, (index) {
          return GestureDetector(
            onTap: () {
              Navigator.push(context, MaterialPageRoute(builder: (context) =>
                  BookDetailPage(
                      img: favouriteBooks[index]["img"],
                      title: favouriteBooks[index]["title"],
                      subTitle: favouriteBooks[index]["sub_title"],
                      price: favouriteBooks[index]["price"],
                      page: favouriteBooks[index]["page"],
                      authorName: favouriteBooks[index]["author_name"],
                      rate: favouriteBooks[index]["rate"].toString())));
            },
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      width: (size.width - 55) / 2,
                      height: (size.width - 40) / 2,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(12),
                          image: DecorationImage(
                              image: NetworkImage(
                                  favouriteBooks[index]["img"]),
                              fit: BoxFit.cover
                          )
                      ),
                    ),
                    Positioned(
                      top: 10,
                      right: 10,
                      child: InkWell(onTap: (){
                        setState(() {
                          for(int i = 0; i< specialForYouJson.length;i++){
                            if(specialForYouJson[i]==favouriteBooks[index]){
                              specialForYouJson[i]['favourite']= !specialForYouJson[i]['favourite'];
                          }
                          }
                          favouriteBooks.removeAt(index);

                        });
                        },
                        child: Container(
                          width: 40,
                          height: 40,
                          decoration: BoxDecoration(
                              color: white,
                              shape: BoxShape.circle
                          ),
                          child: Center(
                            child: Icon(LineIcons.heartAlt, color: danger,
                              size: 22,),
                          ),

                        ),
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Container(
                    width: (size.width - 55) / 2,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(favouriteBooks[index]["title"],
                          maxLines: 1,
                          style: TextStyle(

                            fontSize: 16,
                            fontWeight: FontWeight.w600,

                          ),),
                        Text(favouriteBooks[index]["sub_title"],
                          maxLines: 1,
                          style: TextStyle(

                            fontSize: 13,
                            color: black.withOpacity(0.5),

                          ),),
                        SizedBox(height: 10,),
                        Row(
                          children: [
                            RatingBar.builder(
                                ignoreGestures: true,
                                initialRating: favouriteBooks[index]["rate"],
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
                            SizedBox(width: 5,),
                            Text("(${favouriteBooks[index]["rate"]
                                .toString()})", style: TextStyle(
                                fontSize: 13,
                                color: danger,
                                fontWeight: FontWeight.w500
                            ),)
                          ],
                        )

                      ],
                    ))

              ],
            ),
          );
        })
    );
  }
}
