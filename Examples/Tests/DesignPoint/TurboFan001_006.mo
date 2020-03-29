within PropulsionSystem.Examples.Tests.DesignPoint;

model TurboFan001_006
  extends Modelica.Icons.Example;
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //-----
  PropulsionSystem.Elements.BasicElements.FlightToEngine flightToEngine1(redeclare package Medium = engineAir, MN = 0.8, alt = 10000) annotation(
    Placement(visible = true, transformation(origin = {-90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Inlet inlt010(redeclare package Medium = engineAir, effRamDes = 0.98) annotation(
    Placement(visible = true, transformation(origin = {-60, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.constrain_dm constrain_dm1(redeclare package Medium = engineAir, dmDes = 100) annotation(
    Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.constrain_dm constrain_dm2(redeclare package Medium = engineAir, dmDes = 10) annotation(
    Placement(visible = true, transformation(origin = {-30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.HeatInjector Brn036(redeclare package Medium = engineAir, TtOutletDes(displayUnit = "K") = 1800, switchInput_TtOutlet = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) annotation(
    Placement(visible = true, transformation(origin = {140, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombustFuel MainComb annotation(
    Placement(visible = true, transformation(origin = {120, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.constrain_Nmech Constrain_NH(NmechDes = 9000) annotation(
    Placement(visible = true, transformation(origin = {120, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia ShH(J = 200) annotation(
    Placement(visible = true, transformation(origin = {150, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NozzleConv Noz170(redeclare package Medium = engineAir, CdThDes = 0.98, CvDes = 0.995) annotation(
    Placement(visible = true, transformation(origin = {260, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NozzleConv Noz070(redeclare package Medium = engineAir, CdThDes = 0.98, CvDes = 0.995) annotation(
    Placement(visible = true, transformation(origin = {280, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia ShL(J = 1000) annotation(
    Placement(visible = true, transformation(origin = {100, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.constrain_Nmech constrain_NL(NmechDes = 3000) annotation(
    Placement(visible = true, transformation(origin = {70, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance Perf001 annotation(
    Placement(visible = true, transformation(origin = {360, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {320, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Compressor Cmp120(redeclare package Medium = engineAir, PRdes = 1.4, switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) annotation(
    Placement(visible = true, transformation(origin = {0, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Compressor Cmp020(redeclare package Medium = engineAir, NmechDes = 3000, PRdes = 2) annotation(
    Placement(visible = true, transformation(origin = {30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Compressor Cmp025(redeclare package Medium = engineAir, NmechDes = 9000, PRdes = 20, switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) annotation(
    Placement(visible = true, transformation(origin = {90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Turbine Trb041(redeclare package Medium = engineAir, NmechDes = 9000, switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.use_desValue) annotation(
    Placement(visible = true, transformation(origin = {180, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Turbine Trb049(redeclare package Medium = engineAir, NmechDes = 3000, switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.use_desValue) annotation(
    Placement(visible = true, transformation(origin = {240, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp120_PR(duration = 20, height = 0, offset = 1.4, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-20, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.SetIndependent setIndependent1 annotation(
    Placement(visible = true, transformation(origin = {130, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.SetDependent setDependent1(tgtVal = 12 * 1000) annotation(
    Placement(visible = true, transformation(origin = {390, -140}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp025_PR(duration = 20, height = 25, offset = 5, startTime = 40) annotation(
    Placement(visible = true, transformation(origin = {70, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_Cmp025_PR.y, Cmp025.PR_in) annotation(
    Line(points = {{82, -130}, {90, -130}, {90, -36}, {90, -36}}, color = {0, 0, 127}));
  connect(ramp_Cmp120_PR.y, Cmp120.PR_in) annotation(
    Line(points = {{-9, -130}, {0, -130}, {0, 4}}, color = {0, 0, 127}));
  connect(Perf001.Fn_out, setDependent1.dependent_in) annotation(
    Line(points = {{372, -96}, {382, -96}, {382, -118}, {364, -118}, {364, -140}, {379, -140}}, color = {0, 0, 127}));
  connect(MainComb.dm_fuel_out, Perf001.dm_fuel_in) annotation(
    Line(points = {{131, -4}, {340, -4}, {340, -106}, {349, -106}}, color = {0, 0, 127}));
  connect(Noz170.Fg_out, add1.u1) annotation(
    Line(points = {{265, 10}, {302, 10}, {302, -63.5}, {308, -63.5}, {308, -64}}, color = {0, 0, 127}));
  connect(Noz070.Fg_out, add1.u2) annotation(
    Line(points = {{285, -30}, {296, -30}, {296, -76}, {310, -76}}, color = {0, 0, 127}));
  connect(flightToEngine1.port_fluidAmb, Noz070.port_2) annotation(
    Line(points = {{-90, -20}, {-90, -12}, {290, -12}, {290, -22}}, color = {0, 127, 255}));
  connect(Trb049.port_2, Noz070.port_1) annotation(
    Line(points = {{250, -22}, {270, -22}}, color = {0, 127, 255}));
  connect(add1.y, Perf001.Fg_in) annotation(
    Line(points = {{331, -70}, {334, -70}, {334, -94}, {349, -94}}, color = {0, 0, 127}));
  connect(inlt010.Fram_out, Perf001.Fram_in) annotation(
    Line(points = {{-53, -34}, {-44, -34}, {-44, -98}, {349, -98}}, color = {0, 0, 127}));
  connect(Trb041.port_2, Trb049.port_1) annotation(
    Line(points = {{190, -22}, {230, -22}, {230, -22}, {230, -22}}, color = {0, 127, 255}));
  connect(ShL.flange_b, Trb049.flange_1) annotation(
    Line(points = {{110, -80}, {224, -80}, {224, -30}, {230, -30}}));
  connect(setIndependent1.independent_out, Brn036.TtOutlet_in) annotation(
    Line(points = {{142, 60}, {162, 60}, {162, -28}, {150, -28}, {150, -26}}, color = {0, 0, 127}));
  connect(Brn036.port_2, Trb041.port_1) annotation(
    Line(points = {{150, -22}, {166, -22}, {166, -20}, {172, -20}}, color = {0, 127, 255}));
  connect(MainComb.HeatPort_b, Brn036.HeatPort_1) annotation(
    Line(points = {{130, 0}, {138, 0}, {138, -20}}, color = {191, 0, 0}));
  connect(Cmp025.port_2, Brn036.port_1) annotation(
    Line(points = {{100, -22}, {130, -22}}, color = {0, 127, 255}));
  connect(Cmp020.port_2, Cmp025.port_1) annotation(
    Line(points = {{40, -22}, {80, -22}, {80, -22}, {80, -22}}, color = {0, 127, 255}));
  connect(Cmp120.port_2, Noz170.port_1) annotation(
    Line(points = {{10, 18}, {250, 18}, {250, 18}, {250, 18}}, color = {0, 127, 255}));
  connect(constrain_dm2.port_2, Cmp020.port_1) annotation(
    Line(points = {{-22, -22}, {18, -22}}, color = {0, 127, 255}));
  connect(inlt010.port_2, constrain_dm2.port_1) annotation(
    Line(points = {{-50, -22}, {-42, -22}}, color = {0, 127, 255}));
  connect(flightToEngine1.port_fluidAmb, Noz170.port_2) annotation(
    Line(points = {{-90, -20}, {-90, 26}, {268, 26}, {268, 18}}, color = {0, 127, 255}));
  connect(Constrain_NH.flange_b, ShH.flange_a) annotation(
    Line(points = {{130, -60}, {140, -60}, {140, -60}, {140, -60}}));
  connect(ShH.flange_b, Trb041.flange_1) annotation(
    Line(points = {{160, -58}, {166, -58}, {166, -28}, {172, -28}}));
  connect(Cmp025.flange_2, Constrain_NH.flange_a) annotation(
    Line(points = {{100, -30}, {104, -30}, {104, -60}, {110, -60}, {110, -60}}));
  connect(constrain_NL.flange_b, ShL.flange_a) annotation(
    Line(points = {{80, -80}, {90, -80}}));
  connect(Cmp020.flange_2, constrain_NL.flange_a) annotation(
    Line(points = {{40, -30}, {48, -30}, {48, -80}, {62, -80}}));
  connect(constrain_dm1.port_2, Cmp120.port_1) annotation(
    Line(points = {{-20, 18}, {-12, 18}}, color = {0, 127, 255}));
  connect(Cmp120.flange_2, Cmp020.flange_1) annotation(
    Line(points = {{10, 12}, {16, 12}, {16, -28}, {18, -28}}));
  connect(inlt010.port_2, constrain_dm1.port_1) annotation(
    Line(points = {{-50, -22}, {-44, -22}, {-44, 18}, {-40, 18}}, color = {0, 127, 255}));
  connect(flightToEngine1.port_fluid2Eng, inlt010.port_1) annotation(
    Line(points = {{-80, -20}, {-72, -20}}, color = {0, 127, 255}));
  connect(flightToEngine1.V_tot_out, inlt010.V_tot_in) annotation(
    Line(points = {{-79, -32}, {-69, -32}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-100, -160}, {400, 100}})),
    Icon(coordinateSystem(extent = {{-100, -160}, {400, 100}})),
    version = "",
    uses(Modelica(version = "3.2.2")),
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.001),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end TurboFan001_006;
