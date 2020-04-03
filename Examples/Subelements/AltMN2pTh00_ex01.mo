within PropulsionSystem.Examples.Subelements;

model AltMN2pTh00_ex01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  PropulsionSystem.Subelements.AltMN2pTh00 AltMN2pTh(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {20, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_X(k = 1)  annotation(
    Placement(visible = true, transformation(origin = {-50, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_alt(duration = 10, height = -1000, offset = 10000, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_MN(duration = 10, height = -0.1, offset = 0.8, startTime = 30)  annotation(
    Placement(visible = true, transformation(origin = {-50, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_dTamb(duration = 10, height = -5, offset = 0, startTime = 50)  annotation(
    Placement(visible = true, transformation(origin = {-50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_dTamb.y, AltMN2pTh.u_dTamb) annotation(
    Line(points = {{-39, -30}, {-27, -30}, {-27, -8}, {-3, -8}}, color = {0, 0, 127}));
  connect(const_X.y, AltMN2pTh.u_X[1]) annotation(
    Line(points = {{-39, -60}, {-14, -60}, {-14, -16}, {-2, -16}}, color = {0, 0, 127}));
  connect(ramp_alt.y, AltMN2pTh.u_alt) annotation(
    Line(points = {{-39, 50}, {-15, 50}, {-15, 16}, {-3, 16}, {-3, 16}}, color = {0, 0, 127}));
  connect(ramp_MN.y, AltMN2pTh.u_MN) annotation(
    Line(points = {{-39, 20}, {-23, 20}, {-23, 8}, {-3, 8}, {-3, 8}}, color = {0, 0, 127}));

annotation(
    experiment(StartTime = 0, StopTime = 80, Tolerance = 1e-6, Interval = 0.16),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
    
    
end AltMN2pTh00_ex01;
