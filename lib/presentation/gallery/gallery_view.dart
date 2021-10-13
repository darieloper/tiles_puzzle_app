import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:get/get.dart';
import 'package:tiles_puzzle_app/data/repositories/pictures_repository.dart';
import 'package:tiles_puzzle_app/domain/entities/unsplash_picture.dart';
import 'package:tiles_puzzle_app/presentation/gallery/gallery_controller.dart';
import 'package:tiles_puzzle_app/presentation/utils/base/view.dart';
import 'package:tiles_puzzle_app/presentation/widgets/blur_hash_image.dart';

class GalleryPage extends View {
  final String title;

  GalleryPage({this.title = 'Gallery'});

  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends ViewState<GalleryPage, GalleryController> {
  _GalleryPageState() : super(GalleryController(PicturesRepository()));

  @override
  Widget get view => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          actions: [IconButton(onPressed: () {}, icon: Icon(Icons.search))],
        ),
        body: Obx(
          () => Conditional.single(
            context: context,
            conditionBuilder: (_) => controller.loading.value,
            widgetBuilder: (_) => Center(
              child: CircularProgressIndicator(),
            ),
            fallbackBuilder: (_) => GridView.count(
              crossAxisCount: 3,
              crossAxisSpacing: 7,
              mainAxisSpacing: 7,
              children: List.generate(
                controller.pictures.length,
                (index) {
                  final element =
                      controller.pictures.elementAt(index) as UnsplashPicture;

                  final blurWidget = BlurHashImage(
                    hash: element.blurHash,
                    width: Get.width / 3,
                  );
                  return Card(
                    shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10)),
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Image.network(
                        element.urls.thumb,
                        fit: BoxFit.fill,
                        loadingBuilder: (_, widget, loadingProgress) =>
                            loadingProgress == null ? widget : blurWidget,
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
        ),
      );
}
