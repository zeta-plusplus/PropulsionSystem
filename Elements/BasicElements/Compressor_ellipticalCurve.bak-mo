within PropulsionSystem.Elements.BasicElements;

model Compressor_ellipticalCurve
  extends PropulsionSystem.Elements.BasicElements.Compressor(
      switchInput_Wc_1= PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement,
      switchInput_PR= PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement,
      switchInput_eff= PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement
    );
  
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
  inner parameter Real s_Wc_CurveDes_in= 1.0 "" annotation(Dialog(group = "Subelement parameters"));
  inner parameter Real s_PR_CurveDes_in= 1.0 "" annotation(Dialog(group = "Subelement parameters"));
  inner parameter Real s_eff_CurveDes_in= 1.0 "" annotation(Dialog(group = "Subelement parameters"));
  inner parameter Real thetaCurveDes= Constants.pi/6.0 "" annotation(Dialog(group = "Design Point Definition"));
  inner parameter Real NcqNcDesCurveDes= 1.0 "" annotation(Dialog(group = "Design Point Definition"));
  
  //----- switches -----
  //--- inner-connected ---
  inner parameter switches.switch_defineDesValue switchDef_s_Wc_CurveDes
      =switches.switch_defineDesValue.calcByDesStates
   ""
    annotation(
    Dialog(group = "switch"),
    choicesAllMatching= true,   
    Evaluate = true,
    HideResult = true
    );
  
  inner parameter switches.switch_defineDesValue switchDef_s_PR_CurveDes
      =switches.switch_defineDesValue.calcByDesStates
   ""
    annotation(
    Dialog(group = "switch"),
    choicesAllMatching= true,   
    Evaluate = true,
    HideResult = true
    );
  
  inner parameter switches.switch_defineDesValue switchDef_s_eff_CurveDes
      =switches.switch_defineDesValue.calcByDesStates
   ""
    annotation(
    Dialog(group = "switch"),
    choicesAllMatching= true,   
    Evaluate = true,
    HideResult = true
    );
  
  
  //********** Internal variables **********
  //##### none #####
  
  //********** Internal model **********
  PropulsionSystem.Subelements.CompressorEllipticalCurve model_characteristics_1(
      redeclare package Medium= Medium
    )
    annotation(
    Placement(visible = true, transformation(origin = {0, 20}, extent = {{-60, -60}, {60, 60}}, rotation = 0)));
  
  
  //********** Interfaces **********
  //##### none #####
  //********** Initialization **********
  //##### none #####

protected
  //********** Protected objects **********
  //##### none #####
algorithm
  //##### none #####
    
equation
  
  //--- Wc_1 ---
  WcCalc_1 = model_characteristics_1.Wc_internal;
  if (switchInput_Wc_1 == PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement) then
    Wc_1= WcCalc_1;
  end if;
  
  //--- PR ---
  if (switchInput_PR == PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement) then
    PR = model_characteristics_1.PR_internal;
  end if;
  
  //--- eff ---
  if (switchInput_eff == PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement) then
    eff = model_characteristics_1.eff_internal;
  end if;
  
  
/********************************************************
  Graphics
********************************************************/
//identical to "Compressor"
  
end Compressor_ellipticalCurve;
