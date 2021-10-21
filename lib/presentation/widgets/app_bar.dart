import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:tiles_puzzle_app/data/utils/constants.dart';
import 'dart:math' as math;

import 'package:tiles_puzzle_app/presentation/widgets/badge.dart';

class CustomAppBar extends StatefulWidget implements PreferredSizeWidget {
  final String title;
  final String? subTitle;
  final Size _preferredSize;
  final bool expanded;
  final List<Widget>? actions;

  CustomAppBar({
    required this.title,
    this.expanded = false,
    this.subTitle,
    this.actions,
  }) : _preferredSize = Size.fromHeight(expanded ? 170 : 140);

  @override
  _CustomAppBarState createState() => _CustomAppBarState();

  @override
  Size get preferredSize => _preferredSize;
}

class _CustomAppBarState extends State<CustomAppBar>
    with SingleTickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return AnimatedSize(
      duration: const Duration(milliseconds: 300),
      vsync: this,
      child: Container(
        height: widget.preferredSize.height,
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
            Visibility(
              visible: widget.expanded,
              child: Positioned(
                left: 50,
                right: 50,
                bottom: 15,
                child: Container(
                  width: Get.width / 1.5,
                  height: 40,
                  child: TextField(
                    decoration: InputDecoration(
                      prefixIcon: Icon(Icons.search),
                      prefixIconConstraints:
                          BoxConstraints(maxWidth: 50, minWidth: 40),
                      fillColor: Colors.white,
                      filled: true,
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                      contentPadding: EdgeInsets.all(10),
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
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
                  Expanded(
                    child: Padding(
                      padding: EdgeInsets.only(
                        top: (widget.subTitle?.length ?? 0) > 50 ? 20 : 0,
                        right: 40,
                      ),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Text(
                            widget.title,
                            style: TextStyle(
                              fontFamily: 'Riffic',
                              color: Colors.white,
                              fontSize: 22,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          SizedBox(height: widget.subTitle != null ? 10 : 0),
                          Visibility(
                            visible: widget.subTitle != null,
                            child: Container(
                              width: Get.width - 100,
                              child: Text(
                                widget.subTitle ?? '',
                                overflow: TextOverflow.ellipsis,
                                maxLines: 2,
                                style: TextStyle(
                                  fontFamily: 'KGPartofMe',
                                  color: Colors.white,
                                  fontSize: 17,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                  Visibility(
                    visible: widget.actions != null,
                    child: Expanded(
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [...widget.actions ?? []],
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
