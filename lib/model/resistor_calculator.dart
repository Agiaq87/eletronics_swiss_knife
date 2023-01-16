/// Class for resistors calculation

class ResistorCalculator {
  static Future<int> calculate (double VF, int IF, {double VI = 3.3}) async {
    return  (VF - VI)~/IF;
  }
}