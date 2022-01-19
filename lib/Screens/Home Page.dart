import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/painting.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';
import 'package:get/get.dart';
import 'package:get/instance_manager.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:my_flutter_photos_app/Screens/Detailed%20Page.dart';
import 'package:my_flutter_photos_app/controllers/PhotoController.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final PhotoController photoController = Get.put(PhotoController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          leading: Row(
            children: [
              SizedBox(
                width: 15,
              ),
              Column(
                mainAxisAlignment: MainAxisAlignment.end,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Container(
                    width: 20,
                    height: 2,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    width: 15,
                    height: 2,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 4,
                  ),
                  Container(
                    width: 10,
                    height: 2,
                    color: Colors.black,
                  ),
                  SizedBox(
                    height: 20,
                  ),
                ],
              ),
            ],
          ),
          backgroundColor: Colors.white,
          textTheme: TextTheme(headline6: TextStyle(color: Colors.black)),
          centerTitle: true,
          title: Text('Lorem Piscum',
              style: GoogleFonts.pacifico(fontSize: 20, shadows: <Shadow>[
                Shadow(color: Colors.grey, offset: Offset(0, 0))
              ])),
        ),
        body: Obx(() {
          if (photoController.isLoading.value) {
            return Center(child: CircularProgressIndicator());
          } else {
            return StaggeredGridView.countBuilder(
                itemCount: photoController.photoList.length,
                padding: EdgeInsets.all(10),
                crossAxisCount: 2,
                crossAxisSpacing: 10,
                mainAxisSpacing: 10,
                itemBuilder: (context, index) {
                  return InkWell(
                    onTap: () {
                      Get.to(DetailedPage(), arguments: photoController.photoList[index]);
                    },
                    child: Card(
                        child: CachedNetworkImage(
                            imageUrl:
                                "${photoController.photoList[index].downloadUrl}")),
                  );
                },
                staggeredTileBuilder: (index) {
                  return StaggeredTile.fit(1);
                });
          }
        }));
  }
}
