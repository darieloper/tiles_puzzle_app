import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_conditional_rendering/flutter_conditional_rendering.dart';
import 'package:get/get.dart';
import 'package:tiles_puzzle_app/data/repositories/pictures_repository.dart';
import 'package:tiles_puzzle_app/data/utils/constants.dart';
import 'package:tiles_puzzle_app/domain/entities/unsplash_picture.dart';
import 'package:tiles_puzzle_app/presentation/gallery/gallery_controller.dart';
import 'package:tiles_puzzle_app/presentation/utils/base/view.dart';
import 'package:tiles_puzzle_app/presentation/utils/blur_hash_image_generator.dart';
import 'package:flutter_staggered_animations/flutter_staggered_animations.dart';
import 'package:tiles_puzzle_app/presentation/widgets/app_bar.dart';
import 'package:tiles_puzzle_app/presentation/widgets/pair_toolbar_button.dart';

class GalleryPage extends View {
  final String title;

  GalleryPage({this.title = 'Gallery'});

  _GalleryPageState createState() => _GalleryPageState();
}

class _GalleryPageState extends ViewState<GalleryPage, GalleryController> {
  _GalleryPageState() : super(GalleryController(PicturesRepository()));

  @override
  Widget get view => Scaffold(
        appBar: CustomAppBar(title: widget.title),
        backgroundColor: ConstantColors.PRIMARY,
        body: Container(
            padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            height: Get.height,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(20),
                topLeft: Radius.circular(20),
              ),
            ),
            child: Conditional.single(
              context: context,
              conditionBuilder: (_) => controller.loading.value,
              widgetBuilder: (_) => Center(
                child: CircularProgressIndicator(),
              ),
              fallbackBuilder: (_) => Column(
                children: [
                  Container(
                    height: 40,
                    width: Get.width,
                    child: PairToolbarButtons(
                      firstButtonText: 'Random',
                      lastButtonText: 'From List',
                      onButtonChangeFocus: (isFirstSelected) {
                        controller.isFirstButtonSelected.value =
                            isFirstSelected;
                      },
                    ),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Expanded(
                    child: GridView.count(
                      crossAxisCount: 3,
                      crossAxisSpacing: 7,
                      mainAxisSpacing: 7,
                      children: List.generate(
                        controller.pictures.length,
                        (index) {
                          final element = controller.pictures.elementAt(index)
                              as UnsplashPicture;

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
                                      onTap: () =>
                                          controller.seePreview(element),
                                      child: FadeInImage(
                                        image: NetworkImage(element.urls.thumb),
                                        fit: BoxFit.fill,
                                        placeholder:
                                            BlurHashImageGenerator.generate(
                                                    element.blurHash,
                                                    Get.width / 3)
                                                .image,
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
                ],
              ),
            )),
        floatingActionButton: Obx(
          () => Visibility(
            visible: controller.loading.isFalse,
            child: AnimatedOpacity(
              opacity: controller.loading.isFalse &&
                      controller.isFirstButtonSelected.isTrue
                  ? 1
                  : 0,
              duration: const Duration(milliseconds: 300),
              child: FloatingActionButton(
                backgroundColor: ConstantColors.PRIMARY,
                onPressed: () {},
                tooltip: 'Refresh',
                child: RawMaterialButton(
                  padding: EdgeInsets.all(16),
                  shape: CircleBorder(side: BorderSide.none),
                  child: Icon(Icons.refresh),
                  onPressed: () {},
                ),
              ),
            ),
          ),
        ),
      );
}
