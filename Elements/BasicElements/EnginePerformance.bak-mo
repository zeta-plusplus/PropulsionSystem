within PropulsionSystem.Elements.BasicElements;

model EnginePerformance
  import Modelica.Constants;
  /********************************************************
     Declaration
    ********************************************************/
  //********** Package **********
  //##### none #####
  //********** Parameters **********
  //##### none #####
  parameter Boolean use_FdScrub_in = false "" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true), Dialog(group = "switch"));
  //********** Internal variables **********
  Modelica.SIunits.Force Fg;
  Modelica.SIunits.Force Fram;
  Modelica.SIunits.Force FdScrub;
  Modelica.SIunits.MassFlowRate m_flow_fuel;
  Modelica.SIunits.Force Fn(start = 1.0);
  Real TSFC "";
  Real TSFC_Bt "";
  //********** Interfaces **********
  Modelica.Blocks.Interfaces.RealInput u_Fg annotation(
    Placement(visible = true, transformation(origin = {-120, 60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_Fram annotation(
    Placement(visible = true, transformation(origin = {-120, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_m_flow_fuel annotation(
    Placement(visible = true, transformation(origin = {-120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_FdScrub if use_FdScrub_in annotation(
    Placement(visible = true, transformation(origin = {-120, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_Fn annotation(
    Placement(visible = true, transformation(origin = {110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_TSFC annotation(
    Placement(visible = true, transformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput u_TSFC_Bt annotation(
    Placement(visible = true, transformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
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
  if use_FdScrub_in == true then
    FdScrub = u_FdScrub;
  else
    FdScrub = 0.0;
  end if;
  Fg = u_Fg;
  Fram = u_Fram;
  m_flow_fuel = u_m_flow_fuel;
  y_Fn = Fn;
  y_TSFC = TSFC;
  u_TSFC_Bt = TSFC_Bt;
//********** Eqns describing physics **********
  Fn = Fg - Fram - FdScrub;
  TSFC = m_flow_fuel / Fn;
  TSFC_Bt = TSFC * 2.0;
/********************************************************
  Graphics
********************************************************/

  annotation(
    defaultComponentName="Perf",
    Diagram(coordinateSystem(initialScale = 0.1)),
  Icon(coordinateSystem(initialScale = 0.1), graphics = {Rectangle(origin = {-8, 4}, fillColor = {229, 229, 229}, pattern = LinePattern.None, fillPattern = FillPattern.Solid, extent = {{-92, 96}, {108, -104}}), Text(origin = {-26, 8}, fillColor = {232, 232, 232}, extent = {{-74, 32}, {126, -48}}, textString = "Perf."), Rectangle(origin = {-9, 4}, extent = {{-91, 96}, {109, -104}}),
  
  Rectangle(lineColor = {255, 0, 0}, fillColor = {255, 0, 0}, lineThickness = 4, extent = {{-100, 100}, {100, -100}}), Line(points = {{-100, 100}, {100, -100}}, color = {255, 0, 0}, thickness = 4)
  
  }));


end EnginePerformance;
