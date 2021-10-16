import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tiles_puzzle_app/data/utils/constants.dart';

class PairToolbarButtons extends StatefulWidget {
  final String firstButtonText;
  final String lastButtonText;
  final ValueChanged<bool> onButtonChangeFocus;

  PairToolbarButtons({
    required this.firstButtonText,
    required this.lastButtonText,
    required this.onButtonChangeFocus,
  });

  @override
  _PairToolbarButtonsState createState() => _PairToolbarButtonsState();
}

class _PairToolbarButtonsState extends State<PairToolbarButtons> {
  bool _isFirstSelected = true;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        RawMaterialButton(
          onPressed: () {
            _toggleActiveButton(true);
          },
          elevation: 0,
          child: Text(
            widget.firstButtonText,
            style: TextStyle(
              color: _textColor(true),
              fontWeight: _textWeight(true),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10),
              bottomLeft: Radius.circular(10),
            ),
            side: _borderSideForButton(true),
          ),
          fillColor: _firstButtonColor(true),
        ),
        RawMaterialButton(
          elevation: 0,
          onPressed: () {
            _toggleActiveButton(false);
          },
          child: Text(
            widget.lastButtonText,
            style: TextStyle(
              color: _textColor(false),
              fontWeight: _textWeight(false),
            ),
          ),
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(10),
              bottomRight: Radius.circular(10),
            ),
            side: _borderSideForButton(false),
          ),
          fillColor: _firstButtonColor(false),
        ),
      ],
    );
  }

  Color? _firstButtonColor(bool isFirstSelected) =>
      isFirstSelected == _isFirstSelected ? ConstantColors.BTN_PRIMARY : null;

  BorderSide _borderSideForButton(bool isFirstSelected) => isFirstSelected
      ? BorderSide.none
      : BorderSide(color: Colors.grey.shade300);

  Color _textColor(bool isFirstSelected) => isFirstSelected == _isFirstSelected
      ? Colors.white
      : ConstantColors.BTN_PRIMARY;

  FontWeight _textWeight(bool isFirstSelected) =>
      isFirstSelected == _isFirstSelected ? FontWeight.bold : FontWeight.normal;

  void _toggleActiveButton(bool toValue) {
    if (toValue == _isFirstSelected) {
      return;
    }

    setState(() {
      _isFirstSelected = !_isFirstSelected;
    });

    widget.onButtonChangeFocus(_isFirstSelected);
  }
}
