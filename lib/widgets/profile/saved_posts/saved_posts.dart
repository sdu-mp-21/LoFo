import 'package:flutter/material.dart';
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

  @override
  void initState(){
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
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
