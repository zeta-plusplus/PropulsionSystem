within PropulsionSystem.Examples.Elements.BasicElements;

model FlightCondition2InletFluid00_ex02
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.MoistAir;
  //redeclare package Medium = engineAir
  //-----
  Modelica.Fluid.Sources.MassFlowSource_T boundary(redeclare package Medium = engineAir, m_flow = -1, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {6, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, m_flow = -1, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {90, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.FlightCondition2InletFluid00 Flt2Fluid(redeclare package Medium = engineAir, X_fluid_paramInput = {0.01, 0.99}, use_u_C = false, use_u_MN = true, use_u_X = true, use_u_alt = true, use_u_dTamb = true) annotation(
    Placement(visible = true, transformation(origin = {0, 3.33067e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary2(redeclare package Medium = engineAir, m_flow = -1, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {90, -10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary3(redeclare package Medium = engineAir, m_flow = -1, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {40, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_alt(duration = 10, height = 0, offset = 0, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-80, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_MN(duration = 10, height = 0, offset = 0, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-80, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_dTamb(duration = 10, height = 0, offset = 0, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {-80, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_X1(duration = 10, height = 0.0001, offset = 0.0001, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-80, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 1)  annotation(
    Placement(visible = true, transformation(origin = {-80, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(visible = true, transformation(origin = {-40, -50}, extent = {{-10, 10}, {10, -10}}, rotation = 90)));
equation
  connect(Flt2Fluid.port_amb, boundary3.ports[1]) annotation(
    Line(points = {{6, 20}, {6, 28}, {40, 28}, {40, 40}}, color = {0, 127, 255}));
  connect(Flt2Fluid.port_inlet, boundary2.ports[1]) annotation(
    Line(points = {{20, -10}, {80, -10}}, color = {0, 127, 255}));
  connect(Flt2Fluid.port_inlet, boundary1.ports[1]) annotation(
    Line(points = {{20, -10}, {34, -10}, {34, 20}, {80, 20}}, color = {0, 127, 255}));
  connect(ramp_dTamb.y, Flt2Fluid.u_dTamb) annotation(
    Line(points = {{-68, -10}, {-62, -10}, {-62, 0}, {-22, 0}}, color = {0, 0, 127}));
  connect(ramp_X1.y, Flt2Fluid.u_X_fluid[1]) annotation(
    Line(points = {{-69, -50}, {-54, -50}, {-54, -8}, {-22, -8}}, color = {0, 0, 127}));
  connect(ramp_X1.y, feedback1.u2) annotation(
    Line(points = {{-69, -50}, {-48, -50}}, color = {0, 0, 127}));
  connect(const.y, feedback1.u1) annotation(
    Line(points = {{-69, -80}, {-40, -80}, {-40, -58}}, color = {0, 0, 127}));
  connect(feedback1.y, Flt2Fluid.u_X_fluid[2]) annotation(
    Line(points = {{-40, -40}, {-40, -40}, {-40, -8}, {-22, -8}, {-22, -8}}, color = {0, 0, 127}));
  connect(Flt2Fluid.port_amb, boundary.ports[1]) annotation(
    Line(points = {{6, 20}, {6, 40}}, color = {0, 127, 255}));
  connect(ramp_alt.y, Flt2Fluid.u_alt) annotation(
    Line(points = {{-68, 50}, {-52, 50}, {-52, 16}, {-22, 16}}, color = {0, 0, 127}));
  connect(ramp_MN.y, Flt2Fluid.u_MN) annotation(
    Line(points = {{-68, 20}, {-56, 20}, {-56, 8}, {-22, 8}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end FlightCondition2InletFluid00_ex02;
