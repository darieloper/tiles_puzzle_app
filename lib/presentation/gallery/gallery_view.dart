import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:get/get.dart';
import 'package:tiles_puzzle_app/data/repositories/pictures_repository.dart';
import 'package:tiles_puzzle_app/domain/entities/unsplash_picture.dart';
import 'package:tiles_puzzle_app/presentation/gallery/gallery_controller.dart';
import 'package:tiles_puzzle_app/presentation/utils/base/view.dart';
import 'package:tiles_puzzle_app/presentation/utils/blur_hash_image_generator.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';

class GalleryPage extends View {
  final String title;

  GalleryPage({this.title = 'Gallery'});

  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends ViewState<GalleryPage, GalleryController>
    with SingleTickerProviderStateMixin {
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

                  return AnimationConfiguration.staggeredGrid(
                    position: index,
                    columnCount: Get.height > Get.width ? 3 : 5,
                    duration: Duration(milliseconds: 2000),
                    child: ScaleAnimation(
                      child: FadeInAnimation(
                        child: Card(
                          color: Colors.transparent,
                          elevation: 2,
                          shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10)),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: GestureDetector(
                              onTap: () => controller.seePreview(element),
                              child: Hero(
                                tag: element.id,
                                child: FadeInImage(
                                  image: NetworkImage(element.urls.thumb),
                                  fit: BoxFit.fill,
                                  placeholder: BlurHashImageGenerator.generate(
                                          element.blurHash, Get.width / 3)
                                      .image,
                                ),
                              ),
                            ),
                          ),
                        ),
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
