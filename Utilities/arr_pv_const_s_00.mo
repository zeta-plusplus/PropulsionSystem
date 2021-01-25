within PropulsionSystem.Utilities;

block arr_pv_const_s_00
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
  parameter Integer nPts_par=10;
  
  /* ---------------------------------------------
              Internal variables
  --------------------------------------------- */
  Integer nPts;
  Modelica.SIunits.Pressure arr_p[nPts_par];
  Modelica.SIunits.SpecificVolume arr_v[nPts_par];
  Modelica.SIunits.Pressure dp;
  Modelica.SIunits.SpecificVolume vUpper;
  Modelica.SIunits.SpecificVolume vLower;
  
  
  /* ---------------------------------------------
              Internal objects
  --------------------------------------------- */
  input Modelica.Blocks.Interfaces.RealInput u_pLower(unit = "Pa", displayUnit = "Pa") annotation(
    Placement(visible = true, transformation(origin = {-120, 40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input Modelica.Blocks.Interfaces.RealInput u_pUpper(unit = "Pa", displayUnit = "Pa") annotation(
    Placement(visible = true, transformation(origin = {-120, 80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input Modelica.Blocks.Interfaces.RealInput u_s(unit = "J/(kg.K)", displayUnit = "J/(kg.K)") annotation(
    Placement(visible = true, transformation(origin = {-120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  input Modelica.Blocks.Interfaces.RealInput u_Xi[Medium.nXi] annotation(
    Placement(visible = true, transformation(origin = {-120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

//***********************************************************************************************
equation
  nPts=nPts_par;
  dp = (u_pUpper - u_pLower) / (nPts - 1);
  for i in 1:nPts_par loop
    arr_p[i] = u_pLower + dp * (i - 1);
    arr_v[i] = 1.0 / Medium.density_psX(arr_p[i], u_s, u_Xi);
  end for;
  
  vLower=arr_v[nPts_par];
  vUpper=arr_v[1];
    
annotation(
  defaultComponentName = "arr_pv",
  Icon(graphics = {Rectangle(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {3, -77}, extent = {{-101, -3}, {97, -23}}, textString = "%name")}));

end arr_pv_const_s_00;
