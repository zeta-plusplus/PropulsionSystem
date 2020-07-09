within PropulsionSystem.Utilities;

model ConstrainVariable

//********** Parameters **********
  parameter Real tgtValue_paramInput=1.0 "target value ot constraint, valid only when use_u_targetVal==false" annotation(
    Dialog(group = "Characteristics"));
  
  
  //----- switches -----
  parameter Boolean use_u_targetVal = true "get targetValue from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true), Dialog(group = "switch"));
  //********** Interfaces **********
  Modelica.Blocks.Interfaces.RealInput u_variable annotation(
    Placement(visible = true, transformation(origin = {-120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_targetValue if use_u_targetVal "" annotation(
    Placement(visible = true, transformation(origin = {120, 0}, extent = {{-20, -20}, {20, 20}}, rotation = 180), iconTransformation(origin = {110, 0}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
equation
  if (use_u_targetVal==false) then
    tgtValue_paramInput = u_variable;
  elseif (use_u_targetVal==true) then
    u_targetValue = u_variable;
  end if;
/********************************************************
  Graphics
********************************************************/
  annotation(
    defaultComponentName = "Constraint",
    Diagram,
    Icon(graphics = {Rectangle(fillColor = {39, 39, 39}, fillPattern = FillPattern.Solid, extent = {{-100, 100}, {100, -100}}), Text(origin = {-3, -83}, lineColor = {255, 255, 255}, extent = {{-97, 3}, {103, -17}}, textString = "%name"), Text(origin = {-3, 37}, lineColor = {255, 255, 255}, extent = {{-97, 3}, {103, -77}}, textString = "Constraint", fontSize = 34)}, coordinateSystem(initialScale = 0.1)));


end ConstrainVariable;
