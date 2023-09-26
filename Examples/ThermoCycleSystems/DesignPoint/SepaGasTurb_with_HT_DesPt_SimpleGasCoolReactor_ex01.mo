within PropulsionSystem.Examples.ThermoCycleSystems.DesignPoint;

model SepaGasTurb_with_HT_DesPt_SimpleGasCoolReactor_ex01
  extends Modelica.Icons.Example;
  //-----
  import units = Modelica.Units.SI;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  parameter units.Area AreaHT = 250 "";
  parameter Real khconv = 20 "";
  parameter Real valMinTContour = 0;
  parameter Real valMaxTContour = 2500;
  //-----
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-230, 154}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-206, 154}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 288.15, p = 100*1000, nPorts = 3) annotation(
    Placement(visible = true, transformation(origin = {99, -110}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = engineAir, T = 288.15, p = 100*1000, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {84, 115}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  PropulsionSystem.Elements.BasicElements.CompressorDesignPoint00 CmpDesPt(redeclare package Medium = engineAir, PRdes_par = 40, effDes_par = 1) annotation(
    Placement(visible = true, transformation(origin = {33, -72}, extent = {{17, -17}, {-17, 17}}, rotation = 0)));
  PropulsionSystem.Utilities.ConstrainVariable constraint_m_flow(tgtValue_paramInput = 350, use_u_targetVal = false) annotation(
    Placement(visible = true, transformation(origin = {72, -77}, extent = {{-6, -6}, {6, 6}}, rotation = -90)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {72, -58}, extent = {{6, 6}, {-6, -6}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor annotation(
    Placement(visible = true, transformation(origin = {2, -72}, extent = {{6, -6}, {-6, 6}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed(w_fixed = 500) annotation(
    Placement(visible = true, transformation(origin = {-34, -72}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue real_pwrCmp(significantDigits = 4) annotation(
    Placement(visible = true, transformation(origin = {-8, -92}, extent = {{13, -10}, {-13, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TurbineDesignPoint00 TrbDesPt(redeclare package Medium = engineAir, effDes_par = 1) annotation(
    Placement(visible = true, transformation(origin = {50, 80}, extent = {{-18, -18}, {18, 18}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {87, 80}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue real_pwrCmp1(significantDigits = 4) annotation(
    Placement(visible = true, transformation(origin = {105, 64}, extent = {{-13, -9}, {13, 9}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed1(w_fixed = 1000) annotation(
    Placement(visible = true, transformation(origin = {120, 80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow ptHeatSrc_NormOp annotation(
    Placement(visible = true, transformation(origin = {-50, 8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_heat(duration = 1, height = 1e6, offset = 165*1e6, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {-88, 154}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow ptHeatSrc_LostCoolant annotation(
    Placement(visible = true, transformation(origin = {-196, -3}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  HeatTransferComponents.ForcedConvection.HTflatPlateTurbSmooth00 reactor_NormOp(Amech_par = 0.1, AreaHT_par = AreaHT, Len_par = 2, redeclare package Medium = engineAir, khconv = khconv) annotation(
    Placement(visible = true, transformation(origin = {12, 8}, extent = {{-20, 16}, {20, -16}}, rotation = 90)));
  HeatTransferComponents.NaturalConvection.HTverticalPlate00 reactor_LostCoolant(AreaHT_par = AreaHT, Lc = reactor_NormOp.Len_par, redeclare package Medium = engineAir, khconv = khconv) annotation(
    Placement(visible = true, transformation(origin = {-129.333, -2.33333}, extent = {{-16.6667, -16.6667}, {16.6667, 23.3333}}, rotation = 0)));
  FluidSystemComponents.Sensor.Temperature_degC_DispColor00 temperature_reactorIn(redeclare package Medium = engineAir, valMax = valMaxTContour, valMin = valMinTContour) annotation(
    Placement(visible = true, transformation(origin = {33, -23}, extent = {{-13, -7}, {13, 7}}, rotation = 0)));
  FluidSystemComponents.Sensor.Temperature_degC_DispColor00 temperature_reactorOut(redeclare package Medium = engineAir, valMax = valMaxTContour, valMin = valMinTContour) annotation(
    Placement(visible = true, transformation(origin = {33, 43}, extent = {{-13, -7}, {13, 7}}, rotation = 0)));
  HeatTransferComponents.Sensors.Temperature_degC_DispColor00 temperature_reactor_normOp(valMax = valMaxTContour, valMin = valMinTContour) annotation(
    Placement(visible = true, transformation(origin = {-18, 8}, extent = {{-12, -6}, {12, 6}}, rotation = -90)));
  HeatTransferComponents.Sensors.Temperature_degC_DispColor00 temperature_reactor_LostCoolant(valMax = valMaxTContour, valMin = valMinTContour) annotation(
    Placement(visible = true, transformation(origin = {-164, -3}, extent = {{-12, -6}, {12, 6}}, rotation = -90)));
  FluidSystemComponents.Sensor.Temperature_degC_DispColor00 temperature_inlet(redeclare package Medium = engineAir, valMax = valMaxTContour, valMin = valMinTContour) annotation(
    Placement(visible = true, transformation(origin = {69, -103}, extent = {{13, -7}, {-13, 7}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue real_m_flow_eng(significantDigits = 4) annotation(
    Placement(visible = true, transformation(origin = {74, -44}, extent = {{-13, -10}, {13, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue real_hconv_reactor_LostCoolant(significantDigits = 4) annotation(
    Placement(visible = true, transformation(origin = {-166, 29}, extent = {{19, -9}, {-19, 9}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue real_hconv_reactor_NormOp(significantDigits = 4) annotation(
    Placement(visible = true, transformation(origin = {-24, 39}, extent = {{19, -9}, {-19, 9}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue real_heat_reactor(significantDigits = 4) annotation(
    Placement(visible = true, transformation(origin = {-85, 117}, extent = {{-13, -9}, {13, 9}}, rotation = 0)));
  FluidSystemComponents.Sensor.Temperature_degC_DispColor00 temperature_exhaust(redeclare package Medium = engineAir, valMax = valMaxTContour, valMin = valMinTContour) annotation(
    Placement(visible = true, transformation(origin = {115, 111}, extent = {{-13, -7}, {13, 7}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue real_effTh(significantDigits = 4) annotation(
    Placement(visible = true, transformation(origin = {149, 27}, extent = {{-11, -7}, {11, 7}}, rotation = 0)));
  Modelica.Blocks.Math.Division effTh annotation(
    Placement(visible = true, transformation(origin = {124, 27}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Add pwrAvail annotation(
    Placement(visible = true, transformation(origin = {102, 44}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue real_pwrAvail(significantDigits = 4) annotation(
    Placement(visible = true, transformation(origin = {131, 44}, extent = {{-11, -7}, {11, 7}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = 1/(1e6)) annotation(
    Placement(visible = true, transformation(origin = {-99, 133}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue real_AreaHT(number = AreaHT, significantDigits = 6, use_numberPort = false) annotation(
    Placement(visible = true, transformation(origin = {92, 194}, extent = {{-13, -8}, {13, 8}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue real_khconv(number = khconv, significantDigits = 6, use_numberPort = false) annotation(
    Placement(visible = true, transformation(origin = {92, 172}, extent = {{-13, -8}, {13, 8}}, rotation = 0)));
equation
  connect(CmpDesPt.port_1, massFlowRate.port_b) annotation(
    Line(points = {{43.54, -58.4}, {65.54, -58.4}}, color = {0, 127, 255}, thickness = 0.75));
  connect(boundary.ports[1], massFlowRate.port_a) annotation(
    Line(points = {{89, -110}, {89, -58}, {78, -58}}, color = {0, 127, 255}, thickness = 0.75));
  connect(massFlowRate.m_flow, constraint_m_flow.u_variable) annotation(
    Line(points = {{72, -64.6}, {72, -70}}, color = {0, 0, 127}));
  connect(real_pwrCmp.numberPort, powerSensor.power) annotation(
    Line(points = {{7, -92}, {7, -79}}, color = {0, 0, 127}));
  connect(TrbDesPt.port_2, boundary1.ports[1]) annotation(
    Line(points = {{61.16, 94.4}, {84, 94.4}, {84, 105}}, color = {0, 127, 255}, thickness = 0.75));
  connect(real_pwrCmp1.numberPort, powerSensor1.power) annotation(
    Line(points = {{90, 64}, {82, 64}, {82, 73}, {82.35, 73}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(TrbDesPt.flange_2, powerSensor1.flange_a) annotation(
    Line(points = {{68, 80}, {82, 80}}, thickness = 1));
  connect(powerSensor1.flange_b, constantSpeed1.flange) annotation(
    Line(points = {{93, 80}, {109, 80}}, thickness = 1));
  connect(ramp_heat.y, ptHeatSrc_NormOp.Q_flow) annotation(
    Line(points = {{-88, 143}, {-88, 70}, {-60, 70}, {-60, 8}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(CmpDesPt.port_2, reactor_NormOp.port_1) annotation(
    Line(points = {{24, -58}, {12, -58}, {12, -12}}, color = {0, 127, 255}, thickness = 0.75));
  connect(TrbDesPt.port_1, reactor_NormOp.port_2) annotation(
    Line(points = {{40, 94}, {12, 94}, {12, 28}}, color = {0, 127, 255}, thickness = 0.75));
  connect(ptHeatSrc_NormOp.port, reactor_NormOp.heatPort) annotation(
    Line(points = {{-40, 8}, {-4, 8}}, color = {191, 0, 0}, thickness = 0.75));
  connect(boundary.ports[2], reactor_LostCoolant.portStat) annotation(
    Line(points = {{90, -110}, {-129, -110}, {-129, -19}}, color = {0, 127, 255}, thickness = 0.75));
  connect(ptHeatSrc_LostCoolant.port, reactor_LostCoolant.heatPort) annotation(
    Line(points = {{-186, -3}, {-146, -3}}, color = {191, 0, 0}, thickness = 0.75));
  connect(ramp_heat.y, ptHeatSrc_LostCoolant.Q_flow) annotation(
    Line(points = {{-88, 143}, {-88, 40}, {-206, 40}, {-206, -3}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(temperature_reactorIn.port, reactor_NormOp.port_1) annotation(
    Line(points = {{20, -23.35}, {12, -23.35}, {12, -12.35}}, color = {0, 127, 255}));
  connect(temperature_reactorOut.port, reactor_NormOp.port_2) annotation(
    Line(points = {{20, 42.65}, {12, 42.65}, {12, 27.65}}, color = {0, 127, 255}));
  connect(reactor_NormOp.heatPort, temperature_reactor_normOp.heatPort) annotation(
    Line(points = {{-4, 8}, {-9, 8}, {-9, 20}, {-18, 20}}, color = {191, 0, 0}));
  connect(temperature_reactor_LostCoolant.heatPort, reactor_LostCoolant.heatPort) annotation(
    Line(points = {{-164, 9}, {-157.5, 9}, {-157.5, -3}, {-146, -3}}, color = {191, 0, 0}));
  connect(temperature_inlet.port, boundary.ports[3]) annotation(
    Line(points = {{82, -103}, {82, -110}, {90, -110}}, color = {0, 127, 255}));
  connect(massFlowRate.m_flow, real_m_flow_eng.numberPort) annotation(
    Line(points = {{72, -64}, {59, -64}, {59, -44}}, color = {0, 0, 127}));
  connect(reactor_LostCoolant.y_h, real_hconv_reactor_LostCoolant.numberPort) annotation(
    Line(points = {{-144, 21}, {-144, 29}}, color = {0, 0, 127}));
  connect(reactor_NormOp.y_h, real_hconv_reactor_NormOp.numberPort) annotation(
    Line(points = {{-2, 28}, {-2, 39}}, color = {0, 0, 127}));
  connect(TrbDesPt.port_2, temperature_exhaust.port) annotation(
    Line(points = {{62, 94}, {102, 94}, {102, 111}}, color = {0, 127, 255}));
  connect(pwrAvail.y, effTh.u1) annotation(
    Line(points = {{108.6, 44}, {112.6, 44}, {112.6, 31}, {116.6, 31}}, color = {0, 0, 127}));
  connect(effTh.y, real_effTh.numberPort) annotation(
    Line(points = {{130.6, 27}, {135.6, 27}}, color = {0, 0, 127}));
  connect(pwrAvail.y, real_pwrAvail.numberPort) annotation(
    Line(points = {{108.6, 44}, {118.6, 44}}, color = {0, 0, 127}));
  connect(powerSensor.flange_a, CmpDesPt.flange_2) annotation(
    Line(points = {{8, -72}, {16, -72}}, thickness = 1));
  connect(constantSpeed.flange, powerSensor.flange_b) annotation(
    Line(points = {{-24, -72}, {-4, -72}}, thickness = 1));
  connect(pwrAvail.u1, powerSensor1.power) annotation(
    Line(points = {{95, 48}, {82, 48}, {82, 74}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(powerSensor.power, pwrAvail.u2) annotation(
    Line(points = {{7, -79}, {7, -32}, {95, -32}, {95, 40}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(ramp_heat.y, effTh.u2) annotation(
    Line(points = {{-88, 143}, {-88, 70}, {-56, 70}, {-56, 23}, {117, 23}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(gain.u, ramp_heat.y) annotation(
    Line(points = {{-93, 133}, {-93, 143}, {-88, 143}}, color = {0, 0, 127}));
  connect(gain.y, real_heat_reactor.numberPort) annotation(
    Line(points = {{-104.5, 133}, {-104.5, 117}, {-100, 117}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-260, -140}, {200, 240}}), graphics = {Text(origin = {-61, 117}, extent = {{-13, 3}, {13, -3}}, textString = "[MW]"), Text(origin = {113, 193}, extent = {{-13, 3}, {13, -3}}, textString = "[m2]"), Text(origin = {116, 172}, extent = {{-13, 3}, {13, -3}}, textString = "[nond]"), Text(origin = {117, 182}, extent = {{-65, 6}, {65, -6}}, textString = "Factor on convective heat transfer coefficient", horizontalAlignment = TextAlignment.Left), Text(origin = {99, 204}, extent = {{-47, 3}, {47, -3}}, textString = "Eff area of heat transfer", horizontalAlignment = TextAlignment.Left), Text(origin = {-179, 69}, extent = {{-69, 8}, {69, -8}}, textString = "Only coolant supplied is ambient air.", horizontalAlignment = TextAlignment.Left), Text(origin = {-179, 59}, extent = {{-69, 7}, {69, -7}}, textString = "Heat removal is by natural convection.", horizontalAlignment = TextAlignment.Left), Text(origin = {-185, 78}, extent = {{-63, 4}, {63, -4}}, textString = "Coolant water is lost.", horizontalAlignment = TextAlignment.Left), Text(origin = {-217, 92}, extent = {{-39, 6}, {39, -6}}, textString = "Failure Mode"), Rectangle(origin = {115, 187}, pattern = LinePattern.Dash, extent = {{-73, 29}, {73, -29}}), Rectangle(origin = {-164, 4}, pattern = LinePattern.Dash, extent = {{-70, 44}, {70, -44}}), Text(origin = {1, 134}, extent = {{-47, 8}, {47, -8}}, textString = "Normal Operation"), Text(origin = {69, 228}, extent = {{-65, 8}, {65, -8}}, textString = "Key design parameters;")}),
    Icon(coordinateSystem(extent = {{-200, -100}, {100, 100}})),
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.01));
end SepaGasTurb_with_HT_DesPt_SimpleGasCoolReactor_ex01;
