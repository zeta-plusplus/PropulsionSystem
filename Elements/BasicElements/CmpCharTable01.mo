within PropulsionSystem.Elements.BasicElements;

model CmpCharTable01
  extends PropulsionSystem.BaseClasses.BasicElements.CompressorBase00;
  extends PropulsionSystem.BaseClasses.BasicElements.CompressorBaseDefDesPt00;
  
  
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
  parameter Boolean use_u_s_PRaud = false "" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(group = "switch"));
  parameter Boolean use_u_a_PRaud = false "" annotation(
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
  parameter Boolean use_tableFile_PR = true "" annotation(
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
  parameter Modelica.SIunits.Time timeRemoveDesConstraint = environment.timeRemoveDesConstraint annotation(
    Dialog(group = "Simulation setting"));
  //----------
  parameter Real NcTblDes_paramInput = 1.0 "design point definition on characteristics table" annotation(
    Dialog(group = "Component sizing"));
  parameter Real RlineTblDes_paramInput = 0.774 "design point definition on table" annotation(
    Dialog(group = "Component sizing"));
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
  discrete Real Rline(start=RlineTblDes_paramInput) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  
  Boolean constrainDesPt(start=true) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  
  
  /* ---------------------------------------------
                    Internal objects
    --------------------------------------------- */
  PropulsionSystem.Subelements.ScalerDesCmp_WcPReffNc00 ScalerDesCmp(
    use_tableFile_Wc = use_tableFile_Wc, 
    use_tableFile_PR = use_tableFile_PR, 
    use_tableFile_eff = use_tableFile_eff, 
    switchTableDataLocation = switchTableDataLocation, 
    switchSmoothness_Wc = switchSmoothness_Wc, 
    switchSmoothness_PR = switchSmoothness_PR, 
    switchSmoothness_eff = switchSmoothness_eff, 
    pathName_tableFileInSimExeDir = pathName_tableFileInSimExeDir, 
    pathName_tableFileInLibPackage = pathName_tableFileInLibPackage, 
    tableName_Wc = tableName_Wc, 
    tableName_PR = tableName_PR, 
    tableName_eff = tableName_eff
  ) annotation(
    Placement(visible = true, transformation(origin = {-70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Subelements.SclCmp_WcPReff00 SclCmp annotation(
    Placement(visible = true, transformation(origin = {40, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Subelements.CompressorTable_WcPReff_NcRline00 CmpTbl_WcPReff_NcRline(
    use_tableFile_Wc = use_tableFile_Wc, 
    use_tableFile_PR = use_tableFile_PR, 
    use_tableFile_eff = use_tableFile_eff, 
    switchTableDataLocation = switchTableDataLocation, 
    switchSmoothness_Wc = switchSmoothness_Wc, 
    switchSmoothness_PR = switchSmoothness_PR, 
    switchSmoothness_eff = switchSmoothness_eff, 
    pathName_tableFileInSimExeDir = pathName_tableFileInSimExeDir, 
    pathName_tableFileInLibPackage = pathName_tableFileInLibPackage, 
    tableName_Wc = tableName_Wc, 
    tableName_PR = tableName_PR, 
    tableName_eff = tableName_eff
  ) annotation(
    Placement(visible = true, transformation(origin = {10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Math.Division division_NcTbl annotation(
    Placement(visible = true, transformation(origin = {-20, 34}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  Modelica.Blocks.Nonlinear.Limiter limiter(limitsAtInit = true, uMax = Modelica.Constants.inf, uMin = 1.0e-10) annotation(
    Placement(visible = true, transformation(origin = {-40, 31}, extent = {{-5, -5}, {5, 5}}, rotation = 0)));
  /* ---------------------------------------------
              Interface   
    --------------------------------------------- */
  //********************************************************************************
initial algorithm
//--------------------
  //PRdes := PRdes_paramInput;
  //effDes := effDes_paramInput;
  
  //fluid_1_des.m_flow:= port_1.m_flow ;
  //fluid_1_des.p:=fluid_1.p ;
  //fluid_1_des.T:=fluid_1.T ;
  //NmechDes:=Nmech;
  
//********************************************************************************
initial equation
  /*
  fluid_1_des.p=fluid_1.p ;
  fluid_1_des.T=fluid_1.T ;
  fluid_1_des.m_flow= port_1.m_flow ;
  NmechDes=Nmech;
  */
  
  fluid_1_des.p=fluid_1.p;
  fluid_1_des.T=fluid_1.T;
  fluid_1_des.m_flow= port_1.m_flow;
  NmechDes=Nmech;
  
  //##### none #####
  //********************************************************************************
algorithm
  //##### none ##### 
  //********************************************************************************
equation
  /* ---------------------------------------------
  design point constraint
  --------------------------------------------- */
  PRdes= PRdes_paramInput;
  effDes= effDes_paramInput;
  
  when (time<=environment.timeRemoveDesConstraint)then
    //fluid_1_des.m_flow=port_1.m_flow;
    //fluid_1_des.p=fluid_1.p;
    //fluid_1_des.T=fluid_1.T;
    
    fluid_1_des.m_flow= pre(fluid_1_des.m_flow);
    fluid_1_des.p= pre(fluid_1_des.p);
    fluid_1_des.T= pre(fluid_1_des.T);
    
    NmechDes= pre(NmechDes);
    //--------------------
    //Rline=RlineTblDes_paramInput;
  end when;
  
  
  if noEvent(time <= environment.timeRemoveDesConstraint) then
    constrainDesPt=true;
  else
    constrainDesPt=false;
  end if;
  
  
  if noEvent(time <= environment.timeRemoveDesConstraint) then
    //----- design-point calc -----
    Wc_1=Wc_1_des;
    PR=PRdes;
    eff=effDes;
    
  else
    //----- off-design calc -----
    Wc_1 = SclCmp.y_WcScld;
    PR = SclCmp.y_PRscld;
    eff = SclCmp.y_effScld;
    
  end if;
  
  
  /* ---------------------------------------------
  internal connections
  --------------------------------------------- */
  ScalerDesCmp.u_NcTblDes= NcTblDes_paramInput;
  ScalerDesCmp.u_RlineTblDes= RlineTblDes_paramInput;
  ScalerDesCmp.u_NcDes= Nc_1_des;
  ScalerDesCmp.u_WcDes = Wc_1_des;
  ScalerDesCmp.u_PRdes = PRdes;
  ScalerDesCmp.u_effDes = effDes;
  //----------
  division_NcTbl.u1 = Nc_1;
  CmpTbl_WcPReff_NcRline.u_RlineTbl = Rline;
  //----------
  connect(limiter.y, division_NcTbl.u2) annotation(
    Line(points = {{-34.5, 31}, {-26, 31}}, color = {0, 0, 127}));
  connect(division_NcTbl.y, CmpTbl_WcPReff_NcRline.u_NcTbl) annotation(
    Line(points = {{-14, 34}, {-2, 34}}, color = {0, 0, 127}));
  connect(CmpTbl_WcPReff_NcRline.y_Wc, SclCmp.u_Wc) annotation(
    Line(points = {{22, 36}, {28, 36}, {28, 36}, {28, 36}}, color = {0, 0, 127}));
  connect(CmpTbl_WcPReff_NcRline.y_PR, SclCmp.u_PR) annotation(
    Line(points = {{22, 30}, {28, 30}, {28, 30}, {28, 30}}, color = {0, 0, 127}));
  connect(CmpTbl_WcPReff_NcRline.y_eff, SclCmp.u_eff) annotation(
    Line(points = {{22, 24}, {28, 24}, {28, 24}, {28, 24}}, color = {0, 0, 127}));
  connect(ScalerDesCmp.y_s_NcDes, limiter.u) annotation(
    Line(points = {{-58, 78}, {-52, 78}, {-52, 31}, {-46, 31}}, color = {0, 0, 127}));
  connect(ScalerDesCmp.y_s_WcDes, SclCmp.u_s_Wc) annotation(
    Line(points = {{-58, 74}, {34, 74}, {34, 42}, {34, 42}}, color = {0, 0, 127}));
  connect(ScalerDesCmp.y_s_PRdes, SclCmp.u_s_PR) annotation(
    Line(points = {{-58, 66}, {40, 66}, {40, 42}, {40, 42}}, color = {0, 0, 127}));
  connect(ScalerDesCmp.y_s_effDes, SclCmp.u_s_eff) annotation(
    Line(points = {{-58, 62}, {46, 62}, {46, 42}, {46, 42}}, color = {0, 0, 127}));
  
  
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

</html>"));
end CmpCharTable01;
