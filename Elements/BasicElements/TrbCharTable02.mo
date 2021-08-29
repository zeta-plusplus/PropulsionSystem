within PropulsionSystem.Elements.BasicElements;

model TrbCharTable02
  extends PropulsionSystem.BaseClasses.BasicElements.TurbineBase00;
  extends PropulsionSystem.BaseClasses.BasicElements.TurbineBaseDefDesPt00;
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
  Real PRtbl(start=PRtblDes_paramInput) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Real NcTbl(start=NcTblDes_paramInput) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  
  discrete Real s_NcDes(start=1.0) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  discrete Real s_WcDes(start=1.0) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  discrete Real s_PRdes(start=1.0) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  discrete Real s_effDes(start=1.0) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  
  Modelica.SIunits.MassFlowRate WcTblScld(start=10.0) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Real PRtblScld(start=5.0) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  Real effTblScld(start=0.8) "" annotation(
    Dialog(tab="Variables", group="start attribute" ,enable=false, showStartAttribute=true)
  );
  /**/
  
  
  /* ---------------------------------------------
     Internal objects
  --------------------------------------------- */
  PropulsionSystem.Subelements.TurbineTable_WcEff_NcPR00 TrbTbl_WcEff_NcPR_des(
    use_tableFile_Wc= use_tableFile_Wc,
    use_tableFile_eff= use_tableFile_eff,
    switchTableDataLocation= switchTableDataLocation,
    switchSmoothness_Wc= switchSmoothness_Wc,
    switchSmoothness_eff= switchSmoothness_eff,
    pathName_tableFileInSimExeDir=pathName_tableFileInSimExeDir,
    pathName_tableFileInLibPackage=pathName_tableFileInLibPackage,
    tableName_Wc=tableName_Wc,
    tableName_eff=tableName_eff,
    u_PRtbl(start=PRtblDes_paramInput),
    u_NcTbl(start=NcTblDes_paramInput)
  ) annotation(
    Placement(visible = true, transformation(origin = {-50, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Subelements.TurbineTable_WcEff_NcPR00 TrbTbl_WcEff_NcPR_op(
    use_tableFile_Wc= use_tableFile_Wc,
    use_tableFile_eff= use_tableFile_eff,
    switchTableDataLocation= switchTableDataLocation,
    switchSmoothness_Wc= switchSmoothness_Wc,
    switchSmoothness_eff= switchSmoothness_eff,
    pathName_tableFileInSimExeDir=pathName_tableFileInSimExeDir,
    pathName_tableFileInLibPackage=pathName_tableFileInLibPackage,
    tableName_Wc=tableName_Wc,
    tableName_eff=tableName_eff,
    u_PRtbl(start=PRtblDes_paramInput),
    u_NcTbl(start=NcTblDes_paramInput)
  ) annotation(
    Placement(visible = true, transformation(origin = {-50, -30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  
  
  /* ---------------------------------------------
          Interface   
    --------------------------------------------- */
  Modelica.Blocks.Interfaces.RealInput u_eff if use_u_eff "eff input, valid only when use_u_eff==true" annotation(
    Placement(visible = true, transformation(origin = {-20, -112}, extent = {{-12, -12}, {12, 12}}, rotation = 90), iconTransformation(origin = {-3.55271e-15, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
//******************************************************************************************
initial algorithm
//******************************************************************************************
initial equation
/* ---------------------------------------------
  design point calc
  --------------------------------------------- */
  fluid_1_des.m_flow = port_1.m_flow;
  fluid_1_des.p = fluid_1.p;
  fluid_1_des.T = fluid_1.T;
  NmechDes = Nmech;
//--------------------
  PRdes=PR;
//--------------------
  if use_u_eff == false then
    effDes = effDes_paramInput;
  elseif use_u_eff == true then
    effDes = u_eff;
  end if;
//--------------------
  
  //----- reading design point map -----
  TrbTbl_WcEff_NcPR_des.u_NcTbl= NcTblDes_paramInput;
  TrbTbl_WcEff_NcPR_des.u_PRtbl= PRtblDes_paramInput;
  
  
//******************************************************************************************
algorithm
//##### none #####
//******************************************************************************************
equation
  //--------------------
  if use_u_eff == false then
    effDes = effDes_paramInput;
  elseif use_u_eff == true then
    effDes = u_eff;
  end if;
  //--------------------
  when noEvent(time <= environment.timeRemoveDesConstraint) then
    /* ---------------------------------------------
    design point calc
    --------------------------------------------- */
    fluid_1_des.m_flow = port_1.m_flow;
    fluid_1_des.p = fluid_1.p;
    fluid_1_des.T = fluid_1.T;
    NmechDes = Nmech;
    PRdes=PR;
  end when;
  
  /**************************************************
    processing about data table
  **************************************************/
  //----- reading design point map -----
  TrbTbl_WcEff_NcPR_des.u_NcTbl= NcTblDes_paramInput;
  TrbTbl_WcEff_NcPR_des.u_PRtbl= PRtblDes_paramInput;
  
  when initial() then
    s_NcDes= Nc_1_des/NcTblDes_paramInput;
    s_WcDes= Wc_1_des/TrbTbl_WcEff_NcPR_des.y_Wc;
    s_PRdes= (PRdes-1.0)/(PRtblDes_paramInput-1.0);
    s_effDes= effDes/TrbTbl_WcEff_NcPR_des.y_eff;
  end when;
  
  
  //----- read map for operation -----
  if noEvent(time<=environment.timeRemoveDesConstraint) then
    NcTbl= NcTblDes_paramInput;
    PRtbl= PRtblDes_paramInput;
    eff=effDes;
  else
    NcTbl=Nc_1/s_NcDes;
    Wc_1=WcTblScld;
    eff=effDes;
  end if;
  
  PRtblScld= (PRtbl-1.0)*s_PRdes +1.0;
  PR=PRtblScld;
  
  TrbTbl_WcEff_NcPR_op.u_NcTbl= NcTbl;
  TrbTbl_WcEff_NcPR_op.u_PRtbl= PRtbl;
  WcTblScld= TrbTbl_WcEff_NcPR_op.y_Wc*s_WcDes;
  effTblScld= TrbTbl_WcEff_NcPR_op.y_eff*s_effDes;
  
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
end TrbCharTable02;
