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
        body: Center(
          child: ClipPath(
            clipper: Figure1(),
            child: Container(
              width: 200,
              height: 200,
              color: Colors.pink,
            ),
          ),
        ),
      );
}

class Figure1 extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var controlPoint1 = Offset(50, size.height - 100);
    var controlPoint2 = Offset(size.width - 50, size.height);
    var endPoint = Offset(size.width, size.height - 50);

    Path path = Path()
      ..moveTo(size.width / 2, 0)
      ..lineTo(0, size.height - 50)
      ..cubicTo(controlPoint1.dx, controlPoint1.dy, controlPoint2.dx,
          controlPoint2.dy, endPoint.dx, endPoint.dy)
      ..close();

    // Path path = Path()
    //   ..moveTo(size.width, 70)
    //   ..quadraticBezierTo(size.width / 2, 0, 0, 70)
    //   ..quadraticBezierTo(70, 140, 0, size.height)
    //   // ..lineTo(0, size.height)
    //   ..lineTo(size.width, size.height)
    //   ..lineTo(size.width, 0)
    //   ..close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}
