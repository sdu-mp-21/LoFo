import 'dart:ffi';
import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:lofo_app/colors/basic_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class AnimatedAddItem extends StatefulWidget {
  const AnimatedAddItem({Key? key}) : super(key: key);

  @override
  _AnimatedAddItemState createState() => _AnimatedAddItemState();
}

class _AnimatedAddItemState extends State<AnimatedAddItem> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.transparent,
      body: LayoutBuilder(builder: (context, constraints) {
        return Container(
            child: TweenAnimationBuilder(
          tween: Tween(begin: 0.0, end: 1.0),
          duration: Duration(milliseconds: 1500),
          child: AddItemPageWidget(),
          builder: (context, value, child) {
            return ShaderMask(
              shaderCallback: (rect) {
                return RadialGradient(
                  radius: double.parse(value.toString()) * 5,
                  colors: [
                    Colors.white,
                    Colors.white,
                    Colors.lightBlue,
                    Colors.lightBlue
                  ],
                  stops: [0.0, 0.45, 0.85, 1.0],
                  center: FractionalOffset(0.95, 0.90),
                ).createShader(rect);
              },
              child: child,
            );
          },
        )
            //AddItemPageWidget(),
            );
      }),
    );
  }
}

class AddItemPageWidget extends StatefulWidget {
  const AddItemPageWidget({Key? key}) : super(key: key);

  @override
  _AddItemPageWidgetState createState() => _AddItemPageWidgetState();
}

class _AddItemPageWidgetState extends State<AddItemPageWidget> {
  static const Color tealGreen = Color.fromRGBO(0, 180, 171, 1);
  final titleController = TextEditingController();
  final descriptionController = TextEditingController();
  final placeController = TextEditingController();
  final date = MaskedTextController(mask: '00.00.0000');
  late FToast fToast;

  String dropdownValue = 'Mobile';
  String type = 'Lost';
  File? imageFile;

  @override
  void didChangeDependencies() {
    super.didChangeDependencies();
    fToast = FToast();
  }

  var _validateDescription = false;
  var _validateTitle = false;
  var _validateDate = false;
  var _validatePlace = false;

  String message = '';


  Future uploadImageToFirebase() async {
    print(imageFile);
    print(imageFile == null);
    if (imageFile != null) {
      String fileName = basename(imageFile!.path);
      FirebaseStorage storage = FirebaseStorage.instance;
      Reference ref = storage.ref(fileName);
      print('Uploading file please wait');
      ref.putFile(imageFile!).then((TaskSnapshot result) {
        if (result.state == TaskState.success) {
          print('Successfully uploaded');
        } else {
          print('Error uploading file');
        }
      });
    }
  }

  void createPostFirebase() {
    print('createPostFirebase');
    FirebaseFirestore.instance.collection('posts').add({
      'title': titleController.text,
      'description': descriptionController.text,
      'date': date.text,
      'place': placeController.text,
      'type': type,
      'category': dropdownValue,
    });
    uploadImageToFirebase();
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
                          const Text('You have added new post succesfully', style: TextStyle(fontFamily: 'Google-Sans',fontWeight: FontWeight.w700, fontSize: 16)),
                          const SizedBox(height: 14,),
                        ],
                      ),
                    ),
                    const SizedBox(width: 2,),
                    const Icon(Icons.done),
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

  bool checkFilled() {
    if (titleController.text.isNotEmpty &&
        descriptionController.text.isNotEmpty &&
        placeController.text.isNotEmpty &&
        (date.text.length == 10)) {
      return true;
    } else {
      return false;
    }
  }

  void changeType(String newType) {
    type = newType;
    setState(() {});
  }

  void pickImage() async {
    final ImagePicker _picker = ImagePicker();
    final XFile? image = await _picker.pickImage(source: ImageSource.gallery);
    if (image != null) {
      imageFile = File(image.path);
    }
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    fToast.init(context);

    return Scaffold(
      backgroundColor: Colors.white,
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
                const SizedBox(
                  height: 40,
                ),
                GestureDetector(
                  onTap: () => Navigator.of(context).pop(),
                  child: Row(
                    children: const [
                      Icon(Icons.chevron_left),
                      Text(
                        'Go back',
                        style: TextStyle(
                            fontSize: 14, fontWeight: FontWeight.w400),
                      ),
                    ],
                  ),
                ),
                const Text(
                  'Create Post',
                  style: TextStyle(fontSize: 25, fontWeight: FontWeight.w700),
                ),
                const SizedBox(
                  height: 30,
                ),
                GestureDetector(
                  onTap: pickImage,
                  child: Center(
                    child: (imageFile == null)
                        ? Container(
                            height: 100,
                            // width: 300,
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(30)),
                                color: BasicColors.bgColor),
                            child: const Center(
                              child:
                                  Text('Click here to pick image from gallery'),
                            ),
                          )
                        : Image.file(imageFile!),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Category',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 7,
                ),
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: BasicColors.bgColor),
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
                      items: <String>['Mobile', 'Document', 'Laptop', 'Other']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                    ),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Post Type',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 15,
                ),
                Row(
                  children: [
                    GestureDetector(
                      onTap: () => changeType('Lost'),
                      child: Container(
                        height: 35,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            color: (type == 'Lost')
                                ? tealGreen
                                : Colors.grey.withOpacity(0.2)),
                        child: Center(
                            child: Text('Lost',
                                style: TextStyle(
                                    color: (type == 'Lost')
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600))),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    GestureDetector(
                      onTap: () => changeType('Found'),
                      child: Container(
                        height: 35,
                        width: 70,
                        decoration: BoxDecoration(
                            borderRadius:
                                const BorderRadius.all(Radius.circular(8)),
                            color: (type == 'Found')
                                ? tealGreen
                                : Colors.grey.withOpacity(0.2)),
                        child: Center(
                            child: Text('Found',
                                style: TextStyle(
                                    color: (type == 'Found')
                                        ? Colors.white
                                        : Colors.black,
                                    fontSize: 16,
                                    fontWeight: FontWeight.w600))),
                      ),
                    ),
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Title',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: BasicColors.bgColor),
                  child: TextField(
                    controller: titleController,
                    maxLines: null,
                    decoration: InputDecoration(
                      errorText:
                          _validateTitle ? 'Value Can\'t Be Empty' : null,
                      isDense: true,
                      contentPadding: const EdgeInsets.all(20.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'A title must be at most 30 characters',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Description',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 10,
                ),
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: BasicColors.bgColor),
                  child: TextField(
                    controller: descriptionController,
                    maxLines: null,
                    decoration: InputDecoration(
                      errorText:
                          _validateDescription ? 'Value Can\'t Be Empty' : null,
                      isDense: true,
                      contentPadding: const EdgeInsets.all(20.0),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 3,
                ),
                const Padding(
                  padding: EdgeInsets.only(left: 10),
                  child: Text(
                    'Describe important information like color, feature etc.',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                Row(
                  children: [
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        const Text(
                          'Date',
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.w600),
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        Container(
                          width: 110,
                          decoration: const BoxDecoration(
                              borderRadius:
                                  BorderRadius.all(Radius.circular(12)),
                              color: BasicColors.bgColor),
                          child: TextField(
                            controller: date,
                            maxLines: null,
                            decoration: InputDecoration(
                              errorText:
                                  _validateDate ? 'Should be 8\n digits' : null,
                              isDense: true,
                              contentPadding: const EdgeInsets.all(10.0),
                              border: InputBorder.none,
                            ),
                          ),
                        ),
                        const SizedBox(
                          height: 3,
                        ),
                        const Padding(
                          padding: EdgeInsets.only(left: 10),
                          child: Text(
                            'DD.MM.YYYY',
                            style: TextStyle(
                                fontSize: 12, fontWeight: FontWeight.w400),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(
                      width: 20,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const Text(
                            'Place',
                            style: TextStyle(
                                fontSize: 16, fontWeight: FontWeight.w600),
                          ),
                          const SizedBox(
                            height: 10,
                          ),
                          Container(
                            decoration: const BoxDecoration(
                                borderRadius:
                                    BorderRadius.all(Radius.circular(12)),
                                color: BasicColors.bgColor),
                            child: TextField(
                              controller: placeController,
                              maxLines: null,
                              decoration: InputDecoration(
                                errorText: _validatePlace ? 'Fill this' : null,
                                isDense: true,
                                contentPadding: const EdgeInsets.all(10.0),
                                border: InputBorder.none,
                              ),
                            ),
                          ),
                          const SizedBox(
                            height: 3,
                          ),
                          const Padding(
                            padding: EdgeInsets.only(left: 10),
                            child: Text(
                              'Where you lose/found',
                              style: TextStyle(
                                  fontSize: 12, fontWeight: FontWeight.w400),
                            ),
                          ),
                        ],
                      ),
                    )
                  ],
                ),
                const SizedBox(
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    if (checkFilled()) {
                      _showCartAdded();
                      createPostFirebase();
                      Navigator.of(context).pop();
                    }
                    descriptionController.text.isEmpty
                        ? _validateDescription = true
                        : _validateDescription = false;
                    titleController.text.isEmpty
                        ? _validateTitle = true
                        : _validateTitle = false;
                    date.text.length != 10
                        ? _validateDate = true
                        : _validateDate = false;
                    placeController.text.isEmpty
                        ? _validatePlace = true
                        : _validatePlace = false;
                    setState(() {});
                  },
                  child: Container(
                    height: 50,
                    width: double.infinity,
                    decoration: const BoxDecoration(
                        borderRadius: BorderRadius.all(Radius.circular(999)),
                        color: tealGreen),
                    child: const Center(
                        child: Text(
                      'Create Post',
                      style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.w600),
                    )),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
