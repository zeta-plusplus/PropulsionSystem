within PropulsionSystem.Elements.BasicElements;

model constrain_dm
  extends PropulsionSystem.Interfaces.ElementFrames.ElementFrame_2FluidPorts;
  //-----
  import Modelica.Constants;
  /********************************************************
           Declaration
      ********************************************************/
  //********** Package **********
  //##### none #####
  //********** Type Definitions **********
  type switch_executeConstraint = enumeration(NotExecute "", Execute "");
  //********** Parameters **********
  parameter Modelica.SIunits.MassFlowRate dmDes = 1.0 "" annotation(
    Dialog(group = "Characteristics"));
  //----- switches -----
  parameter PropulsionSystem.Types.switches.switch_parameter_input switchInput_dm = PropulsionSystem.Types.switches.switch_parameter_input.use_desValue "" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  parameter switch_executeConstraint switchConstraint = switch_executeConstraint.Execute "" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  //********** Internal variables **********
  Modelica.SIunits.MassFlowRate dm "";
  //********** Interfaces **********
  Modelica.Blocks.Interfaces.RealInput dm_in if switchInput_dm == PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal "" annotation(
    Placement(visible = true, transformation(origin = {-80, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 90), iconTransformation(origin = {-41, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  //********** Initialization **********
  //##### none #####
  //********** Protected objects **********
  //##### none #####
algorithm
//##### none #####
equation
//********** Geometries **********
//##### none #####
//********** Connections, interface <-> internal variables **********
//--- dm ---
  if (switchInput_dm == PropulsionSystem.Types.switches.switch_parameter_input.use_desValue) then
    dm = dmDes;
  elseif (switchInput_dm == PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) then
    dm = dm_in;
  end if;
  if (switchConstraint == switch_executeConstraint.Execute) then
    port_1.m_flow = dm;
  end if;
//********** Eqns describing physics **********
//-- pressure --
  fluid_2.p = fluid_1.p;
//-- mass conservation --
  port_1.m_flow + port_2.m_flow = 0;
  fluid_2.Xi = fluid_1.Xi;
//-- energy conservation --
  port_1.m_flow * fluid_1.h + port_2.m_flow * fluid_2.h = 0;
//connect(port_1,  port_2);
/********************************************************
  Graphics
********************************************************/
  annotation(
    Icon(graphics = {Rectangle(origin = {-10, 10}, fillPattern = FillPattern.Solid, extent = {{-50, 30}, {70, -50}}), Rectangle(origin = {-58, 71}, fillColor = {148, 148, 148}, fillPattern = FillPattern.Solid, extent = {{-2, 11}, {2, -31}}), Rectangle(origin = {-98, 53}, fillColor = {148, 148, 148}, fillPattern = FillPattern.Solid, extent = {{-2, 29}, {42, 25}}), Rectangle(origin = {58, 71}, fillColor = {148, 148, 148}, fillPattern = FillPattern.Solid, extent = {{-2, 11}, {2, -31}}), Rectangle(origin = {58, 53}, fillColor = {148, 148, 148}, fillPattern = FillPattern.Solid, extent = {{-2, 29}, {42, 25}}), Text(origin = {-24, 85}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-26, 15}, {74, -5}}, textString = "def. dm", fontSize = 40), Text(origin = {-20, 7}, lineColor = {255, 255, 255}, extent = {{-40, 3}, {80, -17}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));
end constrain_dm;
