within PropulsionSystem.Examples.Utilities;

model arr_pv_const_s_00_ex01
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.DryAirNasa;
  package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  Modelica.Blocks.Sources.Constant const_pUpper(k =  10 *101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-50, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_pLower(k = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = { -50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_s(duration = 10, height = 2000, offset = 7000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-50, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_Xi_fluidState_1[engineAir.nXi](k = {0.0, 0.768, 0.232}) annotation(
    Placement(visible = true, transformation(origin = {-50, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Utilities.arr_pv_const_s_00 arr_pv(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {20, 3.55271e-15}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(const_pUpper.y, arr_pv.u_pUpper) annotation(
    Line(points = {{-38, 40}, {-16, 40}, {-16, 16}, {-2, 16}, {-2, 16}}, color = {0, 0, 127}));
  connect(const_pLower.y, arr_pv.u_pLower) annotation(
    Line(points = {{-38, 10}, {-30, 10}, {-30, 8}, {-2, 8}, {-2, 8}}, color = {0, 0, 127}));
  connect(ramp_s.y, arr_pv.u_s) annotation(
    Line(points = {{-38, -20}, {-24, -20}, {-24, -8}, {-2, -8}, {-2, -8}}, color = {0, 0, 127}));
  connect(const_Xi_fluidState_1.y, arr_pv.u_Xi) annotation(
    Line(points = {{-38, -60}, {-14, -60}, {-14, -16}, {-2, -16}, {-2, -16}}, color = {0, 0, 127}, thickness = 0.5));
  annotation(
    Diagram(coordinateSystem(extent = {{-100, -140}, {100, 100}})),
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 70, Tolerance = 1e-06, Interval = 0.140281),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl"));
end arr_pv_const_s_00_ex01;
