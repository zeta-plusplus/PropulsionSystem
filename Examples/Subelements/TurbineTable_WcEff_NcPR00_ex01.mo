within PropulsionSystem.Examples.Subelements;

model TurbineTable_WcEff_NcPR00_ex01
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.TimeTable timeTable_Nc(table = [0, 1; 10, 1; 10, 0.9; 20, 0.9; 20, 0.8; 30, 0.8; 30, 0.7; 40, 0.7; 40, 0.2; 50, 0.2]) annotation(
    Placement(visible = true, transformation(origin = {-70, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.TimeTable timeTable_PR(table = [0, 1.2; 10, 10; 10, 1.2; 20, 10; 20, 1.2; 30, 10; 30, 1.2; 40, 10; 40, 1.2; 50, 10; 51, 10]) annotation(
    Placement(visible = true, transformation(origin = {-70, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Subelements.TurbineTable_WcEff_NcPR00 TrbTbl_WcEff_NcPR annotation(
    Placement(visible = true, transformation(origin = {-1.42109e-14, 1.42109e-14}, extent = {{-40, -40}, {40, 40}}, rotation = 0)));
equation
  connect(timeTable_PR.y, TrbTbl_WcEff_NcPR.u_PRtbl) annotation(
    Line(points = {{-58, -20}, {-54, -20}, {-54, -16}, {-44, -16}, {-44, -16}}, color = {0, 0, 127}));
  connect(timeTable_Nc.y, TrbTbl_WcEff_NcPR.u_NcTbl) annotation(
    Line(points = {{-58, 20}, {-54, 20}, {-54, 16}, {-44, 16}, {-44, 16}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.12),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end TurbineTable_WcEff_NcPR00_ex01;
