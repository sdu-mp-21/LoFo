import 'package:flutter/material.dart';

class ChangeDataHelper extends StatefulWidget {
  final String text;
  final String hintText;
  const ChangeDataHelper({Key? key, required this.text, required this.hintText}) : super(key: key);

  @override
  _ChangeDataHelperState createState() => _ChangeDataHelperState();
}

class _ChangeDataHelperState extends State<ChangeDataHelper> {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Text(widget.text),
        const SizedBox(width: 20,),
        Expanded(child: Container(
            height: 30,
            decoration: BoxDecoration(
                color: Colors.grey.withOpacity(0.2),
                borderRadius: const BorderRadius.all(Radius.circular(14))
            ),
            child: Center(
              child: TextField(
                decoration: InputDecoration(
                  border: InputBorder.none,
                  hintText: widget.hintText,
                  contentPadding: const EdgeInsets.only(left: 10, bottom: 13),
                ),
              ),
            ))
        )
      ],
    );
  }
}
