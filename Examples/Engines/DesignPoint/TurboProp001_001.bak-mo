within PropulsionSystem.Examples.Engines.DesignPoint;

model TurboProp001_001
  extends Modelica.Icons.Example;
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //-----
  PropulsionSystem.Elements.BasicElements.FlightToEngine flightToEngine1(redeclare package Medium = engineAir, MN = 0.8, alt = 10000) annotation(
    Placement(visible = true, transformation(origin = {-90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Inlet Inlt010(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Compressor Cmp020(redeclare package Medium = engineAir, NmechDes = 9000, PRdes = 20, switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.use_desValue, switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.use_desValue) annotation(
    Placement(visible = true, transformation(origin = {0, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Duct Duct030(redeclare package Medium = engineAir, dPqPdes = 0.02) annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.HeatInjector Brn036(redeclare package Medium = engineAir, TtOutletDes(displayUnit = "K") = 1600, switchInput_TtOutlet = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) annotation(
    Placement(visible = true, transformation(origin = {60, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.constrain_dm constrain_dm1(redeclare package Medium = engineAir, dmDes = 10) annotation(
    Placement(visible = true, transformation(origin = {-60, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombustFuel combustFuel1 annotation(
    Placement(visible = true, transformation(origin = {40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.constrain_Nmech constrain_Nmech1(NmechDes = 9000) annotation(
    Placement(visible = true, transformation(origin = {30, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia ShHP(J = 100) annotation(
    Placement(visible = true, transformation(origin = {60, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Turbine Trb041(redeclare package Medium = engineAir, NmechDes = 9000, Tdes_1(displayUnit = "K") = 1600, dmDes_1 = 10, effDes = 0.8, pDes_1 = 1.88665e+06, switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.use_desValue) annotation(
    Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Duct Duct045(redeclare package Medium = engineAir, dPqPdes = 0.03) annotation(
    Placement(visible = true, transformation(origin = {120, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NozzleConv Nzl070(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {210, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance perf001 annotation(
    Placement(visible = true, transformation(origin = {290, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_TIT(duration = 10, height = 0, offset = 1600, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {40, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Turbine Trb046(redeclare package Medium = engineAir, NmechDes = 9000, effDes = 0.8) annotation(
    Placement(visible = true, transformation(origin = {170, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.constrain_Nmech constrain_N_ShLP(NmechDes = 9000)  annotation(
    Placement(visible = true, transformation(origin = {90, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia ShLP(J = 100) annotation(
    Placement(visible = true, transformation(origin = {120, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.PropellerActDisk propellerActDisk1 annotation(
    Placement(visible = true, transformation(origin = {-40, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {214, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure2(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {190, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division division1 annotation(
    Placement(visible = true, transformation(origin = {250, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.SetDependent setDependent1(tgtVal = 1.01)  annotation(
    Placement(visible = true, transformation(origin = {280, 22}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {250, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.IdealGear GearReduProp(ratio = 1 / 9)  annotation(
    Placement(visible = true, transformation(origin = {44, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia ShProp(J = 100) annotation(
    Placement(visible = true, transformation(origin = {-2, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(Cmp020.flange_2, constrain_Nmech1.flange_a) annotation(
    Line(points = {{10, 10}, {15, 10}, {15, -20}, {20, -20}}));
  connect(Cmp020.port_2, Duct030.port_1) annotation(
    Line(points = {{10, 18}, {20, 18}}, color = {0, 127, 255}));
  connect(Inlt010.port_2, Cmp020.port_1) annotation(
    Line(points = {{-20, 20}, {-15, 20}, {-15, 18}, {-10, 18}}, color = {0, 127, 255}));
  connect(Duct045.port_2, Trb046.port_1) annotation(
    Line(points = {{130, 18}, {160, 18}}, color = {0, 127, 255}));
  connect(Trb046.port_2, pressure2.port) annotation(
    Line(points = {{180, 18}, {190, 18}}, color = {0, 127, 255}));
  connect(ShLP.flange_b, Trb046.flange_1) annotation(
    Line(points = {{130, -80}, {144, -80}, {144, 10}, {160, 10}}));
  connect(flightToEngine1.V_tot_out, propellerActDisk1.u_flowSpeed) annotation(
    Line(points = {{-79, 6}, {-76, 6}, {-76, -74}, {-62, -74}}, color = {0, 0, 127}));
  connect(flightToEngine1.port_fluid2Eng, constrain_dm1.port_1) annotation(
    Line(points = {{-80, 18}, {-74, 18}, {-74, 20}, {-68, 20}}, color = {0, 127, 255}));
  connect(flightToEngine1.V_tot_out, Inlt010.V_tot_in) annotation(
    Line(points = {{-79, 6}, {-73.4, 6}, {-73.4, -8}, {-43.4, -8}, {-43.4, 6}, {-37, 6}}, color = {0, 0, 127}));
  connect(flightToEngine1.port_fluidAmb, pressure1.port) annotation(
    Line(points = {{-90, 20}, {-90, 34}, {214, 34}}, color = {0, 127, 255}));
  connect(ShProp.flange_b, GearReduProp.flange_a) annotation(
    Line(points = {{8, -80}, {34, -80}}));
  connect(propellerActDisk1.flange_1, ShProp.flange_a) annotation(
    Line(points = {{-20, -80}, {-12, -80}}));
  connect(GearReduProp.flange_b, constrain_N_ShLP.flange_a) annotation(
    Line(points = {{54, -80}, {80, -80}, {80, -80}, {80, -80}}));
  connect(constrain_N_ShLP.flange_b, ShLP.flange_a) annotation(
    Line(points = {{100, -80}, {110, -80}}));
  connect(propellerActDisk1.y_Fg, add1.u2) annotation(
    Line(points = {{-18, -96}, {228, -96}, {228, -26}, {238, -26}}, color = {0, 0, 127}));
  connect(add1.y, perf001.Fg_in) annotation(
    Line(points = {{262, -20}, {266, -20}, {266, -34}, {280, -34}, {280, -34}}, color = {0, 0, 127}));
  connect(Nzl070.Fg_out, add1.u1) annotation(
    Line(points = {{216, 10}, {226, 10}, {226, -14}, {238, -14}, {238, -14}}, color = {0, 0, 127}));
  connect(division1.y, setDependent1.dependent_in) annotation(
    Line(points = {{262, 22}, {268, 22}, {268, 22}, {268, 22}}, color = {0, 0, 127}));
  connect(pressure1.p, division1.u2) annotation(
    Line(points = {{226, 44}, {230, 44}, {230, 16}, {238, 16}}, color = {0, 0, 127}));
  connect(pressure2.p, division1.u1) annotation(
    Line(points = {{202, 28}, {238, 28}}, color = {0, 0, 127}));
  connect(pressure1.port, Nzl070.port_2) annotation(
    Line(points = {{214, 34}, {220, 34}, {220, 18}}, color = {0, 127, 255}));
  connect(pressure2.port, Nzl070.port_1) annotation(
    Line(points = {{190, 18}, {200, 18}}, color = {0, 127, 255}));
  connect(Inlt010.Fram_out, perf001.Fram_in) annotation(
    Line(points = {{-23, 8}, {-17, 8}, {-17, -38}, {279, -38}}, color = {0, 0, 127}));
  connect(combustFuel1.dm_fuel_out, perf001.dm_fuel_in) annotation(
    Line(points = {{51, 38}, {106, 38}, {106, -46}, {279, -46}}, color = {0, 0, 127}));
  connect(ramp_TIT.y, Brn036.TtOutlet_in) annotation(
    Line(points = {{51, 72}, {73, 72}, {73, 16}, {69, 16}, {69, 16}}, color = {0, 0, 127}));
  connect(combustFuel1.HeatPort_b, Brn036.HeatPort_1) annotation(
    Line(points = {{50, 42}, {58, 42}, {58, 22}}, color = {191, 0, 0}));
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
  connect(constrain_Nmech1.flange_b, ShHP.flange_a) annotation(
    Line(points = {{40, -18}, {45, -18}, {45, -16}, {50, -16}}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(extent = {{-100, -140}, {300, 100}})),
    Icon(coordinateSystem(extent = {{-100, -140}, {200, 100}})),
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.01),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "mat"));
end TurboProp001_001;
