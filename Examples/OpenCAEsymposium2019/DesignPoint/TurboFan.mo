within PropulsionSystem.Examples.OpenCAEsymposium2019.DesignPoint;

model Turbofan
  extends Modelica.Icons.Example;
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //-----
  PropulsionSystem.Elements.BasicElements.FlightToEngine flightToEngine1(redeclare package Medium = engineAir, MN = 0.8, alt = 10000) annotation(
    Placement(visible = true, transformation(origin = {-90, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Inlet inlt010(redeclare package Medium = engineAir, effRamDes = 0.98) annotation(
    Placement(visible = true, transformation(origin = {-60, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.constrain_dm constrain_dm1(redeclare package Medium = engineAir, dmDes = 100, switchInput_dm = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) annotation(
    Placement(visible = true, transformation(origin = {-20, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.constrain_dm constrain_dm2(redeclare package Medium = engineAir, dmDes = 10, switchInput_dm = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) annotation(
    Placement(visible = true, transformation(origin = {-20, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.HeatInjector Brn036(redeclare package Medium = engineAir, TtOutletDes(displayUnit = "K") = 1600, switchInput_TtOutlet = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) annotation(
    Placement(visible = true, transformation(origin = {190, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CombustFuel MainComb annotation(
    Placement(visible = true, transformation(origin = {170, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.constrain_Nmech Constrain_NH(NmechDes = 9000) annotation(
    Placement(visible = true, transformation(origin = {160, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia ShH(J = 200) annotation(
    Placement(visible = true, transformation(origin = {190, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NozzleConv Noz170(redeclare package Medium = engineAir, CdThDes = 0.98, CvDes = 0.995) annotation(
    Placement(visible = true, transformation(origin = {300, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NozzleConv Noz070(redeclare package Medium = engineAir, CdThDes = 0.98, CvDes = 0.995) annotation(
    Placement(visible = true, transformation(origin = {340, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Mechanics.Rotational.Components.Inertia ShL(J = 1000) annotation(
    Placement(visible = true, transformation(origin = {140, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.constrain_Nmech constrain_NL(NmechDes = 3000) annotation(
    Placement(visible = true, transformation(origin = {110, -110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.EnginePerformance Perf001 annotation(
    Placement(visible = true, transformation(origin = {400, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add calc_engineFg annotation(
    Placement(visible = true, transformation(origin = {370, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Compressor Cmp120(redeclare package Medium = engineAir, PRdes = 1.4) annotation(
    Placement(visible = true, transformation(origin = {40, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Compressor Cmp020(redeclare package Medium = engineAir, NmechDes = 3000, PRdes = 2) annotation(
    Placement(visible = true, transformation(origin = {70, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Compressor Cmp025(redeclare package Medium = engineAir, NmechDes = 9000, PRdes = 20) annotation(
    Placement(visible = true, transformation(origin = {130, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Turbine Trb041(redeclare package Medium = engineAir, NmechDes = 9000) annotation(
    Placement(visible = true, transformation(origin = {220, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.Turbine Trb049(redeclare package Medium = engineAir, NmechDes = 3000) annotation(
    Placement(visible = true, transformation(origin = {280, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-70, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-90, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate_Cmp120(redeclare package Medium=engineAir) annotation(
    Placement(visible = true, transformation(origin = {10, -10}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Fluid.Sensors.MassFlowRate massFlowRate_Cmp020(redeclare package Medium=engineAir) annotation(
    Placement(visible = true, transformation(origin = {30, -50}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  Modelica.Blocks.Math.Division calc_BPR annotation(
    Placement(visible = true, transformation(origin = {30, -130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.SplitFlow_by_BPR splitFlow_by_BPR1(switchInput_BPR = PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal)  annotation(
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_BPR(duration = 5, height = 0, offset = 10, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {-80, 60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_dmTotal(duration = 5, height = 0, offset = 110, startTime = 5) annotation(
    Placement(visible = true, transformation(origin = {-80, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 10, height = 100, offset = 1600, startTime = 40) annotation(
    Placement(visible = true, transformation(origin = {180, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp1.y, Brn036.TtOutlet_in) annotation(
    Line(points = {{191, 10}, {202, 10}, {202, -56}, {200, -56}}, color = {0, 0, 127}));
  connect(Trb049.port_2, Noz070.port_1) annotation(
    Line(points = {{290, -52}, {330, -52}, {330, -52}, {330, -52}}, color = {0, 127, 255}));
  connect(Trb041.port_2, Trb049.port_1) annotation(
    Line(points = {{230, -52}, {270, -52}, {270, -52}, {270, -52}}, color = {0, 127, 255}));
  connect(Cmp025.port_2, Brn036.port_1) annotation(
    Line(points = {{140, -52}, {180, -52}, {180, -52}, {180, -52}}, color = {0, 127, 255}));
  connect(Cmp020.port_2, Cmp025.port_1) annotation(
    Line(points = {{80, -52}, {120, -52}, {120, -52}, {120, -52}}, color = {0, 127, 255}));
  connect(Cmp120.port_2, Noz170.port_1) annotation(
    Line(points = {{50, -12}, {290, -12}, {290, -12}, {290, -12}}, color = {0, 127, 255}));
  connect(ramp_dmTotal.y, splitFlow_by_BPR1.flow_total) annotation(
    Line(points = {{-68, 30}, {-62, 30}, {-62, 30}, {-60, 30}}, color = {0, 0, 127}));
  connect(ramp_BPR.y, splitFlow_by_BPR1.BPR_in) annotation(
    Line(points = {{-68, 60}, {-58, 60}, {-58, 42}, {-58, 42}}, color = {0, 0, 127}));
  connect(splitFlow_by_BPR1.flow_primary, constrain_dm2.dm_in) annotation(
    Line(points = {{-39, 26}, {-36, 26}, {-36, -70}, {-24, -70}, {-24, -65}}, color = {0, 0, 127}));
  connect(splitFlow_by_BPR1.flow_secondary, constrain_dm1.dm_in) annotation(
    Line(points = {{-39, 34}, {-34, 34}, {-34, -34.5}, {-24, -34.5}, {-24, -25}}, color = {0, 0, 127}));
  connect(inlt010.Fram_out, Perf001.Fram_in) annotation(
    Line(points = {{-53, -64}, {-44, -64}, {-44, -148}, {389, -148}}, color = {0, 0, 127}));
  connect(calc_engineFg.y, Perf001.Fg_in) annotation(
    Line(points = {{381, -130}, {386, -130}, {386, -144}, {389, -144}}, color = {0, 0, 127}));
  connect(MainComb.dm_fuel_out, Perf001.dm_fuel_in) annotation(
    Line(points = {{181, -34}, {326, -34}, {326, -156}, {389, -156}}, color = {0, 0, 127}));
  connect(Noz170.Fg_out, calc_engineFg.u1) annotation(
    Line(points = {{305, -20}, {328.5, -20}, {328.5, -20}, {354, -20}, {354, -124}, {358, -124}}, color = {0, 0, 127}));
  connect(Noz070.Fg_out, calc_engineFg.u2) annotation(
    Line(points = {{345, -60}, {350, -60}, {350, -136}, {358, -136}}, color = {0, 0, 127}));
  connect(flightToEngine1.port_fluidAmb, Noz070.port_2) annotation(
    Line(points = {{-90, -50}, {-90, -42}, {350, -42}, {350, -52}}, color = {0, 127, 255}));
  connect(MainComb.HeatPort_b, Brn036.HeatPort_1) annotation(
    Line(points = {{180, -30}, {190, -30}, {190, -52}}, color = {191, 0, 0}));
  connect(Brn036.port_2, Trb041.port_1) annotation(
    Line(points = {{200, -54}, {205, -54}, {205, -56}, {210, -56}}, color = {0, 127, 255}));
  connect(Constrain_NH.flange_b, ShH.flange_a) annotation(
    Line(points = {{170, -90}, {180, -90}}));
  connect(ShH.flange_b, Trb041.flange_1) annotation(
    Line(points = {{200, -92}, {206, -92}, {206, -62}, {210, -62}}));
  connect(flightToEngine1.port_fluidAmb, Noz170.port_2) annotation(
    Line(points = {{-90, -50}, {-90, -4}, {310, -4}, {310, -12}}, color = {0, 127, 255}));
  connect(ShL.flange_b, Trb049.flange_1) annotation(
    Line(points = {{150, -110}, {264, -110}, {264, -60}, {270, -60}}));
  connect(Cmp025.flange_2, Constrain_NH.flange_a) annotation(
    Line(points = {{140, -60}, {144, -60}, {144, -90}, {150, -90}, {150, -90}}));
  connect(constrain_NL.flange_b, ShL.flange_a) annotation(
    Line(points = {{120, -110}, {130, -110}}));
  connect(Cmp020.flange_2, constrain_NL.flange_a) annotation(
    Line(points = {{80, -60}, {88, -60}, {88, -110}, {102, -110}}));
  connect(massFlowRate_Cmp020.port_b, Cmp020.port_1) annotation(
    Line(points = {{40, -50}, {48, -50}, {48, -52}, {60, -52}, {60, -52}}, color = {0, 127, 255}));
  connect(Cmp120.flange_2, Cmp020.flange_1) annotation(
    Line(points = {{50, -20}, {56, -20}, {56, -60}, {58, -60}}));
  connect(flightToEngine1.port_fluid2Eng, inlt010.port_1) annotation(
    Line(points = {{-80, -54}, {-70, -54}}, color = {0, 127, 255}));
  connect(flightToEngine1.V_tot_out, inlt010.V_tot_in) annotation(
    Line(points = {{-79, -66}, {-67, -66}}, color = {0, 0, 127}));
  connect(inlt010.port_2, constrain_dm1.port_1) annotation(
    Line(points = {{-50, -54}, {-46, -54}, {-46, -14}, {-30, -14}}, color = {0, 127, 255}));
  connect(inlt010.port_2, constrain_dm2.port_1) annotation(
    Line(points = {{-50, -54}, {-30, -54}}, color = {0, 127, 255}));
  connect(constrain_dm1.port_2, massFlowRate_Cmp120.port_a) annotation(
    Line(points = {{-10, -14}, {-5, -14}, {-5, -12}, {0, -12}}, color = {0, 127, 255}));
  connect(constrain_dm2.port_2, massFlowRate_Cmp020.port_a) annotation(
    Line(points = {{-10, -54}, {8, -54}, {8, -52}, {20, -52}}, color = {0, 127, 255}));
  connect(massFlowRate_Cmp120.port_b, Cmp120.port_1) annotation(
    Line(points = {{20, -10}, {24, -10}, {24, -12}, {30, -12}}, color = {0, 127, 255}));
  connect(massFlowRate_Cmp120.m_flow, calc_BPR.u1) annotation(
    Line(points = {{10, -23}, {10, -126}, {18, -126}}, color = {0, 0, 127}));
  connect(massFlowRate_Cmp020.m_flow, calc_BPR.u2) annotation(
    Line(points = {{30, -63}, {30, -83}, {4, -83}, {4, -136}, {18, -136}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-100, -200}, {420, 100}})),
    Icon(coordinateSystem(extent = {{-100, -200}, {420, 100}})),
    version = "",
    uses(Modelica(version = "3.2.2")),
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 100, Tolerance = 1e-06, Interval = 0.00166667),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "mat"));

end Turbofan;
