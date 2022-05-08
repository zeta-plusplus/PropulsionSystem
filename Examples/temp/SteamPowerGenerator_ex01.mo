within PropulsionSystem.Examples.temp;

model SteamPowerGenerator_ex01 ""
  extends Modelica.Icons.Example;
  //-----
  parameter Real s_pumpDisp=0.1;
  parameter Real s_pumpHead=0.1;
  //-----
  Modelica.Fluid.Examples.DrumBoiler.BaseClasses.EquilibriumDrumBoiler evaporator(redeclare package Medium = Modelica.Media.Water.StandardWater, V_l(fixed = true), V_l_start = 0.5, V_t = 1, cp_D = 500, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_D = 1e-6, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, p(fixed = false, start = 101.325 * 1000), p_start = 3 * 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-120, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow heatSupply annotation(
    Placement(visible = true, transformation(origin = {-120, -69}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowVapor(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {10, -20}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Fluid.Sensors.Temperature T_evaporatorOutlet(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {-19, -1}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Fluid.Sensors.Pressure p_evaporatorOutlet(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(extent = {{20, 28}, {40, 48}}, rotation = 0)));
  Modelica.Fluid.Valves.ValveLinear VaporValve(redeclare package Medium = Modelica.Media.Water.StandardWater, dp_nominal = 10 * 1000, m_flow_nominal = 1) annotation(
    Placement(visible = true, transformation(extent = {{-50, -10}, {-30, -30}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(extent = {{-170, 70}, {-150, 90}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Q_flow_in(duration = 20, height = 1e6, offset = 1e6, startTime = 100) annotation(
    Placement(visible = true, transformation(origin = {-150, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_valveopen(duration = 10, height = -0.0, offset = 1, startTime = 300) annotation(
    Placement(visible = true, transformation(origin = {-60, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T LiquidSupplyPump(redeclare package Medium = Modelica.Media.Water.StandardWater, T = 15 + 273.15, m_flow = 1, nPorts = 1, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {-170, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain fracLiquid(k = 1 / evaporator.V_t) annotation(
    Placement(visible = true, transformation(origin = {-112, 15}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_r_liquidLevel(duration = 100, height = 0, offset = 0.4, startTime = 100) annotation(
    Placement(visible = true, transformation(origin = {-90, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.PI ctrl_pi(T = 30, k = 300) annotation(
    Placement(visible = true, transformation(origin = {-170, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(visible = true, transformation(origin = {-112, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.SpecificEnthalpy specificEnthalpy(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {40, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharFixed00 trb(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {140, -60}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundaryAtm(redeclare package Medium = Modelica.Media.Water.StandardWater, nPorts = 1, p =  101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {200, -24}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed(w_fixed = 3000 * 2.0 * Modelica.Constants.pi / 60.0)  annotation(
    Placement(visible = true, transformation(origin = {60, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor annotation(
    Placement(visible = true, transformation(origin = {90, -60}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.ConstrainVariable constraint(tgtValue_paramInput = 2 * 101.325 * 1000, use_u_targetVal = true)  annotation(
    Placement(visible = true, transformation(origin = {76, 38}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-32, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_Trb_in(duration = 20, height = 0.5 * 100 * 1000, offset = 2 * 100 * 1000, startTime = 200) annotation(
    Placement(visible = true, transformation(origin = {112, 38}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Interaction.Show.RealValue disp_pwrTrb(significantDigits = 5, use_numberPort = true)  annotation(
    Placement(visible = true, transformation(origin = {121, -90}, extent = {{-15, -10}, {15, 10}}, rotation = 0)));
equation
  connect(heatSupply.port, evaporator.heatPort) annotation(
    Line(points = {{-120, -59}, {-120, -40}}, color = {191, 0, 0}));
  connect(ramp_Q_flow_in.y, heatSupply.Q_flow) annotation(
    Line(points = {{-139, -90}, {-120, -90}, {-120, -79}}, color = {0, 0, 127}));
  connect(ramp_valveopen.y, VaporValve.opening) annotation(
    Line(points = {{-49, -60}, {-40, -60}, {-40, -28}}, color = {0, 0, 127}));
  connect(LiquidSupplyPump.ports[1], evaporator.port_a) annotation(
    Line(points = {{-160, -20}, {-140, -20}}, color = {0, 127, 255}));
  connect(evaporator.V, fracLiquid.u) annotation(
    Line(points = {{-112, 2}, {-112, 9}}, color = {0, 0, 127}));
  connect(fracLiquid.y, feedback.u2) annotation(
    Line(points = {{-112, 20.5}, {-112, 32.5}}, color = {0, 0, 127}));
  connect(ramp_r_liquidLevel.y, feedback.u1) annotation(
    Line(points = {{-90, 59}, {-90, 39}, {-104, 39}}, color = {0, 0, 127}));
  connect(ctrl_pi.u, feedback.y) annotation(
    Line(points = {{-158, 40}, {-120, 40}}, color = {0, 0, 127}));
  connect(ctrl_pi.y, LiquidSupplyPump.m_flow_in) annotation(
    Line(points = {{-181, 40}, {-197, 40}, {-197, -12}, {-181, -12}}, color = {0, 0, 127}));
  connect(evaporator.port_b, VaporValve.port_a) annotation(
    Line(points = {{-100, -20}, {-50, -20}}, color = {0, 127, 255}));
  connect(VaporValve.port_b, T_evaporatorOutlet.port) annotation(
    Line(points = {{-30, -20}, {-19, -20}, {-19, -11}}, color = {0, 127, 255}));
  connect(VaporValve.port_b, massFlowVapor.port_a) annotation(
    Line(points = {{-30, -20}, {0, -20}}, color = {0, 127, 255}));
  connect(massFlowVapor.port_b, specificEnthalpy.port) annotation(
    Line(points = {{20, -20}, {40, -20}, {40, 0}}, color = {0, 127, 255}));
  connect(trb.port_2, boundaryAtm.ports[1]) annotation(
    Line(points = {{152, -44}, {161.5, -44}, {161.5, -24}, {190, -24}}, color = {0, 127, 255}));
  connect(constantSpeed.flange, powerSensor.flange_b) annotation(
    Line(points = {{70, -60}, {80, -60}}));
  connect(powerSensor.flange_a, trb.flange_1) annotation(
    Line(points = {{100, -60}, {120, -60}}));
  connect(p_evaporatorOutlet.port, massFlowVapor.port_b) annotation(
    Line(points = {{30, 28}, {30, -20}, {20, -20}}, color = {0, 127, 255}));
  connect(massFlowVapor.port_b, trb.port_1) annotation(
    Line(points = {{20, -20}, {128, -20}, {128, -44}}, color = {0, 127, 255}));
  connect(p_evaporatorOutlet.p, constraint.u_variable) annotation(
    Line(points = {{41, 38}, {65, 38}}, color = {0, 0, 127}));
  connect(constraint.u_targetValue, ramp_p_Trb_in.y) annotation(
    Line(points = {{88, 38}, {102, 38}}, color = {0, 0, 127}));
  connect(powerSensor.power, disp_pwrTrb.numberPort) annotation(
    Line(points = {{98, -70}, {98, -90}, {104, -90}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(extent = {{-100, -100}, {100, 100}}), graphics = {Text(lineColor = {0, 0, 255}, extent = {{-151, 165}, {138, 102}}, textString = "%name")}),
    experiment(StopTime = 400, StartTime = 0, Tolerance = 1e-06, Interval = 0.01),
    Documentation(info = "<html>

</html>"),
    Diagram(coordinateSystem(extent = {{-200, -100}, {260, 100}})));
end SteamPowerGenerator_ex01;
