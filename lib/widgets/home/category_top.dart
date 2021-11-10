import 'package:flutter/material.dart';

class TopListviewWidget extends StatefulWidget {
  final ScrollController controller;
  TopListviewWidget({Key? key, required this.controller}) : super(key: key);
  @override
  State<TopListviewWidget> createState() => _TopListviewWidgetState();
}

class _TopListviewWidgetState extends State<TopListviewWidget> {
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
              widget.controller.animateTo(
                  0,
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.easeInOut);
            },
            child: Container(
              height: 43,
              alignment: Alignment.center,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('All',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
              ),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(999)),
                  color: Color.fromRGBO(214, 214, 214, 0.8)
              ),
            ),
          ),
          const SizedBox(width: 8,),
          GestureDetector(
            onTap: (){
              widget.controller.animateTo(
                  500,
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.easeInOut);
            },
            child: Container(
              height: 43,
              alignment: Alignment.center,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('Mobile',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
              ),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(999)),
                  color: Color.fromRGBO(214, 214, 214, 0.8)
              ),
            ),
          ),
          const SizedBox(width: 8,),
          GestureDetector(
            onTap: (){
              widget.controller.animateTo(
                  1000,
                  duration: Duration(milliseconds: 1000),
                  curve: Curves.easeInOut);
            },
            child: Container(
              height: 43,
              alignment: Alignment.center,
              child: const Padding(
                padding: EdgeInsets.symmetric(horizontal: 20),
                child: Text('Documents',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
              ),
              decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(999)),
                  color: Color.fromRGBO(214, 214, 214, 0.8)
              ),
            ),
          ),
          const SizedBox(width: 8,),
          Container(
            height: 43,
            alignment: Alignment.center,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Laptop',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
            ),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(999)),
                color: Color.fromRGBO(214, 214, 214, 0.8)
            ),
          ),
          const SizedBox(width: 8,),
          Container(
            height: 43,
            alignment: Alignment.center,
            child: const Padding(
              padding: EdgeInsets.symmetric(horizontal: 20),
              child: Text('Other',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w700),),
            ),
            decoration: const BoxDecoration(
                borderRadius: BorderRadius.all(Radius.circular(999)),
                color: Color.fromRGBO(214, 214, 214, 0.8)
            ),
          ),
          const SizedBox(width: 8,),
        ],
      ),
    );
  }
}
