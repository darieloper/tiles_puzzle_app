import 'package:get/get.dart';
import 'package:tiles_puzzle_app/data/repositories/pictures_repository.dart';

class HomeController extends GetxController {
  String label = 'Pressed: ';
  var counter = 0.obs;

  HomeController();

  increment() async {
    counter.value++;
    final result = await PicturesRepository().random();
    print(result.elementAt(0));
  }
}
