import 'package:flutter/material.dart';
import 'package:lofo_app/model/record.dart';
import 'package:lofo_app/widgets/home/home_page_item.dart';
import 'package:lofo_app/widgets/item_info/item_info_helper.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:lofo_app/widgets/item_info/author_info.dart';

class LoFoItemInfo extends StatefulWidget {
  final Record data;
  const LoFoItemInfo({Key? key, required this.data}) : super(key: key);
  @override
  _LoFoItemInfoState createState() => _LoFoItemInfoState();
}

class _LoFoItemInfoState extends State<LoFoItemInfo> {
  @override
  Widget build(BuildContext context) {
    launchURL(String url) async {
      if (!await launch(url)) throw 'Could not launch $url';
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Description'),
        centerTitle: true,
        elevation: 0,
        //backgroundColor: Colors.blueAccent.withOpacity(0.1),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        actions: [
          GestureDetector(
            onTap: (){
              showModalBottomSheet<void>(
                context: context,
                builder: (BuildContext context) {
                  return Material(
                    color: Colors.transparent,
                    child: Container(
                      height: 150,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(20)),
                        color: Colors.white,
                      ),
                      child: Column(
                        children: [
                          SizedBox(height: 25,),
                          Text('Share this post on social media', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 17),),
                          SizedBox(height: 25,),
                          Center(
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                GestureDetector(
                                  onTap: () {
                                    launchURL(
                                        'https://www.instagram.com/flutter.developers/');
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/image/87390.png', height: 40,width:40,),
                                      SizedBox(height: 10,),
                                      const Text('Stories', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),)
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    launchURL(
                                        'https://api.whatsapp.com/send/?phone=77089373529&text&app_absent=0');
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/image/WhatsApp_logo-color-vertical.svg.png', height: 40,width:40,),
                                      SizedBox(height: 10,),
                                      const Text('Whatsapp', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),)
                                    ],
                                  ),
                                ),
                                GestureDetector(
                                  onTap: (){
                                    launchURL(
                                        'https://api.whatsapp.com/send/?phone=77089373529&text&app_absent=0');
                                  },
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Image.asset('assets/image/Telegram_2019_Logo.svg.png', height: 40,width:40,),
                                      SizedBox(height: 10,),
                                      const Text('Telegram', style: TextStyle(color: Colors.black, fontWeight: FontWeight.w700),)
                                    ],
                                  ),
                                )
                              ],
                            )
                          ),
                        ],
                      ),
                    ),
                  );
                },
              );
            },
            child: const Padding(
              padding: EdgeInsets.only(right: 10),
              child: Icon(Icons.share),
            ),
          )
        ],
      ),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Container(
          padding: EdgeInsets.fromLTRB(20, 30, 20, 15),
          child: Column(
            children: [
              Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                Container(
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(20)),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.7),
                        spreadRadius: 5,
                        blurRadius: 9,
                        offset: Offset(0, 4), // Shadow position
                      ),
                    ],
                    image: DecorationImage(
                      image: NetworkImage(widget.data.image),
                      fit: BoxFit.cover,
                    ),
                  ),
                  height: 315,
                  width: MediaQuery.of(context).size.width,
                ),
              ]),
              const SizedBox(
                height: 50,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    widget.data.title,
                    style: GoogleFonts.roboto(
                      fontSize: 35,
                      fontWeight: FontWeight.bold,
                      color: Colors.black,
                    ),
                    textAlign: TextAlign.start,
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Row(
                    children: [
                      const Icon(
                        Icons.location_on,
                        color: Colors.lightBlue,
                        size: 34,
                      ),
                      Text(
                        widget.data.place,
                        style: GoogleFonts.roboto(
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                            color: Colors.lightBlue),
                      )
                    ],
                  ),
                  const SizedBox(
                    height: 15,
                  ),
                  Container(
                    padding: EdgeInsets.all(10),
                    child: Text(
                      widget.data.description,
                      style: GoogleFonts.roboto(
                          fontSize: 20,
                          fontWeight: FontWeight.w500,
                          color: Colors.black38),
                      textAlign: TextAlign.start,
                    ),
                  ),
                  const SizedBox(
                    height: 20,
                  ),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        GestureDetector(
                          onTap: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                builder: (context) =>
                                    ItemAuthorInfo(data: widget.data),
                              ),
                            );
                          },
                          child: Container(
                            child: Row(
                              children: [
                                Container(
                                  width: 60,
                                  height: 60,
                                  margin: EdgeInsets.only(right: 10),
                                  decoration: BoxDecoration(
                                    borderRadius: const BorderRadius.all(
                                        Radius.circular(40)),
                                    image: DecorationImage(
                                      image:
                                      NetworkImage(widget.data.customerImg),
                                      fit: BoxFit.cover,
                                    ),
                                  ),
                                ),
                                Column(
                                  mainAxisAlignment:
                                  MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(widget.data.customerName,
                                        style: GoogleFonts.roboto(
                                            fontSize: 19,
                                            fontWeight: FontWeight.w600,
                                            color: Colors.black)),
                                    Text(widget.data.customerRole,
                                        style: GoogleFonts.roboto(
                                            fontSize: 15,
                                            fontWeight: FontWeight.normal,
                                            color:
                                            Colors.grey.withOpacity(0.8)))
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                        Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Container(
                              padding: EdgeInsets.fromLTRB(20, 4, 20, 4),
                              margin: EdgeInsets.only(bottom: 10),
                              decoration: BoxDecoration(
                                borderRadius:
                                const BorderRadius.all(Radius.circular(17)),
                                color: Colors.lightBlue,
                              ),
                              child: Text(
                                widget.data.status,
                                style: GoogleFonts.roboto(
                                  fontSize: 19,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                                textAlign: TextAlign.center,
                              ),
                            ),
                            Text(widget.data.time,
                                style: GoogleFonts.roboto(
                                    fontSize: 14,
                                    fontWeight: FontWeight.normal,
                                    color: Colors.grey.withOpacity(0.8)))
                          ],
                        )
                      ])
                ],
              )
            ],
          ),
        ),

        // child: Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 25),
        //   child: Column(
        //     crossAxisAlignment: CrossAxisAlignment.start,
        //     children: [
        //       const SizedBox(height: 20,),
        //       Center(
        //         child: ClipRRect(
        //           borderRadius: BorderRadius.circular(8.0),
        //           child: Image(image: NetworkImage(widget.data.image), width: 300,),
        //         ),
        //       ),
        //       const SizedBox(height: 20,),
        //       const Center(child: Text('Description', style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),)),
        //       const SizedBox(height: 10,),
        //       ItemInfoHelper(title: 'Name', info: widget.data.title),
        //       ItemInfoHelper(title: 'Status', info: widget.data.status),
        //       ItemInfoHelper(title: 'Date', info: widget.data.time),
        //       ItemInfoHelper(title: 'Place', info: widget.data.place),
        //       ItemInfoHelper(title: 'Comment', info: widget.data.description),

        //     ],
        //   ),
        // ),
      ),
    );
  }
}