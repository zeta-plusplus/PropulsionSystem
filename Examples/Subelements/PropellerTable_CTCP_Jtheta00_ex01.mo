within PropulsionSystem.Examples.Subelements;

model PropellerTable_CTCP_Jtheta00_ex01
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.TimeTable timeTable_J(table = [0, 0.0; 10, 3.0; 10, 0.0; 20, 3.0; 20, 0.0; 30, 3.0; 30, 0.0; 40, 3.0; 40, 0.0; 50, 3.0; 50, 0.0; 60, 3.0; 60, 0.0; 70, 3.0; 70, 3.0; 80, 3.0]) annotation(
    Placement(visible = true, transformation(origin = {-70, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.TimeTable timeTable_theta(table = [0, 15; 10, 15; 10, 20; 20, 20; 20, 25; 30, 25; 30, 30; 40, 30; 40, 35; 50, 35; 50, 40; 60, 40; 60, 45; 70, 45]) annotation(
    Placement(visible = true, transformation(origin = {-70, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Subelements.PropellerTable_CTCP_Jtheta00 PropTbl_CTCP_Jtheta(use_tableFile_CP = true, use_tableFile_CT = true)  annotation(
    Placement(visible = true, transformation(origin = {20, -1.77636e-15}, extent = {{-40, -40}, {40, 40}}, rotation = 0)));
equation
  connect(timeTable_theta.y, PropTbl_CTCP_Jtheta.u_theta) annotation(
    Line(points = {{-58, -20}, {-48, -20}, {-48, -14}, {-24, -14}, {-24, -16}}, color = {0, 0, 127}));
  connect(timeTable_J.y, PropTbl_CTCP_Jtheta.u_J) annotation(
    Line(points = {{-58, 20}, {-48, 20}, {-48, 16}, {-24, 16}, {-24, 16}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 70, Tolerance = 1e-06, Interval = 0.14),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end PropellerTable_CTCP_Jtheta00_ex01;
