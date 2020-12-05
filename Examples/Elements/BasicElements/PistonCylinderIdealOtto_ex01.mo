within PropulsionSystem.Examples.Elements.BasicElements;

model PistonCylinderIdealOtto_ex01
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.DryAirNasa;
  package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  PropulsionSystem.Elements.BasicElements.PistonCylinderIdealOttoMV00 PistonCylinder(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {20, 16}, extent = {{-20, -24}, {20, 24}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 15 + 273.15, nPorts = 1, p = 101.325 * 1000, use_T_in = true, use_p_in = true)  annotation(
    Placement(visible = true, transformation(origin = {-30, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_fracFuel(duration = 10, height = 0, offset = 0.01, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p1(duration = 10, height = 100 * 1000, offset = 101.325 * 1000, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {-70, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T1(duration = 10, height = 20, offset = 15 + 273.15, startTime = 30)  annotation(
    Placement(visible = true, transformation(origin = {-70, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_fracFuel.y, PistonCylinder.u_fracFuel) annotation(
    Line(points = {{-19, 10}, {-9, 10}, {-9, 30}, {5, 30}}, color = {0, 0, 127}));
  connect(ramp_T1.y, boundary.T_in) annotation(
    Line(points = {{-58, 30}, {-54, 30}, {-54, 54}, {-42, 54}, {-42, 54}}, color = {0, 0, 127}));
  connect(ramp_p1.y, boundary.p_in) annotation(
    Line(points = {{-58, 60}, {-50, 60}, {-50, 58}, {-42, 58}, {-42, 58}}, color = {0, 0, 127}));
  connect(boundary.ports[1], PistonCylinder.port_1) annotation(
    Line(points = {{-20, 50}, {-14, 50}, {-14, 36}, {0, 36}, {0, 36}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-6, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
    
end PistonCylinderIdealOtto_ex01;
