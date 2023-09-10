within PropulsionSystem.Examples.ThermoCycleSystems.DesignPoint;

model SeparateGasTurbine_with_HT_DesPt_ex01
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  parameter Real valMinTContour=0;
  parameter Real valMaxTContour=2500;
  //-----
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-68, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-44, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 288.15, p = 100*1000, nPorts = 2) annotation(
    Placement(visible = true, transformation(origin = {64, -62}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = engineAir, T = 288.15, p = 100*1000, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {44, 87}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  PropulsionSystem.Elements.BasicElements.CompressorDesignPoint00 CmpDesPt(redeclare package Medium = engineAir, PRdes_par = 40, effDes_par = 1) annotation(
    Placement(visible = true, transformation(origin = {-5, -76}, extent = {{17, -17}, {-17, 17}}, rotation = 0)));
  PropulsionSystem.Utilities.ConstrainVariable constraint_m_flow(tgtValue_paramInput = 10, use_u_targetVal = false) annotation(
    Placement(visible = true, transformation(origin = {34, -83}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {34, -62}, extent = {{6, 6}, {-6, -6}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor annotation(
    Placement(visible = true, transformation(origin = {-40, -76}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed(w_fixed = 500) annotation(
    Placement(visible = true, transformation(origin = {-72, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue real_pwrCmp(significantDigits = 4) annotation(
    Placement(visible = true, transformation(origin = {-29, -93}, extent = {{-11, -7}, {11, 7}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TurbineDesignPoint00 TrbDesPt(redeclare package Medium = engineAir, effDes_par = 1) annotation(
    Placement(visible = true, transformation(origin = {12, 46}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {49, 46}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue real_pwrCmp1(significantDigits = 4) annotation(
    Placement(visible = true, transformation(origin = {65, 32}, extent = {{-11, -7}, {11, 7}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed1(w_fixed = 1000) annotation(
    Placement(visible = true, transformation(origin = {82, 46}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow pointHeatSource annotation(
    Placement(visible = true, transformation(origin = {-98, 6}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_heat(duration = 1, height = 1e5, offset = 3e6, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-98, 40}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  HeatTransferComponents.ForcedConvection.HTflatPlateTurbSmooth00 reactor_NormOp(AreaHT_par = 30, redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-36, -4}, extent = {{-20, 16}, {20, -16}}, rotation = 90)));
  FluidSystemComponents.Sensor.Temperature_degC_DispColor00 temperature_reactorIn(redeclare package Medium = engineAir, valMax = valMaxTContour, valMin = valMinTContour) annotation(
    Placement(visible = true, transformation(origin = {-19, -37}, extent = {{-13, -7}, {13, 7}}, rotation = 0)));
  FluidSystemComponents.Sensor.Temperature_degC_DispColor00 temperature_reactorOut(redeclare package Medium = engineAir, valMax = valMaxTContour, valMin = valMinTContour) annotation(
    Placement(visible = true, transformation(origin = {-19, 31}, extent = {{-13, -7}, {13, 7}}, rotation = 0)));
  HeatTransferComponents.Sensors.Temperature_degC_DispColor00 temperature_reactor_normOp(valMax = valMaxTContour, valMin = valMinTContour) annotation(
    Placement(visible = true, transformation(origin = {-66, -4}, extent = {{-12, -6}, {12, 6}}, rotation = -90)));
  FluidSystemComponents.Sensor.Temperature_degC_DispColor00 temperature_inlet(redeclare package Medium = engineAir, valMax = valMaxTContour, valMin = valMinTContour) annotation(
    Placement(visible = true, transformation(origin = {67, -85}, extent = {{-13, -7}, {13, 7}}, rotation = 0)));
  FluidSystemComponents.Sensor.Temperature_degC_DispColor00 temperature_exhaust(redeclare package Medium = engineAir, valMax = valMaxTContour, valMin = valMinTContour) annotation(
    Placement(visible = true, transformation(origin = {69, 77}, extent = {{-13, -7}, {13, 7}}, rotation = 0)));
equation
  connect(CmpDesPt.port_1, massFlowRate.port_b) annotation(
    Line(points = {{5.54, -62.4}, {27.54, -62.4}}, color = {0, 127, 255}));
  connect(boundary.ports[1], massFlowRate.port_a) annotation(
    Line(points = {{54, -62}, {40, -62}}, color = {0, 127, 255}));
  connect(massFlowRate.m_flow, constraint_m_flow.u_variable) annotation(
    Line(points = {{34, -68.6}, {34, -76.2}}, color = {0, 0, 127}));
  connect(powerSensor.flange_b, CmpDesPt.flange_2) annotation(
    Line(points = {{-34, -76}, {-22, -76}}));
  connect(constantSpeed.flange, powerSensor.flange_a) annotation(
    Line(points = {{-62, -76}, {-46, -76}}));
  connect(real_pwrCmp.numberPort, powerSensor.power) annotation(
    Line(points = {{-41.65, -93}, {-44.65, -93}, {-44.65, -83}}, color = {0, 0, 127}));
  connect(TrbDesPt.port_2, boundary1.ports[1]) annotation(
    Line(points = {{23.16, 60.4}, {44.16, 60.4}, {44.16, 77.4}}, color = {0, 127, 255}));
  connect(real_pwrCmp1.numberPort, powerSensor1.power) annotation(
    Line(points = {{52.35, 32}, {44.35, 32}, {44.35, 39}}, color = {0, 0, 127}));
  connect(TrbDesPt.flange_2, powerSensor1.flange_a) annotation(
    Line(points = {{30, 46}, {44, 46}}));
  connect(powerSensor1.flange_b, constantSpeed1.flange) annotation(
    Line(points = {{55, 46}, {71, 46}}));
  connect(ramp_heat.y, pointHeatSource.Q_flow) annotation(
    Line(points = {{-98, 29}, {-98, 16}}, color = {0, 0, 127}));
  connect(TrbDesPt.port_1, reactor_NormOp.port_2) annotation(
    Line(points = {{1, 60}, {-36, 60}, {-36, 16}}, color = {0, 127, 255}));
  connect(CmpDesPt.port_2, reactor_NormOp.port_1) annotation(
    Line(points = {{-15, -62}, {-36, -62}, {-36, -24}}, color = {0, 127, 255}));
  connect(pointHeatSource.port, reactor_NormOp.heatPort) annotation(
    Line(points = {{-98, -4}, {-52, -4}}, color = {191, 0, 0}));
  connect(temperature_reactorOut.port, reactor_NormOp.port_2) annotation(
    Line(points = {{-32, 31}, {-36, 31}, {-36, 16}}, color = {0, 127, 255}));
  connect(temperature_reactorIn.port, reactor_NormOp.port_1) annotation(
    Line(points = {{-32, -37}, {-36, -37}, {-36, -24}}, color = {0, 127, 255}));
  connect(reactor_NormOp.heatPort, temperature_reactor_normOp.heatPort) annotation(
    Line(points = {{-52, -4}, {-58, -4}, {-58, 8}, {-66, 8}}, color = {191, 0, 0}));
  connect(temperature_inlet.port, boundary.ports[2]) annotation(
    Line(points = {{54, -85}, {54, -62}}, color = {0, 127, 255}));
  connect(TrbDesPt.port_2, temperature_exhaust.port) annotation(
    Line(points = {{24, 60}, {56, 60}, {56, 77}}, color = {0, 127, 255}));
  annotation(
    Diagram(coordinateSystem(extent = {{-120, -100}, {100, 100}})),
    Icon(coordinateSystem(extent = {{-120, -100}, {100, 100}})),
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.01));

end SeparateGasTurbine_with_HT_DesPt_ex01;
