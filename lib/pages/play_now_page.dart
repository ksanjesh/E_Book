import 'package:e_book/theme/colors.dart';
import 'package:flutter/material.dart';

class PlayNowPage extends StatefulWidget {
  final String img;
  final String title;
  final String subTitle;

  const PlayNowPage(
      {Key? key,
      required this.img,
      required this.title,
      required this.subTitle})
      : super(key: key);

  @override
  State<PlayNowPage> createState() => _PlayNowPageState();
}

class _PlayNowPageState extends State<PlayNowPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: white,
      appBar: PreferredSize(
        child: getAppBar(),
        preferredSize: Size.fromHeight(60),
      ),
      body: getBody(),
    );
  }

  Widget getAppBar() {
    return AppBar(
      backgroundColor: white,
      elevation: 0,
      automaticallyImplyLeading: false,
      leading: IconButton(
        onPressed: () {
          Navigator.pop(context);
        },
        icon: Icon(
          Icons.arrow_back_ios,
          color: black,
          size: 22,
        ),
      ),
      actions: [
        IconButton(
            onPressed: () {},
            icon: Icon(
              Icons.more_horiz,
              color: black,
              size: 30,
            )),
      ],
      title: Center(
        child: Text(
          'Playing Now',
          style: TextStyle(fontSize: 18, color: Colors.black),
        ),
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
            Container(
              width: double.infinity,
              height: 500,
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                        blurRadius: 15,
                        spreadRadius: 5,
                        color: black.withOpacity(0.1),
                        offset: Offset(0, 10))
                  ],
                  image: DecorationImage(
                      image: NetworkImage(widget.img), fit: BoxFit.cover)),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              widget.title,
              style: TextStyle(fontSize: 25, fontWeight: FontWeight.bold),
            ),
            Text(
              widget.subTitle,
              style: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  color: black.withOpacity(0.6)),
            ),
            SizedBox(
              height: 30,
            ),
            Stack(
              children: [
                Container(
                  height: 4,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5),
                      color: black.withOpacity(0.1)),
                ),
                Container(
                  height: 4,
                  width: 150,
                  decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(5), color: primary),
                )
              ],
            ),
            SizedBox(
              height: 10,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  "0:34:15",
                  style: TextStyle(fontSize: 13, color: black.withOpacity(0.5)),
                ),
                Text(
                  "5:02:55",
                  style: TextStyle(fontSize: 13, color: black.withOpacity(0.5)),
                )
              ],
            ),
            Row(mainAxisAlignment: MainAxisAlignment.center,
              children: [
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.skip_previous),
                  color: primary,
                  iconSize: 25,
                ),
                IconButton(
                  iconSize: 40,
                    onPressed: (){}, icon: Container(
                  decoration: BoxDecoration(
                    color: primary,
                    shape: BoxShape.circle
                  ),
                  child: Center(
                    child: Icon(Icons.play_arrow,size: 25,color: white,),
                  ),
                )),
                IconButton(
                  onPressed: () {},
                  icon: Icon(Icons.skip_next),
                  color: primary,
                  iconSize: 25,
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
