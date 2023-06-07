
import 'package:image_picker/image_picker.dart';

class uploadImageClass{

  Future<String?> getImage({required bool gallery}) async {
    final ImagePicker picker = ImagePicker();
    XFile? pickedFile;
    //Let user select photo from gallery
    if (gallery) {
      pickedFile = await
      picker.pickImage(
        source: ImageSource.gallery,
      );
      print(pickedFile?.path.toString());
      return pickedFile!.path;
      //imagePath.value = pickedFile!.path;
    }
    //Otherwise open camera to get new photo
    else {
      pickedFile = await picker.pickImage(
        source: ImageSource.gallery,
      );
    }
  }


}