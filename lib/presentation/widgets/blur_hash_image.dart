import 'dart:typed_data';

import 'package:blurhash_dart/blurhash_dart.dart';
import 'package:flutter/cupertino.dart';
import 'package:image/image.dart' as imageUtils;

class BlurHashImage extends StatelessWidget {
  final String hash;
  final double width;

  BlurHashImage({
    required this.hash,
    required this.width,
  });

  Widget build(BuildContext context) {
    final image = BlurHash.decode(hash).toImage(width.toInt(), width.toInt());
    return Image.memory(Uint8List.fromList(imageUtils.encodeJpg(image)));
  }
}
