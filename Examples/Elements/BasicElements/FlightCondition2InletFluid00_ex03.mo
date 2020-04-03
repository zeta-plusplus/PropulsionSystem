within PropulsionSystem.Examples.Elements.BasicElements;

model FlightCondition2InletFluid00_ex03
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.MoistAir(extraPropertiesNames={"CO2"},C_nominal={0.00001});
  //redeclare package Medium = engineAir
  //-----
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = engineAir, m_flow = -1, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {6, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, m_flow = -1, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {90, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.FlightCondition2InletFluid00 Flt2Fluid(redeclare package Medium = engineAir, use_u_C = true, use_u_MN = true, use_u_X = true, use_u_alt = true, use_u_dTamb = true) annotation(
    Placement(visible = true, transformation(origin = {8, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary2(redeclare package Medium = engineAir, m_flow = -1, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {90, -40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary3(redeclare package Medium = engineAir, m_flow = -1, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {40, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_alt(duration = 10, height = 0, offset = 0, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-80, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_MN(duration = 10, height = 0, offset = 0, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-80, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_dTamb(duration = 10, height = 0, offset = 0, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {-80, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_X1(duration = 10, height = 0, offset = 0.0001, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-80, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-80, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(visible = true, transformation(origin = {-40, -66}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_C1(duration = 10, height = 0.0001, offset = 0.0001, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-80, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.TraceSubstances traceSubstance(redeclare package Medium = engineAir, substanceName = "CO2") annotation(
    Placement(visible = true, transformation(origin = {60, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Sensors.TraceSubstances traceSubstance1(redeclare package Medium = engineAir, substanceName = "CO2")  annotation(
    Placement(visible = true, transformation(origin = {60, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Fluid.Sensors.TraceSubstances traceSubstance2(redeclare package Medium = engineAir, substanceName = "CO2")  annotation(
    Placement(visible = true, transformation(origin = {-4, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sensors.TraceSubstances traceSubstance3(redeclare package Medium = engineAir, substanceName = "CO2")  annotation(
    Placement(visible = true, transformation(origin = {30, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(boundary3.ports[1], traceSubstance3.port) annotation(
    Line(points = {{40, 40}, {40, 40}, {40, 20}, {40, 20}}, color = {0, 127, 255}));
  connect(Flt2Fluid.port_amb, traceSubstance3.port) annotation(
    Line(points = {{14, -10}, {14, -10}, {14, 2}, {40, 2}, {40, 20}, {40, 20}}, color = {0, 127, 255}));
  connect(ramp_C1.y, Flt2Fluid.u_C_fluid[1]) annotation(
    Line(points = {{-68, -110}, {-26, -110}, {-26, -46}, {-14, -46}}, color = {0, 0, 127}));
  connect(traceSubstance2.port, Flt2Fluid.port_amb) annotation(
    Line(points = {{6, 20}, {6, 5}, {14, 5}, {14, -10}}, color = {0, 127, 255}));
  connect(Flt2Fluid.port_inlet, traceSubstance1.port) annotation(
    Line(points = {{28, -40}, {42, -40}, {42, -10}, {60, -10}}, color = {0, 127, 255}));
  connect(ramp_MN.y, Flt2Fluid.u_MN) annotation(
    Line(points = {{-68, 20}, {-56, 20}, {-56, -22}, {-14, -22}}, color = {0, 0, 127}));
  connect(ramp_alt.y, Flt2Fluid.u_alt) annotation(
    Line(points = {{-68, 50}, {-52, 50}, {-52, -14}, {-14, -14}}, color = {0, 0, 127}));
  connect(feedback1.y, Flt2Fluid.u_X_fluid[2]) annotation(
    Line(points = {{-40, -57}, {-40, -38}, {-14, -38}}, color = {0, 0, 127}));
  connect(ramp_X1.y, Flt2Fluid.u_X_fluid[1]) annotation(
    Line(points = {{-69, -50}, {-54, -50}, {-54, -38}, {-14, -38}}, color = {0, 0, 127}));
  connect(ramp_dTamb.y, Flt2Fluid.u_dTamb) annotation(
    Line(points = {{-68, -10}, {-63, -10}, {-63, -30}, {-14, -30}}, color = {0, 0, 127}));
  connect(Flt2Fluid.port_inlet, traceSubstance.port) annotation(
    Line(points = {{28, -40}, {60, -40}}, color = {0, 127, 255}));
  connect(traceSubstance.port, boundary2.ports[1]) annotation(
    Line(points = {{60, -40}, {80, -40}}, color = {0, 127, 255}));
  connect(const.y, feedback1.u1) annotation(
    Line(points = {{-69, -80}, {-40, -80}, {-40, -74}}, color = {0, 0, 127}));
  connect(ramp_X1.y, feedback1.u2) annotation(
    Line(points = {{-69, -50}, {-58.5, -50}, {-58.5, -66}, {-48, -66}}, color = {0, 0, 127}));
  connect(traceSubstance1.port, boundary1.ports[1]) annotation(
    Line(points = {{60, -10}, {80, -10}, {80, -10}, {80, -10}}, color = {0, 127, 255}));
  connect(boundary.ports[1], traceSubstance2.port) annotation(
    Line(points = {{6, 40}, {6, 20}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-100, -140}, {120, 100}})),
  __OpenModelica_commandLineOptions = "");
end FlightCondition2InletFluid00_ex03;
