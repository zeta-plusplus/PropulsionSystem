within PropulsionSystem.Elements.BasicElements;

model CmpCharTable02
  extends PropulsionSystem.BaseClasses.BasicElements.CompressorBase00;
  extends PropulsionSystem.BaseClasses.BasicElements.CompressorBaseDefDesPt00;
  /********************************************************
        imports   
  ********************************************************/
  import Modelica.Constants;
  import PropulsionSystem.Types.switches;
  import Streams= Modelica.Utilities.Streams;
  
  /********************************************************
        Declaration   
  ********************************************************/
  /* ---------------------------------------------
        switches
  --------------------------------------------- */
  parameter PropulsionSystem.Types.switches.switchHowToDetVar switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.param "switch how to determine PR" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  parameter Boolean use_u_eff = false "get eff from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true), Dialog(group = "switch"));
  
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
  Real RlineTbl(start=RlineTblDes_paramInput) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Real NcTbl(start=NcTblDes_paramInput) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  /**/
  Real s_NcTbl(start=1.0) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Real s_WcTbl(start=1.0) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Real s_PRtbl(start=1.0) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Real s_effTbl(start=1.0) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  
  Real s_NcTblDes(start=1.0) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Real s_WcTblDes(start=1.0) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Real s_PRtblDes(start=1.0) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Real s_effTblDes(start=1.0) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  
  Modelica.SIunits.MassFlowRate WcTblScld(start=10.0) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Real PRtblScld(start=10.0) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Real effTblScld(start=0.8) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  /**/
  
  /* ---------------------------------------------
     Internal objects
  --------------------------------------------- */
  PropulsionSystem.Subelements.CompressorTable_WcPReff_NcRline00 CmpTbl_WcPReff_NcRline_des(
    use_tableFile_Wc= use_tableFile_Wc,
    use_tableFile_PR= use_tableFile_PR,
    use_tableFile_eff= use_tableFile_eff,
    switchTableDataLocation= switchTableDataLocation,
    switchSmoothness_Wc= switchSmoothness_Wc,
    switchSmoothness_PR= switchSmoothness_PR,
    switchSmoothness_eff= switchSmoothness_eff,
    pathName_tableFileInSimExeDir=pathName_tableFileInSimExeDir,
    pathName_tableFileInLibPackage=pathName_tableFileInLibPackage,
    tableName_Wc=tableName_Wc,
    tableName_PR=tableName_PR,
    tableName_eff=tableName_eff,
    u_NcTbl(start=NcTblDes_paramInput),
    u_RlineTbl(start=RlineTblDes_paramInput)
  ) annotation(
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Subelements.CompressorTable_WcPReff_NcRline00 CmpTbl_WcPReff_NcRline_op(
    use_tableFile_Wc= use_tableFile_Wc,
    use_tableFile_PR= use_tableFile_PR,
    use_tableFile_eff= use_tableFile_eff,
    switchTableDataLocation= switchTableDataLocation,
    switchSmoothness_Wc= switchSmoothness_Wc,
    switchSmoothness_PR= switchSmoothness_PR,
    switchSmoothness_eff= switchSmoothness_eff,
    pathName_tableFileInSimExeDir=pathName_tableFileInSimExeDir,
    pathName_tableFileInLibPackage=pathName_tableFileInLibPackage,
    tableName_Wc=tableName_Wc,
    tableName_PR=tableName_PR,
    tableName_eff=tableName_eff,
    u_NcTbl(start=NcTblDes_paramInput),
    u_RlineTbl(start=RlineTblDes_paramInput)
  ) annotation(
    Placement(visible = true, transformation(origin = {-50, -10}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));

  
  
  /* ---------------------------------------------
        Interface   
  --------------------------------------------- */
  Modelica.Blocks.Interfaces.RealInput u_PR if switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput "PR input, valid only when switchDetermine_PR==viaRealInput" annotation(
    Placement(visible = true, transformation(origin = {-60, -112}, extent = {{-12, -12}, {12, 12}}, rotation = 90), iconTransformation(origin = {-40, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput u_eff if use_u_eff "eff input, valid only when use_u_eff==true" annotation(
    Placement(visible = true, transformation(origin = {-20, -112}, extent = {{-12, -12}, {12, 12}}, rotation = 90), iconTransformation(origin = {0, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
//********************************************************************************
initial algorithm
  
//********************************************************************************
initial equation
  /* ---------------------------------------------
    determine design point
  --------------------------------------------- */
  fluid_1_des.m_flow=port_1.m_flow;
  fluid_1_des.p=fluid_1.p;
  fluid_1_des.T=fluid_1.T;
  NmechDes = Nmech;
  //--------------------
  if switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.param then
    PRdes = PRdes_paramInput;
  elseif switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput then
    PRdes = u_PR;
  elseif switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated then
    PRdes= PR;
  end if; 
  //--------------------
  if use_u_eff == false then
    effDes = effDes_paramInput;
  elseif use_u_eff==true then
    effDes = u_eff;
  end if; 
  //--------------------
  
  //----- reading design point map -----
  CmpTbl_WcPReff_NcRline_des.u_NcTbl=NcTblDes_paramInput;
  CmpTbl_WcPReff_NcRline_des.u_RlineTbl=RlineTblDes_paramInput;
  
  
//******************************************************************************************
algorithm
  
//******************************************************************************************
equation
  
  if switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.param then
    PRdes = PRdes_paramInput;
  elseif switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput then
    PRdes = u_PR;
  elseif switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated then
    PRdes= PR;
  end if;
  /**/ 
  //--------------------
  if use_u_eff == false then
    effDes = effDes_paramInput;
  elseif use_u_eff==true then
    effDes = u_eff;
  end if; 
  //--------------------

  when (triggerDesCalc==2) then
    fluid_1_des.m_flow=port_1.m_flow;
    fluid_1_des.p=fluid_1.p;
    fluid_1_des.T=fluid_1.T;
    NmechDes = Nmech;
    //-----
    if(printCmd==true)then
      Streams.print("des.pt.calc. is executed");
      Streams.print("fluid_1_des.m_flow, .p, .T, NmechDes");
    end if;
    reinit(triggerDesCalc,0);
    //--------------------
  end when;
  /**/
  /**************************************************
    processing about data table
  **************************************************/
  //----- reading design point map -----
  CmpTbl_WcPReff_NcRline_des.u_NcTbl=NcTblDes_paramInput;
  CmpTbl_WcPReff_NcRline_des.u_RlineTbl=RlineTblDes_paramInput;
  
  s_NcTbl= Nc_1/NcTblDes_paramInput;
  s_WcTbl= Wc_1/CmpTbl_WcPReff_NcRline_des.y_Wc;
  s_PRtbl= (PR-1.0)/(CmpTbl_WcPReff_NcRline_des.y_PR-1.0);
  s_effTbl= eff/CmpTbl_WcPReff_NcRline_des.y_eff;
  
  when initial() then
    s_NcTblDes= s_NcTbl;
    s_WcTblDes= s_WcTbl;
    s_PRtblDes= s_PRtbl;
    s_effTblDes= s_effTbl;
    //-----
    if(printCmd==true)then
      Streams.print("des.pt.calc. is executed");
      Streams.print("s_NcTblDes, s_WcTblDes, s_PRtblDes, s_effTblDes");
    end if;
  end when;
  /**/
  //----- read map for operation -----
  if noEvent(time<=environment.timeRemoveDesConstraint) then
    NcTbl=NcTblDes_paramInput;
    RlineTbl=RlineTblDes_paramInput;
    PR=PRdes;
    eff=effDes;
  else
    NcTbl=Nc_1/s_NcTblDes;
    Wc_1=WcTblScld;
    PR=PRtblScld;
    eff=effTblScld;
  end if;
  
  CmpTbl_WcPReff_NcRline_op.u_NcTbl=NcTbl;
  CmpTbl_WcPReff_NcRline_op.u_RlineTbl=RlineTbl;
  WcTblScld= CmpTbl_WcPReff_NcRline_op.y_Wc*s_WcTblDes;
  PRtblScld= (CmpTbl_WcPReff_NcRline_op.y_PR-1.0)*s_PRtblDes +1.0;
  effTblScld= CmpTbl_WcPReff_NcRline_op.y_eff*s_effTblDes;
  
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

</html>"));

end CmpCharTable02;
