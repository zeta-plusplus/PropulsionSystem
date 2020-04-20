within PropulsionSystem.Examples.Subelements;

block ScalerDesTrb_WcEffNcPR_ex01
  extends Modelica.Icons.Example;
  Modelica.Blocks.Sources.Constant const_NcDes(k = 3000)  annotation(
    Placement(visible = true, transformation(origin = {-30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_NcTblDes(k = 1.1)  annotation(
    Placement(visible = true, transformation(origin = {-40, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant const_PRtblDes(k = 8)  annotation(
    Placement(visible = true, transformation(origin = {-10, 80}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Sources.Constant const_WcDes(k = 100) annotation(
    Placement(visible = true, transformation(origin = {-70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_PRdes(k = 3) annotation(
    Placement(visible = true, transformation(origin = {-50, 10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const_effDes(k = 0.85) annotation(
    Placement(visible = true, transformation(origin = {-90, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Subelements.ScalerDesTrb_WcEffNcPR00 ScalerDesCmp annotation(
    Placement(visible = true, transformation(origin = {40, 20}, extent = {{-20, -20}, {20, 20}}, rotation = 0)));
equation
  connect(const_effDes.y, ScalerDesCmp.u_effDes) annotation(
    Line(points = {{-78, -30}, {10, -30}, {10, 4}, {18, 4}, {18, 4}}, color = {0, 0, 127}));
  connect(const_WcDes.y, ScalerDesCmp.u_WcDes) annotation(
    Line(points = {{-58, -10}, {4, -10}, {4, 12}, {18, 12}, {18, 12}}, color = {0, 0, 127}));
  connect(const_NcDes.y, ScalerDesCmp.u_NcDes) annotation(
    Line(points = {{-18, 30}, {-8, 30}, {-8, 36}, {18, 36}}, color = {0, 0, 127}));
  connect(const_PRdes.y, ScalerDesCmp.u_PRdes) annotation(
    Line(points = {{-38, 10}, {-2, 10}, {-2, 28}, {18, 28}, {18, 28}}, color = {0, 0, 127}));
  connect(const_NcTblDes.y, ScalerDesCmp.u_NcTblDes) annotation(
    Line(points = {{-40, 80}, {-40, 80}, {-40, 56}, {24, 56}, {24, 42}, {24, 42}}, color = {0, 0, 127}));
  connect(const_PRtblDes.y, ScalerDesCmp.u_PRtblDes) annotation(
    Line(points = {{-10, 70}, {-10, 70}, {-10, 64}, {32, 64}, {32, 42}, {32, 42}}, color = {0, 0, 127}));
  annotation(
    experiment(StartTime = 0, StopTime = 60, Tolerance = 1e-06, Interval = 0.12),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
  Diagram(coordinateSystem(extent = {{-100, -100}, {80, 100}})),
  __OpenModelica_commandLineOptions = "");
end ScalerDesTrb_WcEffNcPR_ex01;
