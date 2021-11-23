import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lofo_app/colors/basic_colors.dart';
import 'package:image_picker/image_picker.dart';

class AddItemPageWidget extends StatefulWidget {
  const AddItemPageWidget({Key? key}) : super(key: key);

  @override
  _AddItemPageWidgetState createState() => _AddItemPageWidgetState();
}

class _AddItemPageWidgetState extends State<AddItemPageWidget> {
  static const Color tealGreen = Color.fromRGBO(0, 180, 171,1);


  String dropdownValue = 'Mobile';
  String type = 'Lost';
  File? imageFile;

  void changeType(String newType){
    type = newType;
    setState(() {});
  }

  void pickImage() async{
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if(image!=null){
      imageFile = File(image.path);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: Colors.white,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25),
          child: SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const SizedBox(height: 40,),
                GestureDetector(
                  onTap: ()=> Navigator.of(context).pop(),
                  child: Row(
                    children: const [
                      Icon(Icons.chevron_left),
                      Text('Go back', style: TextStyle(fontSize: 14, fontWeight: FontWeight.w400),),
                    ],
                  ),
                ),
                const Text('Create Post', style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),),
                const SizedBox(height: 30,),
                GestureDetector(
                  onTap: pickImage,
                  child: Center(
                    child: (imageFile==null)?Container(
                      height: 100,
                      // width: 300,
                      decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(30)),
                        color: BasicColors.bgColor
                      ),
                      child: const Center(
                        child: Text('Add Photo'),
                      ),
                    ):Image.file(imageFile!),
                  ),
                ),
                const SizedBox(height: 20,),
                const Text('Category', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                const SizedBox(height: 7,),
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: BasicColors.bgColor
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 15),
                    child: DropdownButton<String>(
                      isExpanded: true,
                      alignment: AlignmentDirectional.center,
                      value: dropdownValue,
                      icon: const Icon(Icons.arrow_drop_down),
                      iconSize: 24,
                      elevation: 0,
                      style: const TextStyle(color: Colors.black),
                      underline: const SizedBox(),
                      onChanged: (String? newValue) {
                        setState(() {
                          dropdownValue = newValue!;
                        });
                      },
                      items: <String>['Mobile','Document', 'Laptop', 'Other']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(height: 20,),
                const Text('Post Type', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                const SizedBox(height: 15,),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => changeType('Lost'),
                      child: Container(
                        height: 35,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                          color: (type=='Lost')?tealGreen:Colors.grey.withOpacity(0.2)
                        ),
                        child: Center(child: Text('Lost', style: TextStyle(color: (type=='Lost')?Colors.white:Colors.black, fontSize: 16, fontWeight: FontWeight.w600))),
                      ),
                    ),
                    const SizedBox(width: 10,),
                    GestureDetector(
                      onTap: () => changeType('Found'),
                      child: Container(
                        height: 35,
                        width: 70,
                        decoration: BoxDecoration(
                          borderRadius: const BorderRadius.all(Radius.circular(8)),
                          color: (type=='Found')?tealGreen:Colors.grey.withOpacity(0.2)
                        ),
                        child: Center(child: Text('Found', style: TextStyle(color: (type=='Found')?Colors.white:Colors.black, fontSize: 16, fontWeight: FontWeight.w600))),
                      ),
                    ),
                  ],
                ),
                const SizedBox(height: 20,),
                const Text('Title', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                const SizedBox(height: 10,),
                Container(
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: BasicColors.bgColor
                  ),
                  child: const TextField(
                    maxLines: null,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(20.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 3,),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('A title must be at most 30 characters', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),),
                ),
                const SizedBox(height: 20,),
                const Text('Description', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                const SizedBox(height: 10,),
                Container(
                  decoration:  const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(12)),
                    color: BasicColors.bgColor
                  ),
                  child: const TextField(
                    maxLines: null,
                    decoration: InputDecoration(
                      isDense: true,
                      contentPadding: EdgeInsets.all(20.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(height: 3,),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text('Describe important information like color, feature etc.', style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),),
                ),
                const SizedBox(height: 20,),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text('Date', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                        const SizedBox(height: 10,),
                        Container(
                          width: 100,
                          decoration: const BoxDecoration(
                              borderRadius: BorderRadius.all(Radius.circular(12)),
                              color: BasicColors.bgColor
                          ),
                          child: const TextField(
                            maxLines: null,
                            decoration: InputDecoration(
                              isDense: true,
                              contentPadding: EdgeInsets.all(10.0),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(width: 20,),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text('Place', style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),),
                          const SizedBox(height: 10,),
                          Container(
                            decoration: const BoxDecoration(
                                borderRadius: BorderRadius.all(Radius.circular(12)),
                                color: BasicColors.bgColor
                            ),
                            child: const TextField(
                              maxLines: null,
                              decoration: InputDecoration(
                                isDense: true,
                                contentPadding: EdgeInsets.all(10.0),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(height: 20,),
                Container(
                  height: 50,
                  width: double.infinity,
                  decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(999)),
                    color: tealGreen
                  ),
                  child: const Center(child: Text('Create Post', style: TextStyle(color: Colors.white, fontSize: 16, fontWeight: FontWeight.w600),)),
                ),
                const SizedBox(height: 20,),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
