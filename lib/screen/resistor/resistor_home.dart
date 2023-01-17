import 'package:eletronics_swiss_knife/constant/title_constants.dart';
import 'package:eletronics_swiss_knife/widget/resistor/resistor_calculator_card.dart';
import 'package:flutter/material.dart';

class ResistorHome extends StatefulWidget {

  const ResistorHome({super.key});

  @override
  State<StatefulWidget> createState() => _ResistorHomeState();

}

class _ResistorHomeState extends State<ResistorHome> {
  @override
  Widget build(BuildContext context) => Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(TitleConstants.resistorHome),
      ),
      body: Center(
        child: ResistorCalculatorCard()
      )
  );
}