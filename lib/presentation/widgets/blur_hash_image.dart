import 'package:flutter/cupertino.dart';
import 'package:tiles_puzzle_app/presentation/utils/blur_hash_image_generator.dart';
import 'package:get/get.dart';

class BlurHashImage extends StatelessWidget {
  final String hash;
  final double width;

  BlurHashImage({
    required this.hash,
    required this.width,
  });

  Widget build(BuildContext context) {
    return BlurHashImageGenerator.generate(hash, width, height: Get.height);
  }
}
