within PropulsionSystem.Examples.Elements.BasicElements;

model NozzleConv_defAmech_002
  extends Modelica.Icons.Example;
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //-----
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, nPorts = 1, use_T_in = true, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {-50, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = engineAir, nPorts = 1, use_T_in = true, use_p_in = true) annotation(
    Placement(visible = true, transformation(origin = {50, 18}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PropulsionSystem.Elements.BasicElements.NozzleConv_defAmech Nzl003(redeclare package Medium = engineAir, Amech_th_def = 0.01, switchInput_Amech_th = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) annotation(
    Placement(visible = true, transformation(origin = {10, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Compressor Cmp020(redeclare package Medium = engineAir, PRdes = 3, effDes = 0.9, switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) annotation(
    Placement(visible = true, transformation(origin = {-20, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 0.1, height = 0, offset = 101.3 * 1000, startTime = 0.5) annotation(
    Placement(visible = true, transformation(origin = {-90, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp2(duration = 0.1, height = 0, offset = 288.15, startTime = 0.5) annotation(
    Placement(visible = true, transformation(origin = {-90, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp3(duration = 0.1, height = 0, offset = 288.15, startTime = 0.5) annotation(
    Placement(visible = true, transformation(origin = {90, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp4(duration = 0.1, height = 0, offset = 101.3 * 1000, startTime = 0.5) annotation(
    Placement(visible = true, transformation(origin = {90, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed1(w_fixed = 50) annotation(
    Placement(visible = true, transformation(origin = {40, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 100) annotation(
    Placement(visible = true, transformation(origin = {10, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp5(duration = 5, height = 0, offset = 3, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {-40, -18}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp6(duration = 5, height = 0.98, offset = 0.02, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {16, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(boundary1.T_in, ramp3.y) annotation(
    Line(points = {{62, 14}, {70, 14}, {70, 18}, {79, 18}}, color = {0, 0, 127}));
  connect(boundary1.p_in, ramp4.y) annotation(
    Line(points = {{62, 10}, {70, 10}, {70, -22}, {79, -22}}, color = {0, 0, 127}));
  connect(Nzl003.port_2, boundary1.ports[1]) annotation(
    Line(points = {{20, 18}, {29, 18}, {29, 20}, {40, 20}}, color = {0, 127, 255}));
  connect(inertia1.flange_b, constantSpeed1.flange) annotation(
    Line(points = {{20, -20}, {25, -20}, {25, -18}, {30, -18}}));
  connect(ramp2.y, boundary.T_in) annotation(
    Line(points = {{-79, -22}, {-69, -22}, {-69, 24}, {-62, 24}}, color = {0, 0, 127}));
  connect(Cmp020.flange_2, inertia1.flange_a) annotation(
    Line(points = {{-10, 10}, {-6, 10}, {-6, -20}, {0, -20}}));
  connect(ramp5.y, Cmp020.PR_in) annotation(
    Line(points = {{-29, -20}, {-20, -20}, {-20, 2}}, color = {0, 0, 127}));
  connect(ramp6.y, Nzl003.Amech_th_in) annotation(
    Line(points = {{16, 37}, {16, 17}}, color = {0, 0, 127}));
  connect(Cmp020.port_2, Nzl003.port_1) annotation(
    Line(points = {{-10, 18}, {-5, 18}, {-5, 20}, {0, 20}}, color = {0, 127, 255}));
  connect(boundary.ports[1], Cmp020.port_1) annotation(
    Line(points = {{-40, 20}, {-35, 20}, {-35, 16}, {-30, 16}}, color = {0, 127, 255}, thickness = 0.5));
  connect(ramp1.y, boundary.p_in) annotation(
    Line(points = {{-79, 20}, {-73, 20}, {-73, 30}, {-62, 30}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.001));
end NozzleConv_defAmech_002;
