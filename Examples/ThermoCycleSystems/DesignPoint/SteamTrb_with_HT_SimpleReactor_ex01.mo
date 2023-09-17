within PropulsionSystem.Examples.ThermoCycleSystems.DesignPoint;

model SteamTrb_with_HT_SimpleReactor_ex01
  extends Modelica.Icons.Example;
  //-----
  import units= Modelica.Units.SI;
  //-----
  parameter units.Area AreaHT=50 "";
  parameter Real valMinTContour=0;
  parameter Real valMaxTContour=2500;
  //-----
  //-----
  parameter Real s_pumpDisp = 0.1;
  parameter Real s_pumpHead = 0.1;
  //-----
  Modelica.Fluid.Examples.DrumBoiler.BaseClasses.EquilibriumDrumBoiler evaporator(redeclare package Medium = Modelica.Media.Water.StandardWater, V_l(fixed = true), V_l_start = 0.5, V_t = 1, cp_D = 500, m_D = 1e-6, p(fixed = false, start = 2*101.325*1000), p_start = 2*101.325*1000) annotation(
    Placement(visible = true, transformation(origin = {-40, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow heatSupply annotation(
    Placement(visible = true, transformation(origin = {-40, -105}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowVapor(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {65, -20}, extent = {{5, 5}, {-5, -5}}, rotation = 180)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(extent = {{-160, 80}, {-140, 100}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Q_flow_in(duration = 1, height = 1e6, offset = 5e6, startTime = 100) annotation(
    Placement(visible = true, transformation(origin = {-40, -136}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Gain fracLiquid(k = 1/evaporator.V_t) annotation(
    Placement(visible = true, transformation(origin = {-32, 15}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_r_liquidLevel(duration = 100, height = 0, offset = 0.4, startTime = 100) annotation(
    Placement(visible = true, transformation(origin = {0, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.PI ctrl_pi(T = 30, initType = Modelica.Blocks.Types.Init.InitialOutput, k = 300, x_start = 2, y_start = 2) annotation(
    Placement(visible = true, transformation(origin = {-62, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(visible = true, transformation(origin = {-32, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TurbineDesignPoint00 trb(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {120, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundaryAtm(redeclare package Medium = Modelica.Media.Water.StandardWater, nPorts = 1, p = 100*1000) annotation(
    Placement(visible = true, transformation(origin = {150, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed(w_fixed = 3000*2.0*Modelica.Constants.pi/60.0) annotation(
    Placement(visible = true, transformation(origin = {65, -60}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerTrb annotation(
    Placement(visible = true, transformation(origin = {84, -60}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  PropulsionSystem.Utilities.ConstrainVariable constraint(tgtValue_paramInput = 2*101.325*1000, use_u_targetVal = true) annotation(
    Placement(visible = true, transformation(origin = {-198, 30}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-32, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue disp_pwrTrb(significantDigits = 5, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {127, -87}, extent = {{-13, -7}, {13, 7}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT tankOutlet(redeclare package Medium = Modelica.Media.Water.StandardWater, T = 288.15, nPorts = 1, p = 100*1000) annotation(
    Placement(visible = true, transformation(origin = {-258, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CompressorDesignPoint00 pump(redeclare package Medium = Modelica.Media.Water.StandardWater, PRdes_par = 25, effDes_par = 1, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.param) annotation(
    Placement(visible = true, transformation(origin = {-172, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed1(w_fixed = 3000*2.0*Modelica.Constants.pi/60.0) annotation(
    Placement(visible = true, transformation(origin = {-233, -28}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerPump annotation(
    Placement(visible = true, transformation(origin = {-213, -28}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowWater(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {-198, 0}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 5, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-179, -47}, extent = {{-13, -7}, {13, 7}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = 1/1000) annotation(
    Placement(visible = true, transformation(origin = {-207, -47}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = 1/1000) annotation(
    Placement(visible = true, transformation(origin = {99, -87}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Q_flow_in1(duration = 1, height = 1e3, offset = 1e4, startTime = 200) annotation(
    Placement(visible = true, transformation(origin = {28, -101}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow heatSupply1 annotation(
    Placement(visible = true, transformation(origin = {28, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume vaporHeater(redeclare package Medium = Modelica.Media.Water.StandardWater, V = 1, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyStateInitial, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyStateInitial, nPorts=2, use_HeatTransfer = true, use_portsData = false)  annotation(
    Placement(visible = true, transformation(origin = {38, -30}, extent = {{10, -10}, {-10, 10}}, rotation = -180)));
  HeatTransferComponents.ForcedConvection.Block_hFlatPlateTurbSmooth00 calc_hConv_evaporator(Amech = 0.0001, redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {-115, -20}, extent = {{-15, -12}, {15, 12}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Components.Convection convection annotation(
    Placement(visible = true, transformation(origin = {-40, -68}, extent = {{-12, -12}, {12, 12}}, rotation = 90)));
  Modelica.Blocks.Sources.Constant const(k = 50)  annotation(
    Placement(visible = true, transformation(origin = {-102, -114}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedTemperature prescribedTemperature annotation(
    Placement(visible = true, transformation(origin = {-115, -42}, extent = {{-4, -4}, {4, 4}}, rotation = 90)));
  Modelica.Blocks.Math.Add add annotation(
    Placement(visible = true, transformation(origin = {-115, -67}, extent = {{-4, -4}, {4, 4}}, rotation = 90)));
  Modelica.Blocks.Math.Gain gain2(k = 1/2)  annotation(
    Placement(visible = true, transformation(origin = {-115, -55}, extent = {{-3, -3}, {3, 3}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sensors.TemperatureSensor temperatureSensor annotation(
    Placement(visible = true, transformation(origin = {-90, -40}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {-138, -55}, extent = {{-6, 5}, {6, -5}}, rotation = 0)));
  Modelica.Blocks.Math.Product product annotation(
    Placement(visible = true, transformation(origin = {-74, -68}, extent = {{-6, -6}, {6, 6}}, rotation = 0)));
equation
  connect(ramp_Q_flow_in.y, heatSupply.Q_flow) annotation(
    Line(points = {{-40, -125}, {-40, -115}}, color = {0, 0, 127}));
  connect(evaporator.V, fracLiquid.u) annotation(
    Line(points = {{-32, 2}, {-32, 9}}, color = {0, 0, 127}));
  connect(fracLiquid.y, feedback.u2) annotation(
    Line(points = {{-32, 20.5}, {-32, 42}}, color = {0, 0, 127}));
  connect(ramp_r_liquidLevel.y, feedback.u1) annotation(
    Line(points = {{-11, 50}, {-24, 50}}, color = {0, 0, 127}));
  connect(ctrl_pi.u, feedback.y) annotation(
    Line(points = {{-50, 50}, {-41, 50}}, color = {0, 0, 127}));
  connect(constantSpeed.flange, powerTrb.flange_b) annotation(
    Line(points = {{70, -60}, {79, -60}}));
  connect(powerTrb.flange_a, trb.flange_1) annotation(
    Line(points = {{89, -60}, {100, -60}}));
  connect(massFlowVapor.port_b, trb.port_1) annotation(
    Line(points = {{70, -20}, {108, -20}, {108, -44}}, color = {0, 127, 255}));
  connect(constantSpeed1.flange, powerPump.flange_a) annotation(
    Line(points = {{-228, -28}, {-218, -28}}));
  connect(powerPump.flange_b, pump.flange_1) annotation(
    Line(points = {{-208, -28}, {-182, -28}}));
  connect(tankOutlet.ports[1], massFlowWater.port_a) annotation(
    Line(points = {{-248, 0}, {-208, 0}}, color = {0, 127, 255}));
  connect(constraint.u_variable, massFlowWater.m_flow) annotation(
    Line(points = {{-198, 19}, {-198, 11}}, color = {0, 0, 127}));
  connect(ctrl_pi.y, constraint.u_targetValue) annotation(
    Line(points = {{-73, 50}, {-198, 50}, {-198, 42}}, color = {0, 0, 127}));
  connect(trb.port_2, boundaryAtm.ports[1]) annotation(
    Line(points = {{132, -44}, {132, 10}, {140, 10}}, color = {0, 127, 255}));
  connect(massFlowWater.port_b, pump.port_1) annotation(
    Line(points = {{-188, 0}, {-178, 0}, {-178, -20}}, color = {0, 127, 255}));
  connect(gain.y, realValue.numberPort) annotation(
    Line(points = {{-201.5, -47}, {-194, -47}}, color = {0, 0, 127}));
  connect(gain1.y, disp_pwrTrb.numberPort) annotation(
    Line(points = {{104.5, -87}, {112, -87}}, color = {0, 0, 127}));
  connect(powerPump.power, gain.u) annotation(
    Line(points = {{-217, -33.5}, {-217, -47}, {-213, -47}}, color = {0, 0, 127}));
  connect(powerTrb.power, gain1.u) annotation(
    Line(points = {{88, -65.5}, {88, -87}, {93, -87}}, color = {0, 0, 127}));
  connect(ramp_Q_flow_in1.y, heatSupply1.Q_flow) annotation(
    Line(points = {{28, -90}, {28, -80}}, color = {0, 0, 127}));
  connect(vaporHeater.heatPort, heatSupply1.port) annotation(
    Line(points = {{28, -30}, {28, -60}}, color = {191, 0, 0}));
  connect(evaporator.port_b, vaporHeater.ports[1]) annotation(
    Line(points = {{-20, -20}, {38, -20}}, color = {0, 127, 255}));
  connect(vaporHeater.ports[2], massFlowVapor.port_a) annotation(
    Line(points = {{38, -20}, {60, -20}}, color = {0, 127, 255}));
  connect(calc_hConv_evaporator.port_2, evaporator.port_a) annotation(
    Line(points = {{-100, -20}, {-60, -20}}, color = {0, 127, 255}));
  connect(pump.port_2, calc_hConv_evaporator.port_1) annotation(
    Line(points = {{-166, -20}, {-130, -20}}, color = {0, 127, 255}));
  connect(convection.solid, heatSupply.port) annotation(
    Line(points = {{-40, -80}, {-40, -94}}, color = {191, 0, 0}));
  connect(evaporator.heatPort, convection.fluid) annotation(
    Line(points = {{-40, -40}, {-40, -56}}, color = {191, 0, 0}));
  connect(calc_hConv_evaporator.heatPort, prescribedTemperature.port) annotation(
    Line(points = {{-115, -32}, {-115, -38}}, color = {191, 0, 0}));
  connect(gain2.y, prescribedTemperature.T) annotation(
    Line(points = {{-115, -52}, {-115, -47}}, color = {0, 0, 127}));
  connect(gain2.u, add.y) annotation(
    Line(points = {{-115, -59}, {-115, -63}}, color = {0, 0, 127}));
  connect(evaporator.heatPort, temperatureSensor.port) annotation(
    Line(points = {{-40, -40}, {-85, -40}}, color = {191, 0, 0}));
  connect(add.u2, temperatureSensor.T) annotation(
    Line(points = {{-113, -72}, {-95.5, -72}, {-95.5, -40}}, color = {0, 0, 127}));
  connect(pump.port_2, temperature.port) annotation(
    Line(points = {{-166, -20}, {-138, -20}, {-138, -50}}, color = {0, 127, 255}));
  connect(add.u1, temperature.T) annotation(
    Line(points = {{-117, -72}, {-134, -72}, {-134, -55}}, color = {0, 0, 127}));
  connect(product.y, convection.Gc) annotation(
    Line(points = {{-67.4, -68}, {-52.4, -68}}, color = {0, 0, 127}));
  connect(calc_hConv_evaporator.y_h, product.u1) annotation(
    Line(points = {{-106, -32}, {-106, -64}, {-81, -64}}, color = {0, 0, 127}));
  connect(const.y, product.u2) annotation(
    Line(points = {{-90, -114}, {-81, -114}, {-81, -72}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Text(textColor = {0, 0, 255}, extent = {{-151, 165}, {138, 102}}, textString = "%name")}),
    experiment(StopTime = 400, StartTime = 0, Tolerance = 1e-06, Interval = 0.01),
    Documentation(info = "<html>

</html>"),
    Diagram(coordinateSystem(extent = {{-280, -120}, {260, 100}})));
end SteamTrb_with_HT_SimpleReactor_ex01;
