within PropulsionSystem.Examples.Engines.DesignPoint;

model GasGenerator_001
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //-----
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 288.15, nPorts = 1, p = 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Compressor_ellipticalCurve Cmp020(redeclare package Medium= engineAir,switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_Wc_1 = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement)  annotation(
    Placement(visible = true, transformation(origin = {-10, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.HeatInjector HeatInject036(redeclare package Medium= engineAir,TtOutletDes(displayUnit = "K") = 1800)  annotation(
    Placement(visible = true, transformation(origin = {20, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Turbine_exponentialCurve Trb041(redeclare package Medium= engineAir,Tdes_1(displayUnit = "K") = 1800, pDes_1 = 20 * 101.3 * 1000, switchDef_s_Wc_CurveDes = PropulsionSystem.Types.switches.switch_defineDesValue.calcByDesStates, switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_Wc_1 = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement)  annotation(
    Placement(visible = true, transformation(origin = {50, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia ShG(J = 0.1)  annotation(
    Placement(visible = true, transformation(origin = {20, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombustFuel Brn036 annotation(
    Placement(visible = true, transformation(origin = {0, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.FlowSink flowSink1(redeclare package Medium=engineAir) annotation(
    Placement(visible = true, transformation(origin = {80, 48}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Trb041.port_2, flowSink1.port_a) annotation(
    Line(points = {{60, 48}, {70, 48}, {70, 48}, {70, 48}}, color = {0, 127, 255}));
  connect(Brn036.HeatPort_b, HeatInject036.HeatPort_1) annotation(
    Line(points = {{10, 70}, {20, 70}, {20, 50}, {20, 50}}, color = {191, 0, 0}));
  connect(HeatInject036.port_2, Trb041.port_1) annotation(
    Line(points = {{30, 48}, {40, 48}, {40, 48}, {40, 48}}, color = {0, 127, 255}));
  connect(Cmp020.port_2, HeatInject036.port_1) annotation(
    Line(points = {{0, 48}, {10, 48}, {10, 48}, {10, 48}}, color = {0, 127, 255}));
  connect(boundary.ports[1], Cmp020.port_1) annotation(
    Line(points = {{-40, 50}, {-30, 50}, {-30, 48}, {-20, 48}, {-20, 48}}, color = {0, 127, 255}, thickness = 0.5));
  connect(ShG.flange_b, Trb041.flange_1) annotation(
    Line(points = {{30, 10}, {34, 10}, {34, 40}, {40, 40}, {40, 40}}));
  connect(Cmp020.flange_2, ShG.flange_a) annotation(
    Line(points = {{0, 40}, {6, 40}, {6, 10}, {10, 10}, {10, 10}}));
end GasGenerator_001;
