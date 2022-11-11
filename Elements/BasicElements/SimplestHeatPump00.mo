within PropulsionSystem.Elements.BasicElements;

model SimplestHeatPump00
  import units= Modelica.SIunits;
  //----------
  units.HeatFlowRate QH_flow;
  units.HeatFlowRate QL_flow;
  //----------
  Modelica.Blocks.Interfaces.RealInput u_CoP annotation(
    Placement(visible = true, transformation(origin = {-120, -80}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-108, -80}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_dW annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-105, 1}, extent = {{-15, -15}, {15, 15}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_a port_a annotation(
    Placement(visible = true, transformation(origin = {0, -100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {0, -100}, extent = {{-8, -8}, {8, 8}}, rotation = 0)));
  Modelica.Thermal.HeatTransfer.Interfaces.HeatPort_b port_b annotation(
    Placement(visible = true, transformation(origin = {0, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {-4.44089e-16, 100}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
  port_a.Q_flow=QL_flow;
  port_b.Q_flow=(-1.0)*QH_flow;
  //----------
  QL_flow= u_CoP*u_dW;
  QH_flow= u_dW + QL_flow;
annotation(
    defaultComponentName = "HeatPump",
    Diagram,
    Icon(graphics = {Polygon(origin = {-9, 100}, fillPattern = FillPattern.Solid, points = {{9, 1}, {37, -21}, {-19, -21}, {9, 1}}), Rectangle(origin = {0, -75}, fillPattern = FillPattern.Solid, extent = {{-6, 25}, {6, -25}}), Rectangle(origin = {0, 65}, fillPattern = FillPattern.Solid, extent = {{-14, 25}, {14, -25}}), Text(origin = {60, 78}, extent = {{-28, 14}, {28, -14}}, textString = "QH_flow"), Text(origin = {41, -87}, extent = {{-25, 13}, {25, -13}}, textString = "QL_flow"), Ellipse(fillColor = {255, 255, 255}, fillPattern = FillPattern.Solid,lineThickness = 2, extent = {{-40, 40}, {40, -40}}), Line(origin = {-1.01, -0.22}, points = {{-8.9901, -23.7832}, {-20.9901, -13.7832}, {-22.9901, 0.216816}, {-16.9901, 12.2168}, {-8.9901, 20.2168}, {1.0099, 22.2168}, {9.0099, 20.2168}, {17.0099, 16.2168}, {21.0099, 8.21682}, {23.0099, -3.78318}, {21.0099, -9.7832}, {11.0099, -19.7832}}, thickness = 1.5, arrow = {Arrow.None, Arrow.Open}), Polygon(origin = {-9, -40}, fillPattern = FillPattern.Solid, points = {{9, 1}, {23, -19}, {-5, -19}, {9, 1}}), Polygon(origin = {-51, 1}, fillPattern = FillPattern.Solid, points = {{-11, 19}, {11, -1}, {-11, -19}, {-11, 19}}), Text(origin = {-78, 34}, extent = {{-14, 12}, {14, -12}}, textString = "dW"), Rectangle(origin = {-77, 0}, fillPattern = FillPattern.Solid, extent = {{-23, 8}, {23, -8}}), Line(origin = {-30.79, -12.79}, points = {{-69.207, -67.207}, {-29.207, -67.207}, {64.793, 54.793}}, thickness = 1, arrow = {Arrow.None, Arrow.Open}, arrowSize = 5), Text(origin = {-79, -64}, extent = {{-17, 8}, {17, -8}}, textString = "CoP")}));
end SimplestHeatPump00;
