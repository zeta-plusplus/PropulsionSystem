within PropulsionSystem.Examples.Subelements;

model TurboPassage00_ex01
  extends Modelica.Icons.Example;
  PropulsionSystem.Subelements.TurboPassage00 TrboPsg(swCnstrPass = PropulsionSystem.Types.switches.switchConstraintTurboPassage.constHubRad)  annotation(
    Placement(transformation(origin = {-20, 33}, extent = {{-20, -9}, {20, 9}})));
  Modelica.Blocks.Sources.Ramp ramp_A_in(height = 0, duration = 10, offset = 0.5790, startTime = 10)  annotation(
    Placement(transformation(origin = {-40, -12}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_A_out(height = 0, duration = 10, offset = 0.1610, startTime = 30)  annotation(
    Placement(transformation(origin = {0, -14}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(ramp_A_in.y, TrboPsg.u_A_in) annotation(
    Line(points = {{-40, 0}, {-40, 33}}, color = {0, 0, 127}));
  connect(ramp_A_out.y, TrboPsg.u_A_out) annotation(
    Line(points = {{0, -2}, {0, 37.5}}, color = {0, 0, 127}));
annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-06, Interval = 0.1));
end TurboPassage00_ex01;