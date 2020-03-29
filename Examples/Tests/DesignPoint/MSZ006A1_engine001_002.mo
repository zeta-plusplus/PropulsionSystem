within PropulsionSystem.Examples.Tests.DesignPoint;

model MSZ006A1_engine001_002
  extends Modelica.Icons.Example;
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //-----
  PropulsionSystem.Elements.BasicElements.FlightToEngine flightToEngine1(redeclare package Medium = engineAir, MN = 0, alt = 0) annotation(
    Placement(visible = true, transformation(origin = {-90, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Inlet Inlt010(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-30, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Compressor Cmp020(redeclare package Medium = engineAir, NmechDes = 10000, PRdes = 40, effDes = 0.9, switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal, switchInput_Wc_1 = PropulsionSystem.Types.switches.switch_parameter_input.asCalculated, switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) annotation(
    Placement(visible = true, transformation(origin = {0, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Duct Duct030(redeclare package Medium = engineAir, dPqPdes = 0.02) annotation(
    Placement(visible = true, transformation(origin = {30, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.HeatInjector Brn036(redeclare package Medium = engineAir, TtOutletDes(displayUnit = "K") = 1600, switchInput_TtOutlet = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) annotation(
    Placement(visible = true, transformation(origin = {60, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.constrain_dm constrain_dm1(redeclare package Medium = engineAir, dmDes = 417.8) annotation(
    Placement(visible = true, transformation(origin = {-60, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombustFuel combustFuel1 annotation(
    Placement(visible = true, transformation(origin = {40, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.constrain_Nmech constrain_Nmech1(NmechDes = 10000) annotation(
    Placement(visible = true, transformation(origin = {30, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Turbine Trb041(redeclare package Medium = engineAir, NmechDes = 10000, Tdes_1 = 1873.15, effDes = 0.9, pDes_1 = 101.3 * 1000, switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.asCalculated, switchInput_Wc_1 = PropulsionSystem.Types.switches.switch_parameter_input.asCalculated, switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) annotation(
    Placement(visible = true, transformation(origin = {90, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Duct Duct045(redeclare package Medium = engineAir, dPqPdes = 0.03) annotation(
    Placement(visible = true, transformation(origin = {120, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NozzleConv Nzl070(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {150, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance perf001 annotation(
    Placement(visible = true, transformation(origin = {180, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.SetIndependent setIndependent1(independent(fixed = false), independent_init = 2600) annotation(
    Placement(visible = true, transformation(origin = {50, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.SetDependent setDependent1(switchInput_tgtVal = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal, tgtVal = 600000) annotation(
    Placement(visible = true, transformation(origin = {170, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp020_PR(duration = 5, height = 0, offset = 20, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {-30, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp020_eff(duration = 5, height = 0, offset = 0.9, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {-10, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Trb041_eff(duration = 5, height = 0, offset = 0.9, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {70, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_tgt_Fn(duration = 30, height = 395405, offset = 100 * 1000, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {170, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(flightToEngine1.port_fluid2Eng, constrain_dm1.port_1) annotation(
    Line(points = {{-80, 28}, {-68, 28}}, color = {0, 127, 255}));
  connect(flightToEngine1.V_tot_out, Inlt010.V_tot_in) annotation(
    Line(points = {{-79, 16}, {-73.4, 16}, {-73.4, 0}, {-43.4, 0}, {-43.4, 14}, {-37, 14}}, color = {0, 0, 127}));
  connect(flightToEngine1.port_fluidAmb, Nzl070.port_2) annotation(
    Line(points = {{-90, 30}, {-90, 36}, {160, 36}, {160, 26}}, color = {0, 127, 255}));
  connect(Inlt010.port_2, Cmp020.port_1) annotation(
    Line(points = {{-20, 28}, {-15, 28}, {-15, 30}, {-10, 30}}, color = {0, 127, 255}));
  connect(constrain_dm1.port_2, Inlt010.port_1) annotation(
    Line(points = {{-50, 28}, {-45, 28}, {-45, 26}, {-40, 26}}, color = {0, 127, 255}));
  connect(Inlt010.Fram_out, perf001.Fram_in) annotation(
    Line(points = {{-23, 16}, {-17, 16}, {-17, -28}, {167, -28}}, color = {0, 0, 127}));
  connect(Cmp020.port_2, Duct030.port_1) annotation(
    Line(points = {{10, 28}, {15, 28}, {15, 26}, {20, 26}}, color = {0, 127, 255}));
  connect(Cmp020.flange_2, constrain_Nmech1.flange_a) annotation(
    Line(points = {{10, 20}, {15, 20}, {15, -12}, {20, -12}}));
  connect(ramp_Cmp020_eff.y, Cmp020.eff_in) annotation(
    Line(points = {{1, -70}, {4, -70}, {4, 16}}, color = {0, 0, 127}));
  connect(ramp_Cmp020_PR.y, Cmp020.PR_in) annotation(
    Line(points = {{-19, -50}, {0, -50}, {0, 14}}, color = {0, 0, 127}));
  connect(Duct030.port_2, Brn036.port_1) annotation(
    Line(points = {{40, 28}, {50, 28}}, color = {0, 127, 255}));
  connect(combustFuel1.HeatPort_b, Brn036.HeatPort_1) annotation(
    Line(points = {{50, 50}, {60, 50}, {60, 30}}, color = {191, 0, 0}));
  connect(Brn036.port_2, Trb041.port_1) annotation(
    Line(points = {{70, 28}, {73, 28}, {73, 26}, {80, 26}}, color = {0, 127, 255}));
  connect(setIndependent1.independent_out, Brn036.TtOutlet_in) annotation(
    Line(points = {{62, 70}, {72, 70}, {72, 2}, {69, 2}, {69, 23}}, color = {0, 0, 127}));
  connect(combustFuel1.dm_fuel_out, perf001.dm_fuel_in) annotation(
    Line(points = {{51, 46}, {102, 46}, {102, -36}, {167, -36}}, color = {0, 0, 127}));
  connect(Trb041.port_2, Duct045.port_1) annotation(
    Line(points = {{100, 28}, {105, 28}, {105, 30}, {110, 30}}, color = {0, 127, 255}));
  connect(constrain_Nmech1.flange_b, Trb041.flange_1) annotation(
    Line(points = {{40, -10}, {74, -10}, {74, 20}, {80, 20}}));
  connect(ramp_Trb041_eff.y, Trb041.eff_in) annotation(
    Line(points = {{81, -50}, {92, -50}, {92, 12}, {94, 12}}, color = {0, 0, 127}));
  connect(Duct045.port_2, Nzl070.port_1) annotation(
    Line(points = {{130, 28}, {135, 28}, {135, 26}, {140, 26}}, color = {0, 127, 255}));
  connect(Nzl070.Fg_out, perf001.Fg_in) annotation(
    Line(points = {{155, 20}, {161, 20}, {161, -24}, {167, -24}}, color = {0, 0, 127}));
  connect(perf001.Fn_out, setDependent1.dependent_in) annotation(
    Line(points = {{191, -26}, {195, -26}, {195, -44}, {151, -44}, {151, -60}, {158, -60}}, color = {0, 0, 127}));
  connect(ramp_tgt_Fn.y, setDependent1.tgtVal_in) annotation(
    Line(points = {{181, -90}, {190, -90}, {190, -60}, {181, -60}}, color = {0, 0, 127}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(extent = {{-100, -100}, {200, 100}})),
    Icon(coordinateSystem(extent = {{-100, -140}, {200, 100}})),
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.01),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "mat"));
end MSZ006A1_engine001_002;
