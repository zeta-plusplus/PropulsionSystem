within PropulsionSystem.Elements.BasicElements;

model HeatInjector
  extends PropulsionSystem.BaseClasses.BasicElements.HeatInjector_Base;
  /********************************************************
           import
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
  //##### none #####
  //----- switches -----
  parameter PropulsionSystem.Types.switches.switch_parameter_input switchInput_TtOutlet 
    = PropulsionSystem.Types.switches.switch_parameter_input.use_desValue
    ""
    annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  parameter PropulsionSystem.Types.switches.switch_parameter_input switchInput_dqInjected 
    = PropulsionSystem.Types.switches.switch_parameter_input.asCalculated 
    ""
    annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  
  
  //********** Internal variables **********
  //##### none #####
  //********** Interfaces **********
  Modelica.Blocks.Interfaces.RealInput TtOutlet_in 
    if(switchInput_TtOutlet == PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal) 
    ""
    annotation(
    Placement(visible = true, transformation(origin = {-80, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {90, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 180)));
  
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
  if (switchCausality_dq == switchCausality_HeatInjection.input_TtOutlet) then
//--
    if switchInput_TtOutlet == PropulsionSystem.Types.switches.switch_parameter_input.use_desValue then
      TtOutlet = TtOutletDes;
    elseif switchInput_TtOutlet == PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal then
      TtOutlet = TtOutlet_in;
    end if;
//--
    fluid_2.T = TtOutlet;
  elseif (switchCausality_dq == switchCausality_HeatInjection.input_dq) then
//--
    if (switchInput_dqInjected == PropulsionSystem.Types.switches.switch_parameter_input.use_desValue) then
      dqInjected = dqInjectedDes;
    else
      //
    end if;
  end if;
//********** Eqns describing physics **********
//##### none #####
end HeatInjector;
