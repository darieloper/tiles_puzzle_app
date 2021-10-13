import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

abstract class View extends StatefulWidget {}

abstract class ViewState<Page extends StatefulWidget,
    Controller extends GetxController> extends State<Page> {
  final Controller controller;
  ViewState(this.controller);

  Widget get view;

  @override
  Widget build(BuildContext context) {
    return this.view;
  }
}
