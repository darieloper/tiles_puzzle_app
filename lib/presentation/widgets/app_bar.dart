import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:tiles_puzzle_app/data/utils/constants.dart';

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
    );
  }

  @override
  Widget get child => SizedBox.shrink();

  @override
  Size get preferredSize => _preferredSize;
}
