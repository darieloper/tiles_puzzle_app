import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiles_puzzle_app/presentation/home/home_controller.dart';
import 'package:tiles_puzzle_app/presentation/utils/base/view.dart';
import 'package:tiles_puzzle_app/presentation/widgets/app_bar.dart';

class HomePage extends View {
  final String title;

  HomePage({this.title = 'Home'});

  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ViewState<HomePage, HomeController> {
  _HomePageState() : super(HomeController());

  @override
  Widget get view => Scaffold(
        appBar: CustomAppBar(
          title: widget.title,
        ),
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ObxValue((RxInt data) => Text(controller.label + data.string),
                controller.counter),
            SizedBox(
              height: 20,
              width: double.infinity,
            ),
            ElevatedButton(
                onPressed: controller.increment, child: Text('Increment'))
          ],
        ),
      );
}
