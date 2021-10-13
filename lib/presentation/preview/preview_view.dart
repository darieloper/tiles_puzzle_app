import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiles_puzzle_app/presentation/preview/preview_controller.dart';
import 'package:tiles_puzzle_app/presentation/utils/base/view.dart';
import 'package:tiles_puzzle_app/presentation/widgets/blur_hash_image.dart';

class PreviewPage extends View {
  final String title;
  final String id;
  final String imageUrl;
  final String blurHash;
  final String author;

  PreviewPage({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.blurHash,
    required this.author,
  });

  @override
  _PreviewPageState createState() => _PreviewPageState();
}

class _PreviewPageState extends ViewState<PreviewPage, PreviewController> {
  _PreviewPageState() : super(PreviewController());

  @override
  Widget get view => Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          leading: BackButton(),
        ),
        body: Hero(
          tag: widget.id,
          child: Stack(
            children: [
              Positioned(
                left: 0,
                top: 0,
                child: Image.network(widget.imageUrl,
                    fit: BoxFit.fill,
                    width: Get.width,
                    height: Get.height, loadingBuilder:
                        (_, _widget, ImageChunkEvent? loadingProgress) {
                  print([
                    loadingProgress?.cumulativeBytesLoaded,
                    loadingProgress?.expectedTotalBytes
                  ]);
                  // @Todo check this print show twice which means that if both time is null
                  // the images is currently loaded from cache
                  if ((loadingProgress != null &&
                          loadingProgress.cumulativeBytesLoaded ==
                              loadingProgress.expectedTotalBytes) ||
                      loadingProgress == null) {
                    Future.delayed(const Duration(milliseconds: 200),
                        () => controller.loadComplete());
                  }
                  return loadingProgress == null
                      ? _widget
                      : Container(
                          width: Get.width,
                          height: Get.height,
                          child: Center(
                            child: SizedBox(
                              width: 35,
                              height: 35,
                              child: CircularProgressIndicator(),
                            ),
                          ),
                        );
                }),
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
                    child: new ClipRect(
                      child: new BackdropFilter(
                        filter: new ImageFilter.blur(sigmaX: 7.0, sigmaY: 7.0),
                        child: new Container(
                          padding: EdgeInsets.symmetric(
                              vertical: 20, horizontal: 20),
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
                                'Location: ${widget.author}',
                                style: TextStyle(fontSize: 16),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              )
            ],
          ),
        ),
      );
}
