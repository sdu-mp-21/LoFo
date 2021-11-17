import 'package:flutter/material.dart';
import 'package:lofo_app/api_client/api_client.dart';
import 'package:lofo_app/model/record.dart';
import 'package:lofo_app/model/saved_posts.dart';
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
    print(allRecords.length);
    List<Record> saved_posts = [];
    for(var i in saved_posts_by_id){
      saved_posts.addAll(allRecords);
    }
    return Scaffold(
      appBar: AppBar(
        title: const Text('Saved Posts',
            style: TextStyle(fontWeight: FontWeight.bold)),
        centerTitle: true,
        elevation: 0,
        //backgroundColor: Colors.blueAccent.withOpacity(0.1), //white
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
        automaticallyImplyLeading: false,
      ),
      body: Container(
        child: (saved_posts.length != 0)?ListView.builder(
          itemCount: saved_posts.length,
          itemBuilder: (context, index){
            return LoFoItemInfo(data: saved_posts[index],);
          }
        ):Center(
          child: Container(
            child: CircularProgressIndicator(),
          ),
        )
      )
    );
  }
}
