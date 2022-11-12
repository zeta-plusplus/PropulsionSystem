within PropulsionSystem.Examples.Elements.BasicElements;

model SimplestHeatPump00_ex01
  extends Modelica.Icons.Example;
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature TL(T = 273.15)  annotation(
    Placement(visible = true, transformation(origin = {0, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sources.FixedTemperature TH(T = 308.15) annotation(
    Placement(visible = true, transformation(origin = {0, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_dW(duration = 1, height = 2 * 1000, offset = 10 * 1000, startTime = 1)  annotation(
    Placement(visible = true, transformation(origin = {-78, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_CoP_c(duration = 1, height = 5, offset = 5, startTime = 3) annotation(
    Placement(visible = true, transformation(origin = {-68, -32}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.SimplestHeatPump00 heatPump annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-40, -40}, {40, 40}}, rotation = 0)));
equation
  connect(heatPump.port_b, TH.port) annotation(
    Line(points = {{0, 40}, {0, 60}}, color = {191, 0, 0}));
  connect(TL.port, heatPump.port_a) annotation(
    Line(points = {{0, -60}, {0, -40}}, color = {191, 0, 0}));
  connect(ramp_dW.y, heatPump.u_dW) annotation(
    Line(points = {{-66, 0}, {-42, 0}}, color = {0, 0, 127}));
  connect(ramp_CoP_c.y, heatPump.u_CoP) annotation(
    Line(points = {{-56, -32}, {-44, -32}}, color = {0, 0, 127}));
protected
  annotation(
    experiment(StartTime = 0, StopTime = 5, Tolerance = 1e-6, Interval = 0.01));
end SimplestHeatPump00_ex01;
