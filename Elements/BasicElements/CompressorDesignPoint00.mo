within PropulsionSystem.Elements.BasicElements;

model CompressorDesignPoint00
  extends PropulsionSystem.BaseClasses.BasicElements.CompressorBase02;
  
  /********************************************************
          imports   
    ********************************************************/
  import units=Modelica.Units.SI;
  import unitsNonSI=Modelica.Units.NonSI;
  import Modelica.Constants;
  import PropulsionSystem.Types.switches;
  
  /********************************************************
          Declaration   
    ********************************************************/
  /* ---------------------------------------------
          switches
    --------------------------------------------- */
  parameter PropulsionSystem.Types.switches.switchHowToDetVar switchDetermine_m_flow_1= PropulsionSystem.Types.switches.switchHowToDetVar.param "switch how to determine m_flow_1" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true); 
  parameter PropulsionSystem.Types.switches.switchHowToDetVar switchDetermine_eff= PropulsionSystem.Types.switches.switchHowToDetVar.param "switch how to determine eff" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  parameter PropulsionSystem.Types.switches.switchHowToDetVar switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.param "switch how to determine PR" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  
  
  /* ---------------------------------------------
          parameters    
    --------------------------------------------- */
  inner parameter units.MassFlowRate m_flow_1_par=1.0  "mass flow, valid only when switchDetermine_m_flow_1==param, value fixed through simulation" annotation(
    Dialog(group = "Component characteristics"));
  inner parameter Real PRdes_par = 10 "pressure ratio, valid only when switchDetermine_PR==param, value fixed through simulation" annotation(
    Dialog(group = "Component characteristics"));
  inner parameter Real effDes_par = 0.80 "adiabatic efficiency, valid only when use_u_eff==false, value fixed through simulation" annotation(
    Dialog(group = "Component characteristics"));
  
  /* ---------------------------------------------
          Internal variables
      --------------------------------------------- */
  units.MassFlowRate m_flow_1_des;
  Real PRdes(start = PR_init, min = if allowAbnormalOperation then 0.0 else 1.0 + 1.0e-10) "pressure ratio" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Real effDes(start = eff_init, min = 0.0, max = 1.0) "adiabatic efficiency" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  
  /* ---------------------------------------------
          Interface   
    --------------------------------------------- */
  Modelica.Blocks.Interfaces.RealInput u_m_flow_1 if switchDetermine_m_flow_1 == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput "m_flow_1 input, valid only when switchDetermine_m_flow_1==viaRealInput" annotation(
    Placement(visible = true, transformation(origin = {-60, -112}, extent = {{-12, -12}, {12, 12}}, rotation = 90), iconTransformation(origin = {-40, -80}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput u_PR if switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput "PR input, valid only when switchDetermine_PR==viaRealInput" annotation(
    Placement( transformation(origin = {-60, -112}, extent = {{-12, -12}, {12, 12}}, rotation = 90), iconTransformation(origin = {-10, -64}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput u_eff if switchDetermine_eff == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput "eff input, valid only when switchDetermine_eff==viaRealInput" annotation(
    Placement( transformation(origin = {-20, -112}, extent = {{-12, -12}, {12, 12}}, rotation = 90), iconTransformation(origin = {20, -50}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  //********************************************************************************
initial algorithm
//********************************************************************************
initial equation
//--------------------
  if switchDetermine_m_flow_1 == PropulsionSystem.Types.switches.switchHowToDetVar.param then
    m_flow_1_des = m_flow_1_par;
  elseif switchDetermine_m_flow_1 == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput then
    m_flow_1_des = u_m_flow_1;
  elseif switchDetermine_m_flow_1 == PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated then
    m_flow_1_des = port_1.m_flow;
  end if;
//--------------------
  if switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.param then
    PRdes = PRdes_par;
  elseif switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput then
    PRdes = u_PR;
  elseif switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated then
    PRdes = PR;
  end if;
//--------------------
  if switchDetermine_eff == PropulsionSystem.Types.switches.switchHowToDetVar.param then
    effDes = effDes_par;
  elseif switchDetermine_eff == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput then
    effDes = u_eff;
  elseif switchDetermine_eff == PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated then
    effDes = eff;
  end if;
//--------------------
//******************************************************************************************
algorithm
//##### none #####
//******************************************************************************************
equation
//--------------------
  if switchDetermine_m_flow_1 == PropulsionSystem.Types.switches.switchHowToDetVar.param then
    m_flow_1_des = m_flow_1_par;
    port_1.m_flow= m_flow_1_des;
  elseif switchDetermine_m_flow_1 == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput then
    m_flow_1_des = u_m_flow_1;
    port_1.m_flow= m_flow_1_des;
  elseif switchDetermine_m_flow_1 == PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated then
    m_flow_1_des = port_1.m_flow;
  end if;
//--------------------
  if switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.param then
    PRdes = PRdes_par;
    PR=PRdes;
  elseif switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput then
    PRdes = u_PR;
    PR=PRdes;
  elseif switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated then
    PRdes = PR;
  end if;
//--------------------
  if switchDetermine_eff == PropulsionSystem.Types.switches.switchHowToDetVar.param then
    effDes = effDes_par;
  elseif switchDetermine_eff == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput then
    effDes = u_eff;
  elseif switchDetermine_eff == PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated then
    effDes = eff;
  end if;
//--------------------
  eff=effDes;
/********************************************************
  Graphics
********************************************************/
  annotation(
    defaultComponentName = "CmpDesPt",
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
  Icon(graphics = {Text(origin = {-41, 5}, textColor = {255, 255, 255}, extent = {{-19, 1}, {101, -11}}, textString = "CmpDesPt")}));
end CompressorDesignPoint00;
