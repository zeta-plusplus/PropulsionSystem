within PropulsionSystem.Elements.BasicElements;

model MotorGeneratorCharFixed00
  import Modelica.Constants;
  /********************************************************
         Declaration
      ********************************************************/
  //********** Package **********
  //##### none #####
  //********** Type Definitions **********
  type switch_executeConstraint = enumeration(NotExecute "", Execute "");
  type switch_Nmech_input = enumeration(use_NmechDes "", use_Nmech_in "");
  //********** Parameters **********
  parameter Modelica.SIunits.Power pwrExtr_def = 1000.0 "power extracted via frange, des. pt, user defined" annotation(
    Dialog(group = "Characteristics"));
  //----- switches -----
  parameter switch_executeConstraint switchConstraint = switch_executeConstraint.Execute "" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  parameter PropulsionSystem.Types.switches.switch_parameter_input switchInput_pwr = PropulsionSystem.Types.switches.switch_parameter_input.use_desValue "" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  //********** Internal variables **********
  Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm Nmech "mechanical rotation speed, rpm";
  Modelica.SIunits.AngularVelocity omega "mechanical rotation speed, rad/sec";
  Modelica.SIunits.Angle phi "mechanical rotation displacement, rad";
  Modelica.SIunits.Torque trq "";
  Modelica.SIunits.Power pwrExtr "power";
  //********** Interfaces **********
  Modelica.Mechanics.Rotational.Interfaces.Flange_a flange_a annotation(
    Placement(visible = true, transformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_pwrExtr if switchInput_pwr == PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal annotation(
    Placement(visible = true, transformation(origin = {-80, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {-60, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
//********** Connections, interface <-> internal variables **********
  if switchInput_pwr == PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal then
    pwrExtr = u_pwrExtr;
  else
    pwrExtr = pwrExtr_def;
  end if;
  if switchConstraint == switch_executeConstraint.Execute then
    omega * trq = pwrExtr;
  end if;
  phi = flange_a.phi;
  flange_a.tau = trq;
//********** Eqns describing physics **********
  der(phi) = omega;
  Nmech = Modelica.SIunits.Conversions.NonSIunits.to_rpm(omega);
/********************************************************
  Graphics
********************************************************/
  annotation(
    Icon(graphics = {Rectangle(origin = {1, 1}, fillColor = {165, 165, 165}, fillPattern = FillPattern.Solid, extent = {{-101, 9}, {71, -11}}), Rectangle(origin = {0, -1}, fillPattern = FillPattern.Solid, extent = {{-80, 61}, {80, -59}}), Text(origin = {-53, 25}, lineColor = {255, 255, 255}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-27, -5}, {133, -45}}, textString = "Pwr", fontSize = 40), Text(origin = {-45, 96}, extent = {{-35, 4}, {125, -16}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));
end MotorGeneratorCharFixed00;
