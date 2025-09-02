import 'package:flutter/cupertino.dart';
import 'package:image_picker/image_picker.dart';

class ImageViewModel extends ChangeNotifier {
  String? selectedImagePath;
  bool isLoading = false;

  void selectedImage(bool toGallery) async {
    isLoading = true;
    notifyListeners();

    ImagePicker picker = ImagePicker();
    XFile? img;
    if (toGallery) {
      img = await picker.pickImage(source: ImageSource.gallery);
    } else {
      img = await picker.pickImage(source: ImageSource.camera);
    }

    if (img != null) {
      selectedImagePath = img.path;
    }
    
    isLoading = false;
    notifyListeners();
  }
}
