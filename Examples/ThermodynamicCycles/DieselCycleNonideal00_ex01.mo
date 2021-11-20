within PropulsionSystem.Examples.ThermodynamicCycles;

model DieselCycleNonideal00_ex01
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.DryAirNasa;
  //package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
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
  Modelica.Blocks.Sources.Constant const_Xi_fluidState_1[PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00.nXi](k = {0.0, 0.768, 0.232}) annotation(
    Placement(visible = true, transformation(origin = {-30, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_h_fluidState_1(duration = 10, height = 0 * 1.004 * 1000, offset = 288.15 * 1.004 * 1000, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {-30, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_LHV_fuel(k = 42.6 * 10.0 ^ 6.0) annotation(
    Placement(visible = true, transformation(origin = {30, 130}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Subelements.CombustionEfficiency00 calcEffComb(switchFuel = PropulsionSystem.Types.switches.switch_fuel.diesel)  annotation(
    Placement(visible = true, transformation(origin = {-10, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-70, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(visible = true, transformation(origin = {-40, 46}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.TimeTable timeTable1(startTime = 0, table = [0, 1 / 20; 10, 1 / 20; 20, 0.01; 30, 0.01; 40, 1 / 17; 50, 1 / 17]) annotation(
    Placement(visible = true, transformation(origin = {-70, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Subelements.DieselCycleNonideal00 DieselCycle(redeclare package Medium = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00) annotation(
    Placement(visible = true, transformation(origin = {100, -60}, extent = {{-40, -40}, {40, 40}}, rotation = 0)));
equation
  connect(const_Xi_fluidState_1.y, DieselCycle.u_Xi_fluidState_1) annotation(
    Line(points = {{-18, -120}, {34, -120}, {34, -100}, {52, -100}, {52, -100}}, color = {0, 0, 127}, thickness = 0.5));
  connect(ramp_T_fluidState_1.y, DieselCycle.u_T_fluidState_1) annotation(
    Line(points = {{-18, -60}, {6, -60}, {6, -64}, {52, -64}, {52, -64}}, color = {0, 0, 127}));
  connect(ramp_p_fluidState_1.y, DieselCycle.u_p_fluidState_1) annotation(
    Line(points = {{-18, -30}, {8, -30}, {8, -52}, {52, -52}, {52, -52}}, color = {0, 0, 127}));
  connect(const_CR.y, DieselCycle.par_CR) annotation(
    Line(points = {{42, 68}, {68, 68}, {68, -16}, {68, -16}}, color = {0, 0, 127}));
  connect(const_VolDisp.y, DieselCycle.par_VolDisp) annotation(
    Line(points = {{42, 98}, {84, 98}, {84, -16}, {84, -16}}, color = {0, 0, 127}));
  connect(const_LHV_fuel.y, DieselCycle.par_LHV_fuel) annotation(
    Line(points = {{42, 130}, {100, 130}, {100, -16}, {100, -16}}, color = {0, 0, 127}));
  connect(timeTable1.y, DieselCycle.u_fracFuel) annotation(
    Line(points = {{-58, 10}, {14, 10}, {14, -36}, {54, -36}, {54, -36}}, color = {0, 0, 127}));
  connect(calcEffComb.y_effComb, DieselCycle.u_effComb) annotation(
    Line(points = {{2, 46}, {26, 46}, {26, -24}, {54, -24}, {54, -24}}, color = {0, 0, 127}));
  connect(timeTable1.y, calcEffComb.u_fracFuel) annotation(
    Line(points = {{-58, 10}, {-30, 10}, {-30, 34}, {-20, 34}, {-20, 34}}, color = {0, 0, 127}));
  connect(timeTable1.y, feedback1.u2) annotation(
    Line(points = {{-58, 10}, {-40, 10}, {-40, 38}, {-40, 38}}, color = {0, 0, 127}));
  connect(feedback1.y, calcEffComb.u_fracAir) annotation(
    Line(points = {{-30, 46}, {-22, 46}, {-22, 46}, {-22, 46}}, color = {0, 0, 127}));
  connect(const.y, feedback1.u1) annotation(
    Line(points = {{-58, 46}, {-48, 46}, {-48, 46}, {-48, 46}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-100, -140}, {140, 140}})),
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 90, Tolerance = 1e-06, Interval = 0.05),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "mat"));
end DieselCycleNonideal00_ex01;
