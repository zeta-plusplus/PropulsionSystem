within PropulsionSystem.Examples.Elements.BasicElements;

model CmpCharFixed00_ex02
  extends Modelica.Icons.Example;
  //-----

package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharFixed00 Cmp(redeclare package Medium = engineAir, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated, switchDetermine_eff = PropulsionSystem.Types.switches.switchHowToDetVar.param) annotation(
    Placement(visible = true, transformation(origin = {-10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-50, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, T = 288.15, m_flow = -10, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {30, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp_pwr(duration = 10, height = -1000 * 1000, offset = -2000 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {0, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_eff(duration = 5, height = 0.1, offset = 0.8, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed1(w_fixed = 3000 * 2 * Modelica.Constants.pi / 60)  annotation(
    Placement(visible = true, transformation(origin = {90, 30}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.SetDependent setDependent1 annotation(
    Placement(visible = true, transformation(origin = {40, -10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(powerSensor1.power, setDependent1.dependent_in) annotation(
    Line(points = {{42, 19}, {42, 13}, {40, 13}, {40, 0}}, color = {0, 0, 127}));
  connect(Cmp.flange_2, powerSensor1.flange_a) annotation(
    Line(points = {{0, 30}, {40, 30}}));
  connect(powerSensor1.flange_b, constantSpeed1.flange) annotation(
    Line(points = {{60, 30}, {80, 30}, {80, 30}, {80, 30}}));
  connect(ramp_pwr.y, setDependent1.tgtVal_in) annotation(
    Line(points = {{12, -50}, {40, -50}, {40, -21}}, color = {0, 0, 127}));
  connect(ramp_eff.y, Cmp.u_eff) annotation(
    Line(points = {{-19, 0}, {-10, 0}, {-10, 24}}, color = {0, 0, 127}));
  connect(boundary.ports[1], Cmp.port_1) annotation(
    Line(points = {{-40, 60}, {-30, 60}, {-30, 38}, {-20, 38}}, color = {0, 127, 255}));
  connect(Cmp.port_2, boundary1.ports[1]) annotation(
    Line(points = {{0, 38}, {8, 38}, {8, 60}, {20, 60}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-06, Interval = 0.08),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Documentation(info = "<html>
  <a href=modelica://> Document html page</a>

</html>"));
end CmpCharFixed00_ex02;
