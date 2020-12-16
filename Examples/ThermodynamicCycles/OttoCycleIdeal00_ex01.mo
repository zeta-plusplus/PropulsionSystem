within PropulsionSystem.Examples.ThermodynamicCycles;

model OttoCycleIdeal00_ex01
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.DryAirNasa;
  package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  Modelica.Blocks.Sources.Constant const_LHV_fuel(k = 43.4 * 10.0 ^ 6.0) annotation(
    Placement(visible = true, transformation(origin = {-70, 80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_VolDisp(k = 100 * 10.0 ^ (-6.0))  annotation(
    Placement(visible = true, transformation(origin = {-70, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_CR(k = 8)  annotation(
    Placement(visible = true, transformation(origin = {-70, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_p_fluidState_1(duration = 10, height = 100 * 1000, offset = 101.325 * 1000, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {-30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_T_fluidState_1(duration = 10, height = 50, offset = 15 + 273.15, startTime = 30)  annotation(
    Placement(visible = true, transformation(origin = {-30, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_Xi_fluidState_1[engineAir.nXi](k = {0.0, 0.768, 0.232}) annotation(
    Placement(visible = true, transformation(origin = {-30, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_fracFuel(duration = 10, height = 0, offset = 0.01, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {-80, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Subelements.OttoCycleIdeal00 OttoCycle(redeclare package Medium = engineAir, switch_u_thermoState = PropulsionSystem.Types.switches.switch_input_ThermodynamicState.use_T_for_ThermodynamicState) annotation(
    Placement(visible = true, transformation(origin = {40, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(const_Xi_fluidState_1.y, OttoCycle.u_Xi_fluidState_1) annotation(
    Line(points = {{-18, -90}, {-4, -90}, {-4, -34}, {18, -34}, {18, -34}}, color = {0, 0, 127}, thickness = 0.5));
  connect(ramp_T_fluidState_1.y, OttoCycle.u_T_fluidState_1) annotation(
    Line(points = {{-18, -60}, {-8, -60}, {-8, -28}, {18, -28}, {18, -28}}, color = {0, 0, 127}));
  connect(ramp_p_fluidState_1.y, OttoCycle.u_p_fluidState_1) annotation(
    Line(points = {{-18, -30}, {-12, -30}, {-12, -22}, {18, -22}, {18, -22}}, color = {0, 0, 127}));
  connect(const_LHV_fuel.y, OttoCycle.par_LHV_fuel) annotation(
    Line(points = {{-58, 80}, {40, 80}, {40, 2}, {40, 2}}, color = {0, 0, 127}));
  connect(const_VolDisp.y, OttoCycle.par_VolDisp) annotation(
    Line(points = {{-58, 50}, {32, 50}, {32, 2}, {32, 2}}, color = {0, 0, 127}));
  connect(const_CR.y, OttoCycle.par_CR) annotation(
    Line(points = {{-58, 20}, {24, 20}, {24, 2}, {24, 2}}, color = {0, 0, 127}));
  connect(ramp_fracFuel.y, OttoCycle.u_fracFuel) annotation(
    Line(points = {{-68, -10}, {16, -10}, {16, -10}, {18, -10}}, color = {0, 0, 127}));
  annotation(
    Diagram,
    __OpenModelica_commandLineOptions = "",
  experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-6, Interval = 0.1),
  __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
    
end OttoCycleIdeal00_ex01;
