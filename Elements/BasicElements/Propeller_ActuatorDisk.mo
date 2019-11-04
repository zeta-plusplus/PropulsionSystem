within PropulsionSystem.Elements.BasicElements;

model PropellerActDisk
  //----- Interfaces -----
  Modelica.Mechanics.Rotational.Interfaces.Flange_b ShaftPort annotation(
    Placement(visible = true, transformation(origin = {100, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {100, 0}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealOutput y_Fg annotation(
    Placement(visible = true, transformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {110, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
//********** Equations **********
//----- interface <-> internal properties -----
//----- eqns describing physics -----
//----- Internal Connections -----
/* none */
//********** Graphics **********
  annotation(
    Icon(graphics = {Rectangle(origin = {-43, 0}, fillPattern = FillPattern.Solid, extent = {{-1, 2}, {143, -2}}), Polygon(origin = {-57, 0}, fillPattern = FillPattern.Solid, points = {{-18, 0}, {10, 14}, {10, -14}, {-18, 0}}), Text(origin = {55, 84}, extent = {{-55, -4}, {45, -24}}, textString = "%name"), Polygon(origin = {-33, 44}, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, points = {{-12, -44}, {-8, 50}, {2, 56}, {10, -44}, {-12, -44}}), Polygon(origin = {-37, -44}, rotation = 180, fillColor = {0, 0, 127}, fillPattern = FillPattern.Solid, points = {{-12, -44}, {-8, 50}, {2, 56}, {8, -44}, {-12, -44}}), Ellipse(origin = {-33, 0}, extent = {{-47, 100}, {43, -100}}, endAngle = 360), Rectangle(origin = {-38, 1}, fillPattern = FillPattern.Solid, extent = {{-9, 13}, {15, -15}}), Line(origin = {4.47383, -17.2174}, points = {{-34.7934, 12.7934}, {-4.79338, -23.2066}, {37.2066, -23.2066}})}, coordinateSystem(initialScale = 0.1)));


end PropellerActDisk;
