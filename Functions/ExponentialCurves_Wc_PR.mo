within PropulsionSystem.Functions;

function ExponentialCurves_Wc_PR
  extends Modelica.Icons.Function;
  
  //********** declare inputs **********
  //--- operational condition ---
  input Real Nc;
  input Real PRcurve;
  //--- constant number inputs ---
  input Real ka_Wc_0;
  input Real ka_Wc_1;
  input Real ka_Wc_2;
  input Real ka_Wc_3;
  input Real ka_Wc_4;
  input Real kb_Wc_0;
  input Real kb_Wc_1;
  input Real kb_Wc_2;
  input Real kb_Wc_3;
  input Real kb_Wc_4;
  //********** declare outputs **********
  output Real WcCurve;
protected
  //********** declare local variables **********
  Real WcChoke;
  Real kWc;
algorithm
//********** process **********
//----- coefficients -----
//--
  WcChoke := ka_Wc_0 + ka_Wc_1 * Nc + ka_Wc_2 * Nc ^ 2.0 + ka_Wc_3 * Nc ^ 3.0 + ka_Wc_4 * Nc ^ 4.0;
  kWc := kb_Wc_0 + kb_Wc_1 * Nc + kb_Wc_2 * Nc ^ 2.0 + kb_Wc_3 * Nc ^ 3.0 + kb_Wc_4 * Nc ^ 4.0;
//----- PR-Wc-Nc parametric equation -----
  WcCurve := WcChoke - WcChoke * exp(-(PRcurve - 1.0) / kWc);

end ExponentialCurves_Wc_PR;
