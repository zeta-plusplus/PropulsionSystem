within PropulsionSystem.Elements.BasicElements;

model CombCharFixed01
  extends PropulsionSystem.BaseClasses.BasicElements.CombustorBase01;
  /********************************************************
                imports
  ********************************************************/
  import Modelica.Constants;
  import PropulsionSystem.Types.switches;
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
  parameter Boolean use_u_X_fuel = false "get fluid composition from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(group = "switch"));
  parameter Boolean use_u_C_fuel = false "get trace substances from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(group = "switch"));
  
  /* ---------------------------------------------
               parameters
  --------------------------------------------- */
  parameter Medium.MassFraction X_fuel_paramInput[Medium.nX] = {1, 0, 0} "fluid composition, valid only when use_u_X==false, value fixed through simulation" annotation(
  Dialog(group = "Component characteristics"));
  parameter Medium.ExtraProperty C_fuel_paramInput[Medium.nC](quantity = Medium.extraPropertiesNames) = fill(0, Medium.nC) "" annotation(
  Dialog(group = "Component characteristics")); 
  parameter Modelica.SIunits.SpecificEnthalpy LHV_fuel_paramInput = 42.8 * 10.0 ^ 6.0 "lower heatting value of fuel, valid only when use_u_LHV_fuel==false" annotation(
    Dialog(group = "Component characteristics"));
  parameter Real effComb_paramInput = 0.99 "combustion efficiency, valid only when use_u_effComb==false" annotation(
    Dialog(group = "Component characteristics"));
  
  
  /* ---------------------------------------------
               Interface
  --------------------------------------------- */
  Modelica.Blocks.Interfaces.RealInput u_LHV_fuel(quantity = "SpecificEnthalpy", unit = "J/kg", displayUnit = "J/kg") if use_u_LHV_fuel "[J/kg],  lower heating value of fuel" annotation(
    Placement(visible = true, transformation(origin = {40, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {20, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput u_effComb if use_u_effComb "[nond], combustion efficiency" annotation(
    Placement(visible = true, transformation(origin = {80, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {60, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput u_X_fuel[Medium.nX] if use_u_X_fuel annotation(
    Placement(visible = true, transformation(origin = {-40, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-40, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput u_C_fuel if use_u_C_fuel annotation(
    Placement(visible = true, transformation(origin = {-20, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-20, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  
  //***************************************************************************
equation
  /* ---------------------------------------------
    Connections, interface <-> internal variables   
  --------------------------------------------- */
  Combustion.u_m_flow_fuel = u_m_flow_fuel;
//--------------------
  if use_u_LHV_fuel == true then
    Combustion.u_LHV_fuel = u_LHV_fuel;
  elseif use_u_LHV_fuel == false then
    Combustion.u_LHV_fuel = LHV_fuel_paramInput;
  end if;
//--------------------
  if use_u_effComb == true then
    Combustion.u_effComb = u_effComb;
  elseif use_u_effComb == false then
    Combustion.u_effComb = effComb_paramInput;
  end if;
//--------------------
  if use_u_X_fuel == true then
    X_fuel = u_X_fuel[1:Medium.nXi];
  elseif use_u_X_fuel == false then
    X_fuel = X_fuel_paramInput;
  end if;
  //--------------------
  if use_u_C_fuel == true then
    C_fuel = u_C_X_fuel;
  elseif use_u_X_fuel == false then
    C_fuel = C_fuel_paramInput;
  end if;
  
  
  
  
/********************************************************
  Graphics
********************************************************/
  annotation(
    defaultComponentName = "Comb",
    Icon(graphics = {Rectangle(origin = {-52, 85}, fillPattern = FillPattern.Solid, lineThickness = 2, extent = {{-35, -3}, {37, -11}})}, coordinateSystem(extent = {{-100, -80}, {100, 80}}, initialScale = 0.1)),
    __OpenModelica_commandLineOptions = "",
    Diagram(coordinateSystem(initialScale = 0.1)),
    experiment(StartTime = 0, StopTime = 1, Tolerance = 1e-6, Interval = 0.002),
    __OpenModelica_simulationFlags(lv = "LOG_STATS", outputFormat = "mat", s = "dassl"));
end CombCharFixed01;
