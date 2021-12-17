import 'package:flutter/material.dart';

class TopListviewWidget extends StatefulWidget {
  final ScrollController controller;
  TopListviewWidget({Key? key, required this.controller}) : super(key: key);
  @override
  State<TopListviewWidget> createState() => _TopListviewWidgetState();
}

class _TopListviewWidgetState extends State<TopListviewWidget> {
  List<bool> isActive = [true,false,false,false,false];

  void _changeActive(int index){
    for(var i=0; i<5; i++){
      if(i == index){
        isActive[i] = true;
      }else{
        isActive[i] = false;
      }
      setState(() {});
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 43,
      child: ListView(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        children: [
          const SizedBox(width: 16,),
          GestureDetector(
            onTap: (){
              _changeActive(0);
              widget.controller.animateTo(
                  0,
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.easeInOut);
            },
            child: Container(
              height: 43,
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('All',style: TextStyle(color: (isActive[0]==true)?Colors.white:Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(999)),
                  color: (isActive[0]==true)?Colors.blue:Color.fromRGBO(214, 214, 214, 0.8)
              ),
            ),
          ),
          const SizedBox(width: 8,),
          GestureDetector(
            onTap: (){
              _changeActive(1);
              widget.controller.animateTo(
                  730,
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.easeInOut);
            },
            child: Container(
              height: 43,
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('Mobile',style: TextStyle(color: (isActive[1]==true)?Colors.white:Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(999)),
                  color: (isActive[1]==true)?Colors.lightBlue:Color.fromRGBO(214, 214, 214, 0.8)
              ),
            ),
          ),
          const SizedBox(width: 8,),
          GestureDetector(
            onTap: (){
              _changeActive(2);
              widget.controller.animateTo(
                  1460,
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.easeInOut);
            },
            child: Container(
              height: 43,
              alignment: Alignment.center,
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Text('Documents',style: TextStyle(color: (isActive[2]==true)?Colors.white:Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(999)),
                  color: (isActive[2]==true)?Colors.blue:Color.fromRGBO(214, 214, 214, 0.8)
              ),
            ),
          ),
          const SizedBox(width: 8,),
          GestureDetector(
            onTap: (){
              _changeActive(3);
              widget.controller.animateTo(
                  2200,
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.easeInOut);
            },
            child: Container(
              height: 43,
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('Laptop',style: TextStyle(color: (isActive[3]==true)?Colors.white:Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(999)),
                  color: (isActive[3]==true)?Colors.blue:Color.fromRGBO(214, 214, 214, 0.8)
              ),
            ),
          ),
          const SizedBox(width: 8,),
          GestureDetector(
            onTap: (){
              _changeActive(4);
              widget.controller.animateTo(
                  2940,
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.easeInOut);
            },
            child: Container(
              height: 43,
              alignment: Alignment.center,
              child: Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('Other',style: TextStyle(color: (isActive[4]==true)?Colors.white:Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
              ),
              decoration: BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(999)),
                  color: (isActive[4]==true)?Colors.blue:Color.fromRGBO(214, 214, 214, 0.8)
              ),
            ),
          ),
          const SizedBox(width: 8,),
        ],
      ),
    );
  }
}
