within PropulsionSystem.Elements.BasicElements;

model NozzleConv_defAmech
  extends PropulsionSystem.Elements.BasicElements.NozzleConv;
  import Modelica.Constants;
  import PropulsionSystem.FluidFunctions;
  import PropulsionSystem.Types.switches;
  
  /********************************************************
     Declaration
  ********************************************************/
  //********** Package **********
  //##### none #####
  //********** Type definitions, only valid in this class **********
  //##### none #####
  //********** Parameters **********
  parameter Modelica.SIunits.Area Amech_th_def = 1.0 annotation(
    Dialog(group = "Geometry"));
  //----- switches -----
  parameter switches.switch_parameter_input switchInput_Amech_th
      =switches.switch_parameter_input.use_desValue
   ""
    annotation(
    Dialog(group = "switch"),
    choicesAllMatching= true,   
    Evaluate = true,
    HideResult = true
    );
  //********** Internal variables **********
  //##### none #####
  //********** Interface
  //********** Internal model **********
  //##### none #####
  //********** Interfaces **********
  Modelica.Blocks.Interfaces.RealInput Amech_th_in
    if (switchInput_Amech_th== switches.switch_parameter_input.use_inputSignal)
    ""
    annotation(
      Placement(visible = true, transformation(origin = {60, 110}, extent = {{-10, -10}, {10, 10}}, rotation = -90), iconTransformation(origin = {60, 108}, extent = {{-8, -8}, {8, 8}}, rotation = -90)));
  //********** Initialization **********

//##### none #####
protected   
//********** Protected objects **********
  //##### none #####
initial equation
  port_1.m_flow=dmTh;
  port_2.m_flow=-dmTh;
  
algorithm
//##### none #####
equation
//********** Geometries **********
  if switchInput_Amech_th == PropulsionSystem.Types.switches.switch_parameter_input.use_desValue then
    Amech_th = Amech_th_def;
  elseif switchInput_Amech_th == PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal then
    Amech_th = Amech_th_in;
  end if;
//********** Connections, interface <-> internal variables **********
//##### none #####
//********** Eqns describing physics **********
//##### none #####
/********************************************************
  Graphics
********************************************************/
  annotation(
    Icon(graphics = {Polygon(origin = {0, 10}, fillColor = {255, 221, 96}, fillPattern = FillPattern.Solid, points = {{-80, 70}, {-80, -90}, {60, -50}, {60, 30}, {-80, 70}}), Text(origin = {-62, 10}, extent = {{-18, 10}, {102, -30}}, textString = "Nzl"), Line(origin = {60.02, 77.5}, points = {{0, 22}, {0, -38}})}, coordinateSystem(initialScale = 0.1)),
    experiment(StartTime = 0, StopTime = 2, Tolerance = 1e-06, Interval = 0.01));

end NozzleConv_defAmech;
