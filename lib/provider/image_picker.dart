import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class PickedImage extends ChangeNotifier {
  File? imageFile;

  Future chooseImage() async {
    ImagePicker picker = ImagePicker();

    var tempimage = await picker.pickImage(source: ImageSource.gallery);
    imageFile = File(tempimage!.path);
  }
}
