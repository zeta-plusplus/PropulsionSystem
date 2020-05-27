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
  parameter Modelica.SIunits.Time timeRemoveDesConstraint = environment.timeRemoveDesConstraint annotation(
    Dialog(group = "Simulation setting"));
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
  Boolean constrainDesPt(start=true) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  
  
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
  ) annotation(
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
  ) annotation(
    Placement(visible = true, transformation(origin = {30, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Subelements.SclTrb_WcEff00 SclTrb annotation(
    Placement(visible = true, transformation(origin = {60, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-15, 5}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Math.Division division_PRtbl annotation(
    Placement(visible = true, transformation(origin = {-25, 29}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Division division_NcTbl annotation(
    Placement(visible = true, transformation(origin = {0, 45}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Math.Feedback feedback_PRtbl annotation(
    Placement(visible = true, transformation(origin = {-55, 32}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Sources.Constant const1(k = 1) annotation(
    Placement(visible = true, transformation(origin = {-55, 15}, extent = {{-5, -5}, {5, 5}}, rotation = 90)));
  Modelica.Blocks.Math.Add add_PRtbl annotation(
    Placement(visible = true, transformation(origin = {0, 26}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter(limitsAtInit = true, uMax = Modelica.Constants.inf, uMin = 1.0e-10) annotation(
    Placement(visible = true, transformation(origin = {-40, 45}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  Modelica.Blocks.Nonlinear.Limiter limiter1(limitsAtInit = true, uMax = Modelica.Constants.inf, uMin = 1.0e-10) annotation(
    Placement(visible = true, transformation(origin = {-20, 51}, extent = {{-5, -5}, {5, 5}}, rotation = -90)));
  
  
  /* ---------------------------------------------
            Interface   
      --------------------------------------------- */
  
  
  //********************************************************************************
initial algorithm
/* ---------------------------------------------
    determine design point
  --------------------------------------------- */
  effDes := effDes_paramInput;
  fluid_1_des.p := fluid_1.p;
  fluid_1_des.T := fluid_1.T;
  NmechDes := Nmech;
  fluid_1_des.m_flow:=port_1.m_flow;
  PRdes:= PR;
  //********************************************************************************
initial equation
 
  //********************************************************************************
algorithm
//##### none #####
//********************************************************************************
equation
  if noEvent(time<=timeRemoveDesConstraint)then
    constrainDesPt=true;
  else
    constrainDesPt=false;
  end if;
  /* ---------------------------------------------
  design point constraint
  --------------------------------------------- */
  
  if noEvent(time <= timeRemoveDesConstraint) then
    eff = effDes_paramInput;
    fluid_1_des.m_flow= port_1.m_flow;
  else
    eff=SclTrb.y_effScld;
    Wc_1= SclTrb.y_WcScld;
  end if;
  
  /*
  when(time<=timeRemoveDesConstraint)then
    eff = effDes_paramInput;
  elsewhen(timeRemoveDesConstraint<time)then
    eff=SclTrb.y_effScld;
    Wc_1= SclTrb.y_WcScld;
  end when;
  */
  /* ---------------------------------------------
  internal connections
  --------------------------------------------- */
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
  connect(feedback_PRtbl.y, division_PRtbl.u1) annotation(
    Line(points = {{-50.5, 32}, {-31, 32}}, color = {0, 0, 127}));
  connect(const1.y, feedback_PRtbl.u2) annotation(
    Line(points = {{-55, 20.5}, {-55, 28}}, color = {0, 0, 127}));
  connect(division_PRtbl.y, add_PRtbl.u1) annotation(
    Line(points = {{-19.5, 29}, {-6, 29}}, color = {0, 0, 127}));
  connect(const.y, add_PRtbl.u2) annotation(
    Line(points = {{-15, 10.5}, {-15, 23}, {-6, 23}}, color = {0, 0, 127}));
  connect(ScalerDesTrb.y_s_NcDes, limiter1.u) annotation(
    Line(points = {{-58, 78}, {-20, 78}, {-20, 57}}, color = {0, 0, 127}));
  connect(limiter1.y, division_NcTbl.u2) annotation(
    Line(points = {{-20, 45.5}, {-20, 42}, {-6, 42}}, color = {0, 0, 127}));
  connect(ScalerDesTrb.y_s_PRdes, limiter.u) annotation(
    Line(points = {{-58, 74}, {-40, 74}, {-40, 52}, {-40, 52}}, color = {0, 0, 127}));
  connect(limiter.y, division_PRtbl.u2) annotation(
    Line(points = {{-40, 40}, {-40, 26}, {-31, 26}}, color = {0, 0, 127}));
  connect(division_NcTbl.y, TrbTbl_WcEff_NcPR.u_NcTbl) annotation(
    Line(points = {{5.5, 45}, {10, 45}, {10, 34}, {19, 34}}, color = {0, 0, 127}));
  connect(add_PRtbl.y, TrbTbl_WcEff_NcPR.u_PRtbl) annotation(
    Line(points = {{5.5, 26}, {19, 26}}, color = {0, 0, 127}));
  connect(TrbTbl_WcEff_NcPR.y_Wc, SclTrb.u_Wc) annotation(
    Line(points = {{42, 34}, {48, 34}, {48, 34}, {48, 34}}, color = {0, 0, 127}));
  connect(TrbTbl_WcEff_NcPR.y_eff, SclTrb.u_eff) annotation(
    Line(points = {{42, 26}, {50, 26}, {50, 26}, {48, 26}}, color = {0, 0, 127}));
  connect(ScalerDesTrb.y_s_WcDes, SclTrb.u_s_Wc) annotation(
    Line(points = {{-58, 66}, {56, 66}, {56, 42}, {56, 42}}, color = {0, 0, 127}));
  connect(ScalerDesTrb.y_s_effDes, SclTrb.u_s_eff) annotation(
    Line(points = {{-58, 62}, {64, 62}, {64, 42}, {64, 42}}, color = {0, 0, 127}));
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
