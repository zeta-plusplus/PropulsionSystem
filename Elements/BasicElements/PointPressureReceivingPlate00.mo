within PropulsionSystem.Elements.BasicElements;

model PointPressureReceivingPlate00
  import units = Modelica.Units.SI;
  /***********************************
      parameters
      ***********************************/
  parameter units.Length d2core_par = 10;
  parameter units.Length Rplate_par = 200;
  parameter units.Length rCore_par = 55*9.725^(1/3) "[m/kT^(1/3)*(kT^(1/3))]";
  /***********************************
      variables
      ***********************************/
  units.Length rCore;
  units.Length d2core;
  units.Length Rplate;
  units.Pressure pCore;
  units.Force F;
  /***********************************
      interfaces
      ***********************************/
  Modelica.Blocks.Interfaces.RealInput u_p annotation(
    Placement(transformation(origin = {55, 0}, extent = {{5, -5}, {-5, 5}}), iconTransformation(origin = {55, 0}, extent = {{5, -5}, {-5, 5}})));
  Modelica.Mechanics.Translational.Interfaces.Flange_a flange annotation(
    Placement(transformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}}), iconTransformation(origin = {-60, 0}, extent = {{-10, -10}, {10, 10}})));
equation
  pCore = u_p;
  rCore = rCore_par;
  d2core = d2core_par;
  Rplate = Rplate_par;
  flange.f = -1*F;
//-----
  F = u_p*Modelica.Constants.pi*rCore^2*log(1 + Rplate^2/d2core^2);
  
  
  
  annotation(
    Icon(graphics = {Rectangle(origin = {-55, 0}, fillPattern = FillPattern.Solid, extent = {{-5, 100}, {5, -100}}), Line(origin = {5, -1}, points = {{55, 1}, {-45, 1}}, arrow = {Arrow.None, Arrow.Filled}), Line(origin = {5, 19}, points = {{55, -19}, {-33, 29}}, arrow = {Arrow.None, Arrow.Filled}), Line(origin = {17, 37}, points = {{43, -37}, {-9, 49}}, arrow = {Arrow.None, Arrow.Filled}), Line(origin = {5, -19}, points = {{55, 19}, {-33, -29}}, arrow = {Arrow.None, Arrow.Filled}), Line(origin = {47, 37}, points = {{13, -37}, {-41, -121}}, arrow = {Arrow.None, Arrow.Filled}), Text(origin = {0, 110}, extent = {{-80, 10}, {80, -10}}, textString = "%name"), Text(origin = {48, 14}, extent = {{-26, 4}, {26, -4}}, textString = "pressure"), Ellipse(origin = {60, 0}, pattern = LinePattern.Dash, extent = {{80, -80}, {-80, 80}}, startAngle = -60, endAngle = 60, closure = EllipseClosure.None)}, coordinateSystem(preserveAspectRatio = false, extent = {{-60, -100}, {60, 100}})),
    Diagram(graphics),
    defaultComponentName = "pplate",
  experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-06, Interval = 0.002));
end PointPressureReceivingPlate00;
