import 'package:bitirme_projesi/background.dart';
import 'package:bitirme_projesi/page_to_edit.dart';
import 'package:flutter/material.dart';
import 'dart:io';
import 'package:flutter/services.dart';
import 'package:image_picker/image_picker.dart';

class imagePicker extends StatefulWidget {
  const imagePicker({Key? key}) : super(key: key);

  @override
  State<imagePicker> createState() => _imagePickerState();
}

class _imagePickerState extends State<imagePicker> {

  void pickImage(BuildContext context) async {
    final XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.gallery,
    );

    if (pickedFile == null) return;
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (_) => PageToEdit(image: pickedFile)));
  }

  Future pickImageC() async {
    try {
      final image = await ImagePicker().pickImage(source: ImageSource.camera);

      if (image == null) return;

      final imageTemp = File(image.path);
    } on PlatformException catch (e) {
      print('Failed to pick image: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Background(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              pickImage(context);
            },
            child: Container(
              width: MediaQuery.of(context).size.width - 125,
              height: 50,
              decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
            ],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 1.0],
              colors: [
                Colors.purple.shade400,
                Colors.purple.shade200,
              ],
            ),
            color: Colors.deepPurple.shade300,
          ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.file_open_outlined,
                  ),
                  SizedBox(
                    width: 9,
                  ),
                  Text(
                    'Fotoğraf Arşivi',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            height: 13,
          ),
          InkWell(
            onTap: () {
              pickImageC();
            },
            child: Container(
              width: MediaQuery.of(context).size.width - 125,
              height: 50,
              decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(21),
            boxShadow: const [
              BoxShadow(
                  color: Colors.black26, offset: Offset(0, 4), blurRadius: 5.0)
            ],
            gradient: LinearGradient(
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
              stops: [0.0, 1.0],
              colors: [
                Colors.purple.shade400,
                Colors.purple.shade200,
              ],
            ),
            color: Colors.deepPurple.shade300,
          ),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: const [
                  Icon(
                    Icons.camera_alt_outlined,
                  ),
                  SizedBox(
                    width: 9,
                  ),
                  Text(
                    'Kamera',
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        color: Colors.white,
                        fontSize: 21,
                        fontWeight: FontWeight.w300),
                  ),
                ],
              ),
            ),
          ),
          const SizedBox(
            height: 20,
          ),
        ],
      ),
    ));
  }
}

