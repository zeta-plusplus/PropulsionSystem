within PropulsionSystem.Examples.Subelements;

block ScalerDesCmp_WcPReffNc_ex01
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
equation
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
  Diagram(coordinateSystem(extent = {{-100, -100}, {80, 100}})),
  __OpenModelica_commandLineOptions = "");
end ScalerDesCmp_WcPReffNc_ex01;
