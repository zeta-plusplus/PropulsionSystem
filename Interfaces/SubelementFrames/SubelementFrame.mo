within PropulsionSystem.Interfaces.SubelementFrames;

partial model SubelementFrame

  
  PropulsionSystem.Types.SubelementBus subelementBus1 annotation(
    Placement(visible = true, transformation(origin = {70, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {90, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  //********** Internal variables **********
  //##### none #####
  
  //----- inner-outer-connected variables -----
  //##### none #####
  
  
/********************************************************
  Graphics
********************************************************/

annotation(
    Icon(graphics = {Rectangle(origin = {10, -10}, pattern = LinePattern.Dash, lineThickness = 0.5, extent = {{-110, 110}, {90, -50}}), Text(origin = {-55, -74}, extent = {{-43, 10}, {153, -18}}, textString = "%name")}, coordinateSystem(initialScale = 0.1)));


end SubelementFrame;
