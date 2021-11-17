import 'package:flutter/material.dart';
import 'package:lofo_app/model/record.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemAuthorInfo extends StatefulWidget {
  final Record data;
  const ItemAuthorInfo({Key? key, required this.data}) : super(key: key);

  @override
  _ItemAuthorInfoState createState() => _ItemAuthorInfoState();
}

class _ItemAuthorInfoState extends State<ItemAuthorInfo> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.data.customerName,
              style: GoogleFonts.roboto(
                  fontSize: 19,
                  fontWeight: FontWeight.bold,
                  color: Colors.black)),
          centerTitle: true,
          elevation: 0,
          //backgroundColor: Colors.blueAccent.withOpacity(0.1),
          backgroundColor: Colors.grey.withOpacity(0.7),
          foregroundColor: Colors.white,
        ),
        body: Container(
          decoration: new BoxDecoration(color: Colors.grey.withOpacity(0.7)),
          child: Column(
            children: [
              Container(
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 10),
                      height: 255,
                      width: MediaQuery.of(context).size.width,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: NetworkImage(widget.data.customerImg),
                          fit: BoxFit.cover,
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
                    ),
                    Container(
                      margin: EdgeInsets.only(bottom: 30),
                      decoration: new BoxDecoration(color: Colors.white),
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.fromLTRB(20, 10, 20, 25),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.data.customerName,
                                  style: GoogleFonts.roboto(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.black)),
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
                              Container(
                                  margin: EdgeInsets.only(right: 5),
                                  decoration: BoxDecoration(
                                      color: Colors.lightBlue,
                                      borderRadius: BorderRadius.all(
                                          Radius.circular(25))),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    children: [
                                      IconButton(
                                        icon: Icon(
                                          Icons.email,
                                          size: 20,
                                          color: Colors.white,
                                        ),
                                        onPressed: null,
                                      ),
                                    ],
                                  )
                                  // child: IconButton(
                                  //     icon: Icon(
                                  //       Icons.email,
                                  //     ),
                                  //     onPressed: () async {
                                  //       const url =
                                  //           'https://github.com/himanshusharma89';
                                  //       if (await canLaunch(url)) {
                                  //         await launch(url);
                                  //       } else {
                                  //         throw 'Could not launch $url';
                                  //       }
                                  //     }),
                                  ),
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                decoration: BoxDecoration(
                                    color: Colors.lightBlue,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.email,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                  onPressed: null,
                                ),
                              ),
                              Container(
                                margin: EdgeInsets.only(right: 5),
                                decoration: BoxDecoration(
                                    color: Colors.lightBlue,
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(25))),
                                child: IconButton(
                                  icon: Icon(
                                    Icons.email,
                                    size: 20,
                                    color: Colors.white,
                                  ),
                                  onPressed: null,
                                ),
                              )
                            ],
                          )
                        ],
                      ),
                    )
                  ],
                ),
              ),
              Container(
                padding: EdgeInsets.all(20),
                child: SingleChildScrollView(
                  physics: const BouncingScrollPhysics(),
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          Container(
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                              image: DecorationImage(
                                image: NetworkImage(widget.data.image),
                                fit: BoxFit.cover,
                              ),
                            ),
                            height: 208,
                            width: MediaQuery.of(context).size.width,
                          ),
                          Container(
                            decoration: BoxDecoration(
                              gradient: LinearGradient(
                                begin: Alignment.topCenter,
                                end: Alignment.bottomCenter,
                                colors: <Color>[
                                  Colors.black.withOpacity(0.1),
                                  Colors.black.withOpacity(0.5),
                                  Colors.black.withOpacity(0.9)
                                ],
                              ),
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(20)),
                            ),
                            height: 208,
                            width: MediaQuery.of(context).size.width,
                            padding: const EdgeInsets.all(15),
                            child: Container(
                              padding: EdgeInsets.fromLTRB(15, 15, 15, 10),
                              child: Column(
                                mainAxisAlignment: MainAxisAlignment.end,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    widget.data.title,
                                    style: GoogleFonts.roboto(
                                        fontSize: 19,
                                        fontWeight: FontWeight.bold,
                                        color: Colors.white),
                                  ),
                                  const SizedBox(
                                    height: 4,
                                  ),
                                  Row(
                                    children: [
                                      Icon(
                                        Icons.location_on,
                                        color: Colors.grey.withOpacity(0.6),
                                        size: 25,
                                      ),
                                      Text(widget.data.place,
                                          style: GoogleFonts.roboto(
                                              fontSize: 15,
                                              fontWeight: FontWeight.normal,
                                              color:
                                                  Colors.grey.withOpacity(0.8)))
                                    ],
                                  ),
                                  const SizedBox(
                                    height: 40,
                                  ),
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Container(
                                        padding: const EdgeInsets.fromLTRB(
                                            15, 4, 15, 4),
                                        decoration: const BoxDecoration(
                                          borderRadius: BorderRadius.all(
                                              Radius.circular(17)),
                                          color: Colors.lightBlue,
                                        ),
                                        child: Text(
                                          widget.data.status,
                                          style: GoogleFonts.roboto(
                                            fontSize: 13,
                                            fontWeight: FontWeight.bold,
                                            color: Colors.white,
                                          ),
                                          textAlign: TextAlign.center,
                                        ),
                                      ),
                                      Text(widget.data.time,
                                          style: GoogleFonts.roboto(
                                              fontSize: 13,
                                              fontWeight: FontWeight.normal,
                                              color:
                                                  Colors.grey.withOpacity(0.8)))
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ));
  }
}
