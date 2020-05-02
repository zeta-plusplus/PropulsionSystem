within PropulsionSystem.Elements.BasicElements;

model constrain_T
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
  parameter Modelica.SIunits.Temperature Tdes = 288.15 "" annotation(
    Dialog(group = "Characteristics"));
  //----- switches -----
  parameter PropulsionSystem.Types.switches.switch_parameter_input switchInput_T = PropulsionSystem.Types.switches.switch_parameter_input.use_desValue "" annotation(
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
  Modelica.SIunits.Temperature T "";
  //********** Interfaces **********
  Modelica.Blocks.Interfaces.RealInput T_in if switchInput_T == PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal "" annotation(
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
//--- T ---
  if switchInput_T == PropulsionSystem.Types.switches.switch_parameter_input.use_desValue then
    T = Tdes;
  elseif switchInput_T == PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal then
    T = T_in;
  end if;
  if switchConstraint == switch_executeConstraint.Execute then
    fluid_2.T = T;
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
    Icon(graphics = {Rectangle(origin = {-10, 10}, fillColor = {255, 85, 0}, fillPattern = FillPattern.Solid, extent = {{-50, 30}, {70, -50}}), Rectangle(origin = {-58, 71}, fillColor = {148, 148, 148}, fillPattern = FillPattern.Solid, extent = {{-2, 11}, {2, -31}}), Rectangle(origin = {-98, 53}, fillColor = {148, 148, 148}, fillPattern = FillPattern.Solid, extent = {{-2, 29}, {42, 25}}), Rectangle(origin = {58, 71}, fillColor = {148, 148, 148}, fillPattern = FillPattern.Solid, extent = {{-2, 11}, {2, -31}}), Rectangle(origin = {58, 53}, fillColor = {148, 148, 148}, fillPattern = FillPattern.Solid, extent = {{-2, 29}, {42, 25}}), Text(origin = {-32, 83}, fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid, extent = {{-8, 17}, {72, -3}}, textString = "def. T", fontSize = 40), Text(origin = {-20, -3}, extent = {{-40, 13}, {80, -7}}, textString = "%name"),
    
    Rectangle(lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, lineThickness = 4, extent = {{-100, 100}, {100, -100}}), Line(points = {{-100, 100}, {100, -100}}, color = {255, 0, 0}, thickness = 4)
    
    }, coordinateSystem(initialScale = 0.1)));
end constrain_T;
