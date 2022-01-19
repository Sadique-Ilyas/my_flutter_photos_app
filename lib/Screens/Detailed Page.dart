import 'dart:io';
import 'dart:ui';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_photos_app/Models/Photos.dart';
import 'package:my_flutter_photos_app/Services/Downloading%20Services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class DetailedPage extends StatefulWidget {
  @override
  _DetailedPageState createState() => _DetailedPageState();
}

class _DetailedPageState extends State<DetailedPage> {
  var photo = Photos();
  Directory directory;

  @override
  void initState() {
    photo = Get.arguments;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          elevation: 0,
          iconTheme: IconThemeData(
            color: Colors.white,
          ),
          backgroundColor: Colors.transparent,
          textTheme: TextTheme(
              headline6: TextStyle(
            color: Colors.white,
          )),
          centerTitle: true,
          title: Text('Lorem Piscum',
              style: GoogleFonts.pacifico(fontSize: 20, shadows: <Shadow>[
                Shadow(color: Colors.grey, offset: Offset(0, 0))
              ])),
        ),
        extendBodyBehindAppBar: true,
        body: Stack(
          fit: StackFit.expand,
          children: [
            CachedNetworkImage(
              imageUrl: "${photo.downloadUrl}",
              fit: BoxFit.cover,
            ),
            BackdropFilter(
                filter: ImageFilter.blur(sigmaX: 5.0, sigmaY: 5.0),
                child: new Container(
                  color: Colors.black.withOpacity(0.5),
                )),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  SizedBox(
                      height: AppBar().preferredSize.height +
                          MediaQuery.of(context).padding.top),
                  CachedNetworkImage(
                    imageUrl: photo.downloadUrl,
                    fit: BoxFit.contain,
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Column(
                    children: [
                      Row(
                        children: [
                          Text(
                            "Author: ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontStyle: FontStyle.italic),
                          ),
                          Text(
                            photo.author,
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontStyle: FontStyle.italic),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Image Dimension: ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontStyle: FontStyle.italic),
                          ),
                          Text(
                            "${photo.width}*${photo.height}",
                            style: TextStyle(
                                fontSize: 18,
                                color: Colors.white,
                                fontStyle: FontStyle.italic),
                          )
                        ],
                      ),
                      Row(
                        children: [
                          Text(
                            "Url: ",
                            style: TextStyle(
                                color: Colors.white,
                                fontSize: 18,
                                fontStyle: FontStyle.italic),
                          ),
                          Flexible(
                            child: RichText(
                              overflow: TextOverflow.ellipsis,
                              text: TextSpan(
                                  text: "${photo.url}",
                                  style: TextStyle(
                                      color: Colors.lightBlueAccent,
                                      fontSize: 18.0,
                                      decoration: TextDecoration.underline,
                                      fontStyle: FontStyle.italic),
                                  recognizer: TapGestureRecognizer()
                                    ..onTap = () {
                                      DownloadingServices.launchURL(photo);
                                    }),
                            ),
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 20,
                      ),
                      RaisedButton(
                        shape: RoundedRectangleBorder(
                            borderRadius:
                                BorderRadius.all(Radius.circular(10))),
                        onPressed: () {},
                        color: Colors.blue[700],
                        child: Text('Download Image',
                            style: TextStyle(
                              color: Colors.white,
                            )),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ));
  }
}
