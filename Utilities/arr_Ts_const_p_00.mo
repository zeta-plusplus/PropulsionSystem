within PropulsionSystem.Utilities;

block arr_Ts_const_p_00
  /********************************************************
            imports
    ********************************************************/
  import Modelica.Constants;
  import units= Modelica.Units.SI;
  
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
  units.Temperature arr_T[nPts_par];
  units.SpecificEntropy arr_s[nPts_par];
  units.SpecificEntropy ds;
  units.Temperature TLower;
  units.Temperature TUpper;
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
    arr_T[i] = Medium.temperature_psX(u_p, arr_s[i], u_Xi);
  end for;
  TLower = arr_T[1];
  TUpper = arr_T[nPts_par];
  annotation(
    defaultComponentName = "curve_Ts",
    Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {3, -77}, extent = {{-101, -3}, {97, -23}}, textString = "%name")}));

end arr_Ts_const_p_00;
