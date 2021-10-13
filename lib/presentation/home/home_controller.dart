import 'package:get/get.dart';
import 'package:tiles_puzzle_app/data/repositories/pictures_repository.dart';
import 'package:tiles_puzzle_app/presentation/utils/base/controller.dart';

class HomeController extends BaseController {
  String label = 'Pressed: ';
  var counter = 0.obs;

  HomeController() : super();

  increment() async {
    counter.value++;
    final result = await PicturesRepository().random();
    print(result.elementAt(0));
  }
}
