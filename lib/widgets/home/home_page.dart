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
  final GlobalKey _menuKey = GlobalKey();
  final ScrollController _controller = ScrollController();
  final TextEditingController _search = TextEditingController();
  String _selection = 'title';
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
  void initState() {
    super.initState();
  }
  void _showPopupMenu(Offset globalPosition) async {
    await showMenu(
      context: context,
      position: const RelativeRect.fromLTRB(100, 50, 0, 0),
      items: [
        PopupMenuItem<String>(
          onTap: (){
            _selection = 'title';
          },
          child: const Text('By title')),
        PopupMenuItem<String>(
            onTap: (){
              _selection = 'author';
            },
            child: const Text('By author')),
        PopupMenuItem<String>(
            onTap: (){
              _selection = 'place';
            },
            child: const Text('By place')),
      ],
      elevation: 8.0,
    );
  }
  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white,
        child: Column(children: [
          Row(
            children: [
              Expanded(
                child: Container(
                  margin: const EdgeInsets.symmetric(horizontal: 15),
                  decoration: BoxDecoration(
                    borderRadius: const BorderRadius.all(Radius.circular(12)),
                    color: Colors.grey.withOpacity(0.2)
                  ),
                  child: TextField(
                    controller: _search,
                    decoration: const InputDecoration(
                      border: InputBorder.none,
                      hintText: 'Search',
                      contentPadding: EdgeInsets.symmetric(horizontal: 10),
                    ),
                    onChanged: (String str){
                      setState(() {});
                    },
                  )
                ),
              ),
              GestureDetector(
                onTapDown: (TapDownDetails details) {
                  _showPopupMenu(details.globalPosition);
                },
                child: const Icon(Icons.search)
              ),
              const SizedBox(width: 10,)
            ],
          ),
          const SizedBox(
            height: 10,
          ),
          TopListviewWidget(
            controller: _controller,
          ),
          const SizedBox(
            height: 10,
          ),
          (_search.text.isNotEmpty)
          ?Expanded(
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
                    var foundRecords = [];
                    // allRecordPosts.where((element) => element.customerName.toLowerCase().contains(_search.text.toLowerCase())).toList();
                    for(var post in allRecordPosts){
                      if(_selection=='title'){
                        if(post.title.toLowerCase().contains(_search.text.toLowerCase())){
                          foundRecords.add(post);
                        }
                      }else if(_selection=='author'){
                        if(post.customerName.toLowerCase().contains(_search.text.toLowerCase())){
                          foundRecords.add(post);
                        }
                      }else if(_selection=='place'){
                        if(post.place.toLowerCase().contains(_search.text.toLowerCase())){
                          foundRecords.add(post);
                        }
                      }
                    }
                    return ListView.builder(
                        controller: _controller,
                        physics: const BouncingScrollPhysics(),
                        itemCount: foundRecords.length,
                        itemBuilder: (BuildContext context, int index) {
                          return GestureDetector(
                              onTap: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) => LoFoItemInfo(
                                        data: foundRecords[index]),
                                  ),
                                );
                                // Navigator.of(context).pushNamed('/item_information');
                              },
                              child: HomePageItemWidget(
                                data: foundRecords[index],
                              ));
                        });
                  }
                }),
          )
          :Expanded(
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
                                        transitionDuration:
                                            Duration(seconds: 2),
                                        transitionsBuilder:
                                            (BuildContext context,
                                                Animation<double> animation,
                                                Animation<double> secanimation,
                                                Widget child) {
                                          animation = CurvedAnimation(
                                              parent: animation,
                                              curve: Curves.elasticInOut);

                                          return ScaleTransition(
                                            alignment: Alignment.center,
                                            scale: animation,
                                            child: child,
                                          );
                                        },
                                        pageBuilder: (BuildContext context,
                                            Animation<double> animation,
                                            Animation<double>
                                                secondaryAnimation) {
                                          // Navigator.of(context).pushNamed('/item_information');
                                          return LoFoItemInfo(
                                            data: snapshot.data![index],
                                          );
                                        }));
                                // Navigator.of(context).pushNamed('/item_information');
                              },
                              child: HomePageItemWidget(
                                data: snapshot.data![index],
                              ));
                        });
                  }
                }),
          ),
        ]));
  }
}
