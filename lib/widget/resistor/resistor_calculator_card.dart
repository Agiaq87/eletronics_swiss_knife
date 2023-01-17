import 'package:eletronics_swiss_knife/constant/border_radius_constants.dart';
import 'package:eletronics_swiss_knife/constant/color_constants.dart';
import 'package:eletronics_swiss_knife/constant/elevation_constants.dart';
import 'package:eletronics_swiss_knife/constant/formula_constants.dart';
import 'package:eletronics_swiss_knife/constant/margin_constants.dart';
import 'package:eletronics_swiss_knife/model/resistor_calculator.dart';
import 'package:eletronics_swiss_knife/widget/latex/latex_widget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_math_fork/flutter_math.dart';

class ResistorCalculatorCard extends StatefulWidget {

  const ResistorCalculatorCard({super.key});

  @override
  State<ResistorCalculatorCard> createState() => _ResistorCalculatorCardState();
}

class _ResistorCalculatorCardState extends State<ResistorCalculatorCard> {
  double _vf = 0.0;
  double _vi = 0.0;
  int _i = 1;
  int _result = 0;

  @override
  Widget build(BuildContext context) => Card(
        shape: ContinuousRectangleBorder(
            borderRadius: BorderRadiusConstants.standard),
        shadowColor: ColorConstants.shadow,
        elevation: ElevationConstants.standard,
        margin: MarginConstants.standard,
        child: ClipPath(
          clipper: ShapeBorderClipper(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8.0))),
          child: Container(
            padding: const EdgeInsets.all(8.0),
            decoration: BoxDecoration(
                border: Border(
                    left:
                        BorderSide(color: ColorConstants.primary, width: 5.0))),
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  mainAxisSize: MainAxisSize.min,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Center(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                LatexWidget(
                                    formula: FormulaConstants.VF
                                ),
                                const LatexWidget(),
                                SizedBox(
                                  width: 100,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    onChanged: (text) async {
                                      _updateVolt(true, double.tryParse(text.replaceAll(",", ".")) ?? 0.0);
                                    },
                                    decoration: const InputDecoration(
                                      isDense: true,
                                      contentPadding:
                                          EdgeInsets.fromLTRB(12, 12, 12, 12),
                                      // control your hints text size
                                      hintStyle: TextStyle(
                                          letterSpacing: 2,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold),
                                      border: OutlineInputBorder(),
                                    ),
                                    maxLines: 1,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Row(
                              children: [
                                LatexWidget(
                                    formula: FormulaConstants.VI
                                ),
                                const LatexWidget(),
                                SizedBox(
                                  width: 100,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    onChanged: (text) async {
                                      _updateVolt(false, double.tryParse(text.replaceAll(",", ".")) ?? 0.0);
                                    },
                                    decoration: const InputDecoration(
                                      isDense: true,
                                      contentPadding:
                                          EdgeInsets.fromLTRB(12, 12, 12, 12),
                                      // control your hints text size
                                      hintStyle: TextStyle(
                                          letterSpacing: 2,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold),
                                      border: OutlineInputBorder(),
                                    ),
                                    maxLines: 1,
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: const EdgeInsets.only(
                                left: 16.0, top: 8.0, right: 8.0, bottom: 8.0),
                            child: Row(
                              children: [
                                LatexWidget(
                                    formula: FormulaConstants.I
                                ),
                                const LatexWidget(),
                                SizedBox(
                                  width: 100,
                                  child: TextField(
                                    keyboardType: TextInputType.number,
                                    onChanged: (text) async {
                                      _updateCurrent(int.tryParse(text.replaceAll(",", ".")) ?? 1);
                                    },
                                    decoration: const InputDecoration(
                                      isDense: true,
                                      contentPadding:
                                          EdgeInsets.fromLTRB(12, 12, 12, 12),
                                      // control your hints text size
                                      hintStyle: TextStyle(
                                          letterSpacing: 2,
                                          color: Colors.black54,
                                          fontWeight: FontWeight.bold),
                                      border: OutlineInputBorder(),
                                    ),
                                    maxLines: 1,
                                  ),
                                )
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    LatexWidget(
                      formula: FormulaConstants.resistorFormula,
                    ),
                    const Icon(
                      Icons.arrow_right_alt,
                    ),
                    Padding(
                        padding: const EdgeInsets.all(8.0),
                        child:
                        Text(
                            "$_result",
                          style: TextStyle(
                            color: ColorConstants.primary,
                            fontWeight: FontWeight.bold
                          ),
                        )
                    ),
                    LatexWidget(
                        formula: FormulaConstants.OMEGA,
                        style: TextStyle(
                          color: ColorConstants.primary,
                          fontWeight: FontWeight.bold
                        ),
                      margin: MarginConstants.none,
                    )
                  ],
                )
              ],
            ),
          ),
        ),
      );

  void _updateVolt(bool isVF, double value) async {
    isVF ? _vf = value : _vi = value;
    setState(() {
      _result = ResistorCalculator.calculate(VF: _vf, IF: _i, VI: _vi);
    });
  }

  void _updateCurrent(int value) async {
    _i = value;
    setState(() {
      _result = ResistorCalculator.calculate(VF: _vf, IF: _i, VI: _vi);
    });
  }
}
