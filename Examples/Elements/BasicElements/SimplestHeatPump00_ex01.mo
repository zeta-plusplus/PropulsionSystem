within PropulsionSystem.Examples.Elements.BasicElements;

model SimplestHeatPump00_ex01
  extends Modelica.Icons.Example;
  PropulsionSystem.Elements.BasicElements.SimplestHeatPump00 heatPump annotation(
    Placement(visible = true, transformation(origin = {0, 7.10543e-15}, extent = {{-40, -40}, {40, 40}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature TL(T = 278.15)  annotation(
    Placement(visible = true, transformation(origin = {0, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature TH(T = 298.15) annotation(
    Placement(visible = true, transformation(origin = {0, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_dW(duration = 1, height = 2 * 1000, offset = 10 * 1000, startTime = 1)  annotation(
    Placement(visible = true, transformation(origin = {-78, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_CoP(duration = 1, height = 0, offset = 3.5, startTime = 1) annotation(
    Placement(visible = true, transformation(origin = {-68, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(heatPump.port_b, TH.port) annotation(
    Line(points = {{0, 40}, {0, 60}}, color = {191, 0, 0}, thickness = 2));
  connect(heatPump.port_a, TL.port) annotation(
    Line(points = {{0, -40}, {0, -60}}, color = {191, 0, 0}, thickness = 2));
  connect(ramp_dW.y, heatPump.u_dW) annotation(
    Line(points = {{-66, 0}, {-42, 0}}, color = {0, 0, 127}, thickness = 2));
  connect(heatPump.u_CoP, ramp_CoP.y) annotation(
    Line(points = {{-43, -32}, {-56, -32}}, color = {0, 0, 127}));
protected
  annotation(
    experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-6, Interval = 0.01));
end SimplestHeatPump00_ex01;
