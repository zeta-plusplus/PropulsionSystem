within PropulsionSystem.Examples.temp;

model Turbojet_02
  extends Modelica.Icons.Example;
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //-----
  PropulsionSystem.Elements.BasicElements.FlightToEngine flightToEngine1(redeclare package Medium = engineAir, MN = 0.80, alt = 10000) annotation(
    Placement(visible = true, transformation(origin = {-90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Inlet Inlt010(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Compressor Cmp020(redeclare package Medium = engineAir, NmechDes = 9000, PRdes = 20, switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.use_desValue, switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.use_desValue) annotation(
    Placement(visible = true, transformation(origin = {0, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Duct Duct030(redeclare package Medium = engineAir, dPqPdes = 0.02) annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.HeatInjector Brn036(redeclare package Medium = engineAir, T2_init = 1600, TtOutletDes(displayUnit = "K") = 1600, h2_init = 1600 * 1000, p2_init = 20 * 101.3 * 1000, switchInput_TtOutlet = PropulsionSystem.Types.switches.switch_parameter_input.asCalculated) annotation(
    Placement(visible = true, transformation(origin = {60, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.constrain_dm constrain_dm1(redeclare package Medium = engineAir, dmDes = 10) annotation(
    Placement(visible = true, transformation(origin = {-60, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.constrain_Nmech constrain_Nmech1(NmechDes = 9000) annotation(
    Placement(visible = true, transformation(origin = {30, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia ShHP(J = 100) annotation(
    Placement(visible = true, transformation(origin = {60, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Turbine Trb041(redeclare package Medium = engineAir, NmechDes = 9000, PRdes = 3.3, T1_init = 1600, T2_init = 800, Tdes_1(displayUnit = "K") = 1600, dmDes_1 = 10, effDes = 0.8, h1_init = 1600 * 1000, h2_init = 800 * 1000, p1_init = 20 * 101.3 * 1000, p2_init = 5 * 101.3 * 1000, pDes_1 = 1.88665e+06, switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.use_desValue) annotation(
    Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Duct Duct045(redeclare package Medium = engineAir, T1_init = 800, dPqPdes = 0.03, h1_init = 800 * 1000, p1_init = 5 * 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {120, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NozzleConv Nzl070(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {150, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance perf001 annotation(
    Placement(visible = true, transformation(origin = {180, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.FixedHeatFlow fixedHeatFlow1(Q_flow = -1.3e+07, T_ref(displayUnit = "K") = 1600)  annotation(
    Placement(visible = true, transformation(origin = {60, 50}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant dumy_dmFuel(k = 0.1)  annotation(
    Placement(visible = true, transformation(origin = {140, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(dumy_dmFuel.y, perf001.dm_fuel_in) annotation(
    Line(points = {{152, -50}, {162, -50}, {162, -46}, {170, -46}, {170, -46}}, color = {0, 0, 127}));
  connect(fixedHeatFlow1.port, Brn036.HeatPort_1) annotation(
    Line(points = {{60, 40}, {60, 40}, {60, 20}, {60, 20}}, color = {191, 0, 0}));
  connect(Nzl070.Fg_out, perf001.Fg_in) annotation(
    Line(points = {{155, 12}, {161, 12}, {161, -34}, {169, -34}}, color = {0, 0, 127}));
  connect(Inlt010.Fram_out, perf001.Fram_in) annotation(
    Line(points = {{-23, 8}, {-17, 8}, {-17, -38}, {169, -38}}, color = {0, 0, 127}));
  connect(Cmp020.flange_2, constrain_Nmech1.flange_a) annotation(
    Line(points = {{10, 10}, {15, 10}, {15, -20}, {20, -20}}));
  connect(Cmp020.port_2, Duct030.port_1) annotation(
    Line(points = {{10, 18}, {20, 18}}, color = {0, 127, 255}));
  connect(Inlt010.port_2, Cmp020.port_1) annotation(
    Line(points = {{-20, 20}, {-15, 20}, {-15, 18}, {-10, 18}}, color = {0, 127, 255}));
  connect(flightToEngine1.V_tot_out, Inlt010.V_tot_in) annotation(
    Line(points = {{-79, 8}, {-73.4, 8}, {-73.4, -8}, {-43.4, -8}, {-43.4, 6}, {-37, 6}}, color = {0, 0, 127}));
  connect(flightToEngine1.port_fluid2Eng, constrain_dm1.port_1) annotation(
    Line(points = {{-80, 20}, {-68, 20}}, color = {0, 127, 255}));
  connect(flightToEngine1.port_fluidAmb, Nzl070.port_2) annotation(
    Line(points = {{-90, 22}, {-90, 28}, {160, 28}, {160, 18}}, color = {0, 127, 255}));
  connect(constrain_dm1.port_2, Inlt010.port_1) annotation(
    Line(points = {{-50, 18}, {-45, 18}, {-45, 16}, {-40, 16}}, color = {0, 127, 255}));
  connect(Duct030.port_2, Brn036.port_1) annotation(
    Line(points = {{40, 20}, {45, 20}, {45, 22}, {50, 22}}, color = {0, 127, 255}));
  connect(Brn036.port_2, Trb041.port_1) annotation(
    Line(points = {{70, 20}, {75, 20}, {75, 18}, {80, 18}}, color = {0, 127, 255}));
  connect(ShHP.flange_b, Trb041.flange_1) annotation(
    Line(points = {{70, -20}, {75, -20}, {75, 8}, {80, 8}}));
  connect(Trb041.port_2, Duct045.port_1) annotation(
    Line(points = {{100, 20}, {105, 20}, {105, 22}, {110, 22}}, color = {0, 127, 255}));
  connect(Duct045.port_2, Nzl070.port_1) annotation(
    Line(points = {{130, 20}, {135, 20}, {135, 18}, {140, 18}}, color = {0, 127, 255}));
  connect(constrain_Nmech1.flange_b, ShHP.flange_a) annotation(
    Line(points = {{40, -18}, {45, -18}, {45, -16}, {50, -16}}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(extent = {{-100, -60}, {200, 100}})),
    Icon(coordinateSystem(extent = {{-100, -140}, {200, 100}})),
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.01),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "mat"));
end Turbojet_02;
