within PropulsionSystem.Utilities;

block arr_us_const_p_00
  /********************************************************
            imports
    ********************************************************/
  import Modelica.Constants;
  /********************************************************
            Declaration
    ********************************************************/
  /* ---------------------------------------------
            Package
    --------------------------------------------- */
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium annotation(
    choicesAllMatching = true);
  /* ---------------------------------------------
            Parameter
    --------------------------------------------- */
  parameter Integer nPts_par = 10;
  /* ---------------------------------------------
                Internal variables
    --------------------------------------------- */
  Integer nPts;
  Modelica.SIunits.SpecificEnergy arr_u[nPts_par];
  Modelica.SIunits.SpecificEntropy arr_s[nPts_par];
  Modelica.SIunits.SpecificEntropy ds;
  Modelica.SIunits.SpecificEnergy uLower;
  Modelica.SIunits.SpecificEnergy uUpper;
  /* ---------------------------------------------
                Internal objects
    --------------------------------------------- */
  input Modelica.Blocks.Interfaces.RealInput u_sLower(unit = "J/(kg.K)", displayUnit = "J/(kg.K)") annotation(
    Placement(visible = true, transformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input Modelica.Blocks.Interfaces.RealInput u_sUpper(unit = "J/(kg.K)", displayUnit = "J/(kg.K)") annotation(
    Placement(visible = true, transformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input Modelica.Blocks.Interfaces.RealInput u_p(unit = "Pa", displayUnit = "Pa") annotation(
    Placement(visible = true, transformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input Modelica.Blocks.Interfaces.RealInput u_Xi[Medium.nXi] annotation(
    Placement(visible = true, transformation(origin = {-120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //***********************************************************************************************
equation
  nPts = nPts_par;
  ds = (u_sUpper - u_sLower) / (nPts - 1);
  for i in 1:nPts_par loop
    arr_s[i] = u_sLower + ds * (i - 1);
    arr_u[i] = Medium.specificInternalEnergy(Medium.setState_psX(u_p, arr_s[i], u_Xi));
  end for;
  uLower = arr_u[1];
  uUpper = arr_u[nPts_par];
  annotation(
    defaultComponentName = "curve_us",
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {3, -77}, extent = {{-101, -3}, {97, -23}}, textString = "%name")}));

end arr_us_const_p_00;
