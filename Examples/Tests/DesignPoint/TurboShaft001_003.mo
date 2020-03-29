within PropulsionSystem.Examples.Tests.DesignPoint;

model TurboShaft001_003
  extends Modelica.Icons.Example;
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //-----
  PropulsionSystem.Elements.BasicElements.FlightToEngine flightToEngine1(redeclare package Medium = engineAir, MN = 0, alt = 0) annotation(
    Placement(visible = true, transformation(origin = {-90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Inlet Inlt010(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Compressor Cmp020(redeclare package Medium = engineAir, NmechDes = 9000, PRdes = 20, switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.use_desValue, switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.use_desValue) annotation(
    Placement(visible = true, transformation(origin = {0, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Duct Duct030(redeclare package Medium = engineAir, dPqPdes = 0.02) annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.HeatInjector Brn036(redeclare package Medium = engineAir, TtOutletDes(displayUnit = "K") = 1600, switchInput_TtOutlet = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) annotation(
    Placement(visible = true, transformation(origin = {60, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.constrain_dm constrain_dm1(redeclare package Medium = engineAir, dmDes = 10, switchInput_dm = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) annotation(
    Placement(visible = true, transformation(origin = {-60, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombustFuel combustFuel1 annotation(
    Placement(visible = true, transformation(origin = {40, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.constrain_Nmech constrain_N_GasGen(NmechDes = 9000) annotation(
    Placement(visible = true, transformation(origin = {30, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia ShHP(J = 100) annotation(
    Placement(visible = true, transformation(origin = {60, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Turbine Trb041(redeclare package Medium = engineAir, NmechDes = 9000, Tdes_1(displayUnit = "K") = 1600, dmDes_1 = 10, effDes = 0.8, pDes_1 = 1.88665e+06, switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.use_desValue) annotation(
    Placement(visible = true, transformation(origin = {90, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NozzleConv Nzl070(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {210, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance perf001 annotation(
    Placement(visible = true, transformation(origin = {250, -70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_TIT(duration = 5, height = 0, offset = 1600, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {40, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Turbine Trb046(redeclare package Medium = engineAir, NmechDes = 9000, Tdes_1 = 1273.15) annotation(
    Placement(visible = true, transformation(origin = {120, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia ShTrbFree(J = 100) annotation(
    Placement(visible = true, transformation(origin = {180, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure_Fl070(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {190, 28}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.Pressure pressure_Fl090(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {220, 44}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division division_PR_Noz070 annotation(
    Placement(visible = true, transformation(origin = {260, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.SetDependent setDependent_PR_Noz070(tgtVal = 1.01) annotation(
    Placement(visible = true, transformation(origin = {290, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.constrain_Nmech constrain_N_TrbFree annotation(
    Placement(visible = true, transformation(origin = {150, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.extractPwr extractPwrTrbFree(switchInput_pwr = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) annotation(
    Placement(visible = true, transformation(origin = {210, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.SetIndependent setIndependent1 annotation(
    Placement(visible = true, transformation(origin = {210, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_m_flow(duration = 5, height = 20, offset = 10, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {-80, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(division_PR_Noz070.y, setDependent_PR_Noz070.dependent_in) annotation(
    Line(points = {{271, 20}, {277, 20}, {277, 20}, {277, 20}}, color = {0, 0, 127}));
  connect(pressure_Fl070.p, division_PR_Noz070.u1) annotation(
    Line(points = {{202, 28}, {234, 28}, {234, 26}, {248, 26}}, color = {0, 0, 127}));
  connect(pressure_Fl090.p, division_PR_Noz070.u2) annotation(
    Line(points = {{231, 44}, {236, 44}, {236, 14}, {248, 14}}, color = {0, 0, 127}));
  connect(combustFuel1.dm_fuel_out, perf001.dm_fuel_in) annotation(
    Line(points = {{51, 38}, {104, 38}, {104, -76}, {239, -76}}, color = {0, 0, 127}));
  connect(Inlt010.Fram_out, perf001.Fram_in) annotation(
    Line(points = {{-23, 8}, {-17, 8}, {-17, -68}, {239, -68}}, color = {0, 0, 127}));
  connect(Nzl070.Fg_out, perf001.Fg_in) annotation(
    Line(points = {{215, 10}, {227, 10}, {227, -64}, {239, -64}}, color = {0, 0, 127}));
  connect(pressure_Fl090.port, Nzl070.port_2) annotation(
    Line(points = {{220, 34}, {220, 18}}, color = {0, 127, 255}));
  connect(flightToEngine1.port_fluidAmb, pressure_Fl090.port) annotation(
    Line(points = {{-90, 20}, {-90, 34}, {220, 34}}, color = {0, 127, 255}));
  connect(pressure_Fl070.port, Nzl070.port_1) annotation(
    Line(points = {{190, 18}, {200, 18}}, color = {0, 127, 255}));
  connect(setIndependent1.independent_out, extractPwrTrbFree.u_pwrExtr) annotation(
    Line(points = {{210, -39}, {210, -39}, {210, -35}, {204, -35}, {204, -29}, {204, -29}}, color = {0, 0, 127}));
  connect(ShTrbFree.flange_b, extractPwrTrbFree.flange_a) annotation(
    Line(points = {{190, -20}, {200, -20}}));
  connect(constrain_N_TrbFree.flange_b, ShTrbFree.flange_a) annotation(
    Line(points = {{160, -20}, {170, -20}}));
  connect(Trb046.flange_2, constrain_N_TrbFree.flange_a) annotation(
    Line(points = {{130, 10}, {134, 10}, {134, -20}, {140, -20}}));
  connect(Trb041.port_2, Trb046.port_1) annotation(
    Line(points = {{100, 18}, {110, 18}}, color = {0, 127, 255}));
  connect(Trb046.port_2, pressure_Fl070.port) annotation(
    Line(points = {{130, 18}, {190, 18}}, color = {0, 127, 255}));
  connect(ramp_m_flow.y, constrain_dm1.dm_in) annotation(
    Line(points = {{-68, -30}, {-64, -30}, {-64, 6}, {-64, 6}}, color = {0, 0, 127}));
  connect(ramp_TIT.y, Brn036.TtOutlet_in) annotation(
    Line(points = {{51, 72}, {73, 72}, {73, 16}, {69, 16}, {69, 16}}, color = {0, 0, 127}));
  connect(flightToEngine1.V_tot_out, Inlt010.V_tot_in) annotation(
    Line(points = {{-79, 8}, {-73.4, 8}, {-73.4, -8}, {-43.4, -8}, {-43.4, 6}, {-37, 6}}, color = {0, 0, 127}));
  connect(flightToEngine1.port_fluid2Eng, constrain_dm1.port_1) annotation(
    Line(points = {{-80, 20}, {-68, 20}}, color = {0, 127, 255}));
  connect(combustFuel1.HeatPort_b, Brn036.HeatPort_1) annotation(
    Line(points = {{50, 42}, {58, 42}, {58, 22}}, color = {191, 0, 0}));
  connect(constrain_dm1.port_2, Inlt010.port_1) annotation(
    Line(points = {{-50, 18}, {-45, 18}, {-45, 16}, {-40, 16}}, color = {0, 127, 255}));
  connect(Inlt010.port_2, Cmp020.port_1) annotation(
    Line(points = {{-20, 20}, {-15, 20}, {-15, 22}, {-10, 22}}, color = {0, 127, 255}));
  connect(Cmp020.port_2, Duct030.port_1) annotation(
    Line(points = {{10, 20}, {15, 20}, {15, 18}, {20, 18}}, color = {0, 127, 255}));
  connect(Cmp020.flange_2, constrain_N_GasGen.flange_a) annotation(
    Line(points = {{10, 12}, {15, 12}, {15, -20}, {20, -20}}));
  connect(Duct030.port_2, Brn036.port_1) annotation(
    Line(points = {{40, 20}, {45, 20}, {45, 22}, {50, 22}}, color = {0, 127, 255}));
  connect(Brn036.port_2, Trb041.port_1) annotation(
    Line(points = {{70, 20}, {75, 20}, {75, 18}, {80, 18}}, color = {0, 127, 255}));
  connect(ShHP.flange_b, Trb041.flange_1) annotation(
    Line(points = {{70, -20}, {75, -20}, {75, 8}, {80, 8}}));
  connect(constrain_N_GasGen.flange_b, ShHP.flange_a) annotation(
    Line(points = {{40, -18}, {45, -18}, {45, -16}, {50, -16}}));
  annotation(
    uses(Modelica(version = "3.2.2")),
    Diagram(coordinateSystem(extent = {{-100, -80}, {300, 100}})),
    Icon(coordinateSystem(extent = {{-100, -140}, {200, 100}})),
    version = "",
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 30, Tolerance = 1e-06, Interval = 0.01),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "mat"));
end TurboShaft001_003;
