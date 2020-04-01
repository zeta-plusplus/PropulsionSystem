within PropulsionSystem.Elements.BasicElements;

model NzlCharFixed00
  extends PropulsionSystem.BaseClasses.BasicElements.NozzleBase00;
  /********************************************************
      imports
    ********************************************************/
  import Modelica.Constants;
  
  
  /********************************************************
                   Declaration
  ********************************************************/
  /* ---------------------------------------------
        switches
    --------------------------------------------- */
  parameter PropulsionSystem.Types.switches.switchHowToDetVar switchDetermine_CdTh = PropulsionSystem.Types.switches.switchHowToDetVar.param "switch how to determine CdTh" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);

  parameter PropulsionSystem.Types.switches.switchHowToDetVar switchDetermine_Cv = PropulsionSystem.Types.switches.switchHowToDetVar.param "switch how to determine Cv" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  
  parameter PropulsionSystem.Types.switches.switchHowToDetVar switchDetermine_AmechTh = PropulsionSystem.Types.switches.switchHowToDetVar.param "switch how to determine AmechTh" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  
  
  /* ---------------------------------------------
        parameters
    --------------------------------------------- */
  parameter Real CdThDes_paramInput = 0.99 "" annotation(
    Dialog(group = "Characteristics"));
  parameter Real CvDes_paramInput = 0.99 "" annotation(
    Dialog(group = "Characteristics"));
  //----- switches -----
  parameter PropulsionSystem.Types.switches.switch_parameter_input switchInput_CdTh = PropulsionSystem.Types.switches.switch_parameter_input.use_desValue "" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  parameter PropulsionSystem.Types.switches.switch_parameter_input switchInput_Cv = PropulsionSystem.Types.switches.switch_parameter_input.use_desValue "" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  //********** Internal variables **********
  //##### none #####
  //********** Internal model **********
  //##### none #####
  //********** Interfaces **********
  Modelica.Blocks.Interfaces.RealInput CdTh_in if switchInput_CdTh == PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal "" annotation(
    Placement(visible = true, transformation(origin = {-80, -111}, extent = {{-11, -11}, {11, 11}}, rotation = 90), iconTransformation(origin = {-70, -85}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput Cv_in if switchInput_Cv == PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal "" annotation(
    Placement(visible = true, transformation(origin = {-40, -111}, extent = {{-11, -11}, {11, 11}}, rotation = 90), iconTransformation(origin = {-40, -77}, extent = {{-8, -8}, {8, 8}}, rotation = 90)));
  //********** Initialization parameters **********
  //##### none #####
  //********** Protected objects **********
  //##### none #####
initial equation
//##### none #####
algorithm
//##### none #####
equation
//********** Geometries **********
//##### none #####
//********** Connections, interface <-> internal variables **********
//--- CdTh ---
  if switchInput_CdTh == PropulsionSystem.Types.switches.switch_parameter_input.use_desValue then
    CdTh = CdThDes;
  elseif switchInput_CdTh == PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal then
    CdTh = CdTh_in;
  end if;
//--- Cv ---
  if switchInput_Cv == PropulsionSystem.Types.switches.switch_parameter_input.use_desValue then
    Cv = CvDes;
  elseif switchInput_Cv == PropulsionSystem.Types.switches.switch_parameter_input.use_inputSignal then
    Cv = Cv_in;
  end if;
//********** Eqns describing physics **********
//##### none #####
/********************************************************
  Graphics
********************************************************/
//identical to "NozzleConv_Base"
end NzlCharFixed00;
