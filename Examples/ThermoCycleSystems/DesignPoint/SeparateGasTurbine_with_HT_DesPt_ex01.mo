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
    Placement(visible = true, transformation(origin = {-46, -76}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed(w_fixed = 500) annotation(
    Placement(visible = true, transformation(origin = {-72, -76}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue real_pwrCmp(significantDigits = 4) annotation(
    Placement(visible = true, transformation(origin = {-28, -93}, extent = {{-11, -7}, {11, 7}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TurbineDesignPoint00 TrbDesPt(redeclare package Medium = engineAir, effDes_par = 1) annotation(
    Placement(visible = true, transformation(origin = {12, 46}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {43, 46}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue real_pwrCmp1(significantDigits = 4) annotation(
    Placement(visible = true, transformation(origin = {57, 29}, extent = {{-11, -7}, {11, 7}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed1(w_fixed = 1000) annotation(
    Placement(visible = true, transformation(origin = {82, 46}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow pointHeatSource annotation(
    Placement(visible = true, transformation(origin = {-98, 6}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Ramp ramp_heat(duration = 1, height = 1e5, offset = 3e6, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-98, 46}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
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
  Modelica.Blocks.Math.Add pwrAvail annotation(
    Placement(visible = true, transformation(origin = {58, 12}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Division effTh annotation(
    Placement(visible = true, transformation(origin = {80, -5}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue real_pwrAvail(significantDigits = 4) annotation(
    Placement(visible = true, transformation(origin = {87, 12}, extent = {{-11, -7}, {11, 7}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue real_effTh(significantDigits = 4) annotation(
    Placement(visible = true, transformation(origin = {105, -5}, extent = {{-11, -7}, {11, 7}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue real_pwrReactor(significantDigits = 4) annotation(
    Placement(visible = true, transformation(origin = {-71, 31}, extent = {{-11, -7}, {11, 7}}, rotation = 0)));
equation
  connect(CmpDesPt.port_1, massFlowRate.port_b) annotation(
    Line(points = {{5.54, -62.4}, {27.54, -62.4}}, color = {0, 127, 255}));
  connect(boundary.ports[1], massFlowRate.port_a) annotation(
    Line(points = {{54, -62}, {40, -62}}, color = {0, 127, 255}));
  connect(massFlowRate.m_flow, constraint_m_flow.u_variable) annotation(
    Line(points = {{34, -68.6}, {34, -76.2}}, color = {0, 0, 127}));
  connect(real_pwrCmp.numberPort, powerSensor.power) annotation(
    Line(points = {{-41, -93}, {-41, -83}}, color = {0, 0, 127}));
  connect(TrbDesPt.port_2, boundary1.ports[1]) annotation(
    Line(points = {{23.16, 60.4}, {44.16, 60.4}, {44.16, 77.4}}, color = {0, 127, 255}));
  connect(TrbDesPt.flange_2, powerSensor1.flange_a) annotation(
    Line(points = {{30, 46}, {37, 46}}));
  connect(powerSensor1.flange_b, constantSpeed1.flange) annotation(
    Line(points = {{49, 46}, {71, 46}}));
  connect(ramp_heat.y, pointHeatSource.Q_flow) annotation(
    Line(points = {{-98, 35}, {-98, 16}}, color = {0, 0, 127}));
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
  connect(constantSpeed.flange, powerSensor.flange_b) annotation(
    Line(points = {{-62, -76}, {-52, -76}}));
  connect(powerSensor.flange_a, CmpDesPt.flange_2) annotation(
    Line(points = {{-40, -76}, {-22, -76}}));
  connect(pwrAvail.y, effTh.u1) annotation(
    Line(points = {{65, 12}, {69, 12}, {69, -1}, {73, -1}}, color = {0, 0, 127}));
  connect(pwrAvail.u1, powerSensor1.power) annotation(
    Line(points = {{51, 16}, {38, 16}, {38, 39}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(powerSensor.power, pwrAvail.u2) annotation(
    Line(points = {{-42, -82}, {-42, -44}, {51, -44}, {51, 8}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(ramp_heat.y, effTh.u2) annotation(
    Line(points = {{-98, 35}, {-98, 22}, {-76, 22}, {-76, -9}, {73, -9}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(real_pwrCmp1.numberPort, powerSensor1.power) annotation(
    Line(points = {{44, 29}, {38, 29}, {38, 40}}, color = {0, 0, 127}));
  connect(pwrAvail.y, real_pwrAvail.numberPort) annotation(
    Line(points = {{64, 12}, {74, 12}}, color = {0, 0, 127}));
  connect(effTh.y, real_effTh.numberPort) annotation(
    Line(points = {{87, -5}, {92, -5}}, color = {0, 0, 127}));
  connect(real_pwrReactor.numberPort, ramp_heat.y) annotation(
    Line(points = {{-84, 31}, {-98, 31}, {-98, 36}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-120, -100}, {120, 100}})),
    Icon(coordinateSystem(extent = {{-120, -100}, {120, 100}})),
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.01));

end SeparateGasTurbine_with_HT_DesPt_ex01;
