within PropulsionSystem.BaseClasses.BasicElements;

partial model PistonCylinderBase00
  /********************************************************
              imports
  ********************************************************/
  import Modelica.Constants;
  
  
  /********************************************************
              Declaration
          ********************************************************/
  /* ---------------------------------------------
              Package
          --------------------------------------------- */
  replaceable package Medium = Modelica.Media.Interfaces.PartialMedium annotation(
    choicesAllMatching = true);
  /* ---------------------------------------------
                  switch
              --------------------------------------------- */
  parameter Boolean allowFlowReversal = false "= true to allow flow reversal, false restricts to design direction (port_a -> port_b)" annotation(
    Dialog(tab = "Assumptions"),
    Evaluate = true);
  
  
  
  
  annotation(
    defaultComponentName = "PistonCylinder",
    Icon(graphics = {Line(origin = {0.39, -10.28}, points = {{-60, -30}, {-60, 60}, {-60, 100}, {60, 100}, {60, 60}, {60, -30}}, thickness = 1.5), Line(origin = {-40, 89}, points = {{0, 9}, {0, -11}}, thickness = 0.75), Line(origin = {-45.6153, 104.79}, points = {{14, -27}, {-2, -27}}, thickness = 0.75), Line(origin = {39.3395, 91}, points = {{0, 9}, {0, -11}}, thickness = 0.75), Line(origin = {34.3847, 124.112}, points = {{14, -27}, {-2, -27}}, thickness = 0.75), Line(origin = {-61, 89.6778}, points = {{-39, 10}, {21, 10}, {21, -12}}, pattern = LinePattern.Dot, thickness = 1), Line(origin = {-51, 99.661}, points = {{151, 0}, {91, 0}, {91, -20}}, pattern = LinePattern.Dot, thickness = 1), Text(origin = {-29, 112}, extent = {{-51, 8}, {109, -6}}, textString = "%name"), Rectangle(origin = {47, -105}, fillColor = {170, 0, 127}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-27, 11}, {53, -3}}), Rectangle(origin = {20, -95}, rotation = 60, fillColor = {170, 0, 127}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-11, 5}, {51, -7}}), Rectangle(origin = {-7, -59}, fillColor = {170, 0, 127}, fillPattern = FillPattern.HorizontalCylinder, extent = {{7, 11}, {49, -3}}), Rectangle(origin = {-22, -94}, rotation = 60, fillColor = {170, 0, 127}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-11, 5}, {51, -9}}), Rectangle(origin = {-73, -105}, fillColor = {170, 0, 127}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-27, 11}, {53, -3}}), Rectangle(origin = {15, -42}, rotation = 110, fillColor = {170, 0, 127}, fillPattern = FillPattern.HorizontalCylinder, extent = {{-19, 3}, {57, -7}}), Rectangle(origin = {-1, 40}, fillColor = {170, 0, 127}, fillPattern = FillPattern.VerticalCylinder, extent = {{-54, -1}, {56, -33}})}, coordinateSystem(extent = {{-100, -120}, {100, 120}}, initialScale = 0.1)),
    __OpenModelica_commandLineOptions = "",
    experiment(StartTime = 0, StopTime = 50, Tolerance = 1e-06, Interval = 0.1),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
  
end PistonCylinderBase00;
