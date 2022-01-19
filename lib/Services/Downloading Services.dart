import 'package:my_flutter_photos_app/Models/Photos.dart';
import 'package:url_launcher/url_launcher.dart';

class DownloadingServices {
  static askPermission() {}

  static getDirectory() {}

  static downloadFile() {}

  static launchURL(Photos photo) async {
    var url = photo.url;
    if (await canLaunch(url)) {
      await launch(url);
    } else {
      throw 'Could not launch $url';
    }
  }
}
