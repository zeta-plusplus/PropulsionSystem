within PropulsionSystem.Elements.BasicElements;

model Duct
  extends PropulsionSystem.BaseClasses.BasicElements.Duct_Base;
  
  /********************************************************
    imports
  ********************************************************/
  //##### none #####
  
  /********************************************************
         Declaration
  ********************************************************/
  //********** Package **********
  //##### none #####
  
  //********** Parameters **********
  parameter Real dPqPdes = 0.01
    "pressure drop ratio"
    annotation(
    Dialog(group = "Characteristic parameters"));
  
  
  //----- switches -----
  parameter PropulsionSystem.Types.switches.switch_parameter_input switchInput_dPqP
    = PropulsionSystem.Types.switches.switch_parameter_input.use_desValue
    ""
    annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  
  
  //********** Internal variables **********
  //##### none #####
  
  
  //********** Internal model **********
  //##### none #####
  
  
  //********** Interfaces **********
  Modelica.Blocks.Interfaces.RealInput dPqP_in 
    if (switchInput_dPqP == PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal)
    ""
    annotation(
    Placement(visible = true, transformation(origin = {-80, -119}, extent = {{-19, -19}, {19, 19}}, rotation = 90), iconTransformation(origin = {-50, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  
  //********** Initialization **********
  //##### none #####
  
  //********** Protected objects **********
  //##### none #####
  
algorithm
  //##### none #####
equation
  //********** Geometries **********
  //##### none #####
  
  
  //********** Connections, interface <-> internal variables **********
  if (switchInput_dPqP == PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) then
    dPqP = dPqP_in;
  elseif (switchInput_dPqP == PropulsionSystem.Types.switches.switch_parameter_input.use_desValue) then
    dPqP = dPqPdes;
  end if;
  
  
  //********** Eqns describing physics **********
  //##### none #####
  
  
/********************************************************
  Graphics
********************************************************/
//identical to "Duct_Base"
  
end Duct;
