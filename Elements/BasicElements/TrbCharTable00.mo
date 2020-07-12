within PropulsionSystem.Elements.BasicElements;

model TrbCharTable00
  extends PropulsionSystem.BaseClasses.BasicElements.TurbineBase00(
    m_flow1_init=m_flow_1_des_paramInput,
    p1_init=p1_des_paramInput,
    T1_init=T1_des_paramInput,
    Nmech_init=NmechDes_paramInput,
    eff_init=effDes_paramInput
  );
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
  parameter Boolean use_u_s_WcAud = false "" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(group = "switch"));
  parameter Boolean use_u_a_WcAud = false "" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(group = "switch"));
  parameter Boolean use_u_s_effAud = false "" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(group = "switch"));
  parameter Boolean use_u_a_effAud = false "" annotation(
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
  inner parameter Real effDes_paramInput = 0.80 "adiabatic efficiency, valid only when use_u_eff==false, value fixed through simulation" annotation(
    Dialog(group = "Component characteristics"));
  
  //----------
  parameter Modelica.SIunits.MassFlowRate m_flow_1_des_paramInput=1.0 "" annotation(
    Dialog(group = "Component sizing"));
  parameter Modelica.SIunits.Pressure p1_des_paramInput(displayUnit="Pa")=10*101.325*1000 "" annotation(
    Dialog(group = "Component sizing"));
  parameter Modelica.SIunits.Temperature T1_des_paramInput(displayUnit="K")=1600.0 "" annotation(
    Dialog(group = "Component sizing"));
  parameter Modelica.SIunits.Conversions.NonSIunits.AngularVelocity_rpm NmechDes_paramInput=3000.0 "" annotation(
    Dialog(group = "Component sizing"));
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
  Real s_WcAud;
  Real s_effAud;
  Real a_WcAud;
  Real a_effAud;
  
  
  /* ---------------------------------------------
                Internal objects
  --------------------------------------------- */
  PropulsionSystem.Subelements.ScalerDesTrb_WcEffNcPR00 ScalerDesTrb(
    use_tableFile_Wc= use_tableFile_Wc,
    use_tableFile_eff= use_tableFile_eff,
    switchTableDataLocation= switchTableDataLocation,
    switchSmoothness_Wc= switchSmoothness_Wc,
    switchSmoothness_eff= switchSmoothness_eff,
    pathName_tableFileInSimExeDir=pathName_tableFileInSimExeDir,
    pathName_tableFileInLibPackage=pathName_tableFileInLibPackage,
    tableName_Wc=tableName_Wc,
    tableName_eff=tableName_eff
  )
    ""
    annotation(
    Placement(visible = true, transformation(origin = {-70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  PropulsionSystem.Subelements.TurbineTable_WcEff_NcPR00 TrbTbl_WcEff_NcPR(
    use_tableFile_Wc= use_tableFile_Wc,
    use_tableFile_eff= use_tableFile_eff,
    switchTableDataLocation= switchTableDataLocation,
    switchSmoothness_Wc= switchSmoothness_Wc,
    switchSmoothness_eff= switchSmoothness_eff,
    pathName_tableFileInSimExeDir=pathName_tableFileInSimExeDir,
    pathName_tableFileInLibPackage=pathName_tableFileInLibPackage,
    tableName_Wc=tableName_Wc,
    tableName_eff=tableName_eff
  )
    ""
    annotation(
    Placement(visible = true, transformation(origin = {20, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Subelements.SclTrb_WcEff00 SclTrb annotation(
    Placement(visible = true, transformation(origin = {50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division division_NcTbl annotation(
    Placement(visible = true, transformation(origin = {-5, 45}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Division division_PRtbl annotation(
    Placement(visible = true, transformation(origin = {-35, 25}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Add add_PRtbl annotation(
    Placement(visible = true, transformation(origin = {-5, 25}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 1)  annotation(
    Placement(visible = true, transformation(origin = {-20, 5}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Math.Feedback feedback_PRtbl annotation(
    Placement(visible = true, transformation(origin = {-55, 25}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-55, 5}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  
  
  
  /* ---------------------------------------------
                  Interface
  --------------------------------------------- */
  input Modelica.Blocks.Interfaces.RealInput u_s_WcAud if use_u_s_WcAud "" annotation(
    Placement(visible = true, transformation(origin = {-100, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {-60, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  input Modelica.Blocks.Interfaces.RealInput u_s_effAud if use_u_s_effAud "" annotation(
    Placement(visible = true, transformation(origin = {-20, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {20, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  input Modelica.Blocks.Interfaces.RealInput u_a_WcAud if use_u_a_WcAud "" annotation(
    Placement(visible = true, transformation(origin = {-60, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {-20, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  input Modelica.Blocks.Interfaces.RealInput u_a_effAud if use_u_a_effAud "" annotation(
    Placement(visible = true, transformation(origin = {20, -120}, extent = {{-20, -20}, {20, 20}}, rotation = 90), iconTransformation(origin = {60, -90}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  //********************************************************************************
initial algorithm
  
//********************************************************************************
initial equation
  /* ---------------------------------------------
    determine design point
  --------------------------------------------- */
  PRdes = PR;
    
//********************************************************************************
algorithm
  /* ---------------------------------------------
    interface
  --------------------------------------------- */
  //-- scalers --
  //--------------------
  if(use_u_s_WcAud==false)then
    s_WcAud:=1.0;
  elseif(use_u_s_WcAud==true)then
    s_WcAud:=u_s_WcAud;
  end if; 
  //--------------------
  if(use_u_s_effAud==false)then
    s_effAud:=1.0;
  elseif(use_u_s_effAud==true)then
    s_effAud:=u_s_effAud;
  end if; 
  
  //-- adders --
  //--------------------
  if(use_u_a_WcAud==false)then
    a_WcAud:=0.0;
  elseif(use_u_a_WcAud==true)then
    a_WcAud:=u_a_WcAud;
  end if; 
  //--------------------
  if(use_u_a_effAud==false)then
    a_effAud:=0.0;
  elseif(use_u_a_effAud==true)then
    a_effAud:=u_a_effAud;
  end if;
  
  
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
  fluid_1_des.m_flow = m_flow_1_des_paramInput;
  fluid_1_des.p= p1_des_paramInput;
  fluid_1_des.T=T1_des_paramInput;
  NmechDes = NmechDes_paramInput;
  effDes= effDes_paramInput;
  
  when (time<=environment.timeRemoveDesConstraint)then
    //PRdes= PR;
    PRdes= pre(PRdes);
  end when;
  
  //----------
  ScalerDesTrb.u_NcTblDes = NcTblDes_paramInput;
  ScalerDesTrb.u_PRtblDes = PRtblDes_paramInput;
  ScalerDesTrb.u_NcDes = Nc_1_des;
  ScalerDesTrb.u_PRdes = PRdes;
  ScalerDesTrb.u_WcDes = Wc_1_des;
  ScalerDesTrb.u_effDes = effDes;
  //----------
  division_NcTbl.u1 = Nc_1;
  feedback_PRtbl.u1 = PR;
  //--------------------
  /* ---------------------------------------------
    component characteristics
  --------------------------------------------- */
  eff=SclTrb.y_effScld*s_effAud+a_effAud;
  Wc_1= SclTrb.y_WcScld*s_WcAud+a_WcAud;
  
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
end TrbCharTable00;
