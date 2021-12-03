import 'package:flutter/material.dart';
import 'package:lofo_app/api_client/api_client.dart';
import 'package:lofo_app/model/record.dart';
import 'package:lofo_app/model/author_posts.dart';
import 'package:lofo_app/widgets/item_info/item_info.dart';
import 'category_top.dart';
import 'home_page_item.dart';

class HomePageWidget extends StatefulWidget {
  const HomePageWidget({Key? key}) : super(key: key);

  @override
  _HomePageWidgetState createState() => _HomePageWidgetState();
}

class _HomePageWidgetState extends State<HomePageWidget> {
  final ScrollController _controller = ScrollController();
  final List<ItemInfoData> dataSet = [
    ItemInfoData(
        'Airpods 2', 'Found', 'Today', 'assets/image/airpods_on_hand.png'),
    ItemInfoData(
        'Macbook Air', 'Lost', '3 days ago', 'assets/image/macbookAir.jpg'),
    ItemInfoData('Qazaq Republic Somke', 'Lost', '1 day ago',
        'assets/image/qrSomke.jpg'),
    ItemInfoData(
        'Acer Nitro 5', 'Found', 'Today', 'assets/image/acerNitro.jpg'),
  ];

  List<String> categories = ['All', 'Mobiles', 'Documents', 'Laptops', 'Other'];
  @override
  Widget build(BuildContext context) {
    return Container(
        //color: Colors.blueAccent.withOpacity(0.1),
        color: Colors.white,
        child: Column(children: [
          TopListviewWidget(
            controller: _controller,
          ),
          const SizedBox(
            height: 10,
          ),
          Expanded(
            child: FutureBuilder<List<Record>>(
                future: ApiClient().getPost(),
                builder: (context, snapshot) {
                  if (snapshot.hasError) {
                    return Text('${snapshot.error}');
                  }
                  if (!snapshot.hasData) {
                    return const Center(child: Text('LOADING'));
                  } else {
                    allRecordPosts = snapshot.data!.toList();
                    return ListView.builder(
                        controller: _controller,
                        physics: const BouncingScrollPhysics(),
                        itemCount: snapshot.data!.length,
                        itemBuilder: (BuildContext context, int index) {
                          if (index % 3 == 0) {
                            return Column(
                              children: [
                                // 'Category ${index/3+1}'

                                Text(
                                  categories[(index / 3).toInt()],
                                  style: const TextStyle(
                                      fontSize: 20,
                                      fontWeight: FontWeight.w700),
                                ),
                                GestureDetector(
                                    onTap: () {
                                      Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                          builder: (context) => LoFoItemInfo(
                                              data: snapshot.data![index]),
                                        ),
                                      );
                                      // Navigator.of(context).pushNamed('/item_information');
                                    },
                                    child: HomePageItemWidget(
                                      data: snapshot.data![index],
                                    )),
                              ],
                            );
                          }
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  PageRouteBuilder(
                                    transitionDuration: Duration(seconds: 2),
                                    transitionsBuilder: (BuildContext context,
                                        Animation<double> animation,
                                        Animation<double> secanimation,
                                        Widget child) {
                                      animation = CurvedAnimation(parent: animation,
                                      curve: Curves.elasticInOut);

                                      return ScaleTransition(
                                        alignment: Alignment.center,
                                        scale: animation,
                                        child: child,
                                      );
                                    }, pageBuilder: (BuildContext context, Animation<double> animation, Animation<double> secondaryAnimation) {
                                      // Navigator.of(context).pushNamed('/item_information');
                                      return LoFoItemInfo(data: snapshot.data![index],);
                                  }
                                  )
                                );
                                // Navigator.of(context).pushNamed('/item_information');
                              },
                              child: HomePageItemWidget(
                                data: snapshot.data![index],
                              ));
                        });
                  }
                }),
          )
        ]));
  }
}
