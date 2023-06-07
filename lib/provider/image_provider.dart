import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';

class ImagesProvider extends ChangeNotifier {
  XFile? imageXFile;

  Future<void> pickImage() async {
    final picker = ImagePicker();
    final pickedImage = await picker.pickImage(source: ImageSource.gallery);
    imageXFile = pickedImage;
    notifyListeners();
  }
}
