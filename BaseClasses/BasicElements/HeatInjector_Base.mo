within PropulsionSystem.BaseClasses.BasicElements;

partial model HeatInjector_Base
  extends PropulsionSystem.Interfaces.ElementFrames.ElementFrame_2FluidPorts_1HeatPort;
  /********************************************************
           import
    ********************************************************/
  import Modelica.Constants;
  /********************************************************
           Declaration
    ********************************************************/
  //********** Package **********
  //##### none #####
  //********** Type definitions, only valid in this class **********
  type switchCausality_HeatInjection = enumeration(input_dq "", input_TtOutlet "") annotation(
    Documentation(info = "<html>
    </html>"));
  //********** Parameters **********
  parameter Modelica.SIunits.Temperature TtOutletDes = 1800.0 "" annotation(
    Dialog(group = "Characteristics"));
  parameter Modelica.SIunits.HeatFlowRate dqInjectedDes = 1000.0 "" annotation(
    Dialog(group = "Characteristics"));
  //----- switches -----
  parameter switchCausality_HeatInjection switchCausality_dq = switchCausality_HeatInjection.input_TtOutlet "" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  //********** Internal variables **********
  Modelica.SIunits.Temperature TtOutlet(start = TtOutletDes) "";
  Modelica.SIunits.HeatFlowRate dqInjected "";
  //********** Interfaces **********
  //##### none #####
  //********** Initialization **********
  //##### none #####
  //********** Protected objects **********
  //##### none #####
algorithm
//##### none #####
initial equation
//##### none #####
//dqInjected= dq_1_start;
equation
//********** Geometries **********
//##### none #####
//********** Connections, interface <-> internal variables **********
  (1) * HeatPort_1.Q_flow = dqInjected;
//********** Eqns describing physics **********
  fluid_2.p = fluid_1.p;
//no pressure drop
//-- mass conservation --
  port_1.m_flow + port_2.m_flow = 0.0;
  fluid_1.Xi = fluid_2.Xi;
//-- energy conservation --
  port_1.m_flow * fluid_1.h + dqInjected + port_2.m_flow * fluid_2.h = 0.0;
/********************************************************
  Graphics
********************************************************/
  annotation(
    Icon(graphics = {Polygon(origin = {-31, 12}, fillColor = {255, 0, 0}, fillPattern = FillPattern.Solid, points = {{111, 30}, {47, 30}, {-7, 26}, {-35, 20}, {-47, 8}, {-49, -12}, {-45, -32}, {-35, -42}, {-1, -48}, {47, -50}, {111, -50}, {111, 30}}), Rectangle(origin = {-76, 69}, fillColor = {118, 118, 118}, fillPattern = FillPattern.Solid, extent = {{-2, 13}, {2, -49}}), Rectangle(origin = {78, 69}, fillColor = {93, 93, 93}, fillPattern = FillPattern.Solid, extent = {{-2, 13}, {2, -27}}), Rectangle(origin = {105, 80}, rotation = -90, fillColor = {68, 68, 68}, fillPattern = FillPattern.Solid, extent = {{-2, -5}, {2, -29}}), Text(origin = {-17, -51}, extent = {{-63, 11}, {97, -9}}, textString = "%name"), Rectangle(origin = {-51, 81}, rotation = -90, fillColor = {118, 118, 118}, fillPattern = FillPattern.Solid, extent = {{-2, -23}, {2, -49}}), Line(origin = {-0.32, 74.04}, points = {{0, 17}, {0, -53}}, thickness = 3, arrow = {Arrow.None, Arrow.Open}, arrowSize = 12), Text(origin = {-18, 4}, extent = {{-12, 10}, {48, -10}}, textString = "Q_flow")}, coordinateSystem(initialScale = 0.1)));
end HeatInjector_Base;
