within PropulsionSystem.Examples.Subelements;

model CombustionEfficiency00_ex01
  extends Modelica.Icons.Example;
  PropulsionSystem.Subelements.CombustionEfficiency00 calcEffComb(switchFuel = PropulsionSystem.Types.switches.switch_fuel.gasoline)  annotation(
    Placement(visible = true, transformation(origin = {0, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_fracFuel(duration = 10, height = 0.18, offset = 0.02, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(visible = true, transformation(origin = {-40, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 1)  annotation(
    Placement(visible = true, transformation(origin = {-70, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(const.y, feedback1.u1) annotation(
    Line(points = {{-59, 40}, {-56, 40}, {-56, 36}, {-48, 36}}, color = {0, 0, 127}));
  connect(feedback1.y, calcEffComb.u_fracAir) annotation(
    Line(points = {{-30, 36}, {-12, 36}, {-12, 36}, {-12, 36}}, color = {0, 0, 127}));
  connect(ramp_fracFuel.y, feedback1.u2) annotation(
    Line(points = {{-58, 10}, {-40, 10}, {-40, 28}}, color = {0, 0, 127}));
  connect(ramp_fracFuel.y, calcEffComb.u_fracFuel) annotation(
    Line(points = {{-59, 10}, {-18, 10}, {-18, 24}, {-11, 24}}, color = {0, 0, 127}));
annotation(
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-6, Interval = 0.06),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));end CombustionEfficiency00_ex01;
