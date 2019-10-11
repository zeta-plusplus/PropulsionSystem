within PropulsionSystem.Examples.Elements.BasicElements;

model Volume001_002
  extends Modelica.Icons.Example;
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = Modelica.Media.Air.DryAirNasa, T = 288.15, nPorts = 2, p = 101.3 * 1000, use_T_in = false, use_p_in = false)  annotation(
    Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia1(J = 1)  annotation(
    Placement(visible = true, transformation(origin = {20, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed1(w_fixed = -1000)  annotation(
    Placement(visible = true, transformation(origin = {50, 0}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system(energyDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial, massDynamics = Modelica.Fluid.Types.Dynamics.DynamicFreeInitial)  annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.MassFlowSource massFlowSource1(redeclare package Medium = Modelica.Media.Air.DryAirNasa, m_flow = -10, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  PropulsionSystem.Elements.BasicElements.Compressor compressor1(redeclare package Medium = Modelica.Media.Air.DryAirNasa, PRdes = 10) annotation(
    Placement(visible = true, transformation(origin = {-10, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = -10)  annotation(
    Placement(visible = true, transformation(origin = {112, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Sources.ConstantSpeed constantSpeed2(w_fixed = -1000) annotation(
    Placement(visible = true, transformation(origin = {50, -80}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia inertia2(J = 1) annotation(
    Placement(visible = true, transformation(origin = {20, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Compressor compressor2(redeclare package Medium=Modelica.Media.Air.DryAirNasa,PRdes = 10, switchDef_WcDes_1 = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal, switchInput_Wc_1 = PropulsionSystem.Types.switches.switch_parameter_input.asCalculated)  annotation(
    Placement(visible = true, transformation(origin = {-10, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Fittings.SimpleGenericOrifice orifice(redeclare package Medium=Modelica.Media.Air.DryAirNasa,diameter = 0.1, zeta = 1)  annotation(
    Placement(visible = true, transformation(origin = {80, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary1(redeclare package Medium=Modelica.Media.Air.DryAirNasa,T = 288.15, nPorts = 1, p = 101.3 * 1000)  annotation(
    Placement(visible = true, transformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 10, height = 10, offset = 5, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {-50, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Vessels.ClosedVolume volume(redeclare package Medium=Modelica.Media.Air.DryAirNasa,V = 1, nPorts = 2, use_portsData = false)  annotation(
    Placement(visible = true, transformation(origin = {30, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
equation
  connect(inertia2.flange_b, constantSpeed2.flange) annotation(
    Line(points = {{30, -80}, {40, -80}, {40, -80}, {40, -80}}));
  connect(compressor2.flange_2, inertia2.flange_a) annotation(
    Line(points = {{0, -40}, {4, -40}, {4, -80}, {10, -80}}));
  connect(massFlowSource1.m_flow_in, const.y) annotation(
    Line(points = {{82, 50}, {100, 50}, {100, 50}, {100, 50}}, color = {0, 0, 127}));
  connect(compressor1.port_2, massFlowSource1.port_b) annotation(
    Line(points = {{0, 48}, {8, 48}, {8, 50}, {60, 50}, {60, 50}}, color = {0, 127, 255}));
  connect(orifice.port_b, boundary1.ports[1]) annotation(
    Line(points = {{90, -40}, {100, -40}}, color = {0, 127, 255}));
  connect(volume.ports[2], orifice.port_a) annotation(
    Line(points = {{30, -30}, {56, -30}, {56, -40}, {70, -40}, {70, -40}}, color = {0, 127, 255}));
  connect(ramp1.y, compressor2.PR_in) annotation(
    Line(points = {{-39, -60}, {-11, -60}, {-11, -46}, {-11, -46}}, color = {0, 0, 127}));
  connect(inertia1.flange_b, constantSpeed1.flange) annotation(
    Line(points = {{30, 0}, {40, 0}, {40, 0}, {40, 0}}));
  connect(compressor1.flange_2, inertia1.flange_a) annotation(
    Line(points = {{0, 40}, {4, 40}, {4, 0}, {10, 0}, {10, 0}}));
  connect(boundary.ports[2], compressor2.port_1) annotation(
    Line(points = {{-40, 50}, {-34, 50}, {-34, -32}, {-20, -32}, {-20, -32}}, color = {0, 127, 255}));
  connect(compressor2.port_2, volume.ports[1]) annotation(
    Line(points = {{0, -32}, {14, -32}, {14, -30}, {30, -30}, {30, -30}}, color = {0, 127, 255}));
  connect(boundary.ports[1], compressor1.port_1) annotation(
    Line(points = {{-40, 50}, {-30, 50}, {-30, 48}, {-20, 48}, {-20, 48}}, color = {0, 127, 255}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.02),
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
  


end Volume001_002;
