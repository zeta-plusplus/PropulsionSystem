within PropulsionSystem.BaseClasses.BasicElements;

partial model Inlet_Base
  extends PropulsionSystem.Interfaces.ElementFrames.ElementFrame_2FluidPorts;
  
  
  /********************************************************
    imports
  ********************************************************/
  import Modelica.Constants;
  //********** Package **********
  //##### none #####
  //********** Type definitions, only valid in this class **********
  type switch_Inlet_Subelement = enumeration(
                            NoSubelement "", 
                            curve_Wc_MN ""
                            ) 
                            annotation(
    Documentation(info = "<html>
    </html>"));
  
  type switch_calculate_Fram = enumeration(
                            calculate "port V_tot_in is used", 
                            DoNot ""
                            )
                            annotation(
    Documentation(info = "<html>
    </html>"));
  //********** Parameters **********
  //----- switches -----
  parameter switch_calculate_Fram switchCalcFram = switch_calculate_Fram.calculate "" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  //********** Internal variables **********
  Real effRam(start = 0.995);
  Modelica.SIunits.Force Fram "ram drag";
  Modelica.SIunits.Velocity V_tot(start = 100) "";
  //********** Interfaces **********
  Modelica.Blocks.Interfaces.RealInput V_tot_in 
    if(switchCalcFram == switch_calculate_Fram.calculate)
    ""
    annotation(
    Placement(visible = true, transformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-70, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Blocks.Interfaces.RealOutput Fram_out 
    ""
    annotation(
    Placement(visible = true, transformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {70, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  
  
algorithm
//##### none #####
equation
//********** Geometries **********
//##### none #####
//********** Connections, interface <-> internal variables **********
//--- V_tot ---
  if switchCalcFram == switch_calculate_Fram.calculate then
    V_tot = V_tot_in;
  else
    V_tot = 0.0;
  end if;
//---output signal---
  Fram_out = Fram;
//********** Eqns describing physics **********
//-- pressure --
  fluid_2.p = effRam * fluid_1.p;
//-- mass conservation --
  port_1.m_flow + port_2.m_flow = 0;
  fluid_2.Xi = fluid_1.Xi;
//-- energy conservation --
  port_1.m_flow * fluid_1.h + port_2.m_flow * fluid_2.h = 0;
//--- other physics ---
  Fram = port_1.m_flow * V_tot;
  
  
/********************************************************
  Graphics
********************************************************/
  
  
  annotation(
    Diagram(coordinateSystem(initialScale = 0.1)),
    Icon(graphics = {Polygon(origin = {-20, 0}, fillColor = {170, 255, 255}, fillPattern = FillPattern.Solid, points = {{-40, 50}, {-40, -50}, {80, -80}, {80, 80}, {80, 80}, {-40, 50}}), Rectangle(origin = {-58, 75}, fillColor = {139, 139, 139}, fillPattern = FillPattern.Solid, extent = {{-2, 7}, {2, -25}}), Rectangle(origin = {-75, 80}, rotation = -90, fillColor = {139, 139, 139}, fillPattern = FillPattern.Solid, extent = {{-2, 19}, {2, -25}}), Rectangle(origin = {109, 79}, rotation = -90, fillColor = {139, 139, 139}, fillPattern = FillPattern.Solid, extent = {{-2, -9}, {2, -49}}), Text(origin = {-44, 31}, extent = {{-16, -21}, {104, -43}}, textString = "%name"),  Line(origin = {-10, 20}, points = {{-30, 0}, {30, 0}}, thickness = 0.5, arrow = {Arrow.None, Arrow.Filled}, arrowSize = 5)}, coordinateSystem(initialScale = 0.1)),
    Dialog(group = "Characteristics"));


  
end Inlet_Base;