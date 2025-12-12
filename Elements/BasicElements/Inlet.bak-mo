within PropulsionSystem.Elements.BasicElements;

model Inlet
  extends PropulsionSystem.BaseClasses.BasicElements.Inlet_Base;
  
  /********************************************************
    imports
  ********************************************************/
  import Modelica.Constants;
  
  
  /********************************************************
               Declaration
  ********************************************************/
  //********** Package **********
  //##### none #####
  
  
  //********** Type definitions, only valid in this class **********
  //##### none #####
  
  
  //********** Parameters **********
  parameter Real effRamDes = 0.95 "ram pressure recovery factor" annotation(
    Dialog(group = "Characteristics"));
  //----- switches -----
  parameter PropulsionSystem.Types.switches.switch_parameter_input switchInput_effRam
    = PropulsionSystem.Types.switches.switch_parameter_input.use_desValue
    ""
    annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  
  parameter switch_Inlet_Subelement switchSubelement_effRam
    = switch_Inlet_Subelement.NoSubelement
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
  Modelica.Blocks.Interfaces.RealInput effRam_in 
    if(switchInput_effRam == PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal)
    ""
    annotation(
    Placement(visible = true, transformation(origin = {0, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {-40, -64}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  
  
  
  
  //********** Initialization **********
  //##### none #####
protected
  //********** Protected objects **********
  //##### none #####
algorithm
//##### none #####
equation
  //********** Geometries **********
  //##### none #####
  
  
  //********** Connections, interface <-> internal variables **********
  //--- effRam ---
  if switchInput_effRam == PropulsionSystem.Types.switches.switch_parameter_input.use_desValue then
    effRam = effRamDes;
  elseif switchInput_effRam == PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal then
    effRam = effRam_in;
  end if;
  
  
  //********** Eqns describing physics **********
  //##### none #####

/********************************************************
  Graphics
********************************************************/

// identical to Inlet_Base

end Inlet;
