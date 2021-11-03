import 'package:flutter/material.dart';
import 'package:lofo_app/widgets/profile/change_data/change_data_helper.dart';

class ChangeDataPage extends StatefulWidget {
  const ChangeDataPage({Key? key}) : super(key: key);

  @override
  _ChangeDataPageState createState() => _ChangeDataPageState();
}

class _ChangeDataPageState extends State<ChangeDataPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Change Personal Info'),
        centerTitle: true,
        elevation: 0,
        backgroundColor: Colors.blueAccent.withOpacity(0.1),//white
        foregroundColor: Colors.black,
        automaticallyImplyLeading: false,
      ),
      body: Padding(
        padding:  const EdgeInsets.symmetric(horizontal: 26, vertical: 20),
        child: Column(
          children: const [
            ChangeDataHelper(text: 'Name', hintText: 'Change your name'),
            SizedBox(height: 30,),
            ChangeDataHelper(text: 'Surname', hintText: 'Change your surname'),
            SizedBox(height: 30,),
            ChangeDataHelper(text: 'Email', hintText: 'Change your email'),
            SizedBox(height: 30,),
            ChangeDataHelper(text: 'Phone-number', hintText: 'Change your number'),
            SizedBox(height: 30,),

          ],
        ),
      ),
      floatingActionButton: Container(
        height: 40,
        width: 300,
        decoration: const BoxDecoration(
          color: Colors.blueAccent,
          borderRadius: BorderRadius.all(Radius.circular(14))
        ),
        child: TextButton(
          onPressed: (){
            Navigator.of(context).pop();
          },
          child: const Text('Submit my changes', style: TextStyle(color: Colors.white),),
        ),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
