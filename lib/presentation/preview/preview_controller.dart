import 'package:tiles_puzzle_app/presentation/utils/base/controller.dart';
import 'package:get/get.dart';

class PreviewController extends BaseController {
  var loadCompleted = false.obs;

  void loadComplete() {
    this.loadCompleted.value = true;
  }
}
