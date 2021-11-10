import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:lofo_app/model/record.dart';
import 'package:google_fonts/google_fonts.dart';

class ItemInfoData {
  final String name;
  final String lostOrFound;
  final String time;
  final String imageURL;

  ItemInfoData(this.name, this.lostOrFound, this.time, this.imageURL);
}

class HomePageItemWidget extends StatefulWidget {
  final Record data;

  const HomePageItemWidget({
    Key? key,
    required this.data,
  }) : super(key: key);
  @override
  _HomePageItemWidgetState createState() => _HomePageItemWidgetState();
}

class _HomePageItemWidgetState extends State<HomePageItemWidget> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Container(
        decoration: const BoxDecoration(
          borderRadius:  BorderRadius.all(Radius.circular(20)),
        ),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
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
                    Colors.black.withOpacity(0.8)
                  ],
                ),
                borderRadius: const BorderRadius.all(Radius.circular(20)),
              ),
              height: 208,
              width: MediaQuery.of(context).size.width,
              padding: const EdgeInsets.all(15),
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
                        color: Colors.grey.withOpacity(0.8),
                        size: 23,
                      ),
                      Text(widget.data.place,
                          style: GoogleFonts.roboto(
                              fontSize: 15,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey.withOpacity(0.8)))
                    ],
                  ),
                  const SizedBox(
                    height: 8,
                  ),
                  Container(
                    padding: const EdgeInsets.fromLTRB(10, 4, 10, 4),
                    decoration: const BoxDecoration(
                      borderRadius:  BorderRadius.all(Radius.circular(17)),
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
                  const SizedBox(
                    height: 3,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
                        children: [
                          Container(
                            width: 30,
                            height: 30,
                            margin: EdgeInsets.only(right: 10),
                            decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(15)),
                              image: DecorationImage(
                                image: NetworkImage(widget.data.customerImg),
                              ),
                            ),
                          ),
                          Column(
                            mainAxisAlignment: MainAxisAlignment.start,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(widget.data.customerName,
                                  style: GoogleFonts.roboto(
                                      fontSize: 17,
                                      fontWeight: FontWeight.bold,
                                      color: Colors.white)),
                              Text(widget.data.customerRole,
                                  style: GoogleFonts.roboto(
                                      fontSize: 12,
                                      fontWeight: FontWeight.normal,
                                      color: Colors.grey.withOpacity(0.8)))
                            ],
                          )
                        ],
                      ),
                      Text(widget.data.time,
                          style: GoogleFonts.roboto(
                              fontSize: 13,
                              fontWeight: FontWeight.normal,
                              color: Colors.grey.withOpacity(0.8)))
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      // child: Column(
      //   children: [
      //     Container(
      //       height: 150,
      //       width: MediaQuery.of(context).size.width,
      //       decoration: BoxDecoration(
      //         color: Colors.white, // чтобы скрывать тень
      //         border: Border.all(color: Colors.black.withOpacity(0.2)),
      //         borderRadius: const BorderRadius.all(Radius.circular(20)),
      //         image: DecorationImage(
      //           fit: BoxFit.fitWidth,
      //           // image: AssetImage(widget.data.image)
      //           image: NetworkImage(widget.data.image),
      //         ),
      //       ),
      //         child: Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Opacity(
      //               opacity: 0.8,
      //               child: Text(widget.data.title,
      //                 style: TextStyle(fontSize: 30,color: Colors.white,backgroundColor: Colors.black.withOpacity(0.5)),),
      //             )
      //           ],
      //         )
      //     ),
      //     const SizedBox(height: 5,),
      //     Row(
      //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
      //       children: [
      //         Container(
      //           decoration: BoxDecoration(
      //             color: Colors.yellow.withOpacity(0.3),
      //           ),
      //           child: Row(
      //             children:  [
      //               const SizedBox(width: 5,),
      //               const Icon(Icons.content_paste_sharp),
      //               const SizedBox(width: 5,),
      //               Text(widget.data.status,style: const TextStyle(
      //                 fontSize: 18,fontWeight: FontWeight.w700
      //               ),),
      //               const SizedBox(width: 5,),
      //             ],
      //           ),
      //         ),
      //         Text(widget.data.time,style: const TextStyle(
      //             fontSize: 18,fontWeight: FontWeight.w700
      //         ),),
      //       ],
      //     )
      //   ],
      // ),
    );
  }
}
