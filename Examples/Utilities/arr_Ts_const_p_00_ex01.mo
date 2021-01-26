within PropulsionSystem.Examples.Utilities;

model arr_Ts_const_p_00_ex01
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.DryAirNasa;
  package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  Modelica.Blocks.Sources.Constant const_sUpper(k = 9000) annotation(
    Placement(visible = true, transformation(origin = {-50, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_sLower(k = 6500) annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p(duration = 10, height = 10 * 101.325 * 1000, offset = 101.325 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-50, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_Xi_fluidState_1[engineAir.nXi](k = {0.0, 0.768, 0.232}) annotation(
    Placement(visible = true, transformation(origin = {-50, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.arr_Ts_const_p_00 arr_Ts(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {20, 3.55271e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(const_Xi_fluidState_1.y, arr_Ts.u_Xi) annotation(
    Line(points = {{-38, -60}, {-14, -60}, {-14, -16}, {-2, -16}, {-2, -16}}, color = {0, 0, 127}, thickness = 0.5));
  connect(ramp_p.y, arr_Ts.u_p) annotation(
    Line(points = {{-38, -20}, {-24, -20}, {-24, -8}, {-2, -8}, {-2, -8}}, color = {0, 0, 127}));
  connect(const_sLower.y, arr_Ts.u_sLower) annotation(
    Line(points = {{-38, 10}, {-30, 10}, {-30, 8}, {-2, 8}, {-2, 8}}, color = {0, 0, 127}));
  connect(const_sUpper.y, arr_Ts.u_sUpper) annotation(
    Line(points = {{-38, 40}, {-18, 40}, {-18, 16}, {-2, 16}, {-2, 16}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-100, -140}, {100, 100}})),
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 70, Tolerance = 1e-06, Interval = 0.140281),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end arr_Ts_const_p_00_ex01;
