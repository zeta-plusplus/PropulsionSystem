within PropulsionSystem.Examples.Engines.DesignPoint;

model SeparateGasTurbine_with_HT_DesPt_ex01
  extends Modelica.Icons.Example;
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-68, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-44, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 288.15, p = 100*1000, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {64, -58}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = engineAir, T = 288.15, p = 100*1000, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {44, 77}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  PropulsionSystem.Elements.BasicElements.CompressorDesignPoint00 CmpDesPt(redeclare package Medium = engineAir, PRdes_par = 30) annotation(
    Placement(visible = true, transformation(origin = {-5, -72}, extent = {{17, -17}, {-17, 17}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.HeatInjector00 HeatInjector(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-47, 15}, extent = {{-15, -15}, {15, 15}}, rotation = 90)));
  PropulsionSystem.Utilities.ConstrainVariable constraint_m_flow(tgtValue_paramInput = 10, use_u_targetVal = false) annotation(
    Placement(visible = true, transformation(origin = {34, -79}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {34, -58}, extent = {{6, 6}, {-6, -6}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor annotation(
    Placement(visible = true, transformation(origin = {-40, -72}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed(w_fixed = 500) annotation(
    Placement(visible = true, transformation(origin = {-72, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue real_pwrCmp(significantDigits = 4) annotation(
    Placement(visible = true, transformation(origin = {-29, -89}, extent = {{-11, -7}, {11, 7}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TurbineDesignPoint00 TrbDesPt(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {12, 36}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {49, 36}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue real_pwrCmp1(significantDigits = 4) annotation(
    Placement(visible = true, transformation(origin = {65, 22}, extent = {{-11, -7}, {11, 7}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed1(w_fixed = 1000) annotation(
    Placement(visible = true, transformation(origin = {82, 36}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow pointHeatSource annotation(
    Placement(visible = true, transformation(origin = {-110, 36}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_heat(duration = 1, height = 5e5, offset = 5e6, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-110, 64}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection annotation(
    Placement(visible = true, transformation(origin = {-89, 15}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  HeatTransferComponents.ForcedConvection.Block_hFlatPlateTurbSmooth00 calc_hConv(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-47, -22}, extent = {{10, -8}, {-10, 8}}, rotation = -90)));
  Modelica.Blocks.Math.Product product annotation(
    Placement(visible = true, transformation(origin = {-78, -8}, extent = {{-6, -6}, {6, 6}}, rotation = 180)));
  Modelica.Blocks.Sources.Constant areaHeatTransfer(k = 10) annotation(
    Placement(visible = true, transformation(origin = {-64, -34}, extent = {{6, -6}, {-6, 6}}, rotation = -90)));
equation
  connect(CmpDesPt.port_1, massFlowRate.port_b) annotation(
    Line(points = {{6, -58}, {28, -58}}, color = {0, 127, 255}));
  connect(boundary.ports[1], massFlowRate.port_a) annotation(
    Line(points = {{54, -58}, {40, -58}}, color = {0, 127, 255}));
  connect(massFlowRate.m_flow, constraint_m_flow.u_variable) annotation(
    Line(points = {{34, -64.6}, {34, -72.2}}, color = {0, 0, 127}));
  connect(powerSensor.flange_b, CmpDesPt.flange_2) annotation(
    Line(points = {{-34, -72}, {-22, -72}}));
  connect(constantSpeed.flange, powerSensor.flange_a) annotation(
    Line(points = {{-62, -72}, {-46, -72}}));
  connect(real_pwrCmp.numberPort, powerSensor.power) annotation(
    Line(points = {{-41.65, -89}, {-44.65, -89}, {-44.65, -79}}, color = {0, 0, 127}));
  connect(TrbDesPt.port_1, HeatInjector.port_2) annotation(
    Line(points = {{1, 50}, {1, 52}, {-47, 52}, {-47, 30}}, color = {0, 127, 255}));
  connect(TrbDesPt.port_2, boundary1.ports[1]) annotation(
    Line(points = {{23, 50}, {44, 50}, {44, 67}}, color = {0, 127, 255}));
  connect(real_pwrCmp1.numberPort, powerSensor1.power) annotation(
    Line(points = {{52, 22}, {44, 22}, {44, 29}}, color = {0, 0, 127}));
  connect(TrbDesPt.flange_2, powerSensor1.flange_a) annotation(
    Line(points = {{30, 36}, {44, 36}}));
  connect(powerSensor1.flange_b, constantSpeed1.flange) annotation(
    Line(points = {{56, 36}, {72, 36}}));
  connect(ramp_heat.y, pointHeatSource.Q_flow) annotation(
    Line(points = {{-110, 53}, {-110, 45}}, color = {0, 0, 127}));
  connect(convection.fluid, HeatInjector.HeatPort_1) annotation(
    Line(points = {{-79, 15}, {-62, 15}}, color = {191, 0, 0}));
  connect(convection.solid, pointHeatSource.port) annotation(
    Line(points = {{-99, 15}, {-110, 15}, {-110, 26}}, color = {191, 0, 0}));
  connect(calc_hConv.port_2, HeatInjector.port_1) annotation(
    Line(points = {{-47, -12}, {-47, 0}}, color = {0, 127, 255}));
  connect(calc_hConv.port_1, CmpDesPt.port_2) annotation(
    Line(points = {{-47, -32}, {-47, -58}, {-14, -58}}, color = {0, 127, 255}));
  connect(product.y, convection.Gc) annotation(
    Line(points = {{-85, -8}, {-89, -8}, {-89, 5}}, color = {0, 0, 127}));
  connect(product.u2, calc_hConv.y_h) annotation(
    Line(points = {{-71, -4}, {-56, -4}, {-56, -16}}, color = {0, 0, 127}));
  connect(product.u1, areaHeatTransfer.y) annotation(
    Line(points = {{-71, -12}, {-64, -12}, {-64, -28}}, color = {0, 0, 127}));
  connect(calc_hConv.heatPort, convection.solid) annotation(
    Line(points = {{-54, -22}, {-99, -22}, {-99, 15}}, color = {191, 0, 0}));
  annotation(
    Diagram(coordinateSystem(extent = {{-160, -100}, {100, 100}})),
    Icon(coordinateSystem(extent = {{-160, -100}, {100, 100}})),
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.01));
end SeparateGasTurbine_with_HT_DesPt_ex01;
