import 'package:flutter/cupertino.dart';
import 'package:tiles_puzzle_app/presentation/utils/base/controller.dart';
import 'package:get/get.dart';

class PreviewController extends BaseController {
  var loadCompleted = false.obs;

  PreviewController() {
    WidgetsBinding.instance?.addPostFrameCallback((timeStamp) async {
      await Future.delayed(const Duration(milliseconds: 200));
      loadCompleted.value = true;
    });
  }

  void loadComplete() {
    this.loadCompleted.value = true;
  }
}
