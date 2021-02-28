within PropulsionSystem.Examples.ThermodynamicCycles;

model OttoCycleIdeal01_ex02
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.DryAirNasa;
  package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  package engineFluid = Modelica.Media.Water.StandardWaterOnePhase;
  //redeclare package Medium = engineAir
  //-----
  Modelica.Blocks.Sources.Constant const_Qin(k = 100 *1000) annotation(
    Placement(visible = true, transformation(origin = {-80, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_VolDisp(k = 1 * 10.0 ^ (-6.0)) annotation(
    Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_CR(k = 1.002) annotation(
    Placement(visible = true, transformation(origin = {-70, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_fluidState_1(duration = 10, height = 0 * 1000, offset = 101.325 * 1000, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T_fluidState_1(duration = 10, height = 0, offset = 15 + 273.15, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-30, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_Xi_fluidState_1[engineFluid.nXi]() annotation(
    Placement(visible = true, transformation(origin = {-30, -120}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Subelements.OttoCycleIdeal01 OttoCycle(redeclare package Medium = engineFluid, switch_u_thermoState = PropulsionSystem.Types.switches.switch_input_ThermodynamicState.use_T_for_ThermodynamicState) annotation(
    Placement(visible = true, transformation(origin = {40, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_h_fluidState_1(duration = 10, height = 0 * 1.004 * 1000, offset = 288.15 * 1.004 * 1000, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-30, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(ramp_h_fluidState_1.y, OttoCycle.u_h_fluidState_1) annotation(
    Line(points = {{-18, -90}, {2, -90}, {2, -32}, {16, -32}}, color = {0, 0, 127}));
  connect(const_Xi_fluidState_1.y, OttoCycle.u_Xi_fluidState_1) annotation(
    Line(points = {{-19, -120}, {10, -120}, {10, -44}, {16, -44}}, color = {0, 0, 127}, thickness = 0.5));
  connect(const_CR.y, OttoCycle.par_CR) annotation(
    Line(points = {{-58, 20}, {24, 20}, {24, 2}}, color = {0, 0, 127}));
  connect(const_VolDisp.y, OttoCycle.par_VolDisp) annotation(
    Line(points = {{-58, 50}, {32, 50}, {32, 2}}, color = {0, 0, 127}));
  connect(ramp_p_fluidState_1.y, OttoCycle.u_p_fluidState_1) annotation(
    Line(points = {{-18, -30}, {-12, -30}, {-12, -20}, {16, -20}}, color = {0, 0, 127}));
  connect(ramp_T_fluidState_1.y, OttoCycle.u_T_fluidState_1) annotation(
    Line(points = {{-18, -60}, {-8, -60}, {-8, -26}, {16, -26}}, color = {0, 0, 127}));
  connect(const_Qin.y, OttoCycle.u_Qin) annotation(
    Line(points = {{-68, -10}, {-50, -10}, {-50, -4}, {17, -4}}, color = {0, 0, 127}));
  annotation(
    Diagram(coordinateSystem(extent = {{-100, -140}, {100, 100}})),
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 70, Tolerance = 1e-06, Interval = 0.140562),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", s = "dassl", outputFormat = "mat"));
end OttoCycleIdeal01_ex02;
