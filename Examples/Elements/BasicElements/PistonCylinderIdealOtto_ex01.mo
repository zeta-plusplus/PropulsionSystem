within PropulsionSystem.Examples.Elements.BasicElements;

model PistonCylinderIdealOtto_ex01
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.DryAirNasa;
  package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  PropulsionSystem.Elements.BasicElements.PistonCylinderIdealOttoMV00 PistonCylinder(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-20, -4}, extent = {{-20, -24}, {20, 24}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 15 + 273.15, nPorts = 1, p = 101.325 * 1000, use_T_in = true, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_fracFuel(duration = 10, height = 0, offset = 0.01, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p1(duration = 10, height = 100 * 1000, offset = 101.325 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-90, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T1(duration = 10, height = 20, offset = 15 + 273.15, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Speed speed1 annotation(
    Placement(visible = true, transformation(origin = {50, -24}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {20, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Nmech(duration = 10, height = 100, offset = 1000, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {110, -24}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.UnitConversions.From_rpm from_rpm1 annotation(
    Placement(visible = true, transformation(origin = {80, -24}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, m_flow = -1, nPorts = 1, use_m_flow_in = true)  annotation(
    Placement(visible = true, transformation(origin = {30, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {70, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(ramp_fracFuel.y, PistonCylinder.u_fracFuel) annotation(
    Line(points = {{-58, -10}, {-50, -10}, {-50, 10}, {-34, 10}, {-34, 10}}, color = {0, 0, 127}));
  connect(PistonCylinder.flange_2, powerSensor1.flange_a) annotation(
    Line(points = {{0, -24}, {10, -24}, {10, -24}, {10, -24}}));
  connect(boundary1.m_flow_in, VarBySolver.y_independent) annotation(
    Line(points = {{40, 58}, {54, 58}, {54, 50}, {58, 50}, {58, 50}}, color = {0, 0, 127}));
  connect(PistonCylinder.port_2, boundary1.ports[1]) annotation(
    Line(points = {{0, 16}, {12, 16}, {12, 50}, {20, 50}, {20, 50}}, color = {0, 127, 255}));
  connect(from_rpm1.u, ramp_Nmech.y) annotation(
    Line(points = {{92, -24}, {100, -24}, {100, -24}, {100, -24}}, color = {0, 0, 127}));
  connect(speed1.w_ref, from_rpm1.y) annotation(
    Line(points = {{62, -24}, {68, -24}, {68, -24}, {68, -24}}, color = {0, 0, 127}));
  connect(boundary.ports[1], PistonCylinder.port_1) annotation(
    Line(points = {{-40, 50}, {-40, 16}}, color = {0, 127, 255}));
  connect(powerSensor1.flange_b, speed1.flange) annotation(
    Line(points = {{30, -24}, {35, -24}, {35, -24}, {40, -24}, {40, -24}, {40, -24}, {40, -24}, {40, -24}}));
  connect(ramp_T1.y, boundary.T_in) annotation(
    Line(points = {{-79, 30}, {-75, 30}, {-75, 54}, {-63, 54}, {-63, 54}, {-63, 54}, {-63, 54}}, color = {0, 0, 127}));
  connect(ramp_p1.y, boundary.p_in) annotation(
    Line(points = {{-79, 60}, {-71, 60}, {-71, 58}, {-63, 58}, {-63, 58}, {-63, 58}, {-63, 58}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 70, Tolerance = 1e-06, Interval = 0.140562),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-120, -100}, {120, 100}})),
  __OpenModelica_commandLineOptions = "");
end PistonCylinderIdealOtto_ex01;
