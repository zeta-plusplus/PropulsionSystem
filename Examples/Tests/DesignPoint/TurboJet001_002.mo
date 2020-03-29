within PropulsionSystem.Examples.Tests.DesignPoint;

model TurboJet001_002
  extends Modelica.Icons.Example;
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //-----
  PropulsionSystem.Elements.BasicElements.FlightToEngine flightToEngine1(redeclare package Medium = engineAir, MN = 0, alt = 0) annotation(
    Placement(visible = true, transformation(origin = {-90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Inlet Inlt010(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Compressor_Map_WcPReff Cmp020(redeclare package Medium = engineAir, PRdes = 8, switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal, switchInput_Wc_1 = PropulsionSystem.Types.switches.switch_parameter_input.asCalculated, switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal, thetaCurveDes = 3.14 / 4) annotation(
    Placement(visible = true, transformation(origin = {0, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Duct Duct030(redeclare package Medium = engineAir, dPqPdes = 0.02) annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.HeatInjector Brn036(redeclare package Medium = engineAir, TtOutletDes(displayUnit = "K") = 1600, switchInput_TtOutlet = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) annotation(
    Placement(visible = true, transformation(origin = {60, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.constrain_dm constrain_dm1(redeclare package Medium = engineAir, dmDes = 10) annotation(
    Placement(visible = true, transformation(origin = {-60, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombustFuel combustFuel1 annotation(
    Placement(visible = true, transformation(origin = {40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.constrain_Nmech constrain_Nmech1(NmechDes = 3000) annotation(
    Placement(visible = true, transformation(origin = {30, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Turbine_exponentialCurve Trb041(redeclare package Medium = engineAir, PRcurveDes = 1.8, Tdes_1 = 1873.15, pDes_1 = 101.3 * 1000, switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.asCalculated, switchInput_Wc_1 = PropulsionSystem.Types.switches.switch_parameter_input.asCalculated, switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) annotation(
    Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Duct Duct045(redeclare package Medium = engineAir, dPqPdes = 0.03) annotation(
    Placement(visible = true, transformation(origin = {120, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NozzleConv Nzl070(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {150, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance perf001 annotation(
    Placement(visible = true, transformation(origin = {180, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.SetIndependent setIndependent1 annotation(
    Placement(visible = true, transformation(origin = {50, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.SetDependent setDependent1(tgtVal = 10 * 1000) annotation(
    Placement(visible = true, transformation(origin = {170, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp020_PR(duration = 5, height = 40, offset = 10, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {-30, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp020_eff(duration = 5, height = 0, offset = 0.8, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {-10, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Trb041_eff(duration = 5, height = 0, offset = 0.8, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {70, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(flightToEngine1.port_fluid2Eng, constrain_dm1.port_1) annotation(
    Line(points = {{-80, 18}, {-68, 18}}, color = {0, 127, 255}));
  connect(flightToEngine1.V_tot_out, Inlt010.V_tot_in) annotation(
    Line(points = {{-79, 6}, {-73.4, 6}, {-73.4, -10}, {-43.4, -10}, {-43.4, 4}, {-37, 4}}, color = {0, 0, 127}));
  connect(flightToEngine1.port_fluidAmb, Nzl070.port_2) annotation(
    Line(points = {{-90, 20}, {-90, 26}, {160, 26}, {160, 16}}, color = {0, 127, 255}));
  connect(setIndependent1.independent_out, Brn036.TtOutlet_in) annotation(
    Line(points = {{61, 60}, {72, 60}, {72, 12}, {70, 12}, {70, 14}}, color = {0, 0, 127}));
  connect(Inlt010.port_2, Cmp020.port_1) annotation(
    Line(points = {{-20, 18}, {-15, 18}, {-15, 20}, {-10, 20}}, color = {0, 127, 255}));
  connect(constrain_dm1.port_2, Inlt010.port_1) annotation(
    Line(points = {{-50, 18}, {-45, 18}, {-45, 16}, {-40, 16}}, color = {0, 127, 255}));
  connect(Inlt010.Fram_out, perf001.Fram_in) annotation(
    Line(points = {{-23, 6}, {-17, 6}, {-17, -38}, {167, -38}}, color = {0, 0, 127}));
  connect(Cmp020.port_2, Duct030.port_1) annotation(
    Line(points = {{10, 18}, {15, 18}, {15, 16}, {20, 16}}, color = {0, 127, 255}));
  connect(Cmp020.flange_2, constrain_Nmech1.flange_a) annotation(
    Line(points = {{10, 10}, {15, 10}, {15, -22}, {20, -22}}));
  connect(ramp_Cmp020_eff.y, Cmp020.eff_in) annotation(
    Line(points = {{1, -80}, {4, -80}, {4, 6}}, color = {0, 0, 127}));
  connect(ramp_Cmp020_PR.y, Cmp020.PR_in) annotation(
    Line(points = {{-19, -60}, {0, -60}, {0, 4}}, color = {0, 0, 127}));
  connect(Duct030.port_2, Brn036.port_1) annotation(
    Line(points = {{40, 18}, {50, 18}}, color = {0, 127, 255}));
  connect(combustFuel1.HeatPort_b, Brn036.HeatPort_1) annotation(
    Line(points = {{50, 40}, {60, 40}, {60, 20}}, color = {191, 0, 0}));
  connect(Brn036.port_2, Trb041.port_1) annotation(
    Line(points = {{70, 18}, {73, 18}, {73, 16}, {80, 16}}, color = {0, 127, 255}));
  connect(combustFuel1.dm_fuel_out, perf001.dm_fuel_in) annotation(
    Line(points = {{51, 36}, {102, 36}, {102, -46}, {167, -46}}, color = {0, 0, 127}));
  connect(Trb041.port_2, Duct045.port_1) annotation(
    Line(points = {{100, 18}, {105, 18}, {105, 20}, {110, 20}}, color = {0, 127, 255}));
  connect(ramp_Trb041_eff.y, Trb041.eff_in) annotation(
    Line(points = {{81, -60}, {92, -60}, {92, 2}, {94, 2}}, color = {0, 0, 127}));
  connect(constrain_Nmech1.flange_b, Trb041.flange_1) annotation(
    Line(points = {{40, -20}, {74, -20}, {74, 10}, {80, 10}}));
  connect(Duct045.port_2, Nzl070.port_1) annotation(
    Line(points = {{130, 18}, {135, 18}, {135, 16}, {140, 16}}, color = {0, 127, 255}));
  connect(Nzl070.Fg_out, perf001.Fg_in) annotation(
    Line(points = {{155, 10}, {161, 10}, {161, -34}, {167, -34}}, color = {0, 0, 127}));
  connect(perf001.Fn_out, setDependent1.dependent_in) annotation(
    Line(points = {{191, -36}, {195, -36}, {195, -54}, {151, -54}, {151, -70}, {158, -70}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(extent = {{-100, -100}, {200, 100}})),
    Icon(coordinateSystem(extent = {{-100, -140}, {200, 100}})),
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.002),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end TurboJet001_002;
