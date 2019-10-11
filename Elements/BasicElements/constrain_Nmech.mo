within PropulsionSystem.Elements.BasicElements;

model constrain_Nmech
  import Modelica.Constants;
  /********************************************************
     Declaration
  ********************************************************/
  //********** Package **********
  //##### none #####
  //********** Type Definitions **********
  type switch_executeConstraint= enumeration
    (
      NotExecute "",
      Execute ""
    );
  
  type switch_Nmech_input= enumeration
    (
      use_NmechDes "",
      use_Nmech_in ""
    );
  //********** Parameters **********
  parameter Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm NmechDes= 3000.0
    "mechanical rotation speed at design point"
    annotation(
    Dialog(group = "Characteristics"));
  //----- switches -----
  parameter switch_executeConstraint switchConstraint
    = switch_executeConstraint.Execute
    ""
    annotation(
    Dialog(group = "switch"),
    choicesAllMatching= true,   
    Evaluate = true,
    HideResult = true
    );
  
  parameter PropulsionSystem.Types.switches.switch_parameter_input switchInput_Nmech
      =PropulsionSystem.Types.switches.switch_parameter_input.use_desValue
   ""
    annotation(
    Dialog(group = "switch"),
    choicesAllMatching= true,   
    Evaluate = true,
    HideResult = true
    );
  //********** Internal variables **********
  Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm Nmech "mechanical rotation speed, rpm";
  Modelica.SIunits.AngularVelocity omega "mechanical rotation speed, rad/sec";
  Modelica.SIunits.Angle phi "mechanical rotation displacement, rad";
  //********** Interfaces **********
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Interfaces.Flange_b flange_b annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  Modelica.Blocks.Interfaces.RealInput NmechDes_in 
    if (switchInput_Nmech== PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal)
    annotation(
    Placement(visible = true, transformation(origin = {-80, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90), iconTransformation(origin = {-60, -66}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
  //********** Initialization **********

//##### none #####
  //********** Protected objects **********

//##### none #####
  /********************************************************
      Model coding
  ********************************************************/
equation
//********** Geometries **********
//##### none #####
//********** Connections, interface <-> internal variables **********
  if switchInput_Nmech == PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal then
    Nmech = NmechDes_in;
  else
    Nmech = NmechDes;
  end if;
  
  if (switchConstraint== switch_executeConstraint.Execute) then
    Nmech = Modelica.SIunits.Conversions.NonSIunits.to_rpm(omega);
  end if;
  
  phi = flange_a.phi;
  phi = flange_b.phi;
  flange_a.tau + flange_b.tau = 0;
//********** Eqns describing physics **********
  der(phi) = omega;
  
  
/********************************************************
  Graphics
********************************************************/
  
annotation(
    Icon(graphics = {Rectangle(origin = {1, 1}, fillColor = {165, 165, 165}, fillPattern = FillPattern.Solid, extent = {{-101, 9}, {99, -11}}), Rectangle(origin = {0, -1}, fillPattern = FillPattern.Solid, extent = {{-80, 61}, {80, -59}}), Text(origin = {-53, 95}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-27, -5}, {133, -25}}, textString = "def. Nmech", fontSize = 40), Text(origin = {-45, 6}, lineColor = {255, 255, 255}, extent = {{-35, 4}, {125, -16}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));
  

end constrain_Nmech;
