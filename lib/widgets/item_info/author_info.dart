import 'package:flutter/material.dart';
import 'package:lofo_app/model/author_posts.dart';
import 'package:lofo_app/model/record.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:lofo_app/widgets/item_info/author_item_helper.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:lofo_app/widgets/item_info/item_info.dart';

class ItemAuthorInfo extends StatefulWidget {
  final Record data;
  const ItemAuthorInfo({Key? key, required this.data}) : super(key: key);

  @override
  _ItemAuthorInfoState createState() => _ItemAuthorInfoState();
}

class _ItemAuthorInfoState extends State<ItemAuthorInfo> {
  List<Record> author_posts = [];
  @override
  Widget build(BuildContext context) {
    launchURL(String url) async {
      if (!await launch(url)) throw 'Could not launch $url';
    }

    author_posts = getAuthorPosts(widget.data.customerName).toList();
    var post_index;
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.data.customerName,
            style: GoogleFonts.roboto(
                fontSize: 19,
                fontWeight: FontWeight.bold,
                color: Colors.black)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blueAccent.withOpacity(0.1),
        //backgroundColor: Colors.grey.withOpacity(0.7),
        foregroundColor: Colors.white,
      ),
      body: Container(
          //decoration: new BoxDecoration(color: Colors.blue.withOpacity(0.1)),
          child: Column(
        // physics: BouncingScrollPhysics(),
        children: [
          Container(
            child: Column(
              children: [
                Stack(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      height: 275,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(widget.data.customerImg),
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      height: 275,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topCenter,
                          end: Alignment.bottomCenter,
                          colors: <Color>[
                            Colors.black.withOpacity(0.2),
                            Colors.black.withOpacity(0.2),
                            Colors.black.withOpacity(0.2)
                          ],
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            "1901031235577@stu.sdu.edu.kz",
                            style: GoogleFonts.roboto(
                                color: Colors.white,
                                fontSize: 17,
                                fontWeight: FontWeight.w600),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                Container(
                  margin: EdgeInsets.only(bottom: 30),
                  decoration: new BoxDecoration(color: Colors.white),
                  width: MediaQuery.of(context).size.width,
                  padding: EdgeInsets.fromLTRB(20, 20, 20, 40),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(widget.data.customerName,
                              style: GoogleFonts.roboto(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.black)),
                          const SizedBox(
                            height: 4,
                          ),
                          Text(
                            widget.data.customerRole,
                            style: GoogleFonts.roboto(
                                color: Colors.grey,
                                fontSize: 15,
                                fontWeight: FontWeight.w500),
                          )
                        ],
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          GestureDetector(
                              onTap: () {
                                launchURL(
                                    'https://api.whatsapp.com/send/?phone=77089373529&text&app_absent=0');
                              },
                              child: Container(
                                margin: EdgeInsets.all(5),
                                decoration: BoxDecoration(
                                  borderRadius: const BorderRadius.all(
                                      Radius.circular(25)),
                                  image: DecorationImage(
                                    image:
                                        AssetImage('assets/image/whatsapp.png'),
                                    fit: BoxFit.cover,
                                  ),
                                ),
                                height: 30,
                                width: 30,
                              )),
                          GestureDetector(
                            onTap: () {
                              launchURL(
                                  'https://mail.google.com/mail/u/0/#inbox');
                            },
                            child: Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(25)),
                                image: DecorationImage(
                                  image: AssetImage('assets/image/mail.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              height: 30,
                              width: 30,
                            ),
                          ),
                          GestureDetector(
                            onTap: () {
                              launchURL(
                                  'https://www.instagram.com/flutter.developers/');
                            },
                            child: Container(
                              margin: EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                borderRadius:
                                    const BorderRadius.all(Radius.circular(25)),
                                image: DecorationImage(
                                  image:
                                      AssetImage('assets/image/instagram.png'),
                                  fit: BoxFit.cover,
                                ),
                              ),
                              height: 30,
                              width: 30,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                )
              ],
            ),
          ),
          Column(mainAxisAlignment: MainAxisAlignment.center, children: [
            Container(
              padding: EdgeInsets.all(10),
              width: MediaQuery.of(context).size.width,
              child: Text(
                "All Posts",
                style: GoogleFonts.roboto(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.black,
                ),
                textAlign: TextAlign.center,
              ),
            ),
          ]),
          (author_posts.isNotEmpty)
              ? Expanded(
                  child: ListView.builder(
                      physics: const BouncingScrollPhysics(),
                      itemCount: author_posts.length,
                      itemBuilder: (context, index) {
                        return GestureDetector(
                            onTap: () {
                              Navigator.push(
                                context,
                                MaterialPageRoute(
                                  builder: (context) =>
                                      LoFoItemInfo(data: author_posts[index]),
                                ),
                              );
                              // Navigator.of(context).pushNamed('/item_information');
                            },
                            child: AuthorItemHelper(
                              data: author_posts[index],
                            ));
                      }),
                )
              : const Center(
                  child: Text(
                  'There is no post',
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),
                ))
          // Container(
          //   padding: EdgeInsets.all(20),
          // child: Column(
          //   children: [
          //     Container(
          //       width: MediaQuery.of(context).size.width,
          //       margin: EdgeInsets.fromLTRB(5, 0, 0, 15),
          //       child: Text(
          //         "Posts",
          //         style: GoogleFonts.roboto(
          //             fontSize: 19,
          //             fontWeight: FontWeight.bold,
          //             color: Colors.black),
          //         textAlign: TextAlign.left,
          //       ),
          //     ),
          //     AuthorItemHelper(data: widget.data),
          //   child: Column(
          //     mainAxisAlignment: MainAxisAlignment.center,
          //     children: [
          //       (author_posts.isNotEmpty)
          //           ? Expanded(
          //               child: ListView.builder(
          //                   physics: const BouncingScrollPhysics(),
          //                   itemCount: author_posts.length,
          //                   itemBuilder: (context, index) {
          //                     return AuthorItemHelper(
          //                       data: author_posts[index],
          //                     );
          //                   }),
          //             )
          //           : const Center(
          //               child: Text(
          //               'There is no post',
          //               style: TextStyle(
          //                   fontSize: 20, fontWeight: FontWeight.w700),
          //             ))
          //     ],
          //   ),
          //   //     ],
          // ),
          //),
        ],
      )),
    );
  }
}
