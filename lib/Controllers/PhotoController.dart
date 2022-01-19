import 'package:get/state_manager.dart';
import 'package:my_flutter_photos_app/Models/Photos.dart';
import 'package:my_flutter_photos_app/Services/Remote Services.dart';

class PhotoController extends GetxController {
  var isLoading = true.obs;
  var photoList = List<Photos>().obs;

  @override
  void onInit() {
    fetchPhotos();
    super.onInit();
  }

  void fetchPhotos() async {
    isLoading(true);
    try {
      var photos = await RemoteServices.fetchPhotos();
      if(photos != null) {
        photoList.assignAll(photos);
      }
    }
    catch(Exception) {
      print(Exception);
    }
    finally {
      isLoading(false);
    }
  }
}