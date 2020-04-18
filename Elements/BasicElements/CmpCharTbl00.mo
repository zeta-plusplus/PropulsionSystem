within PropulsionSystem.Elements.BasicElements;

model CmpCharTbl00
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
  parameter PropulsionSystem.Types.switches.switchHowToDetVar switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.param "switch how to determine PR" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  parameter Boolean use_u_eff = false "get eff from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(group = "switch"));
  /* ---------------------------------------------
            parameters
  --------------------------------------------- */
  inner parameter Real PRdes_paramInput = 10 "pressure ratio, valid only when switchDetermine_PR==param, value fixed through simulation" annotation(
    Dialog(group = "Component characteristics"));
  inner parameter Real effDes_paramInput = 0.80 "adiabatic efficiency, valid only when use_u_eff==false, value fixed through simulation" annotation(
    Dialog(group = "Component characteristics"));
  /* ---------------------------------------------
            Internal objects
  --------------------------------------------- */
  PropulsionSystem.Subelements.CompressorTable_WcPReff_NcRline00 CmpTbl_WcPReff_NcRline annotation(
    Placement(visible = true, transformation(origin = {-40, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Subelements.SclCmp_WcPReff00 SclCmp annotation(
    Placement(visible = true, transformation(origin = {-10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  PropulsionSystem.Subelements.ScalerDesCmp_WcPReffNc00 ScalerDesCmp annotation(
    Placement(visible = true, transformation(origin = {-70, 70}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  
  
  
  /* ---------------------------------------------
            Interface
  --------------------------------------------- */
  Modelica.Blocks.Interfaces.RealInput u_PRdes if switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput "PR input, valid only when switchDetermine_PR==viaRealInput" annotation(
    Placement(visible = true, transformation(origin = {-40, -112}, extent = {{-12, -12}, {12, 12}}, rotation = 90), iconTransformation(origin = {-40, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput u_effDes if use_u_eff "eff input, valid only when use_u_eff==true" annotation(
    Placement(visible = true, transformation(origin = {0, -112}, extent = {{-12, -12}, {12, 12}}, rotation = 90), iconTransformation(origin = {40, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput u_WcDes annotation(
    Placement(visible = true, transformation(origin = {-80, -112}, extent = {{-12, -12}, {12, 12}}, rotation = 90), iconTransformation(origin = {0, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
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
  elseif switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput then
    PRdes = u_PRdes;
  elseif switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated then
    PRdes = PR;
  end if;
//--------------------
  if use_u_eff == false then
    effDes = effDes_paramInput;
  elseif use_u_eff == true then
    effDes = u_effDes;
  end if;
//--------------------
algorithm
//##### none #####
equation
  connect(ScalerDesCmp.y_s_NcDes, CmpTbl_WcPReff_NcRline.u_NcTbl) annotation(
    Line(points = {{-59, 78}, {-54, 78}, {-54, 34}, {-51, 34}}, color = {0, 0, 127}));
  connect(CmpTbl_WcPReff_NcRline.y_eff, SclCmp.u_eff) annotation(
    Line(points = {{-29, 24}, {-21, 24}}, color = {0, 0, 127}));
  connect(CmpTbl_WcPReff_NcRline.y_PR, SclCmp.u_PR) annotation(
    Line(points = {{-29, 30}, {-21, 30}}, color = {0, 0, 127}));
  connect(CmpTbl_WcPReff_NcRline.y_Wc, SclCmp.u_Wc) annotation(
    Line(points = {{-29, 36}, {-21, 36}}, color = {0, 0, 127}));
  connect(ScalerDesCmp.y_s_effDes, SclCmp.u_s_eff) annotation(
    Line(points = {{-58, 62}, {-4, 62}, {-4, 41}}, color = {0, 0, 127}));
  connect(ScalerDesCmp.y_s_PRdes, SclCmp.u_s_PR) annotation(
    Line(points = {{-58, 66}, {-10, 66}, {-10, 41}}, color = {0, 0, 127}));
  connect(ScalerDesCmp.y_s_WcDes, SclCmp.u_s_Wc) annotation(
    Line(points = {{-58, 74}, {-16, 74}, {-16, 41}}, color = {0, 0, 127}));
  
  
  
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
  
end CmpCharTbl00;
