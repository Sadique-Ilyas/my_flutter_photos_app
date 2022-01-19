import 'package:http/http.dart' as http;
import 'package:my_flutter_photos_app/Models/Photos.dart';

class RemoteServices {
  static var client = http.Client();

  static Future<List<Photos>> fetchPhotos() async {
    try {
      var response =
          await client.get('https://picsum.photos/v2/list?page=1&limit=10');

      if (response.statusCode == 200) {
        var jsonString = response.body;
        return photosFromJson(jsonString);
      } else {
        // Show Error Message
        return null;
      }
    } on Exception catch (e) {
      print(e.toString());
    }
    return null;
  }
}
