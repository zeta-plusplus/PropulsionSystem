within PropulsionSystem.Examples.Tests;

model NozzleConv_002
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //-----
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, nPorts = 1, use_T_in = true, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-50, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = engineAir, nPorts = 1, use_T_in = true, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {80, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PropulsionSystem.Elements.BasicElements.Compressor Cmp020(redeclare package Medium = engineAir, PRdes = 3, effDes = 0.9, switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) annotation(
    Placement(visible = true, transformation(origin = {-20, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 0.1, height = 0, offset = 101.3 * 1000, startTime = 0.5) annotation(
    Placement(visible = true, transformation(origin = {-90, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp2(duration = 0.1, height = 0, offset = 288.15, startTime = 0.5) annotation(
    Placement(visible = true, transformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp3(duration = 0.1, height = 0, offset = 288.15, startTime = 0.5) annotation(
    Placement(visible = true, transformation(origin = {114, 42}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp4(duration = 0.1, height = 0, offset = 101.3 * 1000, startTime = 0.5) annotation(
    Placement(visible = true, transformation(origin = {114, 2}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed1(w_fixed = 50) annotation(
    Placement(visible = true, transformation(origin = {40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 100) annotation(
    Placement(visible = true, transformation(origin = {10, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp5(duration = 5, height = 4.999, offset = 1.001, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.constrain_dm constrain_dm1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NozzleConv Nzl070(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {40, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-110, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(boundary1.T_in, ramp3.y) annotation(
    Line(points = {{92, 36}, {100, 36}, {100, 42}, {103, 42}}, color = {0, 0, 127}));
  connect(boundary1.p_in, ramp4.y) annotation(
    Line(points = {{92, 32}, {100, 32}, {100, 2}, {103, 2}}, color = {0, 0, 127}));
  connect(Nzl070.port_2, boundary1.ports[1]) annotation(
    Line(points = {{50, 38}, {70, 38}}, color = {0, 127, 255}));
  connect(constrain_dm1.port_2, Nzl070.port_1) annotation(
    Line(points = {{20, 38}, {30, 38}, {30, 38}, {30, 38}}, color = {0, 127, 255}));
  connect(Cmp020.port_2, constrain_dm1.port_1) annotation(
    Line(points = {{-10, 38}, {0, 38}, {0, 38}, {0, 38}}, color = {0, 127, 255}));
  connect(inertia1.flange_b, constantSpeed1.flange) annotation(
    Line(points = {{20, -2}, {25, -2}, {25, 0}, {30, 0}}));
  connect(ramp5.y, Cmp020.PR_in) annotation(
    Line(points = {{-29, -2}, {-20, -2}, {-20, 22}}, color = {0, 0, 127}));
  connect(boundary.ports[1], Cmp020.port_1) annotation(
    Line(points = {{-40, 40}, {-35, 40}, {-35, 36}, {-30, 36}}, color = {0, 127, 255}, thickness = 0.5));
  connect(Cmp020.flange_2, inertia1.flange_a) annotation(
    Line(points = {{-10, 28}, {-6, 28}, {-6, -2}, {0, -2}}));
  connect(ramp2.y, boundary.T_in) annotation(
    Line(points = {{-79, 0}, {-69, 0}, {-69, 46}, {-62, 46}}, color = {0, 0, 127}));
  connect(ramp1.y, boundary.p_in) annotation(
    Line(points = {{-79, 40}, {-73, 40}, {-73, 50}, {-62, 50}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.001),
    Diagram(coordinateSystem(extent = {{-140, -140}, {140, 140}})),
    Icon(coordinateSystem(extent = {{-140, -140}, {140, 140}})),
    __OpenModelica_commandLineOptions = "");
end NozzleConv_002;
