within PropulsionSystem.Examples.Engines.DesignPoint;

model MSZ006A1_engine001_002
  extends Modelica.Icons.Example;
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //-----
  PropulsionSystem.Elements.BasicElements.FlightToEngine flightToEngine1(redeclare package Medium = engineAir, MN = 0, alt = 0) annotation(
    Placement(visible = true, transformation(origin = {-90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Inlet Inlt010(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Compressor Cmp020(redeclare package Medium = engineAir, NmechDes = 10000, PRdes = 40, effDes = 0.9, switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal, switchInput_Wc_1 = PropulsionSystem.Types.switches.switch_parameter_input.asCalculated, switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Duct Duct030(redeclare package Medium = engineAir, dPqPdes = 0.02) annotation(
    Placement(visible = true, transformation(origin = {30, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.HeatInjector Brn036(redeclare package Medium = engineAir, TtOutletDes(displayUnit = "K") = 1600, switchInput_TtOutlet = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) annotation(
    Placement(visible = true, transformation(origin = {60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.constrain_dm constrain_dm1(redeclare package Medium = engineAir, dmDes = 417.8) annotation(
    Placement(visible = true, transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombustFuel combustFuel1 annotation(
    Placement(visible = true, transformation(origin = {40, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.constrain_Nmech constrain_Nmech1(NmechDes = 10000) annotation(
    Placement(visible = true, transformation(origin = {30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Turbine Trb041(redeclare package Medium = engineAir, NmechDes = 10000, Tdes_1 = 1873.15, effDes = 0.9, pDes_1 = 101.3 * 1000, switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.asCalculated, switchInput_Wc_1 = PropulsionSystem.Types.switches.switch_parameter_input.asCalculated, switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) annotation(
    Placement(visible = true, transformation(origin = {90, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Duct Duct045(redeclare package Medium = engineAir, dPqPdes = 0.03) annotation(
    Placement(visible = true, transformation(origin = {120, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NozzleConv Nzl070(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {150, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance perf001 annotation(
    Placement(visible = true, transformation(origin = {180, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.SetIndependent setIndependent1(independent(fixed = false), independent_init = 2600)  annotation(
    Placement(visible = true, transformation(origin = {50, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.SetDependent setDependent1(switchInput_tgtVal = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal, tgtVal = 600000)  annotation(
    Placement(visible = true, transformation(origin = {170, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp020_PR(duration = 5, height = 0, offset = 20, startTime = 5)  annotation(
    Placement(visible = true, transformation(origin = {-30, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Cmp020_eff(duration = 5, height = 0, offset = 0.9, startTime = 5)  annotation(
    Placement(visible = true, transformation(origin = {-10, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_Trb041_eff(duration = 5, height = 0, offset = 0.9, startTime = 5)  annotation(
    Placement(visible = true, transformation(origin = {70, -84}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_tgt_Fn(duration = 30, height = 395405, offset = 100 * 1000, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {170, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_tgt_Fn.y, setDependent1.tgtVal_in) annotation(
    Line(points = {{182, -120}, {190, -120}, {190, -90}, {182, -90}, {182, -90}}, color = {0, 0, 127}));
  connect(ramp_Trb041_eff.y, Trb041.eff_in) annotation(
    Line(points = {{81, -84}, {92, -84}, {92, -8}, {94, -8}}, color = {0, 0, 127}));
  connect(ramp_Cmp020_PR.y, Cmp020.PR_in) annotation(
    Line(points = {{-17, -90}, {0, -90}, {0, -6}}, color = {0, 0, 127}));
  connect(constrain_Nmech1.flange_b, Trb041.flange_1) annotation(
    Line(points = {{40, -30}, {74, -30}, {74, 0}, {80, 0}}));
  connect(ramp_Cmp020_eff.y, Cmp020.eff_in) annotation(
    Line(points = {{2, -120}, {4, -120}, {4, -4}, {4, -4}}, color = {0, 0, 127}));
  connect(perf001.Fn_out, setDependent1.dependent_in) annotation(
    Line(points = {{192, -46}, {196, -46}, {196, -74}, {152, -74}, {152, -90}, {158, -90}, {158, -90}}, color = {0, 0, 127}));
  connect(Inlt010.Fram_out, perf001.Fram_in) annotation(
    Line(points = {{-23, -4}, {-17, -4}, {-17, -48}, {167, -48}}, color = {0, 0, 127}));
  connect(combustFuel1.dm_fuel_out, perf001.dm_fuel_in) annotation(
    Line(points = {{51, 26}, {102, 26}, {102, -56}, {167, -56}}, color = {0, 0, 127}));
  connect(Nzl070.Fg_out, perf001.Fg_in) annotation(
    Line(points = {{155, 2.9976e-16}, {161, 2.9976e-16}, {161, -44}, {167, -44}}, color = {0, 0, 127}));
  connect(setIndependent1.independent_out, Brn036.TtOutlet_in) annotation(
    Line(points = {{62, 70}, {72, 70}, {72, 2}, {70, 2}, {70, 4}}, color = {0, 0, 127}));
  connect(Duct045.port_2, Nzl070.port_1) annotation(
    Line(points = {{130, 8}, {135, 8}, {135, 6}, {140, 6}}, color = {0, 127, 255}));
  connect(flightToEngine1.port_fluidAmb, Nzl070.port_2) annotation(
    Line(points = {{-90, 10}, {-90, 16}, {160, 16}, {160, 6}}, color = {0, 127, 255}));
  connect(Trb041.port_2, Duct045.port_1) annotation(
    Line(points = {{100, 10}, {105, 10}, {105, 12}, {110, 12}}, color = {0, 127, 255}));
  connect(Brn036.port_2, Trb041.port_1) annotation(
    Line(points = {{70, 8}, {73, 8}, {73, 6}, {80, 6}}, color = {0, 127, 255}));
  connect(constrain_dm1.port_2, Inlt010.port_1) annotation(
    Line(points = {{-50, 8}, {-45, 8}, {-45, 6}, {-40, 6}}, color = {0, 127, 255}));
  connect(flightToEngine1.V_tot_out, Inlt010.V_tot_in) annotation(
    Line(points = {{-79, -4}, {-73.4, -4}, {-73.4, -20}, {-43.4, -20}, {-43.4, -6}, {-37, -6}}, color = {0, 0, 127}));
  connect(Inlt010.port_2, Cmp020.port_1) annotation(
    Line(points = {{-20, 10}, {-15, 10}, {-15, 12}, {-10, 12}}, color = {0, 127, 255}));
  connect(Cmp020.flange_2, constrain_Nmech1.flange_a) annotation(
    Line(points = {{10, 2}, {15, 2}, {15, -30}, {20, -30}}));
  connect(Cmp020.port_2, Duct030.port_1) annotation(
    Line(points = {{10, 10}, {15, 10}, {15, 8}, {20, 8}}, color = {0, 127, 255}));
  connect(Duct030.port_2, Brn036.port_1) annotation(
    Line(points = {{40, 10}, {50, 10}}, color = {0, 127, 255}));
  connect(combustFuel1.HeatPort_b, Brn036.HeatPort_1) annotation(
    Line(points = {{50, 30}, {60, 30}, {60, 10}}, color = {191, 0, 0}));
  connect(flightToEngine1.port_fluid2Eng, constrain_dm1.port_1) annotation(
    Line(points = {{-80, 10}, {-68, 10}}, color = {0, 127, 255}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(extent = {{-100, -140}, {200, 100}})),
    Icon(coordinateSystem(extent = {{-100, -140}, {200, 100}})),
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.01),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "mat"));

end MSZ006A1_engine001_002;
