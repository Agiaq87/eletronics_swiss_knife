/// Class for resistors calculation

class ResistorCalculator {
  static int calculate ({required double VF, required int IF, double VI = 3.3}) {
    return  (((VF - VI) / IF ) * 1000).ceil();
  }
}