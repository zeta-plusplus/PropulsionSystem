within PropulsionSystem.Examples.Subelements;

model Combustion00_ex01
  extends Modelica.Icons.Example;
  PropulsionSystem.Subelements.Combustion00 Combustion annotation(
    Placement(visible = true, transformation(origin = {-10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow_fuel(duration = 10, height = 1, offset = 1, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_LHV_fuel(duration = 10, height = 0, offset = 42.8 * 10.0 ^ 6.0, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-70, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_effComb(duration = 10, height = 0.01, offset = 0.95, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_effComb.y, Combustion.u_effComb) annotation(
    Line(points = {{-58, 10}, {-24, 10}, {-24, 24}, {-21, 24}}, color = {0, 0, 127}));
  connect(ramp_LHV_fuel.y, Combustion.u_LHV_fuel) annotation(
    Line(points = {{-58, 40}, {-28, 40}, {-28, 30}, {-21, 30}}, color = {0, 0, 127}));
  connect(ramp_m_flow_fuel.y, Combustion.u_m_flow_fuel) annotation(
    Line(points = {{-59, 70}, {-24, 70}, {-24, 36}, {-21, 36}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end Combustion00_ex01;
