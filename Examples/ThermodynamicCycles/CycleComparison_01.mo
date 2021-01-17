within PropulsionSystem.Examples.ThermodynamicCycles;

model CycleComparison_01
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.DryAirNasa;
  package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  Modelica.Blocks.Sources.Constant const_VolDisp(k = 100 * 10.0 ^ (-6.0)) annotation(
    Placement(visible = true, transformation(origin = {-90, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_CR(k = 12) annotation(
    Placement(visible = true, transformation(origin = {-90, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_fluidState_1(duration = 10, height = 100 * 1000, offset = 101.325 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-80, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T_fluidState_1(duration = 10, height = 50, offset = 15 + 273.15, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-80, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_Xi_fluidState_1[engineAir.nXi](k = {0.0, 0.768, 0.232}) annotation(
    Placement(visible = true, transformation(origin = {-80, -180}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_h_fluidState_1(duration = 10, height = 50 * 1.004 * 1000, offset = 288.15 * 1.004 * 1000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-80, -150}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Subelements.DieselCycleIdeal00 DieselCycle(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {140, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Subelements.OttoCycleIdeal00 OttoCycle(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {20, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_LHV_fuel(k = 43.4 * 10.0 ^ 6.0) annotation(
    Placement(visible = true, transformation(origin = {-90, 110}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_fracFuel(duration = 10, height = -0.099, offset = 0.1, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {-80, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_fracFuel.y, DieselCycle.u_fracFuel) annotation(
    Line(points = {{-68, 10}, {106, 10}, {106, -6}, {118, -6}, {118, -6}}, color = {0, 0, 127}));
  connect(ramp_fracFuel.y, OttoCycle.u_fracFuel) annotation(
    Line(points = {{-68, 10}, {-30, 10}, {-30, -6}, {-2, -6}, {-2, -6}}, color = {0, 0, 127}));
  connect(const_LHV_fuel.y, DieselCycle.par_LHV_fuel) annotation(
    Line(points = {{-79, 110}, {140, 110}, {140, 2}}, color = {0, 0, 127}));
  connect(const_LHV_fuel.y, OttoCycle.par_LHV_fuel) annotation(
    Line(points = {{-79, 110}, {20, 110}, {20, 2}}, color = {0, 0, 127}));
  connect(const_CR.y, DieselCycle.par_CR) annotation(
    Line(points = {{-79, 50}, {124, 50}, {124, 2}}, color = {0, 0, 127}));
  connect(const_CR.y, OttoCycle.par_CR) annotation(
    Line(points = {{-79, 50}, {4, 50}, {4, 2}}, color = {0, 0, 127}));
  connect(const_VolDisp.y, DieselCycle.par_VolDisp) annotation(
    Line(points = {{-79, 80}, {132, 80}, {132, 2}}, color = {0, 0, 127}));
  connect(const_VolDisp.y, OttoCycle.par_VolDisp) annotation(
    Line(points = {{-79, 80}, {12, 80}, {12, 2}}, color = {0, 0, 127}));
  connect(ramp_p_fluidState_1.y, DieselCycle.u_p_fluidState_1) annotation(
    Line(points = {{-69, -90}, {90, -90}, {90, -16}, {116, -16}}, color = {0, 0, 127}));
  connect(ramp_p_fluidState_1.y, OttoCycle.u_p_fluidState_1) annotation(
    Line(points = {{-69, -90}, {-32, -90}, {-32, -16}, {-4, -16}}, color = {0, 0, 127}));
  connect(ramp_T_fluidState_1.y, DieselCycle.u_T_fluidState_1) annotation(
    Line(points = {{-69, -120}, {96, -120}, {96, -22}, {116, -22}}, color = {0, 0, 127}));
  connect(ramp_T_fluidState_1.y, OttoCycle.u_T_fluidState_1) annotation(
    Line(points = {{-69, -120}, {-26, -120}, {-26, -22}, {-4, -22}}, color = {0, 0, 127}));
  connect(const_Xi_fluidState_1.y, DieselCycle.u_Xi_fluidState_1) annotation(
    Line(points = {{-69, -180}, {110, -180}, {110, -40}, {116, -40}}, color = {0, 0, 127}, thickness = 0.5));
  connect(const_Xi_fluidState_1.y, OttoCycle.u_Xi_fluidState_1) annotation(
    Line(points = {{-69, -180}, {-12, -180}, {-12, -40}, {-4, -40}}, color = {0, 0, 127}, thickness = 0.5));
  connect(ramp_h_fluidState_1.y, DieselCycle.u_h_fluidState_1) annotation(
    Line(points = {{-69, -150}, {104, -150}, {104, -28}, {116, -28}}, color = {0, 0, 127}));
  connect(ramp_h_fluidState_1.y, OttoCycle.u_h_fluidState_1) annotation(
    Line(points = {{-69, -150}, {-18, -150}, {-18, -28}, {-4, -28}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-100, -200}, {180, 120}})),
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 70, Tolerance = 1e-06, Interval = 0.140562),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end CycleComparison_01;
