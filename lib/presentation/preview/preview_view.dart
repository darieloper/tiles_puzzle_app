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

  PreviewPage({
    required this.id,
    required this.title,
    required this.imageUrl,
    required this.blurHash,
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
          child: Image.network(widget.imageUrl, fit: BoxFit.fill,
              loadingBuilder: (_, _widget, loadingProgress) {
            return loadingProgress == null
                ? _widget
                : BlurHashImage(hash: widget.blurHash, width: Get.width);
          }),
        ),
      );
}
