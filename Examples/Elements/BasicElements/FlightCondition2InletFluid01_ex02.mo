within PropulsionSystem.Examples.Elements.BasicElements;

model FlightCondition2InletFluid01_ex02
  extends Modelica.Icons.Example;
  //-----
  //package engineAir = Modelica.Media.Air.MoistAir;
  package engineAir = PropulsionSystem.Media.EngineBreathingAir.DryAirMethaneMixture00;
  //redeclare package Medium = engineAir
  //-----
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.FlightCondition2InletFluid01 Flt2Fluid(redeclare package Medium = engineAir, use_u_C = false, use_u_MN = true, use_u_X = true, use_u_alt = true, use_u_dTamb = true) annotation(
    Placement(visible = true, transformation(origin = {-20, -30}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_alt(duration = 10, height = 2000, offset = 0, startTime = 30) annotation(
    Placement(visible = true, transformation(origin = {-80, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_MN(duration = 10, height = 0.1, offset = 0.5, startTime = 10) annotation(
    Placement(visible = true, transformation(origin = {-80, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Ramp ramp_dTamb(duration = 10, height = 0, offset = 0, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {-80, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const[engineAir.nXi](k = {0.0, 0.768, 0.232}) annotation(
    Placement(visible = true, transformation(origin = {-80, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Pipes.StaticPipe pipe(redeclare package Medium = engineAir,diameter = 0.1, length = 2)  annotation(
    Placement(visible = true, transformation(origin = {70, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-50, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.HeatInjector00 HeatInjector(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {100, -34}, extent = {{-10, 10}, {10, -10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlCharFixed00 Nzl(redeclare package Medium = engineAir, AmechTh_paramInput = Modelica.Constants.pi / 4 * 0.1 ^ 2, switchDetermine_AmechTh = PropulsionSystem.Types.switches.switchHowToDetVar.param) annotation(
    Placement(visible = true, transformation(origin = {130, -42}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1 annotation(
    Placement(visible = true, transformation(origin = {100, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp_Qflow(duration = 10, height = 0, offset = 10 * 1000, startTime = 50) annotation(
    Placement(visible = true, transformation(origin = {100, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort specificEntropy_inlet(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {40, -34}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sensors.SpecificEntropyTwoPort specificEntropy_amb4sink(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {20, 10}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
equation
  connect(specificEntropy_amb4sink.port_a, Nzl.port_2) annotation(
    Line(points = {{30, 10}, {140, 10}, {140, -34}}, color = {0, 127, 255}));
  connect(specificEntropy_amb4sink.port_b, Flt2Fluid.port_amb4sink) annotation(
    Line(points = {{10, 10}, {-20, 10}, {-20, -10}}, color = {0, 127, 255}));
  connect(pipe.port_b, HeatInjector.port_1) annotation(
    Line(points = {{80, -34}, {90, -34}, {90, -34}, {90, -34}}, color = {0, 127, 255}));
  connect(specificEntropy_inlet.port_b, pipe.port_a) annotation(
    Line(points = {{50, -34}, {60, -34}, {60, -34}, {60, -34}}, color = {0, 127, 255}));
  connect(prescribedHeatFlow1.port, HeatInjector.HeatPort_1) annotation(
    Line(points = {{100, -50}, {100, -50}, {100, -44}, {100, -44}}, color = {191, 0, 0}));
  connect(HeatInjector.port_2, Nzl.port_1) annotation(
    Line(points = {{110, -34}, {120, -34}, {120, -34}, {120, -34}}, color = {0, 127, 255}));
  connect(Flt2Fluid.port_inlet, specificEntropy_inlet.port_a) annotation(
    Line(points = {{0, -34}, {30, -34}}, color = {0, 127, 255}));
  connect(ramp_Qflow.y, prescribedHeatFlow1.Q_flow) annotation(
    Line(points = {{100, -79}, {100, -79}, {100, -71}, {100, -71}}, color = {0, 0, 127}));
  connect(const.y, Flt2Fluid.u_X_fluid) annotation(
    Line(points = {{-68, -80}, {-54, -80}, {-54, -38}, {-42, -38}}, color = {0, 0, 127}));
  connect(ramp_MN.y, Flt2Fluid.u_MN) annotation(
    Line(points = {{-68, 20}, {-56, 20}, {-56, -22}, {-42, -22}}, color = {0, 0, 127}));
  connect(ramp_alt.y, Flt2Fluid.u_alt) annotation(
    Line(points = {{-68, 50}, {-52, 50}, {-52, -14}, {-42, -14}}, color = {0, 0, 127}));
  connect(ramp_dTamb.y, Flt2Fluid.u_dTamb) annotation(
    Line(points = {{-68, -10}, {-63, -10}, {-63, -30}, {-42, -30}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-100, -140}, {160, 100}})),
  __OpenModelica_commandLineOptions = "");
end FlightCondition2InletFluid01_ex02;
