within PropulsionSystem.Elements.BasicElements;

model CmpCharFixed00
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
  parameter PropulsionSystem.Types.switches.switchHowToDetVar switchDetermine_eff = PropulsionSystem.Types.switches.switchHowToDetVar.param "switch how to determine eff" annotation(
    Dialog(group = "switch"),
    choicesAllMatching = true,
    Evaluate = true,
    HideResult = true);
  /* ---------------------------------------------
        parameters
    --------------------------------------------- */
  inner parameter Real PRdes_paramInput = 10 "pressure ratio, value fixed through simulation" annotation(
    Dialog(group = "Component characteristics"));
  inner parameter Real effDes_paramInput = 0.80 "adiabatic efficiency, value fixed through simulation" annotation(
    Dialog(group = "Component characteristics"));
  /* ---------------------------------------------
        Interface
    --------------------------------------------- */
  Modelica.Blocks.Interfaces.RealInput u_PR if switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput "PR input, valid only when switchDetermine_PR==viaRealInput" annotation(
    Placement(visible = true, transformation(origin = {-60, -112}, extent = {{-12, -12}, {12, 12}}, rotation = 90), iconTransformation(origin = {-40, -76}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput u_eff if switchDetermine_eff == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput "eff input, valid only when switchDetermine_eff==viaRealInput" annotation(
    Placement(visible = true, transformation(origin = {-20, -112}, extent = {{-12, -12}, {12, 12}}, rotation = 90), iconTransformation(origin = {0, -56}, extent = {{-6, -6}, {6, 6}}, rotation = 90)));

algorithm
//##### none #####
equation
  m_flow_des_1 = port_1.m_flow;
  pDes_1 = fluid_1.p;
  Tdes_1 = fluid_1.T;
  NmechDes = Nmech;
//--------------------
  if switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.param then
    PRdes = PRdes_paramInput;
  elseif switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput then
    PRdes = u_PR;
  end if;
//--------------------
  if switchDetermine_eff == PropulsionSystem.Types.switches.switchHowToDetVar.param then
    effDes = effDes_paramInput;
  elseif switchDetermine_eff == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput then
    effDes = u_eff;
  end if;
//--------------------
  PR = PRdes;
  eff = effDes;
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
    </ul>
    
  <h4>classes which this component call (those in MSL are not listed) </h4>
    <p> -> none </p>
    
  <h4>classes from which this component extend </h4>
    <ul>
    <li><a href=\"modelica://PropulsionSystem.BaseClasses.BasicElements.CompressorBase00\"> PropulsionSystem.BaseClasses.BasicElements.CompressorBase00 </a> </li>
    </ul>

</html>"));

end CmpCharFixed00;
