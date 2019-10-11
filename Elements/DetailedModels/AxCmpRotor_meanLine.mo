within PropulsionSystem.Elements.DetailedModels;

model AxCmpRotor_meanLine
  extends PropulsionSystem.Interfaces.ElementFrames.ElementFrame_2FluidPorts_2ShaftPorts;
  
  /********************************************************
    imports
  ********************************************************/
  import Modelica.Constants;
  import PropulsionSystem.Types.switches;
  
  
  /********************************************************
    Declaration
  ********************************************************/
  //********** Package **********
  //##### none #####
  
  
  //********** Type definitions, only valid in this class **********
  //##### none #####
  
  
  //********** Parameters **********
  
  
  //********** Internal variables **********
  Modelica.SIunits.Length rMean "";
  Modelica.SIunits.Length rTip_1 "";
  Modelica.SIunits.Length rHub_1 "";
  Modelica.SIunits.Length rTip_2 "";
  Modelica.SIunits.Length rHub_2 "";
  Modelica.SIunits.Length lAxial "";
  Modelica.SIunits.Length spanRep "representive span";
  Modelica.SIunits.Area Sblade "surface area of single blade";
  Modelica.SIunits.Area Amech_1 "";
  Modelica.SIunits.Area Amech_2 "";
  Real MnAx_1 "";
  Real MnAx_2 "";
  Modelica.SIunits.Velocity c1 "";
  Modelica.SIunits.Velocity c2 "";
  Real AR "aspect ratio";
  Real BR_1 "boss ratio, leading";
  Real BR_2 "boss ratio, trailing edge";
  Real numBlades "num. of blades";
  Modelica.SIunits.Velocity uMean "";
  
  Medium.BaseProperties fluidStat_1
    "static flow station, 1";
  Medium.BaseProperties fluidStat_2
    "static flow station, 2";
  
  //********** Interfaces **********
  Modelica.Blocks.Interfaces.RealInput u_flowAngle "incoming flow angle"annotation(
    Placement(visible = true, transformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_flowAngle "exiting flow angle" annotation(
    Placement(visible = true, transformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation
  //********** Geometries **********
  
  
annotation(
    Icon(graphics = {Rectangle(origin = {52, -2}, fillPattern = FillPattern.Solid, extent = {{-92, 6}, {-12, -2}}),  Polygon(origin = {-1, 46}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, points = {{-11, 54}, {-11, -26}, {11, -26}, {11, 48}, {-11, 54}}), Line(origin = {0.02, 11.18}, points = {{0, 10}, {0, -12}}, pattern = LinePattern.Dot, thickness = 1.5), Line(origin = {-39.7738, -9.94116}, points = {{0, 10}, {-60, 10}}, pattern = LinePattern.Dot, thickness = 1.5), Line(origin = {98.77, -10.2247}, points = {{0, 10}, {-60, 10}}, pattern = LinePattern.Dot, thickness = 1.5)}),
    __OpenModelica_commandLineOptions = "");

end AxCmpRotor_meanLine;
