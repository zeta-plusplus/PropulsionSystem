within PropulsionSystem.Examples.ThermoCycleSystems.DesignPoint;

model SteamTrb_with_HT_SimpleReactor_ex01
  extends Modelica.Icons.Example;
  //-----
  import units = Modelica.Units.SI;
  //-----
  parameter units.Area AreaHT = 50 "";
  parameter Real valMinTContour = 0;
  parameter Real valMaxTContour = 600;
  //-----
  //-----
  parameter Real s_pumpDisp = 0.1;
  parameter Real s_pumpHead = 0.1;
  //-----
  Modelica.Fluid.Examples.DrumBoiler.BaseClasses.EquilibriumDrumBoiler evaporator(redeclare package Medium = Modelica.Media.Water.StandardWater, V_l(fixed = true), V_l_start = 0.7, V_t = 1, cp_D = 500, m_D = 1e-6, p(fixed = false, start = 2*101.325*1000), p_start = 25*100*1000) annotation(
    Placement(visible = true, transformation(origin = {50, -34}, extent = {{-20, 20}, {20, -20}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow heat_evaporator annotation(
    Placement(visible = true, transformation(origin = {-32, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowVapor(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {65, 144}, extent = {{5, 5}, {-5, -5}}, rotation = 180)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {378, -36}, extent = {{-160, 80}, {-140, 100}}, rotation = 0)));
  Modelica.Blocks.Math.Gain fracLiquid(k = 1/evaporator.V_t) annotation(
    Placement(visible = true, transformation(origin = {94, -26}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_r_liquidLevel(duration = 100, height = 0, offset = 0.7, startTime = 300) annotation(
    Placement(visible = true, transformation(origin = {114, 4}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Continuous.PI ctrl_pi(T = 5, initType = Modelica.Blocks.Types.Init.InitialOutput, k = -5e6, x_start = 0, y_start = 5e6) annotation(
    Placement(visible = true, transformation(origin = {114, -58}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(visible = true, transformation(origin = {114, -26}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.TurbineDesignPoint00 trb(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {120, 128}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundaryAtm(redeclare package Medium = Modelica.Media.Water.StandardWater, nPorts = 1, p = 100*1000) annotation(
    Placement(visible = true, transformation(origin = {184, 162}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed(w_fixed = 3000*2.0*Modelica.Constants.pi/60.0) annotation(
    Placement(visible = true, transformation(origin = {189, 128}, extent = {{9, -9}, {-9, 9}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerTrb annotation(
    Placement(visible = true, transformation(origin = {162, 128}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  PropulsionSystem.Utilities.ConstrainVariable constraint(tgtValue_paramInput = 2, use_u_targetVal = false) annotation(
    Placement(visible = true, transformation(origin = {140, -86}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {228, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue disp_pwrTrb(significantDigits = 5, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {119, 101}, extent = {{13, -7}, {-13, 7}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT tankOutlet(redeclare package Medium = Modelica.Media.Water.StandardWater, T = 15 + 273.15, nPorts = 2, p = 100*1000) annotation(
    Placement(visible = true, transformation(origin = {195, -118}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CompressorDesignPoint00 pump(redeclare package Medium = Modelica.Media.Water.StandardWater, PRdes_par = 25, effDes_par = 1, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.param) annotation(
    Placement(visible = true, transformation(origin = {58, -128}, extent = {{13, -13}, {-13, 13}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed1(w_fixed = 3000*2.0*Modelica.Constants.pi/60.0) annotation(
    Placement(visible = true, transformation(origin = {-6, -128}, extent = {{-9, -9}, {9, 9}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerPump annotation(
    Placement(visible = true, transformation(origin = {22, -128}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowWater(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {140, -118}, extent = {{-10, 10}, {10, -10}}, rotation = -180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 5, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {60, -149}, extent = {{-13, -7}, {13, 7}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = 1/1000) annotation(
    Placement(visible = true, transformation(origin = {32, -149}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = 1/1000) annotation(
    Placement(visible = true, transformation(origin = {145, 101}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_heat_vaporHeater(duration = 1, height = 4e5, offset = 5e5, startTime = 200) annotation(
    Placement(visible = true, transformation(origin = {-108, 144}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow heat_vaporHeater annotation(
    Placement(visible = true, transformation(origin = {-93, 92}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Sensor.Temperature_degC_DispColor00 temperature_pump_in(redeclare package Medium = Modelica.Media.Water.StandardWater, valMax = valMaxTContour, valMin = valMinTContour) annotation(
    Placement(visible = true, transformation(origin = {189, -137}, extent = {{-11, -7}, {11, 7}}, rotation = 0)));
  FluidSystemComponents.Sensor.Temperature_degC_DispColor00 temperature_pump_out(redeclare package Medium = Modelica.Media.Water.StandardWater, valMax = valMaxTContour, valMin = valMinTContour) annotation(
    Placement(visible = true, transformation(origin = {69, -97}, extent = {{-11, -7}, {11, 7}}, rotation = 0)));
  FluidSystemComponents.Sensor.Temperature_degC_DispColor00 temperature_evaporator_out(redeclare package Medium = Modelica.Media.Water.StandardWater, valMax = valMaxTContour, valMin = valMinTContour) annotation(
    Placement(visible = true, transformation(origin = {67, -3}, extent = {{-11, 7}, {11, -7}}, rotation = 0)));
  FluidSystemComponents.Sensor.Temperature_degC_DispColor00 temperature_vaporHeater_out(redeclare package Medium = Modelica.Media.Water.StandardWater, valMax = valMaxTContour, valMin = valMinTContour) annotation(
    Placement(visible = true, transformation(origin = {65, 102}, extent = {{-11, -7}, {11, 7}}, rotation = 0)));
  FluidSystemComponents.Sensor.Temperature_degC_DispColor00 temperature_trb_out(redeclare package Medium = Modelica.Media.Water.StandardWater, valMax = valMaxTContour, valMin = valMinTContour) annotation(
    Placement(visible = true, transformation(origin = {147, 153}, extent = {{-11, -7}, {11, 7}}, rotation = 0)));
  HeatTransferComponents.Sensors.Temperature_degC_DispColor00 temperature_vaporHeater_wall(valMax = valMaxTContour, valMin = valMinTContour) annotation(
    Placement(visible = true, transformation(origin = {-28, 93}, extent = {{-12, -6}, {12, 6}}, rotation = -90)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium = Modelica.Media.Water.StandardWater, T_start = 220 + 273.15, V = 2, nPorts = 3, p_start = 25*100*1000, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {40, 82}, extent = {{-10, 10}, {10, -10}}, rotation = -90)));
  HeatTransferComponents.ForcedConvection.Block_hFlatPlateTurbSmooth00 calc_hConv_vaporHeater(Amech = 0.005, Len = 2, redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {50, 38.75}, extent = {{16.25, -13}, {-16.25, 13}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant const_Area_HT_vaporHeater(k = 100) annotation(
    Placement(visible = true, transformation(origin = {-28, 56}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
  Modelica.Blocks.Math.Product product1 annotation(
    Placement(visible = true, transformation(origin = {4, 62}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Components.Convection conv_vaporHeater annotation(
    Placement(visible = true, transformation(origin = {4, 92}, extent = {{-14, 14}, {14, -14}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlow_evaporator annotation(
    Placement(visible = true, transformation(origin = {-3, -34}, extent = {{8, -8}, {-8, 8}}, rotation = -180)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlow_vaporHeater annotation(
    Placement(visible = true, transformation(origin = {-63, 92}, extent = {{8, 8}, {-8, -8}}, rotation = 180)));
  Modelica.Blocks.Math.Add sum_ReactorHeat annotation(
    Placement(visible = true, transformation(origin = {-86, 28}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  HeatTransferComponents.NaturalConvection.HTverticalPlate00 reactor_LostCoolant(AreaHT_par = 2*const_Area_HT_vaporHeater.k, Lc = 2*calc_hConv_vaporHeater.Len, redeclare package Medium = Modelica.Media.Air.DryAirNasa) annotation(
    Placement(visible = true, transformation(origin = {-226.333, -45.3333}, extent = {{16.6667, -16.6667}, {-16.6667, 23.3333}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue real_hconv_reactor_LostCoolant(significantDigits = 4) annotation(
    Placement(visible = true, transformation(origin = {-189, -15}, extent = {{-13, -9}, {13, 9}}, rotation = 0)));
  HeatTransferComponents.Sensors.Temperature_degC_DispColor00 temperature_reactor_LostCoolant(valMax = valMaxTContour, valMin = valMinTContour) annotation(
    Placement(visible = true, transformation(origin = {-192, -45}, extent = {{-12, -6}, {12, 6}}, rotation = -90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow ptHeatSrc_LostCoolant annotation(
    Placement(visible = true, transformation(origin = {-166, -46}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT ambientAir(redeclare package Medium = Modelica.Media.Air.DryAirNasa, T = 288.15, nPorts = 2, p = 100*1000) annotation(
    Placement(visible = true, transformation(origin = {197, -168}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue real_Q_flow_reactor(significantDigits = 4) annotation(
    Placement(visible = true, transformation(origin = {-83, 5}, extent = {{-13, -9}, {13, 9}}, rotation = 0)));
  FluidSystemComponents.Sensor.Temperature_degC_DispColor00 temperature_ambAir(redeclare package Medium = Modelica.Media.Air.DryAirNasa, valMax = valMaxTContour, valMin = valMinTContour) annotation(
    Placement(visible = true, transformation(origin = {193, -187}, extent = {{-11, -5}, {11, 5}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue real_mass_flow_water(significantDigits = 3, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {162, -104}, extent = {{-9, -8}, {9, 8}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue real_mass_flow_vapor(significantDigits = 3, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {82, 154}, extent = {{-9, -8}, {9, 8}}, rotation = 0)));
equation
  connect(massFlowVapor.port_b, trb.port_1) annotation(
    Line(points = {{70, 144}, {108, 144}}, color = {0, 127, 255}, thickness = 0.75));
  connect(tankOutlet.ports[1], massFlowWater.port_a) annotation(
    Line(points = {{185, -118}, {150, -118}}, color = {0, 127, 255}, thickness = 0.75));
  connect(trb.port_2, boundaryAtm.ports[1]) annotation(
    Line(points = {{132, 144}, {132, 162}, {174, 162}}, color = {0, 127, 255}, thickness = 0.75));
  connect(gain.y, realValue.numberPort) annotation(
    Line(points = {{37.5, -149}, {45, -149}}, color = {0, 0, 127}));
  connect(gain1.y, disp_pwrTrb.numberPort) annotation(
    Line(points = {{139.5, 101}, {134, 101}}, color = {0, 0, 127}));
  connect(powerPump.power, gain.u) annotation(
    Line(points = {{26, -133.5}, {26, -149}}, color = {0, 0, 127}));
  connect(powerTrb.power, gain1.u) annotation(
    Line(points = {{158, 122.5}, {158, 101}, {151, 101}}, color = {0, 0, 127}));
  connect(ramp_heat_vaporHeater.y, heat_vaporHeater.Q_flow) annotation(
    Line(points = {{-108, 133}, {-108, 92}, {-103, 92}}, color = {0, 0, 127}));
  connect(trb.flange_2, powerTrb.flange_a) annotation(
    Line(points = {{140, 128}, {158, 128}}, thickness = 0.75));
  connect(powerTrb.flange_b, constantSpeed.flange) annotation(
    Line(points = {{168, 128}, {180, 128}}, thickness = 0.75));
  connect(massFlowWater.port_b, pump.port_1) annotation(
    Line(points = {{130, -118}, {66, -118}}, color = {0, 127, 255}, thickness = 0.75));
  connect(powerPump.flange_a, pump.flange_2) annotation(
    Line(points = {{27, -128}, {45, -128}}, thickness = 0.75));
  connect(constantSpeed1.flange, powerPump.flange_b) annotation(
    Line(points = {{3, -128}, {17, -128}}, thickness = 0.75));
  connect(massFlowWater.m_flow, constraint.u_variable) annotation(
    Line(points = {{140, -107}, {140, -97}}, color = {0, 0, 127}));
  connect(fracLiquid.y, feedback.u2) annotation(
    Line(points = {{99.5, -26}, {105.5, -26}}, color = {0, 0, 127}));
  connect(feedback.y, ctrl_pi.u) annotation(
    Line(points = {{114, -35}, {114, -46}}, color = {0, 0, 127}));
  connect(ramp_r_liquidLevel.y, feedback.u1) annotation(
    Line(points = {{114, -7}, {114, -19}}, color = {0, 0, 127}));
  connect(evaporator.V, fracLiquid.u) annotation(
    Line(points = {{72, -26}, {88, -26}}, color = {0, 0, 127}));
  connect(temperature_evaporator_out.port, evaporator.port_b) annotation(
    Line(points = {{56, -3}, {50, -3}, {50, -14}}, color = {0, 127, 255}));
  connect(temperature_trb_out.port, trb.port_2) annotation(
    Line(points = {{136, 153}, {132, 153}, {132, 144}}, color = {0, 127, 255}));
  connect(massFlowVapor.port_a, volume.ports[1]) annotation(
    Line(points = {{60, 144}, {50, 144}, {50, 82}}, color = {0, 127, 255}, thickness = 0.75));
  connect(temperature_vaporHeater_out.port, volume.ports[2]) annotation(
    Line(points = {{54, 102}, {50, 102}, {50, 82}}, color = {0, 127, 255}));
  connect(calc_hConv_vaporHeater.port_2, volume.ports[3]) annotation(
    Line(points = {{50, 55}, {50, 82}}, color = {0, 127, 255}, thickness = 0.75));
  connect(evaporator.port_b, calc_hConv_vaporHeater.port_1) annotation(
    Line(points = {{50, -14}, {50, 22.5}}, color = {0, 127, 255}, thickness = 0.75));
  connect(const_Area_HT_vaporHeater.y, product1.u1) annotation(
    Line(points = {{-21.4, 56}, {2.6, 56}}, color = {0, 0, 127}));
  connect(product1.u2, calc_hConv_vaporHeater.y_h) annotation(
    Line(points = {{7, 56}, {36, 56}, {36, 48.5}}, color = {0, 0, 127}));
  connect(conv_vaporHeater.fluid, volume.heatPort) annotation(
    Line(points = {{18, 92}, {40, 92}}, color = {191, 0, 0}, thickness = 0.75));
  connect(product1.y, conv_vaporHeater.Gc) annotation(
    Line(points = {{4, 68}, {4, 78}}, color = {0, 0, 127}));
  connect(conv_vaporHeater.solid, calc_hConv_vaporHeater.heatPort) annotation(
    Line(points = {{-10, 92}, {-10, 39}, {37, 39}}, color = {191, 0, 0}));
  connect(evaporator.port_a, pump.port_2) annotation(
    Line(points = {{50, -54}, {50, -118}}, color = {0, 127, 255}, thickness = 0.75));
  connect(temperature_pump_out.port, pump.port_2) annotation(
    Line(points = {{58, -97.35}, {50, -97.35}, {50, -118.35}}, color = {0, 127, 255}));
  connect(ctrl_pi.y, heat_evaporator.Q_flow) annotation(
    Line(points = {{114, -69}, {114, -76}, {-42, -76}, {-42, -34}}, color = {0, 0, 127}));
  connect(heatFlow_evaporator.port_a, heat_evaporator.port) annotation(
    Line(points = {{-11, -34}, {-22, -34}}, color = {191, 0, 0}, thickness = 0.75));
  connect(heatFlow_evaporator.port_b, evaporator.heatPort) annotation(
    Line(points = {{5, -34}, {30, -34}}, color = {191, 0, 0}, thickness = 0.75));
  connect(heatFlow_vaporHeater.port_b, conv_vaporHeater.solid) annotation(
    Line(points = {{-55, 92}, {-10, 92}}, color = {191, 0, 0}, thickness = 0.75));
  connect(heat_vaporHeater.port, heatFlow_vaporHeater.port_a) annotation(
    Line(points = {{-83, 92}, {-71, 92}}, color = {191, 0, 0}, thickness = 0.75));
  connect(temperature_vaporHeater_wall.heatPort, heatFlow_vaporHeater.port_b) annotation(
    Line(points = {{-28, 106}, {-46, 106}, {-46, 92}, {-55, 92}}, color = {191, 0, 0}));
  connect(sum_ReactorHeat.u1, heatFlow_vaporHeater.Q_flow) annotation(
    Line(points = {{-74, 34}, {-63, 34}, {-63, 83}}, color = {0, 0, 127}));
  connect(sum_ReactorHeat.u2, heatFlow_evaporator.Q_flow) annotation(
    Line(points = {{-74, 22}, {-3, 22}, {-3, -25}}, color = {0, 0, 127}));
  connect(tankOutlet.ports[2], temperature_pump_in.port) annotation(
    Line(points = {{186, -118}, {170, -118}, {170, -137}, {178, -137}}, color = {0, 127, 255}));
  connect(ambientAir.ports[1], reactor_LostCoolant.portStat) annotation(
    Line(points = {{187, -168}, {-226, -168}, {-226, -62}}, color = {0, 127, 255}, thickness = 0.75));
  connect(reactor_LostCoolant.heatPort, ptHeatSrc_LostCoolant.port) annotation(
    Line(points = {{-209.666, -45.5}, {-194.666, -45.5}, {-194.666, -46}, {-176, -46}}, color = {191, 0, 0}, thickness = 0.75));
  connect(temperature_reactor_LostCoolant.heatPort, reactor_LostCoolant.heatPort) annotation(
    Line(points = {{-192, -33}, {-204, -33}, {-204, -45.5}, {-210, -45.5}}, color = {191, 0, 0}));
  connect(real_hconv_reactor_LostCoolant.numberPort, reactor_LostCoolant.y_h) annotation(
    Line(points = {{-203.95, -15}, {-210.95, -15}, {-210.95, -22}}, color = {0, 0, 127}));
  connect(sum_ReactorHeat.y, ptHeatSrc_LostCoolant.Q_flow) annotation(
    Line(points = {{-96, 28}, {-118, 28}, {-118, -46}, {-156, -46}}, color = {0, 0, 127}));
  connect(sum_ReactorHeat.y, real_Q_flow_reactor.numberPort) annotation(
    Line(points = {{-96, 28}, {-106, 28}, {-106, 5}, {-98, 5}}, color = {0, 0, 127}));
  connect(ambientAir.ports[2], temperature_ambAir.port) annotation(
    Line(points = {{187, -168}, {177, -168}, {177, -188}, {181, -188}}, color = {0, 127, 255}));
  connect(real_mass_flow_water.numberPort, massFlowWater.m_flow) annotation(
    Line(points = {{152, -104}, {140, -104}, {140, -106}}, color = {0, 0, 127}));
  connect(real_mass_flow_vapor.numberPort, massFlowVapor.m_flow) annotation(
    Line(points = {{72, 154}, {65, 154}, {65, 149.5}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(extent = {{-280, -200}, {260, 200}}), graphics = {Text(textColor = {0, 0, 255}, extent = {{-151, 165}, {138, 102}}, textString = "%name")}),
    experiment(StopTime = 600, StartTime = 0, Tolerance = 1e-06, Interval = 0.1),
    Documentation(info = "<html>

</html>"),
    Diagram(coordinateSystem(extent = {{-280, -200}, {260, 200}})));
end SteamTrb_with_HT_SimpleReactor_ex01;
