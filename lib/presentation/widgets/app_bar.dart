import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tiles_puzzle_app/data/utils/constants.dart';
import 'dart:math' as math;

class CustomAppBar extends StatelessWidget implements PreferredSize {
  final Size _preferredSize;
  final String title;

  CustomAppBar({required this.title}) : _preferredSize = Size.fromHeight(140);

  @override
  Widget build(BuildContext context) {
    return Container(
        height: _preferredSize.height,
        width: Get.width,
        color: ConstantColors.PRIMARY,
        child: Stack(
          children: [
            Positioned(
              left: -45,
              top: -20,
              child: Transform.rotate(
                angle: 45 * math.pi / 180,
                child: SvgPicture.asset(
                  'assets/svgs/blob-haikei.svg',
                  width: 120,
                  height: 120,
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
            Positioned(
              right: -50,
              top: -40,
              child: Transform.rotate(
                angle: 90 * math.pi / 180,
                child: SvgPicture.asset(
                  'assets/svgs/blob-haikei-2.svg',
                  width: 130,
                  height: 130,
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
            Positioned(
              right: 0,
              bottom: -70,
              child: Transform.rotate(
                angle: 0 * math.pi / 180,
                child: SvgPicture.asset(
                  'assets/svgs/blob-haikei-2.svg',
                  width: 120,
                  height: 120,
                  color: Colors.white.withOpacity(0.1),
                ),
              ),
            ),
            Positioned.fill(
              left: 0,
              top: 0,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  RawMaterialButton(
                    onPressed: () => Get.back(),
                    child: Padding(
                      padding: EdgeInsets.all(5),
                      child: Icon(
                        Icons.arrow_back,
                        color: Colors.white,
                      ),
                    ),
                    constraints: BoxConstraints(),
                    shape: CircleBorder(),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        title,
                        style: TextStyle(color: Colors.white, fontSize: 22),
                      )
                    ],
                  )
                ],
              ),
            ),
          ],
        ));
  }

  @override
  Widget get child => SizedBox.shrink();

  @override
  Size get preferredSize => _preferredSize;
}
