
import 'package:flutter/material.dart';
import '../../constant/color_constants.dart';

class CardTitleDecoration extends StatelessWidget {

  final String title;

  const CardTitleDecoration({
    super.key,
    required this.title
  });

  @override
  Widget build(BuildContext context) => Container(
    margin: const EdgeInsets.only(
      top: 2.0,
      right: 0.0,
      bottom: 2.0,
      left: 0.0
    ),
    padding: const EdgeInsets.all(8.0),
    decoration: BoxDecoration(
        color: ColorConstants.primary,
        border: Border.all(width: 0.0),
        borderRadius: const BorderRadius.only(
          topLeft: Radius.circular(5.0),
          topRight: Radius.circular(5.0),
        )
    ),
    child: Text(
      title,
      style: TextStyle(
          color: ColorConstants.titleString
      ),
    ),
  );

}