within PropulsionSystem.Examples.ThermoCycleSystems.DesignPoint;

model SteamPowerGenerator_ex03 ""
  extends Modelica.Icons.Example;
  //-----
  parameter Real s_pumpDisp = 0.1;
  parameter Real s_pumpHead = 0.1;
  //-----
  Modelica.Fluid.Examples.DrumBoiler.BaseClasses.EquilibriumDrumBoiler evaporator(redeclare package Medium = Modelica.Media.Water.StandardWater, V_l(fixed = true), V_l_start = 0.5, V_t = 1, cp_D = 500, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_D = 1e-6, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, p(fixed = false, start = 10 * 101.325 * 1000), p_start = 10 * 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-120, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow heatSupplyEvaporator annotation(
    Placement(visible = true, transformation(origin = {-120, -89}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowVapor(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {120, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
  Modelica.Fluid.Sensors.Temperature T_evaporatorOutlet(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {106, 15}, extent = {{5, 5}, {-5, -5}}, rotation = 180)));
  Modelica.Fluid.Sensors.Pressure p_evaporatorOutlet(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {135, 7}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear VaporValve(redeclare package Medium = Modelica.Media.Water.StandardWater, dp_nominal = 10 * 1000, m_flow_nominal = 1) annotation(
    Placement(visible = true, transformation(extent = {{70, -10}, {90, -30}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(extent = {{-160, 100}, {-140, 120}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Q_flow_evaporator(duration = 10, height = 1e6, offset = 5e6, startTime = 100) annotation(
    Placement(visible = true, transformation(origin = {-120, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_valveopen(duration = 10, height = -0.0, offset = 1, startTime = 300) annotation(
    Placement(visible = true, transformation(origin = {80, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Gain fracLiquid(k = 1 / evaporator.V_t) annotation(
    Placement(visible = true, transformation(origin = {-112, 15}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_r_liquidLevel(duration = 100, height = 0, offset = 0.4, startTime = 100) annotation(
    Placement(visible = true, transformation(origin = {0, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.PI ctrl_pump_pi(T = 30, k = 300) annotation(
    Placement(visible = true, transformation(origin = {-160, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(visible = true, transformation(origin = {-112, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.SpecificEnthalpy specificEnthalpy(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {140, -5}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharFixed00 trb(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {160, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed(w_fixed = 3000 * 2.0 * Modelica.Constants.pi / 60.0) annotation(
    Placement(visible = true, transformation(origin = {235, -80}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerTrb annotation(
    Placement(visible = true, transformation(origin = {215, -80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  PropulsionSystem.Utilities.ConstrainVariable constraint(tgtValue_paramInput = 2 * 101.325 * 1000, use_u_targetVal = true) annotation(
    Placement(visible = true, transformation(origin = {-220, 30}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-30, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_PR_pump(duration = 10, height = 1, offset = 10, startTime = 200) annotation(
    Placement(visible = true, transformation(origin = {-178, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interaction.Show.RealValue disp_pwrTrb(significantDigits = 5, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {153, -107}, extent = {{13, -7}, {-13, 7}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharFixed00 pump(redeclare package Medium = Modelica.Media.Water.StandardWater, PRdes_paramInput = 2, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput) annotation(
    Placement(visible = true, transformation(origin = {-174, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed1(w_fixed = 3000 * 2.0 * Modelica.Constants.pi / 60.0) annotation(
    Placement(visible = true, transformation(origin = {-227, -28}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerPump annotation(
    Placement(visible = true, transformation(origin = {-207, -28}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {-220, 0}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 5, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-173, -47}, extent = {{-13, -7}, {13, 7}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = 1 / 1000) annotation(
    Placement(visible = true, transformation(origin = {-201, -47}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = 1 / 1000) annotation(
    Placement(visible = true, transformation(origin = {181, -107}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Fluid.Examples.DrumBoiler.BaseClasses.EquilibriumDrumBoiler Condenser(redeclare package Medium = Modelica.Media.Water.StandardWater, V_l(fixed = true), V_l_start = 0.5, V_t = 1, cp_D = 500, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_D = 1e-6, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, p(fixed = false, start =  101.325 * 1000), p_start =  101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {80, -180}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {-190, -190}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {205, -180}, extent = {{5, 5}, {-5, -5}}, rotation = 90)));
  Modelica.Fluid.Sensors.SpecificEnthalpy specificEnthalpy1(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {205, -155}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Fluid.Sensors.Temperature temperature1(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {-50, -190}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow annotation(
    Placement(visible = true, transformation(origin = {80, -250}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = Modelica.Media.Water.StandardWater, T = 15 + 273.15, p = 101.325 * 1000, nPorts = 1)  annotation(
    Placement(visible = true, transformation(origin = {-260, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = Modelica.Media.Water.StandardWater, T = 15 + 273.15, p = 101.325 * 1000, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {-240, -180}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {30, -180}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
  PropulsionSystem.Utilities.ConstrainVariable constraint1(tgtValue_paramInput = 2 * 101.325 * 1000, use_u_targetVal = true) annotation(
    Placement(visible = true, transformation(origin = {30, -155}, extent = {{5, -5}, {-5, 5}}, rotation = -90)));
  PropulsionSystem.Utilities.VariableBySolver varBySolver annotation(
    Placement(visible = true, transformation(origin = {80, -285}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume HeatRemover(redeclare package Medium = Modelica.Media.Water.StandardWater, V = 1.0, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, use_HeatTransfer = true, use_portsData = false, nPorts = 2)  annotation(
    Placement(visible = true, transformation(origin = {-5, -195}, extent = {{-15, 15}, {15, -15}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1 annotation(
    Placement(visible = true, transformation(origin = {-20, -260}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PropulsionSystem.Utilities.VariableBySolver varBySolver1 annotation(
    Placement(visible = true, transformation(origin = {-20, -285}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  PropulsionSystem.Utilities.ConstrainVariable constraint2(tgtValue_paramInput = 288.15, use_u_targetVal = false) annotation(
    Placement(visible = true, transformation(origin = {-60, -215}, extent = {{5, -5}, {-5, 5}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor annotation(
    Placement(visible = true, transformation(origin = {80, -225}, extent = {{-5, 5}, {5, -5}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor1 annotation(
    Placement(visible = true, transformation(origin = {-20, -235}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Math.Sum sum_heat_Condenser(nin = 2) annotation(
    Placement(visible = true, transformation(origin = {30, -270}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_heater_out(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {-20, -20}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume vaporHeater(redeclare package Medium = Modelica.Media.Water.StandardWater,V = 1.0, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-45, -35}, extent = {{-15, 15}, {15, -15}}, rotation = 0)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_evaporator_out(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {-80, -20}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow heatSupplyVaporHeater annotation(
    Placement(visible = true, transformation(origin = {-60, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(visible = true, transformation(origin = {-20, -55}, extent = {{5, -5}, {-5, 5}}, rotation = 90)));
  PropulsionSystem.Utilities.ConstrainVariable constraint3(tgtValue_paramInput = 2 * 101.325 * 1000, use_u_targetVal = true) annotation(
    Placement(visible = true, transformation(origin = {-11, -80}, extent = {{5, -5}, {-5, 5}}, rotation = 180)));
  Modelica.Blocks.Sources.Constant const(k = 273.15)  annotation(
    Placement(visible = true, transformation(origin = {5, -55}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T_heater_out(duration = 10, height = 20, offset = 300, startTime = 150) annotation(
    Placement(visible = true, transformation(origin = {14, -80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.VariableBySolver varBySolver2 annotation(
    Placement(visible = true, transformation(origin = {-60, -115}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor2 annotation(
    Placement(visible = true, transformation(origin = {-60, -69}, extent = {{-5, 5}, {5, -5}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor11 annotation(
    Placement(visible = true, transformation(origin = {-120, -65}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Math.Sum sum_heat_evaporator(nin = 2) annotation(
    Placement(visible = true, transformation(origin = {-90, -86}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(ramp_Q_flow_evaporator.y, heatSupplyEvaporator.Q_flow) annotation(
    Line(points = {{-120, -109}, {-120, -99}}, color = {0, 0, 127}));
  connect(ramp_valveopen.y, VaporValve.opening) annotation(
    Line(points = {{80, -39}, {80, -28}}, color = {0, 0, 127}));
  connect(evaporator.V, fracLiquid.u) annotation(
    Line(points = {{-112, 2}, {-112, 9}}, color = {0, 0, 127}));
  connect(fracLiquid.y, feedback.u2) annotation(
    Line(points = {{-112, 20.5}, {-112, 42}}, color = {0, 0, 127}));
  connect(ramp_r_liquidLevel.y, feedback.u1) annotation(
    Line(points = {{-11, 50}, {-104, 50}}, color = {0, 0, 127}));
  connect(ctrl_pump_pi.u, feedback.y) annotation(
    Line(points = {{-148, 50}, {-121, 50}}, color = {0, 0, 127}));
  connect(VaporValve.port_b, T_evaporatorOutlet.port) annotation(
    Line(points = {{90, -20}, {106, -20}, {106, 10}}, color = {0, 127, 255}));
  connect(VaporValve.port_b, massFlowVapor.port_a) annotation(
    Line(points = {{90, -20}, {110, -20}}, color = {0, 127, 255}));
  connect(massFlowVapor.port_b, specificEnthalpy.port) annotation(
    Line(points = {{130, -20}, {140, -20}, {140, -10}}, color = {0, 127, 255}));
  connect(p_evaporatorOutlet.port, massFlowVapor.port_b) annotation(
    Line(points = {{135, 2}, {135, -20}, {130, -20}}, color = {0, 127, 255}));
  connect(massFlowVapor.port_b, trb.port_1) annotation(
    Line(points = {{130, -20}, {148, -20}, {148, -64}}, color = {0, 127, 255}));
  connect(pump.port_2, evaporator.port_a) annotation(
    Line(points = {{-168, -20}, {-140, -20}}, color = {0, 127, 255}));
  connect(constantSpeed1.flange, powerPump.flange_a) annotation(
    Line(points = {{-222, -28}, {-212, -28}}));
  connect(powerPump.flange_b, pump.flange_1) annotation(
    Line(points = {{-202, -28}, {-184, -28}}));
  connect(constraint.u_variable, massFlowRate.m_flow) annotation(
    Line(points = {{-220, 19}, {-220, 11}}, color = {0, 0, 127}));
  connect(ctrl_pump_pi.y, constraint.u_targetValue) annotation(
    Line(points = {{-171, 50}, {-220, 50}, {-220, 42}}, color = {0, 0, 127}));
  connect(pump.u_PR, ramp_PR_pump.y) annotation(
    Line(points = {{-178, -36}, {-178, -79}}, color = {0, 0, 127}));
  connect(massFlowRate.port_b, pump.port_1) annotation(
    Line(points = {{-210, 0}, {-180, 0}, {-180, -20}}, color = {0, 127, 255}));
  connect(gain.y, realValue.numberPort) annotation(
    Line(points = {{-195.5, -47}, {-188, -47}}, color = {0, 0, 127}));
  connect(gain1.y, disp_pwrTrb.numberPort) annotation(
    Line(points = {{175.5, -107}, {168, -107}}, color = {0, 0, 127}));
  connect(powerPump.power, gain.u) annotation(
    Line(points = {{-211, -33.5}, {-211, -47}, {-207, -47}}, color = {0, 0, 127}));
  connect(powerTrb.power, gain1.u) annotation(
    Line(points = {{211, -85.5}, {211, -107}, {187, -107}}, color = {0, 0, 127}));
  connect(trb.port_2, specificEnthalpy1.port) annotation(
    Line(points = {{172, -64}, {200, -64}, {200, -155}}, color = {0, 127, 255}));
  connect(specificEnthalpy1.port, temperature.port) annotation(
    Line(points = {{200, -155}, {200, -181}}, color = {0, 127, 255}));
  connect(Condenser.port_b, temperature.port) annotation(
    Line(points = {{100, -180}, {200, -180}}, color = {0, 127, 255}));
  connect(boundary.ports[1], massFlowRate.port_a) annotation(
    Line(points = {{-250, 0}, {-230, 0}}, color = {0, 127, 255}));
  connect(trb.flange_2, powerTrb.flange_a) annotation(
    Line(points = {{180, -80}, {210, -80}}));
  connect(powerTrb.flange_b, constantSpeed.flange) annotation(
    Line(points = {{220, -80}, {230, -80}}));
  connect(massFlowRate1.port_a, Condenser.port_a) annotation(
    Line(points = {{40, -180}, {60, -180}}, color = {0, 127, 255}));
  connect(boundary1.ports[1], pressure.port) annotation(
    Line(points = {{-230, -180}, {-190, -180}}, color = {0, 127, 255}));
  connect(massFlowVapor.m_flow, constraint1.u_targetValue) annotation(
    Line(points = {{120, -31}, {120, -142}, {30, -142}, {30, -149}}, color = {0, 0, 127}));
  connect(massFlowRate1.m_flow, constraint1.u_variable) annotation(
    Line(points = {{30, -169}, {30, -161.5}}, color = {0, 0, 127}));
  connect(varBySolver.y_independent, prescribedHeatFlow.Q_flow) annotation(
    Line(points = {{80, -279.5}, {80, -261}}, color = {0, 0, 127}));
  connect(varBySolver1.y_independent, prescribedHeatFlow1.Q_flow) annotation(
    Line(points = {{-20, -279.5}, {-20, -270}}, color = {0, 0, 127}));
  connect(temperature1.T, constraint2.u_variable) annotation(
    Line(points = {{-57, -190}, {-60, -190}, {-60, -209.5}}, color = {0, 0, 127}));
  connect(HeatRemover.ports[1], massFlowRate1.port_b) annotation(
    Line(points = {{-5, -180}, {20, -180}}, color = {0, 127, 255}));
  connect(temperature1.port, HeatRemover.ports[2]) annotation(
    Line(points = {{-50, -180}, {-5, -180}}, color = {0, 127, 255}));
  connect(pressure.port, temperature1.port) annotation(
    Line(points = {{-190, -180}, {-50, -180}}, color = {0, 127, 255}));
  connect(Condenser.heatPort, heatFlowSensor.port_b) annotation(
    Line(points = {{80, -200}, {80, -220}}, color = {191, 0, 0}));
  connect(prescribedHeatFlow.port, heatFlowSensor.port_a) annotation(
    Line(points = {{80, -240}, {80, -230}}, color = {191, 0, 0}));
  connect(prescribedHeatFlow1.port, heatFlowSensor1.port_a) annotation(
    Line(points = {{-20, -250}, {-20, -240}}, color = {191, 0, 0}));
  connect(HeatRemover.heatPort, heatFlowSensor1.port_b) annotation(
    Line(points = {{-20, -195}, {-20, -231}}, color = {191, 0, 0}));
  connect(heatFlowSensor1.Q_flow, sum_heat_Condenser.u[1]) annotation(
    Line(points = {{-15, -235}, {30, -235}, {30, -258}}, color = {0, 0, 127}));
  connect(heatFlowSensor.Q_flow, sum_heat_Condenser.u[2]) annotation(
    Line(points = {{75, -225}, {30, -225}, {30, -258}}, color = {0, 0, 127}));
  connect(T_heater_out.port_b, VaporValve.port_a) annotation(
    Line(points = {{-10, -20}, {70, -20}}, color = {0, 127, 255}));
  connect(evaporator.port_b, T_evaporator_out.port_a) annotation(
    Line(points = {{-100, -20}, {-90, -20}}, color = {0, 127, 255}));
  connect(T_evaporator_out.port_b, vaporHeater.ports[1]) annotation(
    Line(points = {{-70, -20}, {-45, -20}}, color = {0, 127, 255}));
  connect(vaporHeater.ports[2], T_heater_out.port_a) annotation(
    Line(points = {{-45, -20}, {-30, -20}}, color = {0, 127, 255}));
  connect(T_heater_out.T, feedback1.u1) annotation(
    Line(points = {{-20, -31}, {-20, -51}}, color = {0, 0, 127}));
  connect(feedback1.y, constraint3.u_variable) annotation(
    Line(points = {{-20, -59.5}, {-20, -80}, {-16.5, -80}}, color = {0, 0, 127}));
  connect(feedback1.u2, const.y) annotation(
    Line(points = {{-16, -55}, {-0.5, -55}}, color = {0, 0, 127}));
  connect(constraint3.u_targetValue, ramp_T_heater_out.y) annotation(
    Line(points = {{-5, -80}, {3, -80}}, color = {0, 0, 127}));
  connect(varBySolver2.y_independent, heatSupplyVaporHeater.Q_flow) annotation(
    Line(points = {{-60, -109.5}, {-60, -99}}, color = {0, 0, 127}));
  connect(vaporHeater.heatPort, heatFlowSensor2.port_b) annotation(
    Line(points = {{-60, -34}, {-60, -64}}, color = {191, 0, 0}));
  connect(heatFlowSensor2.port_a, heatSupplyVaporHeater.port) annotation(
    Line(points = {{-60, -74}, {-60, -80}}, color = {191, 0, 0}));
  connect(evaporator.heatPort, heatFlowSensor11.port_b) annotation(
    Line(points = {{-120, -40}, {-120, -60}}, color = {191, 0, 0}));
  connect(heatFlowSensor11.port_a, heatSupplyEvaporator.port) annotation(
    Line(points = {{-120, -70}, {-120, -78}}, color = {191, 0, 0}));
  connect(heatFlowSensor11.Q_flow, sum_heat_evaporator.u[1]) annotation(
    Line(points = {{-115, -65}, {-90, -65}, {-90, -74}}, color = {0, 0, 127}));
  connect(heatFlowSensor2.Q_flow, sum_heat_evaporator.u[2]) annotation(
    Line(points = {{-65, -69}, {-90, -69}, {-90, -74}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(extent = {{-280, -300}, {260, 120}}), graphics = {Text(lineColor = {0, 0, 255}, extent = {{-151, 165}, {138, 102}}, textString = "%name")}),
    experiment(StopTime = 400, StartTime = 0, Tolerance = 1e-06, Interval = 0.01),
    Documentation(info = "<html>

</html>"),
    Diagram(coordinateSystem(extent = {{-280, -300}, {260, 120}})));
end SteamPowerGenerator_ex03;
