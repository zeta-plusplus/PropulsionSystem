within PropulsionSystem.Elements.BasicElements;

model CmpCharTable01
  extends PropulsionSystem.BaseClasses.BasicElements.CompressorBase00;
  /********************************************************
                  imports
        ********************************************************/
  import Modelica.Constants;
  import PropulsionSystem.Types.switches;
  /********************************************************
                  Declaration
        ********************************************************/
  /* ---------------------------------------------
                  switches
        --------------------------------------------- */
  parameter PropulsionSystem.Types.switches.switchHowToDetVar switchDetermine_PRdes = PropulsionSystem.Types.switches.switchHowToDetVar.param "switch how to determine PRdes" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  //----------
  parameter Boolean use_tableFile_Wc = false "" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(group = "switch about table file reading"));
  parameter Boolean use_tableFile_PR = false "" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(group = "switch about table file reading"));
  parameter Boolean use_tableFile_eff = false "" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(group = "switch about table file reading"));
  parameter PropulsionSystem.Types.switches.switchTableDataResource switchTableDataLocation = PropulsionSystem.Types.switches.switchTableDataResource.inLibraryDirectory "where table data file is located, valid if use_tableFile_..==true" annotation(
    Dialog(group = "switch about table file reading"));
  parameter Modelica.Blocks.Types.Smoothness switchSmoothness_Wc = Modelica.Blocks.Types.Smoothness.ContinuousDerivative "" annotation(
    Dialog(group = "switch about interpolation"));
  parameter Modelica.Blocks.Types.Smoothness switchSmoothness_PR = Modelica.Blocks.Types.Smoothness.ContinuousDerivative "" annotation(
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
  parameter Real NcTblDes_paramInput = 1.0 "design point definition on characteristics table" annotation(
    Dialog(group = "Component characteristics"));
  parameter Real RlineTblDes_paramInput = Modelica.Constants.pi / 4.0 "design point definition on table" annotation(
    Dialog(group = "Component characteristics"));
  //----------
  parameter String pathName_tableFileInSimExeDir = "./tableData/table_Compressor_WcPReff_NcRline00.txt" "relative path under sim. exe. file directory" annotation(
    Dialog(group = "table file read setting"));
  parameter String pathName_tableFileInLibPackage = "modelica://PropulsionSystem/tableData/table_Compressor_WcPReff_NcRline00.txt" "path in library sub-directory" annotation(
    Dialog(group = "table file read setting"));
  parameter String tableName_Wc = "Wc_NcRline" "" annotation(
    Dialog(group = "table file read setting"));
  parameter String tableName_PR = "PR_NcRline" "" annotation(
    Dialog(group = "table file read setting"));
  parameter String tableName_eff = "eff_NcRline" "" annotation(
    Dialog(group = "table file read setting"));
  /* ---------------------------------------------
                  Internal variables
      --------------------------------------------- */
  Real Rline;
  /* ---------------------------------------------
                  Internal objects
      --------------------------------------------- */
  PropulsionSystem.Subelements.CompressorTable_WcPReff_NcRline00 CmpTbl_WcPReff_NcRline(use_tableFile_Wc = use_tableFile_Wc, use_tableFile_PR = use_tableFile_PR, use_tableFile_eff = use_tableFile_eff, switchTableDataLocation = switchTableDataLocation, switchSmoothness_Wc = switchSmoothness_Wc, switchSmoothness_PR = switchSmoothness_PR, switchSmoothness_eff = switchSmoothness_eff, pathName_tableFileInSimExeDir = pathName_tableFileInSimExeDir, pathName_tableFileInLibPackage = pathName_tableFileInLibPackage, tableName_Wc = tableName_Wc, tableName_PR = tableName_PR, tableName_eff = tableName_eff) annotation(
    Placement(visible = true, transformation(origin = {0, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Subelements.SclCmp_WcPReff00 SclCmp annotation(
    Placement(visible = true, transformation(origin = {30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Subelements.ScalerDesCmp_WcPReffNc00 ScalerDesCmp(use_tableFile_Wc = use_tableFile_Wc, use_tableFile_PR = use_tableFile_PR, use_tableFile_eff = use_tableFile_eff, switchTableDataLocation = switchTableDataLocation, switchSmoothness_Wc = switchSmoothness_Wc, switchSmoothness_PR = switchSmoothness_PR, switchSmoothness_eff = switchSmoothness_eff, pathName_tableFileInSimExeDir = pathName_tableFileInSimExeDir, pathName_tableFileInLibPackage = pathName_tableFileInLibPackage, tableName_Wc = tableName_Wc, tableName_PR = tableName_PR, tableName_eff = tableName_eff) annotation(
    Placement(visible = true, transformation(origin = {-70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division division_NcTbl annotation(
    Placement(visible = true, transformation(origin = {-30, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  //********************************************************************************
initial equation
/* ---------------------------------------------
    determine design point
  --------------------------------------------- */
  pDes_1 = fluid_1.p;
  Tdes_1 = fluid_1.T;
  NmechDes = Nmech;
  m_flow_des_1 = port_1.m_flow;
//--------------------
  if switchDetermine_PRdes == PropulsionSystem.Types.switches.switchHowToDetVar.param then
    PRdes = PRdes_paramInput;
  elseif switchDetermine_PRdes == PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated then
    PRdes = PR;
  else
    PRdes = PRdes_paramInput;
  end if;
//--------------------
  effDes = effDes_paramInput;
algorithm
//##### none #####
equation
  connect(ScalerDesCmp.y_s_NcDes, division_NcTbl.u2) annotation(
    Line(points = {{-58, 78}, {-54, 78}, {-54, 34}, {-42, 34}, {-42, 34}}, color = {0, 0, 127}));
  connect(division_NcTbl.y, CmpTbl_WcPReff_NcRline.u_NcTbl) annotation(
    Line(points = {{-19, 40}, {-14.5, 40}, {-14.5, 34}, {-10, 34}}, color = {0, 0, 127}));
  connect(CmpTbl_WcPReff_NcRline.y_Wc, SclCmp.u_Wc) annotation(
    Line(points = {{11, 36}, {19, 36}}, color = {0, 0, 127}));
  connect(CmpTbl_WcPReff_NcRline.y_PR, SclCmp.u_PR) annotation(
    Line(points = {{11, 30}, {19, 30}}, color = {0, 0, 127}));
  connect(CmpTbl_WcPReff_NcRline.y_eff, SclCmp.u_eff) annotation(
    Line(points = {{11, 24}, {19, 24}}, color = {0, 0, 127}));
  connect(ScalerDesCmp.y_s_WcDes, SclCmp.u_s_Wc) annotation(
    Line(points = {{-58, 74}, {24, 74}, {24, 41}}, color = {0, 0, 127}));
  connect(ScalerDesCmp.y_s_PRdes, SclCmp.u_s_PR) annotation(
    Line(points = {{-58, 66}, {30, 66}, {30, 41}}, color = {0, 0, 127}));
  connect(ScalerDesCmp.y_s_effDes, SclCmp.u_s_eff) annotation(
    Line(points = {{-58, 62}, {36, 62}, {36, 41}}, color = {0, 0, 127}));
//----------
  ScalerDesCmp.u_NcTblDes = NcTblDes_paramInput;
  ScalerDesCmp.u_RlineTblDes = RlineTblDes_paramInput;
  ScalerDesCmp.u_NcDes = NcDes_1;
  ScalerDesCmp.u_WcDes = WcDes_1;
  ScalerDesCmp.u_PRdes = PRdes;
  ScalerDesCmp.u_effDes = effDes;
//----------
  division_NcTbl.u1 = Nc_1;
  CmpTbl_WcPReff_NcRline.u_RlineTbl = Rline;
//----------
  eff = SclCmp.y_effScld;
  PR = SclCmp.y_PRscld;
  Wc_1 = SclCmp.y_WcScld;
/********************************************************
  Graphics
********************************************************/
  annotation(
    defaultComponentName = "Cmp",
    Documentation(info = "<html>
  <a href=modelica://PropulsionSystem/docs/Elements/BasicElements/CmpCharFixed00.html> Document html page</a>
  
  <h4>example/demo models</h4>
    <ul>
    <li><a href=\"modelica://PropulsionSystem.Examples.Elements.BasicElements.CmpCharFixed00_ex01\"> PropulsionSystem.Examples.BasicElements.CmpCharFixed00_ex01 </a> </li>
    <li><a href=\"modelica://PropulsionSystem.Examples.Elements.BasicElements.CmpCharFixed00_ex02\"> PropulsionSystem.Examples.BasicElements.CmpCharFixed00_ex02 </a> </li>
    <li><a href=\"modelica://PropulsionSystem.Examples.Elements.BasicElements.Cmp_and_Trb_ex01\"> PropulsionSystem.Examples.BasicElements.Cmp_and_Trb_ex01 </a> </li>
    <li><a href=\"modelica://PropulsionSystem.Examples.Elements.BasicElements.Cmp_and_Trb_ex02\"> PropulsionSystem.Examples.BasicElements.Cmp_and_Trb_ex02 </a> </li>
    </ul>
    
  <h4>classes which this component call (those in MSL are not listed) </h4>
    <p> -> none </p>
    
  <h4>classes from which this component extend </h4>
    <ul>
    <li><a href=\"modelica://PropulsionSystem.BaseClasses.BasicElements.CompressorBase00\"> PropulsionSystem.BaseClasses.BasicElements.CompressorBase00 </a> </li>
    </ul>

</html>"),
    Diagram,
    __OpenModelica_commandLineOptions = "");
end CmpCharTable01;
