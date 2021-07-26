within PropulsionSystem.Examples.ThermodynamicCycles;

model OttoCycleNonideal00_ex01
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.DryAirNasa;
  package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  Modelica.Blocks.Sources.Constant const_VolDisp(k = 100 * 10.0 ^ (-6.0)) annotation(
    Placement(visible = true, transformation(origin = {30, 98}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_CR(k = 8) annotation(
    Placement(visible = true, transformation(origin = {30, 68}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_fluidState_1(duration = 10, height = 100 * 1000, offset = 101.325 * 1000, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {-30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T_fluidState_1(duration = 10, height = 20, offset = 15 + 273.15, startTime = 70) annotation(
    Placement(visible = true, transformation(origin = {-30, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_Xi_fluidState_1[engineAir.nXi](k = {0.0, 0.768, 0.232}) annotation(
    Placement(visible = true, transformation(origin = {-30, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_h_fluidState_1(duration = 10, height = 0 * 1.004 * 1000, offset = 288.15 * 1.004 * 1000, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {-30, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Subelements.OttoCycleNonideal00 OttoCycle(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {90, -30}, extent = {{-30, -30}, {30, 30}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_LHV_fuel(k = 43.4 * 10.0 ^ 6.0) annotation(
    Placement(visible = true, transformation(origin = {30, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Subelements.CombustionEfficiency00 calcEffComb annotation(
    Placement(visible = true, transformation(origin = {-10, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-70, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(visible = true, transformation(origin = {-40, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.TimeTable timeTable1(startTime = 0, table = [0, 0.2; 10, 0.2; 20, 0.01; 30, 0.01; 40, 1 / 17; 50, 1 / 17]) annotation(
    Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(OttoCycle.u_T_fluidState_1, ramp_T_fluidState_1.y) annotation(
    Line(points = {{54, -40}, {-8, -40}, {-8, -60}, {-18, -60}, {-18, -60}}, color = {0, 0, 127}));
  connect(timeTable1.y, OttoCycle.u_fracFuel) annotation(
    Line(points = {{-58, 10}, {-6, 10}, {-6, -18}, {56, -18}, {56, -18}}, color = {0, 0, 127}));
  connect(timeTable1.y, calcEffComb.u_fracFuel) annotation(
    Line(points = {{-58, 10}, {-30, 10}, {-30, 34}, {-20, 34}, {-20, 34}}, color = {0, 0, 127}));
  connect(timeTable1.y, feedback1.u2) annotation(
    Line(points = {{-58, 10}, {-40, 10}, {-40, 38}, {-40, 38}}, color = {0, 0, 127}));
  connect(calcEffComb.y_effComb, OttoCycle.u_effComb) annotation(
    Line(points = {{2, 46}, {16, 46}, {16, -6}, {56, -6}}, color = {0, 0, 127}));
  connect(feedback1.y, calcEffComb.u_fracAir) annotation(
    Line(points = {{-30, 46}, {-22, 46}, {-22, 46}, {-22, 46}}, color = {0, 0, 127}));
  connect(const.y, feedback1.u1) annotation(
    Line(points = {{-58, 46}, {-48, 46}, {-48, 46}, {-48, 46}}, color = {0, 0, 127}));
  connect(const_LHV_fuel.y, OttoCycle.par_LHV_fuel) annotation(
    Line(points = {{42, 130}, {90, 130}, {90, 4}, {90, 4}}, color = {0, 0, 127}));
  connect(const_CR.y, OttoCycle.par_CR) annotation(
    Line(points = {{41, 68}, {66, 68}, {66, 4}}, color = {0, 0, 127}));
  connect(const_VolDisp.y, OttoCycle.par_VolDisp) annotation(
    Line(points = {{41, 98}, {78, 98}, {78, 4}}, color = {0, 0, 127}));
  connect(OttoCycle.u_Xi_fluidState_1, const_Xi_fluidState_1.y) annotation(
    Line(points = {{54, -66}, {30, -66}, {30, -120}, {-18, -120}, {-18, -120}}, color = {0, 0, 127}, thickness = 0.5));
  connect(OttoCycle.u_h_fluidState_1, ramp_h_fluidState_1.y) annotation(
    Line(points = {{54, -48}, {6, -48}, {6, -90}, {-18, -90}, {-18, -90}}, color = {0, 0, 127}));
  connect(OttoCycle.u_p_fluidState_1, ramp_p_fluidState_1.y) annotation(
    Line(points = {{54, -30}, {-20, -30}, {-20, -30}, {-18, -30}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-100, -140}, {140, 140}})),
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 90, Tolerance = 1e-06, Interval = 0.180723),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "mat"));
end OttoCycleNonideal00_ex01;
