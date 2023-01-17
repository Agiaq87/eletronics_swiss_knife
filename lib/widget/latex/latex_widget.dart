import 'package:eletronics_swiss_knife/constant/formula_constants.dart';
import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';
import '../../constant/margin_constants.dart';

class LatexWidget extends StatelessWidget {
  final String? formula;
  final TextStyle? style;
  final EdgeInsets? margin;

  const LatexWidget({
    super.key,
    this.formula,
    this.style,
    this.margin
  });

  @override
  Widget build(BuildContext context) => Container(
      margin: margin ?? MarginConstants.standard,
      child: Math.tex(
        formula ?? FormulaConstants.EQ,
        mathStyle: MathStyle.display,
        textStyle: style,
        textScaleFactor: 1.1,
      )
  );
}
