import 'package:flutter/material.dart';
import 'package:lofo_app/model/record.dart';
import 'package:google_fonts/google_fonts.dart';

class AuthorItemHelper extends StatelessWidget {
  final Record data;
  const AuthorItemHelper({Key? key, required this.data}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        padding: EdgeInsets.all(20),
        child: Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(20)),
                image: DecorationImage(
                  image: NetworkImage(data.image),
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
                borderRadius: const BorderRadius.all(Radius.circular(20)),
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
                      data.title,
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
                        Text(data.place,
                            style: GoogleFonts.roboto(
                                fontSize: 15,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey.withOpacity(0.9)))
                      ],
                    ),
                    const SizedBox(
                      height: 40,
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Container(
                          padding: const EdgeInsets.fromLTRB(15, 4, 15, 4),
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(17)),
                            color: Colors.lightBlue,
                          ),
                          child: Text(
                            data.status,
                            style: GoogleFonts.roboto(
                              fontSize: 15,
                              fontWeight: FontWeight.bold,
                              color: Colors.white,
                            ),
                            textAlign: TextAlign.center,
                          ),
                        ),
                        Text(data.time,
                            style: GoogleFonts.roboto(
                                fontSize: 13,
                                fontWeight: FontWeight.normal,
                                color: Colors.grey.withOpacity(0.8)))
                      ],
                    ),
                  ],
                ),
              ),
            ),
          ],
        ));
  }
}
