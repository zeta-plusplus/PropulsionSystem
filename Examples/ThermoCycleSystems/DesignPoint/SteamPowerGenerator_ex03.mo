within PropulsionSystem.Examples.ThermoCycleSystems.DesignPoint;

model SteamPowerGenerator_ex03 ""
  extends Modelica.Icons.Example;
  //-----
  parameter Real s_pumpDisp = 0.1;
  parameter Real s_pumpHead = 0.1;
  //-----
  Modelica.Fluid.Examples.DrumBoiler.BaseClasses.EquilibriumDrumBoiler evaporator(redeclare package Medium = Modelica.Media.Water.StandardWater, V_l(fixed = true), V_l_start = 0.5, V_t = 1, cp_D = 500, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_D = 1e-6, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, p(fixed = false, start = 10 * 101.325 * 1000), p_start = 10 * 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-40, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow heatSupply annotation(
    Placement(visible = true, transformation(origin = {-40, -69}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowVapor(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {70, -20}, extent = {{10, -10}, {-10, 10}}, rotation = 180)));
  Modelica.Fluid.Sensors.Temperature T_evaporatorOutlet(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {40, -5}, extent = {{5, 5}, {-5, -5}}, rotation = 180)));
  Modelica.Fluid.Sensors.Pressure p_evaporatorOutlet(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {85, 5}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear VaporValve(redeclare package Medium = Modelica.Media.Water.StandardWater, dp_nominal = 10 * 1000, m_flow_nominal = 1) annotation(
    Placement(visible = true, transformation(extent = {{10, -10}, {30, -30}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(extent = {{-160, 100}, {-140, 120}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Q_flow_in(duration = 10, height = 1e6, offset = 5e6, startTime = 150) annotation(
    Placement(visible = true, transformation(origin = {-40, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_valveopen(duration = 10, height = -0.0, offset = 1, startTime = 300) annotation(
    Placement(visible = true, transformation(origin = {20, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Gain fracLiquid(k = 1 / evaporator.V_t) annotation(
    Placement(visible = true, transformation(origin = {-32, 15}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_r_liquidLevel(duration = 100, height = 0, offset = 0.4, startTime = 100) annotation(
    Placement(visible = true, transformation(origin = {0, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Continuous.PI ctrl_pump_pi(T = 30, k = 300) annotation(
    Placement(visible = true, transformation(origin = {-90, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(visible = true, transformation(origin = {-32, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.SpecificEnthalpy specificEnthalpy(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {100, -5}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharFixed00 trb(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed(w_fixed = 3000 * 2.0 * Modelica.Constants.pi / 60.0) annotation(
    Placement(visible = true, transformation(origin = {205, -80}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerTrb annotation(
    Placement(visible = true, transformation(origin = {185, -80}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  PropulsionSystem.Utilities.ConstrainVariable constraint(tgtValue_paramInput = 2 * 101.325 * 1000, use_u_targetVal = true) annotation(
    Placement(visible = true, transformation(origin = {-180, 30}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-30, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_PR_pump(duration = 10, height = 1, offset = 10, startTime = 200) annotation(
    Placement(visible = true, transformation(origin = {-98, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interaction.Show.RealValue disp_pwrTrb(significantDigits = 5, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {113, -107}, extent = {{13, -7}, {-13, 7}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharFixed00 pump(redeclare package Medium = Modelica.Media.Water.StandardWater, PRdes_paramInput = 2, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput) annotation(
    Placement(visible = true, transformation(origin = {-94, -28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed1(w_fixed = 3000 * 2.0 * Modelica.Constants.pi / 60.0) annotation(
    Placement(visible = true, transformation(origin = {-155, -28}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerPump annotation(
    Placement(visible = true, transformation(origin = {-135, -28}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {-180, 0}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Blocks.Interaction.Show.RealValue realValue(significantDigits = 5, use_numberPort = true) annotation(
    Placement(visible = true, transformation(origin = {-93, -47}, extent = {{-13, -7}, {13, 7}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain(k = 1 / 1000) annotation(
    Placement(visible = true, transformation(origin = {-129, -47}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Gain gain1(k = 1 / 1000) annotation(
    Placement(visible = true, transformation(origin = {141, -107}, extent = {{5, -5}, {-5, 5}}, rotation = 0)));
  Modelica.Fluid.Examples.DrumBoiler.BaseClasses.EquilibriumDrumBoiler Condenser(redeclare package Medium = Modelica.Media.Water.StandardWater, V_l(fixed = true), V_l_start = 0.5, V_t = 1, cp_D = 500, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_D = 1e-6, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, p(fixed = false, start =  101.325 * 1000), p_start =  101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {80, -160}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {-190, -170}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {165, -160}, extent = {{5, 5}, {-5, -5}}, rotation = 90)));
  Modelica.Fluid.Sensors.SpecificEnthalpy specificEnthalpy1(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {165, -135}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Fluid.Sensors.Temperature temperature1(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {-50, -170}, extent = {{10, 10}, {-10, -10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow annotation(
    Placement(visible = true, transformation(origin = {80, -230}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = Modelica.Media.Water.StandardWater, T = 15 + 273.15, p = 101.325 * 1000, nPorts = 1)  annotation(
    Placement(visible = true, transformation(origin = {-250, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = Modelica.Media.Water.StandardWater, T = 15 + 273.15, p = 101.325 * 1000, nPorts = 1) annotation(
    Placement(visible = true, transformation(origin = {-240, -160}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate1(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {30, -160}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
  PropulsionSystem.Utilities.ConstrainVariable constraint1(tgtValue_paramInput = 2 * 101.325 * 1000, use_u_targetVal = true) annotation(
    Placement(visible = true, transformation(origin = {30, -130}, extent = {{10, -10}, {-10, 10}}, rotation = -90)));
  PropulsionSystem.Utilities.VariableBySolver varBySolver annotation(
    Placement(visible = true, transformation(origin = {80, -260}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Vessels.ClosedVolume HeatRemover(redeclare package Medium = Modelica.Media.Water.StandardWater, V = 1.0, energyDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, massDynamics = Modelica.Fluid.Types.Dynamics.SteadyState, use_HeatTransfer = true, use_portsData = false, nPorts = 2)  annotation(
    Placement(visible = true, transformation(origin = {-5, -175}, extent = {{-15, 15}, {15, -15}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1 annotation(
    Placement(visible = true, transformation(origin = {-20, -240}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PropulsionSystem.Utilities.VariableBySolver varBySolver1 annotation(
    Placement(visible = true, transformation(origin = {-20, -270}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  PropulsionSystem.Utilities.ConstrainVariable constraint2(tgtValue_paramInput = 288.15, use_u_targetVal = false) annotation(
    Placement(visible = true, transformation(origin = {-70, -190}, extent = {{10, -10}, {-10, 10}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor annotation(
    Placement(visible = true, transformation(origin = {80, -205}, extent = {{-5, 5}, {5, -5}}, rotation = 90)));
  Modelica.Thermal.HeatTransfer.Sensors.HeatFlowSensor heatFlowSensor1 annotation(
    Placement(visible = true, transformation(origin = {-20, -215}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Math.Sum sum_heat_Condenser(nin = 2) annotation(
    Placement(visible = true, transformation(origin = {30, -250}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(heatSupply.port, evaporator.heatPort) annotation(
    Line(points = {{-40, -59}, {-40, -40}}, color = {191, 0, 0}));
  connect(ramp_Q_flow_in.y, heatSupply.Q_flow) annotation(
    Line(points = {{-40, -89}, {-40, -79}}, color = {0, 0, 127}));
  connect(ramp_valveopen.y, VaporValve.opening) annotation(
    Line(points = {{20, -39}, {20, -28}}, color = {0, 0, 127}));
  connect(evaporator.V, fracLiquid.u) annotation(
    Line(points = {{-32, 2}, {-32, 9}}, color = {0, 0, 127}));
  connect(fracLiquid.y, feedback.u2) annotation(
    Line(points = {{-32, 20.5}, {-32, 42}}, color = {0, 0, 127}));
  connect(ramp_r_liquidLevel.y, feedback.u1) annotation(
    Line(points = {{-11, 50}, {-24, 50}}, color = {0, 0, 127}));
  connect(ctrl_pump_pi.u, feedback.y) annotation(
    Line(points = {{-78, 50}, {-41, 50}}, color = {0, 0, 127}));
  connect(evaporator.port_b, VaporValve.port_a) annotation(
    Line(points = {{-20, -20}, {10, -20}}, color = {0, 127, 255}));
  connect(VaporValve.port_b, T_evaporatorOutlet.port) annotation(
    Line(points = {{30, -20}, {40, -20}, {40, -10}}, color = {0, 127, 255}));
  connect(VaporValve.port_b, massFlowVapor.port_a) annotation(
    Line(points = {{30, -20}, {60, -20}}, color = {0, 127, 255}));
  connect(massFlowVapor.port_b, specificEnthalpy.port) annotation(
    Line(points = {{80, -20}, {100, -20}, {100, -10}}, color = {0, 127, 255}));
  connect(p_evaporatorOutlet.port, massFlowVapor.port_b) annotation(
    Line(points = {{85, 0}, {85, -20}, {80, -20}}, color = {0, 127, 255}));
  connect(massFlowVapor.port_b, trb.port_1) annotation(
    Line(points = {{80, -20}, {108, -20}, {108, -64}}, color = {0, 127, 255}));
  connect(pump.port_2, evaporator.port_a) annotation(
    Line(points = {{-88.2, -20}, {-60.2, -20}}, color = {0, 127, 255}));
  connect(constantSpeed1.flange, powerPump.flange_a) annotation(
    Line(points = {{-150, -28}, {-140, -28}}));
  connect(powerPump.flange_b, pump.flange_1) annotation(
    Line(points = {{-130, -28}, {-104, -28}}));
  connect(constraint.u_variable, massFlowRate.m_flow) annotation(
    Line(points = {{-180, 19}, {-180, 11}}, color = {0, 0, 127}));
  connect(ctrl_pump_pi.y, constraint.u_targetValue) annotation(
    Line(points = {{-101, 50}, {-180, 50}, {-180, 42}}, color = {0, 0, 127}));
  connect(pump.u_PR, ramp_PR_pump.y) annotation(
    Line(points = {{-98, -36}, {-98, -79}}, color = {0, 0, 127}));
  connect(massFlowRate.port_b, pump.port_1) annotation(
    Line(points = {{-170, 0}, {-100, 0}, {-100, -20}}, color = {0, 127, 255}));
  connect(gain.y, realValue.numberPort) annotation(
    Line(points = {{-123.5, -47}, {-108, -47}}, color = {0, 0, 127}));
  connect(gain1.y, disp_pwrTrb.numberPort) annotation(
    Line(points = {{135.5, -107}, {128, -107}}, color = {0, 0, 127}));
  connect(powerPump.power, gain.u) annotation(
    Line(points = {{-139, -33.5}, {-139, -47}, {-135, -47}}, color = {0, 0, 127}));
  connect(powerTrb.power, gain1.u) annotation(
    Line(points = {{181, -85.5}, {181, -107}, {147, -107}}, color = {0, 0, 127}));
  connect(trb.port_2, specificEnthalpy1.port) annotation(
    Line(points = {{132, -64}, {160, -64}, {160, -134}}, color = {0, 127, 255}));
  connect(specificEnthalpy1.port, temperature.port) annotation(
    Line(points = {{160, -134}, {160, -160}}, color = {0, 127, 255}));
  connect(Condenser.port_b, temperature.port) annotation(
    Line(points = {{100, -160}, {160, -160}}, color = {0, 127, 255}));
  connect(boundary.ports[1], massFlowRate.port_a) annotation(
    Line(points = {{-240, 0}, {-190, 0}}, color = {0, 127, 255}));
  connect(trb.flange_2, powerTrb.flange_a) annotation(
    Line(points = {{140, -80}, {180, -80}}));
  connect(powerTrb.flange_b, constantSpeed.flange) annotation(
    Line(points = {{190, -80}, {200, -80}}));
  connect(massFlowRate1.port_a, Condenser.port_a) annotation(
    Line(points = {{40, -160}, {60, -160}}, color = {0, 127, 255}));
  connect(boundary1.ports[1], pressure.port) annotation(
    Line(points = {{-230, -160}, {-190, -160}}, color = {0, 127, 255}));
  connect(massFlowVapor.m_flow, constraint1.u_targetValue) annotation(
    Line(points = {{70, -30}, {70, -110}, {30, -110}, {30, -118}}, color = {0, 0, 127}));
  connect(massFlowRate1.m_flow, constraint1.u_variable) annotation(
    Line(points = {{30, -148}, {30, -141}}, color = {0, 0, 127}));
  connect(varBySolver.y_independent, prescribedHeatFlow.Q_flow) annotation(
    Line(points = {{80, -249}, {80, -241}}, color = {0, 0, 127}));
  connect(varBySolver1.y_independent, prescribedHeatFlow1.Q_flow) annotation(
    Line(points = {{-20, -259}, {-20, -250}}, color = {0, 0, 127}));
  connect(temperature1.T, constraint2.u_variable) annotation(
    Line(points = {{-56, -170}, {-70, -170}, {-70, -178}}, color = {0, 0, 127}));
  connect(HeatRemover.ports[1], massFlowRate1.port_b) annotation(
    Line(points = {{-5, -160}, {20, -160}}, color = {0, 127, 255}));
  connect(temperature1.port, HeatRemover.ports[2]) annotation(
    Line(points = {{-50, -160}, {-5, -160}}, color = {0, 127, 255}));
  connect(pressure.port, temperature1.port) annotation(
    Line(points = {{-190, -160}, {-50, -160}}, color = {0, 127, 255}));
  connect(Condenser.heatPort, heatFlowSensor.port_b) annotation(
    Line(points = {{80, -180}, {80, -200}}, color = {191, 0, 0}));
  connect(prescribedHeatFlow.port, heatFlowSensor.port_a) annotation(
    Line(points = {{80, -220}, {80, -210}}, color = {191, 0, 0}));
  connect(prescribedHeatFlow1.port, heatFlowSensor1.port_a) annotation(
    Line(points = {{-20, -230}, {-20, -220}}, color = {191, 0, 0}));
  connect(HeatRemover.heatPort, heatFlowSensor1.port_b) annotation(
    Line(points = {{-20, -174}, {-20, -210}}, color = {191, 0, 0}));
  connect(heatFlowSensor1.Q_flow, sum_heat_Condenser.u[1]) annotation(
    Line(points = {{-15, -215}, {30, -215}, {30, -238}}, color = {0, 0, 127}));
  connect(heatFlowSensor.Q_flow, sum_heat_Condenser.u[2]) annotation(
    Line(points = {{75, -205}, {30, -205}, {30, -238}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(extent = {{-280, -300}, {260, 120}}), graphics = {Text(lineColor = {0, 0, 255}, extent = {{-151, 165}, {138, 102}}, textString = "%name")}),
    experiment(StopTime = 400, StartTime = 0, Tolerance = 1e-06, Interval = 0.01),
    Documentation(info = "<html>

</html>"),
    Diagram(coordinateSystem(extent = {{-280, -300}, {260, 120}})));
end SteamPowerGenerator_ex03;
