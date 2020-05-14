within PropulsionSystem.Elements.BasicElements;

model TrbCharTable01
  extends PropulsionSystem.BaseClasses.BasicElements.TurbineBase00;
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
  parameter PropulsionSystem.Types.switches.switchHowToDetVar switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated "switch how to determine PR" annotation(
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
  parameter Boolean use_tableFile_eff = false "" annotation(
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
  inner parameter Real PRdes_paramInput = 5.0 "pressure ratio, valid only when switchDetermine_PR==param, value fixed through simulation" annotation(
    Dialog(group = "Component characteristics"));
  inner parameter Real effDes_paramInput = 0.80 "adiabatic efficiency, valid only when use_u_eff==false, value fixed through simulation" annotation(
    Dialog(group = "Component characteristics"));
  parameter Real NcTblDes_paramInput = 1.0 "design point definition on characteristics table" annotation(
    Dialog(group = "Component characteristics"));
  parameter Real PRtblDes_paramInput = 6.0 "design point definition on table" annotation(
    Dialog(group = "Component characteristics"));
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
                  Internal objects
    --------------------------------------------- */
  PropulsionSystem.Subelements.ScalerDesTrb_WcEffNcPR00 ScalerDesTrb(use_tableFile_Wc = use_tableFile_Wc, use_tableFile_eff = use_tableFile_eff, switchTableDataLocation = switchTableDataLocation, switchSmoothness_Wc = switchSmoothness_Wc, switchSmoothness_eff = switchSmoothness_eff, pathName_tableFileInSimExeDir = pathName_tableFileInSimExeDir, pathName_tableFileInLibPackage = pathName_tableFileInLibPackage, tableName_Wc = tableName_Wc, tableName_eff = tableName_eff) "" annotation(
    Placement(visible = true, transformation(origin = {-70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Subelements.TurbineTable_WcEff_NcPR00 TrbTbl_WcEff_NcPR(use_tableFile_Wc = use_tableFile_Wc, use_tableFile_eff = use_tableFile_eff, switchTableDataLocation = switchTableDataLocation, switchSmoothness_Wc = switchSmoothness_Wc, switchSmoothness_eff = switchSmoothness_eff, pathName_tableFileInSimExeDir = pathName_tableFileInSimExeDir, pathName_tableFileInLibPackage = pathName_tableFileInLibPackage, tableName_Wc = tableName_Wc, tableName_eff = tableName_eff) "" annotation(
    Placement(visible = true, transformation(origin = {20, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Subelements.SclTrb_WcEff00 SclTrb annotation(
    Placement(visible = true, transformation(origin = {50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division division_NcTbl annotation(
    Placement(visible = true, transformation(origin = {-5, 45}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Division division_PRtbl annotation(
    Placement(visible = true, transformation(origin = {-35, 25}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add_PRtbl annotation(
    Placement(visible = true, transformation(origin = {-5, 25}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-20, 5}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Math.Feedback feedback_PRtbl annotation(
    Placement(visible = true, transformation(origin = {-55, 25}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-55, 5}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  /* ---------------------------------------------
              Interface   
      --------------------------------------------- */
  //********************************************************************************
initial equation
/* ---------------------------------------------
    determine design point
  --------------------------------------------- */
  m_flow_des_1 = port_1.m_flow;
  pDes_1 = fluid_1.p;
  Tdes_1 = fluid_1.T;
  NmechDes = Nmech;
//--------------------
  if switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.param then
    PRdes = PRdes_paramInput;
  elseif switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated then
    PRdes = PR;
  else
    PRdes = PRdes_paramInput;
  end if;
//--------------------
  effDes = effDes_paramInput;
algorithm
//##### none #####
equation
  connect(feedback_PRtbl.y, division_PRtbl.u1) annotation(
    Line(points = {{-50, 25}, {-44.5, 25}, {-44.5, 28}, {-40, 28}}, color = {0, 0, 127}));
  connect(ScalerDesTrb.y_s_PRdes, division_PRtbl.u2) annotation(
    Line(points = {{-58, 74}, {-46, 74}, {-46, 22}, {-40, 22}}, color = {0, 0, 127}));
  connect(const1.y, feedback_PRtbl.u2) annotation(
    Line(points = {{-55, 10.5}, {-55, 21}}, color = {0, 0, 127}));
  connect(const.y, add_PRtbl.u2) annotation(
    Line(points = {{-20, 11}, {-20, 22}, {-11, 22}}, color = {0, 0, 127}));
  connect(add_PRtbl.y, TrbTbl_WcEff_NcPR.u_PRtbl) annotation(
    Line(points = {{1, 25}, {4, 25}, {4, 26}, {8, 26}}, color = {0, 0, 127}));
  connect(division_PRtbl.y, add_PRtbl.u1) annotation(
    Line(points = {{-29.5, 25}, {-24, 25}, {-24, 28}, {-11, 28}}, color = {0, 0, 127}));
  connect(ScalerDesTrb.y_s_NcDes, division_NcTbl.u2) annotation(
    Line(points = {{-58, 78}, {-32, 78}, {-32, 42}, {-11, 42}}, color = {0, 0, 127}));
  connect(division_NcTbl.y, TrbTbl_WcEff_NcPR.u_NcTbl) annotation(
    Line(points = {{1, 45}, {4, 45}, {4, 34}, {8, 34}}, color = {0, 0, 127}));
  connect(TrbTbl_WcEff_NcPR.y_eff, SclTrb.u_eff) annotation(
    Line(points = {{31, 26}, {39, 26}}, color = {0, 0, 127}));
  connect(TrbTbl_WcEff_NcPR.y_Wc, SclTrb.u_Wc) annotation(
    Line(points = {{31, 34}, {39, 34}}, color = {0, 0, 127}));
  connect(ScalerDesTrb.y_s_effDes, SclTrb.u_s_eff) annotation(
    Line(points = {{-58, 62}, {54, 62}, {54, 41}}, color = {0, 0, 127}));
  connect(ScalerDesTrb.y_s_WcDes, SclTrb.u_s_Wc) annotation(
    Line(points = {{-58, 66}, {46, 66}, {46, 41}}, color = {0, 0, 127}));
//----------
  ScalerDesTrb.u_NcTblDes = NcTblDes_paramInput;
  ScalerDesTrb.u_PRtblDes = PRtblDes_paramInput;
  ScalerDesTrb.u_NcDes = NcDes_1;
  ScalerDesTrb.u_PRdes = PRdes;
  ScalerDesTrb.u_WcDes = WcDes_1;
  ScalerDesTrb.u_effDes = effDes;
//----------
  division_NcTbl.u1 = Nc_1;
  feedback_PRtbl.u1 = PR;
//--------------------
//eff = effDes;
  eff = SclTrb.y_effScld;
  Wc_1 = SclTrb.y_WcScld;
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

</html>"));
end TrbCharTable01;
