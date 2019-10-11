within PropulsionSystem.Interfaces.ElementFrames;

partial model ElementFrame

  import Modelica.Constants;
  
  /********************************************************
    Declaration
  ********************************************************/
  //********** Package **********
  replaceable package Medium= Modelica.Media.Interfaces.PartialMedium
    annotation (choicesAllMatching= true);
  //********** Parameters **********
  //##### none #####
  //********** Internal variables **********
  //##### none #####
  //----- inner-outer-connected variables -----
  //##### none #####
  //********** Interfaces **********
  //##### none #####
  //********** Initialization **********
  //##### none #####
  //********** Protected objects **********
  //##### none #####
  /********************************************************
    Model coding
  ********************************************************/
  PropulsionSystem.Types.ElementBus elementBus1 annotation(
    Placement(visible = true, transformation(origin = {70, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0), iconTransformation(origin = {70, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
equation
//********** Geometries **********
//##### none #####
//********** Connections, interface <-> internal variables **********
//##### none #####
//********** Eqns describing physics **********
//##### none #####
/********************************************************
  Graphics
********************************************************/
//##### none #####


end ElementFrame;
