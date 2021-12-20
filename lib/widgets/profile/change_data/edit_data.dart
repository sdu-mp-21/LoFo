import 'dart:ffi';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:lofo_app/widgets/profile/change_data/change_data_helper.dart';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:path/path.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:lofo_app/colors/basic_colors.dart';
import 'package:image_picker/image_picker.dart';
import 'package:flutter_masked_text2/flutter_masked_text2.dart';

class EditDataPage extends StatefulWidget {
  const EditDataPage({Key? key}) : super(key: key);

  @override
  _EditDataPageState createState() => _EditDataPageState();
}

class _EditDataPageState extends State<EditDataPage> {
  static const Color tealGreen = Colors.lightBlue;

  final name = TextEditingController();
  final email = TextEditingController();
  final password = TextEditingController();
  final image = TextEditingController();
  final role = TextEditingController();
  final phone_number = TextEditingController();
  final whats_up_number = TextEditingController();
  final instagram_name = TextEditingController();

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
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
            color: Colors.transparent,
            child: Padding(
              padding: const EdgeInsets.only(top: 10, bottom: 10),
              child: Container(
                width: 400,
                // height: 77,
                constraints: const BoxConstraints(minHeight: 77),
                decoration: const BoxDecoration(
                    borderRadius: BorderRadius.all(Radius.circular(15)),
                    color: Colors.white
                    // color: Color.fromRGBO(241, 243, 245, 0.8),
                    ),
                child: Row(
                  children: [
                    const SizedBox(
                      width: 14,
                    ),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          const SizedBox(
                            height: 7,
                          ),
                          Row(
                            children: const [
                              // Image(image: AssetImage('images/sandyqLogoCart1.png'), height: 18,),
                              SizedBox(
                                width: 5,
                              ),
                              Text(
                                'Lost & Found',
                                style: TextStyle(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 14,
                                    color: Color.fromRGBO(161, 51, 10, 0.8)),
                              )
                            ],
                          ),
                          const SizedBox(
                            height: 7,
                          ),
                          const Text('You changed your data succesfully',
                              style: TextStyle(
                                  fontFamily: 'Google-Sans',
                                  fontWeight: FontWeight.w700,
                                  fontSize: 16)),
                          const SizedBox(
                            height: 14,
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(
                      width: 2,
                    ),
                    const Icon(Icons.done),
                    const SizedBox(
                      width: 14,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
        direction: DismissDirection.up,
        onDismissed: (direction) {
          if (direction == DismissDirection.endToStart) {
            fToast.removeCustomToast();
          }
        },
      ),
      gravity: ToastGravity.TOP,
      toastDuration: const Duration(seconds: 5),
    );
  }

  bool checkFilled() {
    if (name.text.isNotEmpty &&
        email.text.isNotEmpty &&
        role.text.isNotEmpty &&
        whats_up_number.text.isNotEmpty &&
        instagram_name.text.isNotEmpty) {
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
      appBar: AppBar(
        title: const Text('Change Data'),
        centerTitle: true,
        elevation: 0,
        //backgroundColor: Colors.blueAccent.withOpacity(0.1),
        backgroundColor: Colors.white,
        foregroundColor: Colors.black,
      ),
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
                              child: Text(
                                  'Pick image to your profile imagefrom gallery'),
                            ),
                          )
                        : Image.file(imageFile!),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Name',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: BasicColors.bgColor),
                  child: TextField(
                    controller: name,
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
                    'Write your full name',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'Role',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 7,
                ),
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: BasicColors.bgColor),
                  child: TextField(
                    controller: role,
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
                  height: 20,
                ),
                const Text(
                  'Email',
                  style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
                ),
                Container(
                  decoration: const BoxDecoration(
                      borderRadius: BorderRadius.all(Radius.circular(12)),
                      color: BasicColors.bgColor),
                  child: TextField(
                    controller: email,
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
                    'Write your SDU email',
                    style: TextStyle(fontSize: 12, fontWeight: FontWeight.w400),
                  ),
                ),
                const SizedBox(
                  height: 20,
                ),
                const SizedBox(
                  height: 20,
                ),
                const Text(
                  'WhatsApp Number',
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
                    controller: whats_up_number,
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
                  height: 20,
                ),
                const Text(
                  'Instagram Username',
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
                    controller: instagram_name,
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
                  height: 20,
                ),
                GestureDetector(
                  onTap: () {
                    if (checkFilled()) {
                      _showCartAdded();
                      // createPostFirebase();
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
                      'Change Data',
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
