within PropulsionSystem.Examples.temp;

model CmpCharTable01_temp1
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-50, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 288.15, nPorts = 1, p = 101.325 * 1000)  annotation(
    Placement(visible = true, transformation(origin = {-70, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-40, 40}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.SpeedSensor speedSensor1 annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.CmpCharTable01 Cmp(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-10, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, nPorts = 1, use_m_flow_in = true)  annotation(
    Placement(visible = true, transformation(origin = {50, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.Torque torque1 annotation(
    Placement(visible = true, transformation(origin = {60, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {90, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.VariableBySolver VarBySolver1 annotation(
    Placement(visible = true, transformation(origin = {90, 20}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.ConstrainVariableDesignPoint ConstraintDesPt annotation(
    Placement(visible = true, transformation(origin = {-40, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant const(k = 10)  annotation(
    Placement(visible = true, transformation(origin = {-40, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Constant const1(k = 3000) annotation(
    Placement(visible = true, transformation(origin = {30, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.UnitConversions.To_rpm to_rpm1 annotation(
    Placement(visible = true, transformation(origin = {30, -20}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Utilities.ConstrainVariable Constraint annotation(
    Placement(visible = true, transformation(origin = {30, -50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(Constraint.u_targetValue, const1.y) annotation(
    Line(points = {{30, -62}, {30, -62}, {30, -68}, {30, -68}}, color = {0, 0, 127}));
  connect(to_rpm1.y, Constraint.u_variable) annotation(
    Line(points = {{30, -30}, {30, -30}, {30, -38}, {30, -38}}, color = {0, 0, 127}));
  connect(speedSensor1.w, to_rpm1.u) annotation(
    Line(points = {{30, -2}, {30, -2}, {30, -8}, {30, -8}}, color = {0, 0, 127}));
  connect(const.y, ConstraintDesPt.u_targetValue) annotation(
    Line(points = {{-40, -8}, {-40, -8}, {-40, -2}, {-40, -2}}, color = {0, 0, 127}));
  connect(massFlowRate1.m_flow, ConstraintDesPt.u_variable) annotation(
    Line(points = {{-40, 28}, {-40, 28}, {-40, 22}, {-40, 22}}, color = {0, 0, 127}));
  connect(Cmp.port_2, boundary1.ports[1]) annotation(
    Line(points = {{0, 28}, {26, 28}, {26, 40}, {40, 40}}, color = {0, 127, 255}));
  connect(Cmp.flange_2, speedSensor1.flange) annotation(
    Line(points = {{0, 20}, {30, 20}}));
  connect(massFlowRate1.port_b, Cmp.port_1) annotation(
    Line(points = {{-30, 40}, {-24, 40}, {-24, 28}, {-20, 28}}, color = {0, 127, 255}));
  connect(boundary.ports[1], massFlowRate1.port_a) annotation(
    Line(points = {{-60, 40}, {-50, 40}}, color = {0, 127, 255}));
  connect(torque1.tau, VarBySolver1.y_independent) annotation(
    Line(points = {{72, 20}, {80, 20}, {80, 20}, {80, 20}}, color = {0, 0, 127}));
  connect(boundary1.m_flow_in, VarBySolver.y_independent) annotation(
    Line(points = {{60, 48}, {70, 48}, {70, 50}, {78, 50}, {78, 50}}, color = {0, 0, 127}));
  connect(speedSensor1.flange, torque1.flange) annotation(
    Line(points = {{30, 20}, {50, 20}}));
end CmpCharTable01_temp1;
