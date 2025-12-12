within PropulsionSystem.Elements.BasicElements;

model Turbine_Map_WcEff
  extends PropulsionSystem.Elements.BasicElements.Turbine(
      switchInput_Wc_1 = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, 
      switchInput_PR = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement, 
      switchInput_eff = PropulsionSystem.Types.switches.switch_parameter_input.calc_Subelement
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
  inner parameter Real PRcurveDes= 1.8 "" annotation(Dialog(group = "Design Point Definition"));
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
    
  inner parameter Boolean switchUseMapDataFile_Wc=false ""
    annotation(Dialog(group = "table data"));
  inner parameter Boolean switchUseMapDataFile_eff=false ""
    annotation(Dialog(group = "table data"));
  
  inner parameter Modelica.Blocks.Types.Smoothness switchSmoothness=Modelica.Blocks.Types.Smoothness.LinearSegments ""
    annotation(Dialog(group = "table data"));
  
  
  //----- string -----
  //--- inner-connected ---
  inner parameter String pathName_tableFile= "./tableData/table_Trb_PR_NcqNcDes_000.txt"
    annotation(Dialog(group = "table data"));
  inner parameter String tableName_Wc= "Wc_PR_NcqNcDes"
    annotation(Dialog(group = "table data"));
  inner parameter String tableName_eff= "eff_PR_NcqNcDes"
    annotation(Dialog(group = "table data")); 
  
  
  
  //********** Internal variables **********
  //##### none #####
  //********** Internal model **********
  PropulsionSystem.Subelements.TurbineMap_WcEff model_characteristics_1(
        redeclare package Medium= Medium
      )
    ""
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
//identical to "Turbine"
end Turbine_Map_WcEff;
