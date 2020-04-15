within PropulsionSystem.Examples.Subelements;

model CompressorTable_WcPReff_NcRline00_ex01
  extends Modelica.Icons.Example;
  PropulsionSystem.Subelements.CompressorTable_WcPReff_NcRline00 CmpTbl_WcPReff_NcRline annotation(
    Placement(visible = true, transformation(origin = {20, -1.77636e-15}, extent = {{-40, -40}, {40, 40}}, rotation = 0)));
  Modelica.Blocks.Sources.TimeTable timeTable_Nc(table = [0, 1; 10, 1; 10, 0.9; 20, 0.9; 20, 0.8; 30, 0.8; 30, 0.7; 40, 0.7; 40, 0.2; 50, 0.2])  annotation(
    Placement(visible = true, transformation(origin = {-60, 20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.TimeTable timeTable1(table = [0, 0.09; 10, 1; 10, 0.09; 20, 1; 20, 0.09; 30, 1; 30, 0.09; 40, 1; 40, 0.09; 50, 1; 51, 1])  annotation(
    Placement(visible = true, transformation(origin = {-60, -20}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(timeTable1.y, CmpTbl_WcPReff_NcRline.u_RlineTbl) annotation(
    Line(points = {{-49, -20}, {-36, -20}, {-36, -16}, {-24, -16}}, color = {0, 0, 127}));
  connect(timeTable_Nc.y, CmpTbl_WcPReff_NcRline.u_NcTbl) annotation(
    Line(points = {{-49, 20}, {-34, 20}, {-34, 16}, {-24, 16}}, color = {0, 0, 127}));

annotation(
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-6, Interval = 0.12),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));end CompressorTable_WcPReff_NcRline00_ex01;
