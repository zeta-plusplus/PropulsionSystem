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
    Placement(visible = true, transformation(origin = {-150, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Fluid.Sources.MassFlowSource_T boundary1(redeclare package Medium = engineAir, T = 288.15, m_flow = -10, nPorts = 1, use_m_flow_in = true) annotation(
    Placement(visible = true, transformation(origin = {-30, 50}, extent = {{-10, 10}, {10, -10}}, rotation = 180)));
  Modelica.Fluid.Sources.Boundary_pT boundary2(redeclare package Medium = engineAir, T = 1600, nPorts = 1, p = 5 * 101.3 * 1000) annotation(
    Placement(visible = true, transformation(origin = {50, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.NmechAtInit NmechAtInit(Nmech_init_paramInput = 3000)  annotation(
    Placement(visible = true, transformation(origin = {-10, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.MassFlowAtInit MassFlowAtInit(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-120, 36}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.CmpCharTable01 Cmp(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {-80, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  FluidSystemComponents.Utilities.VariableBySolver VarBySolver annotation(
    Placement(visible = true, transformation(origin = {10, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PropulsionSystem.Elements.BasicElements.TrbCharTable01 Trb(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {120, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Fluid.Sources.Boundary_pT boundary3(redeclare package Medium = engineAir, nPorts = 1, p = 101.325 * 1000) annotation(
    Placement(visible = true, transformation(origin = {170, 50}, extent = {{10, -10}, {-10, 10}}, rotation = 0)));
  PropulsionSystem.Sources.MassFlowAtInit MassFlowAtInit1(redeclare package Medium = engineAir) annotation(
    Placement(visible = true, transformation(origin = {80, 50}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(MassFlowAtInit1.port_2, Trb.port_1) annotation(
    Line(points = {{90, 50}, {94, 50}, {94, 36}, {100, 36}, {100, 36}}, color = {0, 127, 255}));
  connect(boundary2.ports[1], MassFlowAtInit1.port_1) annotation(
    Line(points = {{60, 50}, {70, 50}, {70, 50}, {70, 50}}, color = {0, 127, 255}));
  connect(Trb.port_2, boundary3.ports[1]) annotation(
    Line(points = {{140, 36}, {146, 36}, {146, 50}, {160, 50}, {160, 50}}, color = {0, 127, 255}));
  connect(NmechAtInit.flange_2, Trb.flange_1) annotation(
    Line(points = {{0, 20}, {100, 20}}));
  connect(Cmp.flange_2, NmechAtInit.flange_1) annotation(
    Line(points = {{-60, 20}, {-20, 20}, {-20, 20}, {-20, 20}}));
  connect(boundary1.m_flow_in, VarBySolver.y_independent) annotation(
    Line(points = {{-20, 58}, {-10, 58}, {-10, 50}, {-2, 50}, {-2, 50}}, color = {0, 0, 127}));
  connect(Cmp.port_2, boundary1.ports[1]) annotation(
    Line(points = {{-60, 36}, {-50, 36}, {-50, 50}, {-40, 50}}, color = {0, 127, 255}));
  connect(MassFlowAtInit.port_2, Cmp.port_1) annotation(
    Line(points = {{-110, 36}, {-100, 36}, {-100, 36}, {-100, 36}}, color = {0, 127, 255}));
  connect(boundary.ports[1], MassFlowAtInit.port_1) annotation(
    Line(points = {{-140, 36}, {-130, 36}, {-130, 36}, {-130, 36}}, color = {0, 127, 255}));
  annotation(
    experiment(StartTime = 0, StopTime = 40, Tolerance = 1e-06, Interval = 0.08),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
    Documentation(info = "<html>
  <a href=modelica://> Document html page</a>

</html>"),
    Diagram(graphics = {Text(origin = {-68, -13}, fillPattern = FillPattern.Solid, extent = {{-22, 7}, {12, 1}}, textString = "PR, eff are given"), Text(origin = {104, -11}, fillPattern = FillPattern.Solid, extent = {{-26, 5}, {12, -3}}, textString = "PR is calculated")}, coordinateSystem(extent = {{-180, -160}, {220, 100}})),
    __OpenModelica_commandLineOptions = "");
end Cmp_and_Trb_ex03;
