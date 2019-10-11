within PropulsionSystem.Functions;

function EllipticalCurves_PR_Wc
  extends Modelica.Icons.Function;
  //********** declare inputs **********
  //--- operational condition ---
  input Real Nc;
  input Real theta;
  //--- constant numbers ---
  input Real ka_PR_0;
  input Real ka_PR_1;
  input Real ka_PR_2;
  input Real ka_PR_3;
  input Real ka_PR_4;
  input Real kb_PR_0;
  input Real kb_PR_1;
  input Real kb_PR_2;
  input Real kb_PR_3;
  input Real kb_PR_4;
  input Real zMin;
  input Real zMax;
  input Real NcMin;
  input Real NcMax;
  //********** declare outputs **********
  output Real WcCurve;
  output Real PRcurve;
protected
  //********** declare local variables **********
  Real coeff_PR_a;
  Real coeff_PR_b;
  Real coeff_PR_z;
algorithm
  //********** process **********
  //----- coefficients -----
  //--
  coeff_PR_a := ka_PR_4 * Nc ^ 4.0 + ka_PR_3 * Nc ^ 3.0 + ka_PR_2 * Nc ^ 2.0 + ka_PR_1 * Nc ^ 1.0 + ka_PR_0;
  //--
  coeff_PR_b := kb_PR_4 * Nc ^ 4.0 + kb_PR_3 * Nc ^ 3.0 + kb_PR_2 * Nc ^ 2.0 + kb_PR_1 * Nc ^ 1.0 + kb_PR_0;
  //--
  coeff_PR_z := zMin + Nc * (zMax - zMin) / (NcMax - NcMin);
  //----- PR-Wc-Nc parametric equation -----
  WcCurve := coeff_PR_a * sign(cos(theta)) * abs(cos(theta)) ^ (2.0 / coeff_PR_z);
  PRcurve := coeff_PR_b * sign(sin(theta)) * abs(sin(theta)) ^ (2.0 / coeff_PR_z);
  /*
  WcCurve:= coeff_PR_a*(cos(theta))^ (2.0/coeff_PR_z);
  PRcurve:= coeff_PR_b*(sin(theta))^ (2.0/coeff_PR_z);
  */

end EllipticalCurves_PR_Wc;
