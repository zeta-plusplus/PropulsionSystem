within PropulsionSystem.Elements.BasicElements;

model TrbCharTable03
  extends PropulsionSystem.BaseClasses.BasicElements.TurbineBase02;
  extends PropulsionSystem.BaseClasses.BasicElements.TurbineBaseDefDesPt01;
  /********************************************************
            imports   
      ********************************************************/
  import Modelica.Constants;
  import PropulsionSystem.Types.switches;
  import Modelica.Utilities.Streams;
  /********************************************************
            Declaration   
    ********************************************************/
  /* ---------------------------------------------
            switches    
    --------------------------------------------- */
  parameter Boolean switch_calcOnlyDes = false "use this component for only design pt. calc." annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(group = "switch"));
  //----------
  parameter PropulsionSystem.Types.switches.switchHowToDetVar switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated "switch how to determine PR" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  parameter Boolean use_u_eff = false "get eff from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(group = "switch"));
  //----------
  parameter Boolean use_tableFile_Wc = true "" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(group = "switch about table file reading"));
  parameter Boolean use_tableFile_eff = true "" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(group = "switch about table file reading"));
  parameter PropulsionSystem.Types.switches.switchTableDataResource switchTableDataLocation = PropulsionSystem.Types.switches.switchTableDataResource.inLibraryDirectory "where table data file is located, valid if use_tableFile_..==true" annotation(
    Dialog(group = "switch about table file reading"));
  parameter Modelica.Blocks.Types.Smoothness switchSmoothness_Wc = Modelica.Blocks.Types.Smoothness.ContinuousDerivative "" annotation(
    Dialog(group = "switch about interpolation"));
  parameter Modelica.Blocks.Types.Smoothness switchSmoothness_eff = Modelica.Blocks.Types.Smoothness.ContinuousDerivative "" annotation(
    Dialog(group = "switch about interpolation"));
  /* ---------------------------------------------
            parameters    
    --------------------------------------------- */
  inner parameter Real PRdes_paramInput = 10 "pressure ratio, valid only when switchDetermine_PR==param, value fixed through simulation" annotation(
    Dialog(group = "Component characteristics"));
  inner parameter Real effDes_paramInput = 0.80 "adiabatic efficiency, valid only when use_u_eff==false, value fixed through simulation" annotation(
    Dialog(group = "Component characteristics"));
  //----------
  parameter Real NcTblDes_paramInput = 1.0 "design point definition on characteristics table" annotation(
    Dialog(group = "Component sizing"));
  parameter Real PRtblDes_paramInput = 2.0 "design point definition on table" annotation(
    Dialog(group = "Component sizing"));
  //----------
  parameter String pathName_tableFileInSimExeDir = "./tableData/table_Turbine_WcEff_NcPR00.txt" "relative path under sim. exe. file directory" annotation(
    Dialog(group = "table file read setting"));
  parameter String pathName_tableFileInLibPackage = "modelica://PropulsionSystem/tableData/table_Turbine_WcEff_NcPR00.txt" "path in library sub-directory" annotation(
    Dialog(group = "table file read setting"));
  parameter String tableName_Wc = "Wc_NcPR" "" annotation(
    Dialog(group = "table file read setting"));
  parameter String tableName_eff = "eff_NcPR" "" annotation(
    Dialog(group = "table file read setting"));
  /* ---------------------------------------------
       Internal variables
    --------------------------------------------- */
  Real PRtbl(start = PRtblDes_paramInput) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Real NcTbl(start = NcTblDes_paramInput) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Modelica.SIunits.MassFlowRate WcTblScld(start = 10.0) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Real PRtblScld(start = 5.0) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Real effTblScld(start = 0.8) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  /**/
  Real s_NcTbl(start = 1.0) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Real s_WcTbl(start = 1.0) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Real s_PRtbl(start = 1.0) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Real s_effTbl(start = 1.0) "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  discrete Real auxVar(start = 1.0) if switch_calcOnlyDes == false and switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated "" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  /**/
  /* ---------------------------------------------
       Internal objects
    --------------------------------------------- */
  PropulsionSystem.Subelements.TurbineTable_WcEff_NcPR00 TrbTbl_WcEff_NcPR_des(use_tableFile_Wc = use_tableFile_Wc, use_tableFile_eff = use_tableFile_eff, switchTableDataLocation = switchTableDataLocation, switchSmoothness_Wc = switchSmoothness_Wc, switchSmoothness_eff = switchSmoothness_eff, pathName_tableFileInSimExeDir = pathName_tableFileInSimExeDir, pathName_tableFileInLibPackage = pathName_tableFileInLibPackage, tableName_Wc = tableName_Wc, tableName_eff = tableName_eff, u_PRtbl(start = PRtblDes_paramInput), u_NcTbl(start = NcTblDes_paramInput)) annotation(
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Subelements.TurbineTable_WcEff_NcPR00 TrbTbl_WcEff_NcPR_op(use_tableFile_Wc = use_tableFile_Wc, use_tableFile_eff = use_tableFile_eff, switchTableDataLocation = switchTableDataLocation, switchSmoothness_Wc = switchSmoothness_Wc, switchSmoothness_eff = switchSmoothness_eff, pathName_tableFileInSimExeDir = pathName_tableFileInSimExeDir, pathName_tableFileInLibPackage = pathName_tableFileInLibPackage, tableName_Wc = tableName_Wc, tableName_eff = tableName_eff, u_PRtbl(start = PRtblDes_paramInput), u_NcTbl(start = NcTblDes_paramInput)) annotation(
    Placement(visible = true, transformation(origin = {-50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  /* ---------------------------------------------
            Interface   
      --------------------------------------------- */
  Modelica.Blocks.Interfaces.RealInput u_PR if switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput "PR input, valid only when switchDetermine_PR==viaRealInput" annotation(
    Placement(visible = true, transformation(origin = {-60, -112}, extent = {{-12, -12}, {12, 12}}, rotation = 90), iconTransformation(origin = {0, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput u_eff if use_u_eff "eff input, valid only when use_u_eff==true" annotation(
    Placement(visible = true, transformation(origin = {-20, -112}, extent = {{-12, -12}, {12, 12}}, rotation = 90), iconTransformation(origin = {40, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  //******************************************************************************************
protected
  parameter Real s_NcTblDes(fixed = false) "" annotation(
    HideResult = false);
  parameter Real s_WcTblDes(fixed = false) "" annotation(
    HideResult = false);
  parameter Real s_PRtblDes(fixed = false) "" annotation(
    HideResult = false);
  parameter Real s_effTblDes(fixed = false) "" annotation(
    HideResult = false);
  //******************************************************************************************
initial algorithm
//******************************************************************************************
initial equation
/* ---------------------------------------------
    determine design point
  --------------------------------------------- */
  NmechDes = Nmech;
  s_NcTblDes = s_NcTbl;
  s_WcTblDes = s_WcTbl;
  s_PRtblDes = s_PRtbl;
  s_effTblDes = s_effTbl;
//--------------------
  if switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.param then
    PRdes = PRdes_paramInput;
  elseif switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput then
    PRdes = u_PR;
  elseif switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated then
    PRdes = PR;
  end if;
//--------------------
  if use_u_eff == false then
    effDes = effDes_paramInput;
  elseif use_u_eff == true then
    effDes = u_eff;
  end if;
//--------------------
  fluid_1_des.m_flow = port_1.m_flow;
  fluid_1_des.p = fluid_1.p;
  fluid_1_des.T = fluid_1.T;
//******************************************************************************************
algorithm
//******************************************************************************************
equation
/**************************************************
    processing about data table
  **************************************************/
//----- reading design point map -----
  TrbTbl_WcEff_NcPR_des.u_NcTbl = NcTblDes_paramInput;
  TrbTbl_WcEff_NcPR_des.u_PRtbl = PRtblDes_paramInput;
  s_NcTbl = Nc_1 / NcTblDes_paramInput;
  s_WcTbl = Wc_1 / TrbTbl_WcEff_NcPR_des.y_Wc;
  s_PRtbl = (PR - 1.0) / (PRtblDes_paramInput - 1.0);
  s_effTbl = eff / TrbTbl_WcEff_NcPR_des.y_eff;
//----- read map for operation -----
  if switch_calcOnlyDes == true then
//===== mode: only des. pt. calc =====
    NcTbl = NcTblDes_paramInput;
    PRtbl = PRtblDes_paramInput;
//-----
    if switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.param then
      PR = PRdes;
    elseif switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput then
      PR = PRdes;
    end if;
//-----
    eff = effDes;
  else
//===== mode: des. pt. -> off des. =====
    if switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated then
      if time <= environment.timeRemoveDesConstraint then
        NcTbl = NcTblDes_paramInput;
        PRtbl = PRtblDes_paramInput;
        WcTblScld = auxVar;
        eff = effDes;
      else
        NcTbl = Nc_1 / s_NcTblDes;
        PRtbl = (PR - 1.0) / s_PRtblDes + 1.0;
        Wc_1 = WcTblScld;
        eff = effTblScld;
      end if;
    else
      if time <= environment.timeRemoveDesConstraint then
        NcTbl = NcTblDes_paramInput;
        PRtbl = PRtblDes_paramInput;
        PR = PRdes;
        eff = effDes;
      else
        NcTbl = Nc_1 / s_NcTblDes;
        PRtbl = (PR - 1.0) / s_PRtblDes + 1.0;
        Wc_1 = WcTblScld;
        eff = effTblScld;
      end if;
    end if;
  end if;
  when sample(environment.timeRemoveDesConstraint, 1.0) and environment.timeRemoveDesConstraint < time then
    if switch_calcOnlyDes == false and switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated then
//===== mode: des. pt. -> off des. =====
      auxVar = 1;
    end if;
  end when;
/**/
  TrbTbl_WcEff_NcPR_op.u_NcTbl = NcTbl;
  TrbTbl_WcEff_NcPR_op.u_PRtbl = PRtbl;
  PRtblScld = (PRtbl - 1.0) * s_PRtblDes + 1.0;
  WcTblScld = TrbTbl_WcEff_NcPR_op.y_Wc * s_WcTblDes;
  effTblScld = TrbTbl_WcEff_NcPR_op.y_eff * s_effTblDes;
/********************************************************
  Graphics
********************************************************/
  annotation(
    defaultComponentName = "Trb",
    Documentation(info = "<html>
  <a href=modelica://PropulsionSystem/docs/Elements/BasicElements/TrbCharFixed00.html> Document html page</a>
  
  <h4>example/demo models</h4>
    <ul>
    <li><a href=\"modelica://PropulsionSystem.Examples.Elements.BasicElements.TrbCharFixed00_ex01\"> PropulsionSystem.Examples.BasicElements.TrbCharFixed00_ex01 </a> </li>
    <li><a href=\"modelica://PropulsionSystem.Examples.Elements.BasicElements.TrbCharFixed00_ex02\"> PropulsionSystem.Examples.BasicElements.TrbCharFixed00_ex02 </a> </li>
    <li><a href=\"modelica://PropulsionSystem.Examples.Elements.BasicElements.Cmp_and_Trb_ex01\"> PropulsionSystem.Examples.BasicElements.Cmp_and_Trb_ex01 </a> </li>
    <li><a href=\"modelica://PropulsionSystem.Examples.Elements.BasicElements.Cmp_and_Trb_ex02\"> PropulsionSystem.Examples.BasicElements.Cmp_and_Trb_ex02 </a> </li>
    </ul>
    
  <h4>classes which this component call (those in MSL are not listed) </h4>
    <p> -> none </p>
    
  <h4>classes from which this component extend </h4>
    <ul>
    <li><a href=\"modelica://PropulsionSystem.BaseClasses.BasicElements.TurbineBase00\"> PropulsionSystem.BaseClasses.BasicElements.TurbineBase00 </a> </li>
    </ul>

</html>"),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end TrbCharTable03;
