within PropulsionSystem.Examples.ThermoCycleSystems.DesignPoint;

model SteamPowerGenerator_ex04 ""
  extends Modelica.Icons.Example;
  //-----
  parameter Real s_pumpDisp = 0.1;
  parameter Real s_pumpHead = 0.1;
  //-----
  Modelica.Fluid.Examples.DrumBoiler.BaseClasses.EquilibriumDrumBoiler evaporator(redeclare package Medium = Modelica.Media.Water.StandardWater, V_l(fixed = true), V_l_start = 0.5, V_t = 1, cp_D = 500, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_D = 1e-6, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, p(fixed = false, start = ramp_evaporator_p_in.offset), p_start = ramp_evaporator_p_in.offset) annotation(
    Placement(visible = true, transformation(origin = {-80, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow heatSupplyEvaporator annotation(
    Placement(visible = true, transformation(origin = {-80, -69}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowVapor(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {160, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
  Modelica.Fluid.Sensors.Temperature T_evaporatorOutlet(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {146, 35}, extent = {{5, 5}, {-5, -5}}, rotation = 180)));
  Modelica.Fluid.Sensors.Pressure p_evaporatorOutlet(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {175, 27}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear VaporValve(redeclare package Medium = Modelica.Media.Water.StandardWater, dp_nominal = 10 * 1000, m_flow_nominal = 1) annotation(
    Placement(visible = true, transformation(extent = {{110, 10}, {130, -10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(extent = {{-160, 100}, {-140, 120}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_valveopen(duration = 10, height = -0.0, offset = 1, startTime = 300) annotation(
    Placement(visible = true, transformation(origin = {120, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Gain fracLiquid(k = 1 / evaporator.V_t) annotation(
    Placement(visible = true, transformation(origin = {-72, 39}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_r_liquidLevel(duration = 100, height = 0, offset = 0.5, startTime = 100) annotation(
    Placement(visible = true, transformation(origin = {-40, 70}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.PI ctrl_pump_pi(T = 30, k = 300) annotation(
    Placement(visible = true, transformation(origin = {-120, 70}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(visible = true, transformation(origin = {-72, 70}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.SpecificEnthalpy specificEnthalpy(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {180, 15}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharFixed00 trb(redeclare package Medium = Modelica.Media.Water.StandardWater, effDes_paramInput = 1.0) annotation(
    Placement(visible = true, transformation(origin = {210, -50}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed(w_fixed = 3000 * 2.0 * Modelica.Constants.pi / 60.0) annotation(
    Placement(visible = true, transformation(origin = {275, -50}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerTrb annotation(
    Placement(visible = true, transformation(origin = {253, -50}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  PropulsionSystem.Utilities.ConstrainVariable constraint(tgtValue_paramInput = 2 * 101.325 * 1000, use_u_targetVal = true) annotation(
    Placement(visible = true, transformation(origin = {-214, 45}, extent = {{5, -5}, {-5, 5}}, rotation = -90)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-30, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue disp_pwrTrb(significantDigits = 5, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {193, -87}, extent = {{13, -7}, {-13, 7}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharFixed00 pump(redeclare package Medium = Modelica.Media.Water.StandardWater, PRdes_paramInput = 2, effDes_paramInput = 1.0, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput) annotation(
    Placement(visible = true, transformation(origin = {-160, -16}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed1(w_fixed = 3000 * 2.0 * Modelica.Constants.pi / 60.0) annotation(
    Placement(visible = true, transformation(origin = {-223, -16}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerPump annotation(
    Placement(visible = true, transformation(origin = {-203, -16}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {-214, 20}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 5, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-167, -43}, extent = {{-13, -7}, {13, 7}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = 1 / 1000) annotation(
    Placement(visible = true, transformation(origin = {-195, -43}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = 1 / 1000) annotation(
    Placement(visible = true, transformation(origin = {231, -87}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Fluid.Examples.DrumBoiler.BaseClasses.EquilibriumDrumBoiler Condenser(redeclare package Medium = Modelica.Media.Water.StandardWater, V_l(fixed = true), V_l_start = 0.5, V_t = 1, cp_D = 500, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_D = 1e-6, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, p(fixed = false, start =  ramp_p_tank.offset), p_start =  ramp_p_tank.offset) annotation(
    Placement(visible = true, transformation(origin = {120, -180}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {-182, -190}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature T_condenser_in(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {165, -185}, extent = {{5, 5}, {-5, -5}}, rotation = 0)));
  Modelica.Fluid.Sensors.SpecificEnthalpy specificEnthalpy1(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {269, -180}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Fluid.Sensors.Temperature T_cooler_out(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {-214, -190}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow annotation(
    Placement(visible = true, transformation(origin = {120, -250}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {70, -180}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
  PropulsionSystem.Utilities.ConstrainVariable constraint1(tgtValue_paramInput = 2 * 101.325 * 1000, use_u_targetVal = true) annotation(
    Placement(visible = true, transformation(origin = {70, -139}, extent = {{5, -5}, {-5, 5}}, rotation = -90)));
  PropulsionSystem.Utilities.VariableBySolver varBySolver annotation(
    Placement(visible = true, transformation(origin = {120, -285}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume HeatRemover(redeclare package Medium = Modelica.Media.Water.StandardWater, V = 1.0, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, use_HeatTransfer = true, use_portsData = false, nPorts = 2)  annotation(
    Placement(visible = true, transformation(origin = {35, -195}, extent = {{-15, 15}, {15, -15}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1 annotation(
    Placement(visible = true, transformation(origin = {20, -260}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PropulsionSystem.Utilities.VariableBySolver varBySolver1 annotation(
    Placement(visible = true, transformation(origin = {20, -285}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  PropulsionSystem.Utilities.ConstrainVariable constraint2(tgtValue_paramInput = 15 + 273.15, use_u_targetVal = false) annotation(
    Placement(visible = true, transformation(origin = {-245, -190}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor annotation(
    Placement(visible = true, transformation(origin = {120, -225}, extent = {{-5, 5}, {5, -5}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor1 annotation(
    Placement(visible = true, transformation(origin = {20, -235}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Math.Sum sum_heat_Condenser(nin = 2) annotation(
    Placement(visible = true, transformation(origin = {70, -254}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_heater_out(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {30, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume vaporHeater(redeclare package Medium = Modelica.Media.Water.StandardWater,V = 1.0, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = true, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-9, -15}, extent = {{-15, 15}, {15, -15}}, rotation = 0)));
  Modelica.Fluid.Sensors.TemperatureTwoPort T_evaporator_out(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {-40, 0}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow heatSupplyVaporHeater annotation(
    Placement(visible = true, transformation(origin = {-24, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(visible = true, transformation(origin = {30, -35}, extent = {{5, -5}, {-5, 5}}, rotation = 90)));
  PropulsionSystem.Utilities.ConstrainVariable constraint3(tgtValue_paramInput = 2 * 101.325 * 1000, use_u_targetVal = true) annotation(
    Placement(visible = true, transformation(origin = {39, -60}, extent = {{5, -5}, {-5, 5}}, rotation = 180)));
  Modelica.Blocks.Sources.Constant const(k = 273.15)  annotation(
    Placement(visible = true, transformation(origin = {55, -35}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T_heater_out(duration = 10, height = 20, offset = 500, startTime = 150) annotation(
    Placement(visible = true, transformation(origin = {64, -60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.VariableBySolver varBySolver2 annotation(
    Placement(visible = true, transformation(origin = {-24, -95}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor2 annotation(
    Placement(visible = true, transformation(origin = {-24, -49}, extent = {{-5, 5}, {5, -5}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor11 annotation(
    Placement(visible = true, transformation(origin = {-80, -45}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Math.Sum sum_heat_evaporator(nin = 2) annotation(
    Placement(visible = true, transformation(origin = {-56, -66}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Utilities.ConstrainVariable constraint4(tgtValue_paramInput = 2 * 101.325 * 1000, use_u_targetVal = true) annotation(
    Placement(visible = true, transformation(origin = {135, -70}, extent = {{-5, -5}, {5, 5}}, rotation = 180)));
  PropulsionSystem.Utilities.VariableBySolver varBySolver3 annotation(
    Placement(visible = true, transformation(origin = {-80, -95}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow_vapor(duration = 10, height = 1, offset = 1, startTime = 100) annotation(
    Placement(visible = true, transformation(origin = {110, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain11(k = 1 / 1000) annotation(
    Placement(visible = true, transformation(origin = {-56, -101}, extent = {{5, -5}, {-5, 5}}, rotation = 90)));
  Modelica.Blocks.Interaction.Show.RealValue disp_heatSupply(significantDigits = 5, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-87, -126}, extent = {{13, -7}, {-13, 7}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue disp_heatRemove(significantDigits = 5, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {49, -304}, extent = {{13, -7}, {-13, 7}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain111(k = 1 / 1000) annotation(
    Placement(visible = true, transformation(origin = {70, -281}, extent = {{5, -5}, {-5, 5}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume tank(redeclare package Medium = Modelica.Media.Water.StandardWater, V = 1.0, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, nPorts = 2, use_HeatTransfer = false, use_portsData = false) annotation(
    Placement(visible = true, transformation(origin = {-260, -110}, extent = {{-20, 20}, {20, -20}}, rotation = -90)));
  Modelica.Fluid.Sources.Boundary_pT tank_p_regulator(redeclare package Medium = Modelica.Media.Water.StandardWater, T = 15 + 273.15, nPorts = 2, p = 101.325 * 1000.0, use_T_in = true, use_p_in = true)  annotation(
    Placement(visible = true, transformation(origin = {-250, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T_tank(duration = 10, height = 0, offset = 15 + 273.15, startTime = 200) annotation(
    Placement(visible = true, transformation(origin = {-310, -154}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_tank(duration = 10, height = 0, offset = 0.008 * 1000 * 1000, startTime = 200) annotation(
    Placement(visible = true, transformation(origin = {-310, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division effTherm annotation(
    Placement(visible = true, transformation(origin = {240, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue disp_effTherm(significantDigits = 3, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {283, -110}, extent = {{-11, -7}, {11, 7}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure p_evaporator_in(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {-117, 39}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  PropulsionSystem.Utilities.ConstrainVariable constraint5(tgtValue_paramInput = 2 * 101.325 * 1000, use_u_targetVal = true) annotation(
    Placement(visible = true, transformation(origin = {-134, 39}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_evaporator_p_in(duration = 10, height = 0.5 * 1000 * 1000, offset = 8 * 1000 * 1000, startTime = 200) annotation(
    Placement(visible = true, transformation(origin = {-160, 39}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.VariableBySolver varBySolver4 annotation(
    Placement(visible = true, transformation(origin = {-168, -61}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Sources.RealExpression effTherm_Carnot(y = 1.0 - T_condenser_in.T / (1 / 2 * (T_evaporator_in.T + T_heater_out.T)))  annotation(
    Placement(visible = true, transformation(origin = {239, -134}, extent = {{-11, -8}, {11, 8}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue realValue1(significantDigits = 3, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {283, -134}, extent = {{-11, -7}, {11, 7}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature T_evaporator_in(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {-125, 11}, extent = {{5, 5}, {-5, -5}}, rotation = 180)));
equation
  connect(ramp_valveopen.y, VaporValve.opening) annotation(
    Line(points = {{120, -19}, {120, -8}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(evaporator.V, fracLiquid.u) annotation(
    Line(points = {{-72, 22}, {-72, 33}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(fracLiquid.y, feedback.u2) annotation(
    Line(points = {{-72, 44.5}, {-72, 62}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(ramp_r_liquidLevel.y, feedback.u1) annotation(
    Line(points = {{-51, 70}, {-64, 70}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(ctrl_pump_pi.u, feedback.y) annotation(
    Line(points = {{-108, 70}, {-81, 70}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(VaporValve.port_b, T_evaporatorOutlet.port) annotation(
    Line(points = {{130, 0}, {146, 0}, {146, 30}}, color = {0, 127, 255}));
  connect(VaporValve.port_b, massFlowVapor.port_a) annotation(
    Line(points = {{130, 0}, {150, 0}}, color = {0, 127, 255}));
  connect(massFlowVapor.port_b, specificEnthalpy.port) annotation(
    Line(points = {{170, 0}, {180, 0}, {180, 10}}, color = {0, 127, 255}));
  connect(p_evaporatorOutlet.port, massFlowVapor.port_b) annotation(
    Line(points = {{175, 22}, {175, 0}, {170, 0}}, color = {0, 127, 255}));
  connect(massFlowVapor.port_b, trb.port_1) annotation(
    Line(points = {{170, 0}, {193, 0}, {193, -26}}, color = {0, 127, 255}));
  connect(pump.port_2, evaporator.port_a) annotation(
    Line(points = {{-148, 0}, {-100, 0}}, color = {0, 127, 255}));
  connect(constantSpeed1.flange, powerPump.flange_a) annotation(
    Line(points = {{-218, -16}, {-208, -16}}));
  connect(powerPump.flange_b, pump.flange_1) annotation(
    Line(points = {{-198, -16}, {-180, -16}}));
  connect(constraint.u_variable, massFlowRate.m_flow) annotation(
    Line(points = {{-214, 39.5}, {-214, 31}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(massFlowRate.port_b, pump.port_1) annotation(
    Line(points = {{-204, 20}, {-172, 20}, {-172, 0}}, color = {0, 127, 255}));
  connect(gain.y, realValue.numberPort) annotation(
    Line(points = {{-189.5, -43}, {-182, -43}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(gain1.y, disp_pwrTrb.numberPort) annotation(
    Line(points = {{225.5, -87}, {208, -87}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(powerPump.power, gain.u) annotation(
    Line(points = {{-207, -21.5}, {-207, -43}, {-201, -43}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(powerTrb.power, gain1.u) annotation(
    Line(points = {{249, -55.5}, {249, -87}, {237, -87}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(trb.port_2, specificEnthalpy1.port) annotation(
    Line(points = {{228, -26}, {264, -26}, {264, -180}}, color = {0, 127, 255}));
  connect(specificEnthalpy1.port, T_condenser_in.port) annotation(
    Line(points = {{264, -180}, {165, -180}}, color = {0, 127, 255}));
  connect(Condenser.port_b, T_condenser_in.port) annotation(
    Line(points = {{140, -180}, {165, -180}}, color = {0, 127, 255}));
  connect(trb.flange_2, powerTrb.flange_a) annotation(
    Line(points = {{240, -50}, {248, -50}}));
  connect(powerTrb.flange_b, constantSpeed.flange) annotation(
    Line(points = {{258, -50}, {270, -50}}));
  connect(massFlowRate1.port_a, Condenser.port_a) annotation(
    Line(points = {{80, -180}, {100, -180}}, color = {0, 127, 255}));
  connect(massFlowVapor.m_flow, constraint1.u_targetValue) annotation(
    Line(points = {{160, -11}, {160, -124}, {70, -124}, {70, -133}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(massFlowRate1.m_flow, constraint1.u_variable) annotation(
    Line(points = {{70, -169}, {70, -144.5}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(varBySolver.y_independent, prescribedHeatFlow.Q_flow) annotation(
    Line(points = {{120, -279.5}, {120, -261}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(varBySolver1.y_independent, prescribedHeatFlow1.Q_flow) annotation(
    Line(points = {{20, -279.5}, {20, -270}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(HeatRemover.ports[1], massFlowRate1.port_b) annotation(
    Line(points = {{35, -180}, {60, -180}}, color = {0, 127, 255}));
  connect(Condenser.heatPort, heatFlowSensor.port_b) annotation(
    Line(points = {{120, -200}, {120, -220}}, color = {191, 0, 0}));
  connect(prescribedHeatFlow.port, heatFlowSensor.port_a) annotation(
    Line(points = {{120, -240}, {120, -230}}, color = {191, 0, 0}));
  connect(prescribedHeatFlow1.port, heatFlowSensor1.port_a) annotation(
    Line(points = {{20, -250}, {20, -240}}, color = {191, 0, 0}));
  connect(HeatRemover.heatPort, heatFlowSensor1.port_b) annotation(
    Line(points = {{20, -195}, {20, -231}}, color = {191, 0, 0}));
  connect(heatFlowSensor1.Q_flow, sum_heat_Condenser.u[1]) annotation(
    Line(points = {{25, -235}, {70, -235}, {70, -242}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(heatFlowSensor.Q_flow, sum_heat_Condenser.u[2]) annotation(
    Line(points = {{115, -225}, {70, -225}, {70, -242}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(T_heater_out.port_b, VaporValve.port_a) annotation(
    Line(points = {{40, 0}, {110, 0}}, color = {0, 127, 255}));
  connect(evaporator.port_b, T_evaporator_out.port_a) annotation(
    Line(points = {{-60, 0}, {-50, 0}}, color = {0, 127, 255}));
  connect(T_evaporator_out.port_b, vaporHeater.ports[1]) annotation(
    Line(points = {{-30, 0}, {-9, 0}}, color = {0, 127, 255}));
  connect(vaporHeater.ports[2], T_heater_out.port_a) annotation(
    Line(points = {{-9, 0}, {20, 0}}, color = {0, 127, 255}));
  connect(T_heater_out.T, feedback1.u1) annotation(
    Line(points = {{30, -11}, {30, -31}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(feedback1.y, constraint3.u_variable) annotation(
    Line(points = {{30, -39.5}, {30, -60}, {33.5, -60}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(feedback1.u2, const.y) annotation(
    Line(points = {{34, -35}, {49.5, -35}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(constraint3.u_targetValue, ramp_T_heater_out.y) annotation(
    Line(points = {{45, -60}, {53, -60}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(varBySolver2.y_independent, heatSupplyVaporHeater.Q_flow) annotation(
    Line(points = {{-24, -89.5}, {-24, -79}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(vaporHeater.heatPort, heatFlowSensor2.port_b) annotation(
    Line(points = {{-24, -15}, {-24, -45}}, color = {191, 0, 0}));
  connect(heatFlowSensor2.port_a, heatSupplyVaporHeater.port) annotation(
    Line(points = {{-24, -54}, {-24, -60}}, color = {191, 0, 0}));
  connect(evaporator.heatPort, heatFlowSensor11.port_b) annotation(
    Line(points = {{-80, -20}, {-80, -40}}, color = {191, 0, 0}));
  connect(heatFlowSensor11.port_a, heatSupplyEvaporator.port) annotation(
    Line(points = {{-80, -50}, {-80, -58}}, color = {191, 0, 0}));
  connect(heatFlowSensor11.Q_flow, sum_heat_evaporator.u[1]) annotation(
    Line(points = {{-75, -45}, {-56, -45}, {-56, -54}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(heatFlowSensor2.Q_flow, sum_heat_evaporator.u[2]) annotation(
    Line(points = {{-29, -49}, {-56, -49}, {-56, -54}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(varBySolver3.y_independent, heatSupplyEvaporator.Q_flow) annotation(
    Line(points = {{-80, -89.5}, {-80, -77.5}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(ctrl_pump_pi.y, constraint.u_targetValue) annotation(
    Line(points = {{-131, 70}, {-214, 70}, {-214, 51}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(massFlowVapor.m_flow, constraint4.u_variable) annotation(
    Line(points = {{160, -11}, {160, -71}, {140.5, -71}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(ramp_m_flow_vapor.y, constraint4.u_targetValue) annotation(
    Line(points = {{121, -70}, {129, -70}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(sum_heat_evaporator.y, gain11.u) annotation(
    Line(points = {{-56, -77}, {-56, -96}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(disp_heatSupply.numberPort, gain11.y) annotation(
    Line(points = {{-72, -126}, {-56, -126}, {-56, -106.5}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(disp_heatRemove.numberPort, gain111.y) annotation(
    Line(points = {{64, -304}, {69.95, -304}, {69.95, -286}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(gain111.u, sum_heat_Condenser.y) annotation(
    Line(points = {{70, -275}, {70, -265}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(T_cooler_out.T, constraint2.u_variable) annotation(
    Line(points = {{-221, -190}, {-239.5, -190}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(massFlowRate.port_a, tank_p_regulator.ports[1]) annotation(
    Line(points = {{-224, 20}, {-240, 20}, {-240, -60}}, color = {0, 127, 255}));
  connect(tank_p_regulator.ports[2], tank.ports[1]) annotation(
    Line(points = {{-240, -60}, {-240, -110}}, color = {0, 127, 255}));
  connect(pressure.port, HeatRemover.ports[2]) annotation(
    Line(points = {{-182, -180}, {35, -180}}, color = {0, 127, 255}));
  connect(pressure.port, T_cooler_out.port) annotation(
    Line(points = {{-182, -180}, {-214, -180}}, color = {0, 127, 255}));
  connect(T_cooler_out.port, tank.ports[2]) annotation(
    Line(points = {{-214, -180}, {-240, -180}, {-240, -110}}, color = {0, 127, 255}));
  connect(ramp_T_tank.y, tank_p_regulator.T_in) annotation(
    Line(points = {{-299, -154}, {-295, -154}, {-295, -56}, {-262, -56}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(ramp_T_tank.y, constraint2.u_targetValue) annotation(
    Line(points = {{-299, -154}, {-289, -154}, {-289, -190}, {-252, -190}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(ramp_p_tank.y, tank_p_regulator.p_in) annotation(
    Line(points = {{-299, -20}, {-279, -20}, {-279, -52}, {-263, -52}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(gain1.y, effTherm.u1) annotation(
    Line(points = {{225.5, -87}, {216, -87}, {216, -104}, {228, -104}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(gain11.y, effTherm.u2) annotation(
    Line(points = {{-56, -106}, {-56, -116}, {228, -116}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(effTherm.y, disp_effTherm.numberPort) annotation(
    Line(points = {{252, -110}, {270, -110}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(pump.port_2, p_evaporator_in.port) annotation(
    Line(points = {{-148, 0}, {-117, 0}, {-117, 34}}, color = {0, 127, 255}));
  connect(constraint5.u_variable, p_evaporator_in.p) annotation(
    Line(points = {{-128.5, 39}, {-122.5, 39}}, color = {0, 0, 127}));
  connect(ramp_evaporator_p_in.y, constraint5.u_targetValue) annotation(
    Line(points = {{-149, 39}, {-140, 39}}, color = {0, 0, 127}));
  connect(varBySolver4.y_independent, pump.u_PR) annotation(
    Line(points = {{-168, -55.5}, {-168, -32}}, color = {0, 0, 127}));
  connect(effTherm_Carnot.y, realValue1.numberPort) annotation(
    Line(points = {{252, -134}, {270, -134}}, color = {0, 0, 127}, pattern = LinePattern.Dash));
  connect(T_evaporator_in.port, evaporator.port_a) annotation(
    Line(points = {{-125, 6}, {-125, 0}, {-100, 0}}, color = {0, 127, 255}));
  annotation(
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Text(textColor = {0, 0, 255}, extent = {{-151, 165}, {138, 102}}, textString = "%name")}),
    experiment(StopTime = 400, StartTime = 0, Tolerance = 1e-06, Interval = 0.01),
    Documentation(info = "<html>

</html>"),
    Diagram(coordinateSystem(extent = {{-320, -320}, {300, 120}}), graphics = {Rectangle(origin = {-48, -42}, pattern = LinePattern.Dash, lineThickness = 0.5, extent = {{-62, 68}, {62, -68}}), Rectangle(origin = {75, -223}, pattern = LinePattern.Dash, lineThickness = 0.5, extent = {{-75, 71}, {75, -71}}), Rectangle(origin = {-260, -91}, pattern = LinePattern.Dash, lineThickness = 0.5, extent = {{-30, 51}, {30, -51}}), Text(origin = {-20, 34}, extent = {{-36, 6}, {36, -6}}, textString = "steam generator"), Text(origin = {126, -142}, extent = {{-36, 6}, {36, -6}}, textString = "steam condenser"), Text(origin = {-199, -151}, extent = {{-37, 11}, {37, -11}}, textString = "pressure regulated
tank", horizontalAlignment = TextAlignment.Left)}));
end SteamPowerGenerator_ex04;
