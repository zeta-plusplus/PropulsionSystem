within PropulsionSystem.Elements.BasicElements;

model TurbineDesPt00
  extends PropulsionSystem.BaseClasses.BasicElements.Turbine_Base;
  /********************************************************
      imports
    ********************************************************/
  import Modelica.Constants;
  import PropulsionSystem.Types.switches;
  /********************************************************
             Declaration
    ********************************************************/
  //********** Package **********
  //##### none #####
  //********** Type definitions, only valid in this class **********
  //##### none #####
  //********** Parameters **********
  //##### none #####
  //----- inner-connected parameters -----
  //##### none #####
  //----- switches -----
  parameter PropulsionSystem.Types.switches.switch_parameter_input switchInput_Wc_1 = PropulsionSystem.Types.switches.switch_parameter_input.asCalculated "" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  parameter PropulsionSystem.Types.switches.switch_parameter_input switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.use_desValue "" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  parameter PropulsionSystem.Types.switches.switch_parameter_input switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.asCalculated "" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  //********** Internal variables **********
  Modelica.SIunits.MassFlowRate WcCalc_1(start = WcDes_1_def);
  //----- inner-connected variables -----
  //##### none #####
  //----- outer-connected variables -----
  //##### none #####
  //----- inner-outer-connected variables -----
  //##### none #####
  //********** Internal model **********
  //##### none #####
  //********** Interfaces **********
  Modelica.Blocks.Interfaces.RealInput Wc_1_in if switchInput_Wc_1 == PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal "" annotation(
    Placement(visible = true, transformation(origin = {-80, -112}, extent = {{-12, -12}, {12, 12}}, rotation = 90), iconTransformation(origin = {-8.88178e-16, -58}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput eff_in if switchInput_eff == PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal "" annotation(
    Placement(visible = true, transformation(origin = {-60, -112}, extent = {{-12, -12}, {12, 12}}, rotation = 90), iconTransformation(origin = {30, -73}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
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
//--- Wc_1 ---
  if switchInput_Wc_1 == PropulsionSystem.Types.switches.switch_parameter_input.use_desValue then
    WcCalc_1 = WcDes_1;
    Wc_1 = WcCalc_1;
  elseif switchInput_Wc_1 == PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal then
    WcCalc_1 = Wc_1_in;
    Wc_1 = WcCalc_1;
  elseif switchInput_Wc_1 == PropulsionSystem.Types.switches.switch_parameter_input.asCalculated then
    Wc_1 = WcCalc_1;
  end if;
//--- eff ---
  if switchInput_eff == PropulsionSystem.Types.switches.switch_parameter_input.use_desValue then
    eff = effDes;
  elseif switchInput_eff == PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal then
    eff = eff_in;
  end if;
//--- PR ---
  if switchInput_PR == PropulsionSystem.Types.switches.switch_parameter_input.use_desValue then
    PR = PRdes;
  elseif switchInput_PR == PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal then
    PR = PR_in;
  end if;
//********** Eqns describing physics **********
//##### none #####
end TurbineDesPt00;
