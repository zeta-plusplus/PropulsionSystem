within PropulsionSystem.Examples.ThermoCycleSystems.DesignPoint;

model SteamPowerGenerator_ex01 ""
  extends Modelica.Icons.Example;
  //-----
  parameter Real s_pumpDisp=0.1;
  parameter Real s_pumpHead=0.1;
  //-----
  parameter Boolean use_inputs = false "use external inputs instead of test data contained internally";
  Modelica.Fluid.Examples.DrumBoiler.BaseClasses.EquilibriumDrumBoiler evaporator(redeclare package Medium = Modelica.Media.Water.StandardWater, V_l(fixed = true), V_l_start = 0.5, V_t = 1, cp_D = 500, energyDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, m_D = 1e-6, massDynamics = Modelica.Fluid.Types.Dynamics.FixedInitial, p(fixed = false, start = 101.325 * 1000), p_start = 3 * 101.325 * 1000) annotation(
    Placement(visible = true, transformation(extent = {{-100, -30}, {-80, -10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow heatSupply annotation(
    Placement(visible = true, transformation(origin = {-90, -53}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowVapor(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {-30, -20}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Fluid.Sensors.Temperature T_evaporatorOutlet(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {-60, -1}, extent = {{10, 10}, {-10, -10}}, rotation = 180)));
  Modelica.Fluid.Sensors.Pressure p_evaporatorOutlet(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(extent = {{-50, 0}, {-30, 20}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(transformation(extent = {{-90, 70}, {-70, 90}})));
  Modelica.Blocks.Sources.Ramp ramp_Q_flow_in(duration = 100, height = 1e7, offset = 1e8, startTime = 100) annotation(
    Placement(visible = true, transformation(origin = {-124, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Gain fracLiquid(k = 1 / evaporator.V_t) annotation(
    Placement(visible = true, transformation(origin = {-86, 15}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_r_liquidLevel(duration = 100, height = 0, offset = 0.4, startTime = 100) annotation(
    Placement(visible = true, transformation(origin = {-10, 70}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Continuous.PI ctrl_pi(T = 30, k = 300) annotation(
    Placement(visible = true, transformation(origin = {-124, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback annotation(
    Placement(visible = true, transformation(origin = {-86, 40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T pump(redeclare package Medium = Modelica.Media.Water.StandardWater, T = 15 + 273.15, nPorts = 1, use_m_flow_in = true)  annotation(
    Placement(visible = true, transformation(origin = {-150, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-110, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {140, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sensors.PowerSensor powerSensor1 annotation(
    Placement(visible = true, transformation(origin = {50, -40}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed1(w_fixed = 3000 * 2.0 * Modelica.Constants.pi / 60.0) annotation(
    Placement(visible = true, transformation(origin = {20, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium = Modelica.Media.Water.StandardWater, T = 400 + 273.15, nPorts = 1, p = 1 * 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {230, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow(duration = 10, height = 0.0, offset = 1.0, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {100, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharFixed00 Trb1(redeclare package Medium = Modelica.Media.Water.StandardWater, printCmd = true, switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated, use_u_eff = true) annotation(
    Placement(visible = true, transformation(origin = {100, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlCharFixed00 nzl(redeclare package Medium = Modelica.Media.Water.StandardWater) annotation(
    Placement(visible = true, transformation(origin = {178, -8}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp(duration = 10, height = 0.0, offset = 10 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {20, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.ConstrainVariable constraint annotation(
    Placement(visible = true, transformation(origin = {58, -66}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(heatSupply.port, evaporator.heatPort) annotation(
    Line(points = {{-90, -43}, {-90, -30}}, color = {191, 0, 0}));
  connect(p_evaporatorOutlet.port, massFlowVapor.port_a) annotation(
    Line(points = {{-40, 0}, {-40, -20}}, color = {0, 127, 255}));
  connect(evaporator.port_b, massFlowVapor.port_a) annotation(
    Line(points = {{-80, -20}, {-40, -20}}, color = {0, 127, 255}));
  connect(T_evaporatorOutlet.port, massFlowVapor.port_a) annotation(
    Line(points = {{-60, -11}, {-60, -20}, {-40, -20}}, color = {0, 127, 255}));
  connect(ramp_Q_flow_in.y, heatSupply.Q_flow) annotation(
    Line(points = {{-113, -70}, {-91, -70}, {-91, -62}}, color = {0, 0, 127}));
  connect(evaporator.V, fracLiquid.u) annotation(
    Line(points = {{-86, -9}, {-86, 9}}, color = {0, 0, 127}));
  connect(fracLiquid.y, feedback.u2) annotation(
    Line(points = {{-86, 20.5}, {-86, 32.5}}, color = {0, 0, 127}));
  connect(ramp_r_liquidLevel.y, feedback.u1) annotation(
    Line(points = {{-10, 60}, {-10, 40}, {-78, 40}}, color = {0, 0, 127}));
  connect(ctrl_pi.u, feedback.y) annotation(
    Line(points = {{-112, 40}, {-94, 40}}, color = {0, 0, 127}));
  connect(pump.ports[1], evaporator.port_a) annotation(
    Line(points = {{-140, -20}, {-100, -20}}, color = {0, 127, 255}));
  connect(ctrl_pi.y, pump.m_flow_in) annotation(
    Line(points = {{-135, 40}, {-182, 40}, {-182, -12}, {-160, -12}}, color = {0, 0, 127}));
  connect(constantSpeed1.flange, powerSensor1.flange_b) annotation(
    Line(points = {{30, -40}, {40, -40}, {40, -40}, {40, -40}}));
  connect(massFlowVapor.port_b, Trb1.port_1) annotation(
    Line(points = {{-20, -20}, {90, -20}, {90, -32}}, color = {0, 127, 255}));
  connect(powerSensor1.flange_a, Trb1.flange_1) annotation(
    Line(points = {{60, -40}, {90, -40}}));
  connect(Trb1.port_2, massFlowRate.port_a) annotation(
    Line(points = {{110, -32}, {110, 0}, {130, 0}}, color = {0, 127, 255}));
  connect(massFlowRate.port_b, nzl.port_1) annotation(
    Line(points = {{150, 0}, {168, 0}}, color = {0, 127, 255}));
  connect(nzl.port_2, boundary1.ports[1]) annotation(
    Line(points = {{188, 0}, {220, 0}}, color = {0, 127, 255}));
  connect(powerSensor1.power, constraint.u_variable) annotation(
    Line(points = {{58, -51}, {58, -55}}, color = {0, 0, 127}));
  connect(ramp.y, constraint.u_targetValue) annotation(
    Line(points = {{31, -84}, {58, -84}, {58, -78}}, color = {0, 0, 127}));
  annotation(
    Icon(coordinateSystem(extent = {{-200, -100}, {260, 100}}), graphics = {Text(lineColor = {0, 0, 255}, extent = {{-151, 165}, {138, 102}}, textString = "%name")}),
    experiment(StopTime = 400, StartTime = 0, Tolerance = 1e-06, Interval = 0.01),
    Documentation(info = "<html>

</html>"),
    Diagram(coordinateSystem(extent = {{-200, -100}, {260, 100}}), graphics = {Text(origin = {114, -23}, extent = {{-36, 11}, {66, -8}}, textString = "mass flow, inlet/outlet pressure are given"), Text(origin = {186, -57}, extent = {{-26, 7}, {48, -4}}, textString = "power, torque are calculated"), Line(origin = {179.407, -33.292}, points = {{-13, 7}, {-9, -19}}, arrow = {Arrow.None, Arrow.Open})}));
end SteamPowerGenerator_ex01;
