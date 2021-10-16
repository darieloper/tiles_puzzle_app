import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiles_puzzle_app/data/utils/constants.dart';
import 'package:tiles_puzzle_app/presentation/preview/preview_controller.dart';
import 'package:tiles_puzzle_app/presentation/utils/base/view.dart';
import 'package:tiles_puzzle_app/presentation/utils/blur_hash_image_generator.dart';
import 'package:tiles_puzzle_app/presentation/widgets/app_bar.dart';

class PreviewPage extends View {
  final String title;
  final String id;
  final String imageUrl;
  final String blurHash;
  final String author;
  final String? location;

  PreviewPage({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.blurHash,
    required this.author,
    required this.location,
  });

  @override
  _PreviewPageState createState() => _PreviewPageState();
}

class _PreviewPageState extends ViewState<PreviewPage, PreviewController> {
  _PreviewPageState() : super(PreviewController());

  @override
  Widget get view => Scaffold(
        appBar: CustomAppBar(),
        backgroundColor: ConstantColors.PRIMARY,
        body: Stack(
          clipBehavior: Clip.none,
          children: [
            Positioned(
              left: 0,
              top: 0,
              child: Hero(
                tag: widget.id,
                child: ClipRRect(
                  borderRadius: BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(20),
                  ),
                  child: FadeInImage(
                    image: NetworkImage(widget.imageUrl),
                    fit: BoxFit.fill,
                    width: Get.width,
                    height: Get.height,
                    placeholder: BlurHashImageGenerator.generate(
                            widget.blurHash, Get.width)
                        .image,
                  ),
                ),
              ),
            ),
            Positioned(
              bottom: 0,
              left: 0,
              right: 0,
              child: Obx(
                () => AnimatedOpacity(
                  opacity: controller.loadCompleted.value ? 1 : 0,
                  duration: const Duration(seconds: 1),
                  curve: Curves.easeIn,
                  child: ClipRect(
                    child: new BackdropFilter(
                      filter: new ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
                      child: new Container(
                        padding:
                            EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                        decoration: new BoxDecoration(
                            color: Colors.grey.shade200.withOpacity(0.4)),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            new Text(
                              'Author: ${widget.author}',
                              style: TextStyle(fontSize: 16),
                            ),
                            SizedBox(
                              height: 5,
                            ),
                            new Text(
                              'Location: ${widget.location ?? 'Unknow'}',
                              style: TextStyle(fontSize: 16),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      );
}
