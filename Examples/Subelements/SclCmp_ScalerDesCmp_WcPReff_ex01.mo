within PropulsionSystem.Examples.Subelements;

block SclCmp_ScalerDesCmp_WcPReff_ex01
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Constant const_NcDes(k = 3000)  annotation(
    Placement(visible = true, transformation(origin = {-30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_NcTblDes(k = 1.1)  annotation(
    Placement(visible = true, transformation(origin = {-40, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant const_RlineTblDes(k = Modelica.Constants.pi / 4)  annotation(
    Placement(visible = true, transformation(origin = {-10, 80}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  PropulsionSystem.Subelements.ScalerDesCmp_WcPReffNc00 ScalerDesCmp annotation(
    Placement(visible = true, transformation(origin = {40, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_WcDes(k = 100) annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_PRdes(k = 10) annotation(
    Placement(visible = true, transformation(origin = {-70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_effDes(k = 0.85) annotation(
    Placement(visible = true, transformation(origin = {-90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Subelements.CompressorTable_WcPReff_NcRline00 CmpTbl_WcPReff_NcRline annotation(
    Placement(visible = true, transformation(origin = {140, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Subelements.SclCmp_WcPReff00 SclCmp annotation(
    Placement(visible = true, transformation(origin = {200, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Math.Division division1 annotation(
    Placement(visible = true, transformation(origin = {90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_RlineTbl(k = Modelica.Constants.pi / 4) annotation(
    Placement(visible = true, transformation(origin = {30, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_Nc(k = 3000) annotation(
    Placement(visible = true, transformation(origin = {30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  connect(CmpTbl_WcPReff_NcRline.y_eff, SclCmp.u_eff) annotation(
    Line(points = {{162, -52}, {178, -52}, {178, -52}, {178, -52}}, color = {0, 0, 127}));
  connect(CmpTbl_WcPReff_NcRline.y_PR, SclCmp.u_PR) annotation(
    Line(points = {{162, -40}, {178, -40}, {178, -40}, {178, -40}}, color = {0, 0, 127}));
  connect(CmpTbl_WcPReff_NcRline.y_Wc, SclCmp.u_Wc) annotation(
    Line(points = {{162, -28}, {178, -28}, {178, -28}, {178, -28}}, color = {0, 0, 127}));
  connect(ScalerDesCmp.y_s_effDes, SclCmp.u_s_eff) annotation(
    Line(points = {{62, 4}, {212, 4}, {212, -18}, {212, -18}}, color = {0, 0, 127}));
  connect(ScalerDesCmp.y_s_PRdes, SclCmp.u_s_PR) annotation(
    Line(points = {{62, 12}, {200, 12}, {200, -18}, {200, -18}}, color = {0, 0, 127}));
  connect(ScalerDesCmp.y_s_WcDes, SclCmp.u_s_Wc) annotation(
    Line(points = {{62, 28}, {188, 28}, {188, -18}, {188, -18}}, color = {0, 0, 127}));
  connect(const_Nc.y, division1.u1) annotation(
    Line(points = {{42, -30}, {64, -30}, {64, -24}, {78, -24}, {78, -24}}, color = {0, 0, 127}));
  connect(const_RlineTbl.y, CmpTbl_WcPReff_NcRline.u_RlineTbl) annotation(
    Line(points = {{42, -60}, {102, -60}, {102, -48}, {118, -48}, {118, -48}}, color = {0, 0, 127}));
  connect(division1.y, CmpTbl_WcPReff_NcRline.u_NcTbl) annotation(
    Line(points = {{102, -30}, {108, -30}, {108, -32}, {118, -32}, {118, -32}}, color = {0, 0, 127}));
  connect(ScalerDesCmp.y_s_NcDes, division1.u2) annotation(
    Line(points = {{62, 36}, {68, 36}, {68, -36}, {78, -36}, {78, -36}}, color = {0, 0, 127}));
  connect(const_effDes.y, ScalerDesCmp.u_effDes) annotation(
    Line(points = {{-79, -30}, {7, -30}, {7, 4}, {18, 4}}, color = {0, 0, 127}));
  connect(const_PRdes.y, ScalerDesCmp.u_PRdes) annotation(
    Line(points = {{-59, -10}, {-1, -10}, {-1, 12}, {18, 12}}, color = {0, 0, 127}));
  connect(const_WcDes.y, ScalerDesCmp.u_WcDes) annotation(
    Line(points = {{-39, 10}, {-7, 10}, {-7, 28}, {18, 28}}, color = {0, 0, 127}));
  connect(const_NcDes.y, ScalerDesCmp.u_NcDes) annotation(
    Line(points = {{-19, 30}, {-12, 30}, {-12, 36}, {18, 36}}, color = {0, 0, 127}));
  connect(const_NcTblDes.y, ScalerDesCmp.u_NcTblDes) annotation(
    Line(points = {{-40, 80}, {-40, 52}, {24, 52}, {24, 42}}, color = {0, 0, 127}));
  connect(const_RlineTblDes.y, ScalerDesCmp.u_RlineTblDes) annotation(
    Line(points = {{-10, 69}, {-10, 58}, {32, 58}, {32, 42}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.12),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-100, -100}, {240, 100}})),
  __OpenModelica_commandLineOptions = "");
end SclCmp_ScalerDesCmp_WcPReff_ex01;
