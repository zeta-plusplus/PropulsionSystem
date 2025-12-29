within PropulsionSystem.Elements.BasicElements;

model Inlet_Map_effRam
  extends PropulsionSystem.Elements.BasicElements.Inlet(switchInput_effRam = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement);
  //----- imports -----
  import Modelica.Constants;
  import PropulsionSystem.Types.switches;
  /********************************************************
       Declaration
  ********************************************************/
  //********** Package **********
  //##### none #####
  //********** Parameters **********
  //----- inner-connected  -----
  inner parameter Real s_eff_CurveDes_in = 1.0 "" annotation(
    Dialog(group = "Subelement parameters"));
  inner parameter Real WcCurveDes = 100.0 "" annotation(
    Dialog(group = "Design Point Definition"));
  inner parameter Real MnFltDes = 0.8 "" annotation(
    Dialog(group = "Design Point Definition"));
  //----- switches -----
  parameter PropulsionSystem.Types.switches.switch_connector switchConnector_MnFlt
    = disactivated
    ""
    annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  
  //********** Interfaces **********
  Modelica.Blocks.Interfaces.RealInput MnFlt
    if(switchConnector_MnFlt == PropulsionSystem.Types.switches.switch_connector.activated)
    "" annotation(
    Placement(visible = true, transformation(origin = {-120, -20}, extent = {{-20, -20}, {20, 20}}, rotation = 0), iconTransformation(origin = {-70, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

equation

end Inlet_Map_effRam;
