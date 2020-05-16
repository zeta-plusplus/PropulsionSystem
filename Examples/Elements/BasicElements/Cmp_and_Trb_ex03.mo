within PropulsionSystem.Examples.Elements.BasicElements;

model Cmp_and_Trb_ex03
  extends Modelica.Icons.Example;
  //-----
  package engineAir = Modelica.Media.Air.DryAirNasa;
  //redeclare package Medium = engineAir
  //-----
  inner PropulsionSystem.EngineSimEnvironment environment annotation(
    Placement(visible = true, transformation(origin = {-10, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  inner Modelica.Fluid.System system annotation(
    Placement(visible = true, transformation(origin = {-30, 90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary(redeclare package Medium = engineAir, T = 288.15, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {-150, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.NmechAtInit NmechAtInit(Nmech_init_paramInput = 3000)  annotation(
    Placement(visible = true, transformation(origin = {-10, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.MassFlowAtInit MassFlowAtInit(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-120, -24}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharTable01 Cmp(redeclare package Medium = engineAir, use_tableFile_PR = true, use_tableFile_Wc = true, use_tableFile_eff = true) annotation(
    Placement(visible = true, transformation(origin = {-80, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable01 Trb(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {120, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.NzlDefAbyInitCharFixed01 Nzl(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {180, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary3(redeclare package Medium = engineAir, T = 288.15, nPorts = 1, p = 101.325 * 1000)  annotation(
    Placement(visible = true, transformation(origin = {200, 10}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Elements.BasicElements.HeatInjector00 HeatInjector(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {0, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sensors.Temperature temperature(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {30, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1 annotation(
    Placement(visible = true, transformation(origin = {-20, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {-50, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  FluidSystemComponents.Utilities.ConstrainVariable Constraint annotation(
    Placement(visible = true, transformation(origin = {50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Sources.Ramp ramp1(duration = 10, height = 0, offset = 1000, startTime = 10)  annotation(
    Placement(visible = true, transformation(origin = {50, 60}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
equation
  connect(ramp1.y, Constraint.u_targetValue) annotation(
    Line(points = {{50, 48}, {50, 48}, {50, 42}, {50, 42}}, color = {0, 0, 127}));
  connect(VarBySolver.y_independent, prescribedHeatFlow1.Q_flow) annotation(
    Line(points = {{-38, 40}, {-32, 40}, {-32, 40}, {-30, 40}}, color = {0, 0, 127}));
  connect(Constraint.u_variable, temperature.T) annotation(
    Line(points = {{50, 19}, {50, 10}, {38, 10}}, color = {0, 0, 127}));
  connect(temperature.port, Trb.port_1) annotation(
    Line(points = {{30, 0}, {100, 0}, {100, -24}}, color = {0, 127, 255}));
  connect(HeatInjector.port_2, temperature.port) annotation(
    Line(points = {{20, 0}, {30, 0}}, color = {0, 127, 255}));
  connect(prescribedHeatFlow1.port, HeatInjector.HeatPort_1) annotation(
    Line(points = {{-10, 40}, {0, 40}, {0, 20}, {0, 20}}, color = {191, 0, 0}));
  connect(Cmp.port_2, HeatInjector.port_1) annotation(
    Line(points = {{-60, -24}, {-60, -24}, {-60, 0}, {-20, 0}, {-20, 0}}, color = {0, 127, 255}));
  connect(boundary3.ports[1], Nzl.port_2) annotation(
    Line(points = {{200, 0}, {200, -24}}, color = {0, 127, 255}));
  connect(Trb.port_2, Nzl.port_1) annotation(
    Line(points = {{140, -24}, {160, -24}, {160, -24}, {160, -24}}, color = {0, 127, 255}));
  connect(boundary.ports[1], MassFlowAtInit.port_1) annotation(
    Line(points = {{-140, -24}, {-130, -24}, {-130, -24}, {-130, -24}}, color = {0, 127, 255}));
  connect(MassFlowAtInit.port_2, Cmp.port_1) annotation(
    Line(points = {{-110, -24}, {-100, -24}, {-100, -24}, {-100, -24}}, color = {0, 127, 255}));
  connect(Cmp.flange_2, NmechAtInit.flange_1) annotation(
    Line(points = {{-60, -40}, {-20, -40}, {-20, -40}, {-20, -40}}));
  connect(NmechAtInit.flange_2, Trb.flange_1) annotation(
    Line(points = {{0, -40}, {100, -40}}));
  annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-06, Interval = 0.08),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Documentation(info = "<html>
  <a href=modelica://> Document html page</a>

</html>"),
    Diagram(graphics = {Text(origin = {-68, -73}, fillPattern = FillPattern.Solid, extent = {{-22, 7}, {12, 1}}, textString = "PR, eff are given"), Text(origin = {104, -71}, fillPattern = FillPattern.Solid, extent = {{-26, 5}, {12, -3}}, textString = "PR is calculated")}, coordinateSystem(extent = {{-180, -160}, {220, 100}}, initialScale = 0.1)),
    __OpenModelica_commandLineOptions = "");
end Cmp_and_Trb_ex03;
