within PropulsionSystem.Examples.Subelements;

block SclTrb_ScalerDesTrb_WcEff_ex01
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Constant const_NcDes(k = 3000)  annotation(
    Placement(visible = true, transformation(origin = {-30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_NcTblDes(k = 1.1)  annotation(
    Placement(visible = true, transformation(origin = {-40, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant const_PRtblDes(k = 10)  annotation(
    Placement(visible = true, transformation(origin = {-10, 80}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant const_WcDes(k = 100) annotation(
    Placement(visible = true, transformation(origin = {-70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_PRdes(k = 3) annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_effDes(k = 0.85) annotation(
    Placement(visible = true, transformation(origin = {-90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division division1 annotation(
    Placement(visible = true, transformation(origin = {100, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_PR(k = 3) annotation(
    Placement(visible = true, transformation(origin = {0, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_Nc(k = 3000) annotation(
    Placement(visible = true, transformation(origin = {30, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Subelements.ScalerDesTrb_WcEffNcPR00 ScalerDesTrb annotation(
    Placement(visible = true, transformation(origin = {40, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Subelements.TurbineTable_WcEff_NcPR00 TrbTbl_WcEff_NcPR annotation(
    Placement(visible = true, transformation(origin = {180, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  PropulsionSystem.Subelements.SclTrb_WcEff00 SclTrb annotation(
    Placement(visible = true, transformation(origin = {240, -40}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback1 annotation(
    Placement(visible = true, transformation(origin = {30, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 1)  annotation(
    Placement(visible = true, transformation(origin = {30, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Math.Division division2 annotation(
    Placement(visible = true, transformation(origin = {90, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Add add1 annotation(
    Placement(visible = true, transformation(origin = {130, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = 1) annotation(
    Placement(visible = true, transformation(origin = {110, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
equation
  connect(const1.y, add1.u2) annotation(
    Line(points = {{110, -78}, {110, -78}, {110, -66}, {118, -66}, {118, -66}}, color = {0, 0, 127}));
  connect(add1.y, TrbTbl_WcEff_NcPR.u_PRtbl) annotation(
    Line(points = {{142, -60}, {148, -60}, {148, -48}, {158, -48}, {158, -48}}, color = {0, 0, 127}));
  connect(division2.y, add1.u1) annotation(
    Line(points = {{102, -60}, {106, -60}, {106, -54}, {118, -54}, {118, -54}}, color = {0, 0, 127}));
  connect(TrbTbl_WcEff_NcPR.y_Wc, SclTrb.u_Wc) annotation(
    Line(points = {{202, -32}, {218, -32}}, color = {0, 0, 127}));
  connect(TrbTbl_WcEff_NcPR.y_eff, SclTrb.u_eff) annotation(
    Line(points = {{202, -48}, {218, -48}}, color = {0, 0, 127}));
  connect(division1.y, TrbTbl_WcEff_NcPR.u_NcTbl) annotation(
    Line(points = {{111, -30}, {124.5, -30}, {124.5, -32}, {158, -32}}, color = {0, 0, 127}));
  connect(ScalerDesTrb.y_s_WcDes, SclTrb.u_s_Wc) annotation(
    Line(points = {{62, 12}, {232, 12}, {232, -18}}, color = {0, 0, 127}));
  connect(ScalerDesTrb.y_s_effDes, SclTrb.u_s_eff) annotation(
    Line(points = {{62, 4}, {248, 4}, {248, -18}}, color = {0, 0, 127}));
  connect(const.y, feedback1.u2) annotation(
    Line(points = {{30, -79}, {30, -68}}, color = {0, 0, 127}));
  connect(const_PR.y, feedback1.u1) annotation(
    Line(points = {{11, -60}, {22, -60}}, color = {0, 0, 127}));
  connect(feedback1.y, division2.u1) annotation(
    Line(points = {{39, -60}, {46, -60}, {46, -54}, {78, -54}}, color = {0, 0, 127}));
  connect(ScalerDesTrb.y_s_PRdes, division2.u2) annotation(
    Line(points = {{62, 28}, {68, 28}, {68, -66}, {78, -66}, {78, -66}}, color = {0, 0, 127}));
  connect(ScalerDesTrb.y_s_NcDes, division1.u2) annotation(
    Line(points = {{62, 36}, {80, 36}, {80, -36}, {88, -36}}, color = {0, 0, 127}));
  connect(const_Nc.y, division1.u1) annotation(
    Line(points = {{42, -30}, {64, -30}, {64, -24}, {88, -24}}, color = {0, 0, 127}));
  connect(const_effDes.y, ScalerDesTrb.u_effDes) annotation(
    Line(points = {{-78, -30}, {8, -30}, {8, 4}, {18, 4}, {18, 4}}, color = {0, 0, 127}));
  connect(const_WcDes.y, ScalerDesTrb.u_WcDes) annotation(
    Line(points = {{-58, -10}, {-2, -10}, {-2, 12}, {18, 12}, {18, 12}}, color = {0, 0, 127}));
  connect(const_PRdes.y, ScalerDesTrb.u_PRdes) annotation(
    Line(points = {{-38, 10}, {-10, 10}, {-10, 28}, {18, 28}}, color = {0, 0, 127}));
  connect(const_NcDes.y, ScalerDesTrb.u_NcDes) annotation(
    Line(points = {{-18, 30}, {-12, 30}, {-12, 36}, {18, 36}}, color = {0, 0, 127}));
  connect(const_NcTblDes.y, ScalerDesTrb.u_NcTblDes) annotation(
    Line(points = {{-40, 80}, {-40, 56}, {24, 56}, {24, 42}}, color = {0, 0, 127}));
  connect(const_PRtblDes.y, ScalerDesTrb.u_PRtblDes) annotation(
    Line(points = {{-10, 70}, {-10, 64}, {32, 64}, {32, 42}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.12),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-100, -100}, {260, 100}})),
  __OpenModelica_commandLineOptions = "");
end SclTrb_ScalerDesTrb_WcEff_ex01;
