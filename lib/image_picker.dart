import 'package:image_picker/image_picker.dart';
class PickMyImage {
    final ImagePicker _picker = ImagePicker();
  XFile? file;

  Future<void> pickImageFromGallery() async {
    final XFile? photo = await _picker.pickImage(source: ImageSource.gallery);
    file = photo;
  }
}
