within PropulsionSystem.Elements.BasicElements;

model TurbineDesignPoint00
  extends PropulsionSystem.BaseClasses.BasicElements.TurbineBase02;
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
  parameter PropulsionSystem.Types.switches.switchHowToDetVar switchDetermine_PR = PropulsionSystem.Types.switches.switchHowToDetVar.asCalculated "switch how to determine PR" annotation(
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
  inner parameter Real PRdes_par = 5.0 "pressure ratio, valid only when switchDetermine_PR==param, value fixed through simulation" annotation(
    Dialog(group = "Component characteristics"));
  inner parameter Real effDes_par = 0.80 "adiabatic efficiency, valid only when switchDetermine_eff==param, value fixed through simulation" annotation(
    Dialog(group = "Component characteristics"));
  
  /* ---------------------------------------------
          Internal variables
      --------------------------------------------- */
  Real PRdes(start = PR_init, min = if allowAbnormalOperation then 0.0 else 1.0 + 1.0e-10) "pressure ratio" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  Real effDes(start = eff_init, min = 0.0, max = 1.0) "adiabatic efficiency" annotation(
    Dialog(tab = "Variables", group = "start attribute", enable = false, showStartAttribute = true));
  
  
  /* ---------------------------------------------
            Interface   
      --------------------------------------------- */
  Modelica.Blocks.Interfaces.RealInput u_PR if switchDetermine_PR == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput "PR input, valid only when switchDetermine_PR==viaRealInput" annotation(
    Placement(visible = true, transformation(origin = {-60, -112}, extent = {{-12, -12}, {12, 12}}, rotation = 90), iconTransformation(origin = {-40, -40}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  Modelica.Blocks.Interfaces.RealInput u_eff if switchDetermine_eff == PropulsionSystem.Types.switches.switchHowToDetVar.viaRealInput "eff input, valid only when switchDetermine_eff==viaRealInput" annotation(
    Placement(visible = true, transformation(origin = {-20, -112}, extent = {{-12, -12}, {12, 12}}, rotation = 90), iconTransformation(origin = {-3.55271e-15, -60}, extent = {{-10, -10}, {10, 10}}, rotation = 90)));
  //******************************************************************************************
initial algorithm
//******************************************************************************************
initial equation
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
    defaultComponentName = "TrbDesPt",
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

</html>"),
  Icon(graphics = {Text(origin = {-41, 5}, textColor = {255, 255, 255}, extent = {{-19, 1}, {101, -11}}, textString = "TrbDesPt")}));
end TurbineDesignPoint00;
