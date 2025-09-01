within PropulsionSystem.Elements.BasicElements;

model CombCharFixed02
  extends PropulsionSystem.BaseClasses.BasicElements.CombustorBase02;
  /********************************************************
                  imports
    ********************************************************/
  import Modelica.Constants;
  import units=Modelica.Units.SI;
  import unitsNonSI=Modelica.Units.NonSI;
  import unitConversions=Modelica.Units.Conversions;
  
  import PropulsionSystem.Types.switches;
  
  
  
  /********************************************************
      Declaration
  ********************************************************/
  /* ---------------------------------------------
                 switch
    --------------------------------------------- */
  parameter Boolean use_u_LHV_fuel = false "get LHV_fuel from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(group = "switch"));
  parameter Boolean use_u_effComb = false "get effComb from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(group = "switch"));
  
  
  /* ---------------------------------------------
                 parameters
    --------------------------------------------- */
  parameter units.SpecificEnthalpy LHV_fuel_paramInput = 42.8 * 10.0 ^ 6.0 "lower heatting value of fuel, valid only when use_u_LHV_fuel==false" annotation(
    Dialog(group = "Component characteristics"));
  parameter Real effComb_paramInput = 0.99 "combustion efficiency, valid only when use_u_effComb==false" annotation(
    Dialog(group = "Component characteristics"));
  
  
  /* ---------------------------------------------
                 Interface
    --------------------------------------------- */
  Modelica.Blocks.Interfaces.RealInput u_LHV_fuel(quantity = "SpecificEnthalpy", unit = "J/kg", displayUnit = "J/kg") if use_u_LHV_fuel "[J/kg],  lower heating value of fuel" annotation(
    Placement(visible = true, transformation(origin = {40, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput u_effComb if use_u_effComb "[nond], combustion efficiency" annotation(
    Placement(visible = true, transformation(origin = {80, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {40, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  //***************************************************************************
initial equation
  /* ---------------------------------------------
    determine design point
  --------------------------------------------- */
  if use_u_effComb == true then
    effCombDes = u_effComb;
  elseif use_u_effComb == false then
    effCombDes = effComb_paramInput;
  end if;
  
  
  
equation
/* ---------------------------------------------
    Connections, interface <-> internal variables   
  --------------------------------------------- */
//--------------------
  if use_u_LHV_fuel == true then
    Combustion.u_LHV_fuel = u_LHV_fuel;
  elseif use_u_LHV_fuel == false then
    Combustion.u_LHV_fuel = LHV_fuel_paramInput;
  end if;
//--------------------
  if use_u_effComb == true then
    effComb = u_effComb;
  elseif use_u_effComb == false then
    effComb = effComb_paramInput;
  end if;
/********************************************************
  Graphics
********************************************************/
  annotation(
    defaultComponentName = "Comb",
    Icon(coordinateSystem(extent = {{-100, -80}, {100, 80}}, initialScale = 0.1)),
    __OpenModelica_commandLineOptions = "",
    Diagram(coordinateSystem(initialScale = 0.1)),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"),
  Documentation(info = "<html>
  <a href=\"modelica://PropulsionSystem/docs/Elements/BasicElements/CombCharFixed02.html\"> Document html page</a>
  
  <h4>example/demo models</h4>
    <ul>
    <li><a href=\"modelica://PropulsionSystem.Examples.Elements.BasicElements.CombCharFixed02_ex01\"> PropulsionSystem.Examples.Elements.BasicElements.CombCharFixed02_ex01 </a> </li>
    
    <li><a href=\"modelica://PropulsionSystem.Examples.Elements.BasicElements.CombCharFixed02_ex02\"> PropulsionSystem.Examples.Elements.BasicElements.CombCharFixed02_ex02 </a> </li>
    
    
  <h4>classes which this component call (those in MSL are not listed) </h4>
    <ul>
    <li><a href=\"modelica://PropulsionSystem.Subelements.Combustion00\"> PropulsionSystem.Subelements.Combustion00 </a> </li>
    
    <li><a href=\"modelica://PropulsionSystem.Elements.BasicElements.IdealMixer01\"> PropulsionSystem.Elements.BasicElements.IdealMixer01 </a> </li>
    
    <li><a href=\"modelica://PropulsionSystem.Elements.BasicElements.HeatInjector00\"> PropulsionSystem.Elements.BasicElements.HeatInjector00 </a> </li>
    
    </ul>
    
  <h4>classes from which this component extend </h4>
    <ul>
    <li><a href=\"modelica://PropulsionSystem.BaseClasses.BasicElements.CombustorBase02\"> PropulsionSystem.BaseClasses.BasicElements.CombustorBase02 </a> </li>
    </ul>

</html>"));
  
end CombCharFixed02;
