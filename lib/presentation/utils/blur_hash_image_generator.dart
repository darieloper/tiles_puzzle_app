import 'dart:typed_data';

import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:image/image.dart' as imageUtils;

class BlurHashImageGenerator {
  static Image generate(String hash, double width, {double? height}) {
    final image = BlurHash.decode(hash).toImage(
      width.toInt(),
      height == null ? width.toInt() : height.toInt(),
    );
    return Image.memory(
      Uint8List.fromList(imageUtils.encodeJpg(image)),
      fit: BoxFit.cover,
    );
  }
}
