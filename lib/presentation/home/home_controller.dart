import 'package:get/get.dart';

class HomeController extends GetxController {
  String label = 'Pressed: ';
  var counter = 0.obs;

  HomeController();

  increment() {
    counter.value++;
  }
}
