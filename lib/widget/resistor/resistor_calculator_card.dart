import 'package:eletronics_swiss_knife/constant/color_constants.dart';
import 'package:eletronics_swiss_knife/constant/elevation_constants.dart';
import 'package:flutter/material.dart';

class ResistorCalculatorCard extends StatelessWidget {
  const ResistorCalculatorCard({super.key});

  @override
  Widget build(BuildContext context) => Card(
    shadowColor: ColorConstants.shadow,
    elevation: ElevationConstants.standard,
  );
}
