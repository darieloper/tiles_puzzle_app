import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiles_puzzle_app/data/utils/constants.dart';

class Badge extends StatelessWidget {
  final String label;
  final IconData icon;
  final double iconSize;
  final Color? iconColor;
  final Color? badgeColor;

  Badge({
    required this.label,
    required this.icon,
    this.iconColor = Colors.white,
    this.iconSize = 24,
    this.badgeColor = ConstantColors.SECONDARY,
  });

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 50,
      height: 56,
      child: Stack(
        children: [
          Positioned(
            left: 0,
            bottom: 0,
            child: Icon(
              icon,
              color: iconColor,
              size: iconSize,
            ),
          ),
          Positioned(
            right: 0,
            top: -7,
            child: Chip(
              elevation: 2,
              backgroundColor: badgeColor,
              label: Text(
                label,
                style: TextStyle(
                  color: iconColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 13,
                ),
              ),
              padding: EdgeInsets.all(0),
            ),
          )
        ],
      ),
    );
  }
}
