class FormulaConstants {

  static String EQ = r'=';

  static String VF = r'V_F';
  static String VI = r'V_I';
  static String I = r'I';
  static String OMEGA = r'\Omega';

  static String resistorFormula = r'\frac{V_F - V_I}{I}';

  static String suggestedResistor(final String nearest) => r'Suggested: ' + nearest + '\Omega';


}