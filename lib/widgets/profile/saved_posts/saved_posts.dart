import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:lofo_app/api_client/api_client.dart';
import 'package:lofo_app/model/record.dart';
import 'package:lofo_app/model/saved_posts.dart';
import 'package:lofo_app/widgets/home/home_page_item.dart';
import 'package:lofo_app/widgets/item_info/item_info.dart';

class SavedPostsPage extends StatefulWidget {
  const SavedPostsPage({Key? key}) : super(key: key);

  @override
  _SavedPostsPageState createState() => _SavedPostsPageState();
}

class _SavedPostsPageState extends State<SavedPostsPage> {
  late FToast fToast;

  @override
  void initState(){
    super.initState();
  }
  void _showCartAdded() {
    fToast.showToast(
      child: Dismissible(
        key: UniqueKey(),
        child: Align(
          alignment: Alignment.topCenter,
          child: Material(
            shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                width: 400,
                // height: 77,
                constraints: const BoxConstraints(
                    minHeight: 77
                ),
                decoration:  const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.white
                  // color: Color.fromRGBO(241, 243, 245, 0.8),
                ),
                child: Row(
                  children: [
                    const SizedBox(width: 14,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(height: 7,),
                          Row(
                            children: const [
                              // Image(image: AssetImage('images/sandyqLogoCart1.png'), height: 18,),
                              SizedBox(width: 5,),
                              Text('Lost & Found', style: TextStyle(fontWeight: FontWeight.w700, fontSize: 14,color: Color.fromRGBO(161, 51, 10, 0.8)),)
                            ],
                          ),
                          const SizedBox(height: 7,),
                          const Text('You have succesfully deleted saved post', style: TextStyle(fontFamily: 'Google-Sans',fontWeight: FontWeight.w700, fontSize: 16)),
                          const SizedBox(height: 14,),
                        ],
                      ),
                    ),
                    const SizedBox(width: 2,),
                    const Icon(Icons.delete_outline, color: Colors.red,),
                    const SizedBox(width: 14,),
                  ],
                ),
              ),
            ),
          ),
        )
        ,
        direction: DismissDirection.up,
        onDismissed: (direction) {
          if(direction == DismissDirection.endToStart) {
            fToast.removeCustomToast();
          }
        },
      ),
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(seconds: 5),
    );
  }
  @override
  Widget build(BuildContext context) {
    fToast = FToast();
    fToast.init(context);
    List<Record> saved_posts = [];
    for(var i in saved_posts_by_id){
      saved_posts.add(allRecords[i]);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Posts',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        automaticallyImplyLeading: false,
        leading: GestureDetector(
          onTap: (){
            saved_posts_by_id.clear();
            setState(() {});
          },
          child: const Icon(Icons.delete, color: Colors.red,)
        ),
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          (saved_posts.isNotEmpty)?Expanded(
            child: ListView.builder(
              physics: const BouncingScrollPhysics(),
              itemCount: saved_posts.length,
              itemBuilder: (context, index){
                return Dismissible(
                  key: UniqueKey(),
                  onDismissed: (direction) {
                    setState(() {
                      saved_posts_by_id.removeAt(index);
                    });
                    _showCartAdded();
                  },
                  background: Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: const [
                      Text('Delete Post', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w700),),
                      SizedBox(width: 10,),
                      Icon(Icons.delete, color: Colors.red,),
                      SizedBox(width: 20,),
                    ],
                  ),
                  child: HomePageItemWidget(data: saved_posts[index],)
                );
              }
            ),
          ):const Center(child: Text('There is no saved post', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w400),))
        ],
      ),
      // body: Expanded(
      //   child: FutureBuilder<List<Record>>(
      //       future: ApiClient().getPost(),
      //       builder: (context, snapshot){
      //         if (snapshot.hasError) {
      //           return Text('${snapshot.error}');
      //         }
      //         if(!snapshot.hasData){
      //           return const Center(child: Text('LOADING'));
      //         }else{
      //           for(var i in saved_posts_by_id){
      //             saved_posts.add(snapshot.data![i]);
      //           }
      //           print('here');
      //           print(saved_posts);
      //           return Container(
      //             height: 100,
      //             width: 100,
      //             color: Colors.red,
      //           );
      //           // return ListView.builder(
      //           //     physics: const BouncingScrollPhysics(),
      //           //     itemCount: saved_posts.length,
      //           //     itemBuilder: (BuildContext context, int index) {
      //           //       return GestureDetector(
      //           //           onTap: (){
      //           //             Navigator.push(
      //           //               context,
      //           //               MaterialPageRoute(
      //           //                 builder: (context) => LoFoItemInfo(data: saved_posts[index]),
      //           //               ),
      //           //             );
      //           //             // Navigator.of(context).pushNamed('/item_information');
      //           //           },
      //           //           child: HomePageItemWidget(data: saved_posts[index],)
      //           //       );
      //           //     }
      //           // );
      //         }
      //       }
      //   ),
      // ),
      // body: Container(
      //   height: 400,
      //   child: (saved_posts.length != 0)?ListView.builder(
      //     itemCount: saved_posts.length,
      //     itemBuilder: (context, index){
      //       return LoFoItemInfo(data: saved_posts[0],);
      //     }
      //   ):Center(
      //     child: Container(
      //       child: Text('There is no saved posts', style: TextStyle(fontSize: 20, fontWeight: FontWeight.w700),),
      //     ),
      //   )
      // )
    );
  }
}
