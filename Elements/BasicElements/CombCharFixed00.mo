within PropulsionSystem.Elements.BasicElements;

model CombCharFixed00
  extends PropulsionSystem.BaseClasses.BasicElements.CombustorBase00;
  /********************************************************
          imports
  ********************************************************/
  import Modelica.Constants;
  import PropulsionSystem.Types.switches;
  
  
  
  /********************************************************
      Declaration
  ********************************************************/
  /* ---------------------------------------------
        switch
  --------------------------------------------- */
  parameter Boolean use_u_m_flow_fuel = true "get m_flow_fuel from the real input connector" annotation(
    Evaluate = true,
    HideResult = true,
    choices(checkBox = true),
    Dialog(group = "switch"));
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
  parameter Modelica.SIunits.MassFlowRate m_flow_fuel_paramInput = 1.0 "mass flow rate of fuel, valid only when use_u_mflow_fuel==false" annotation(
    Dialog(group = "Component characteristics"));
  parameter Modelica.SIunits.SpecificEnthalpy LHV_fuel_paramInput = 42.8 * 10.0 ^ 6.0 "lower heatting value of fuel, valid only when use_u_LHV_fuel==false" annotation(
    Dialog(group = "Component characteristics"));
  parameter Real effComb_paramInput = 0.99 "combustion efficiency, valid only when use_u_effComb==false" annotation(
    Dialog(group = "Component characteristics"));
  
  /* ---------------------------------------------
      Internal objects
  --------------------------------------------- */
  Modelica.Thermal.HeatTransfer.Sources.PrescribedHeatFlow prescribedHeatFlow1 annotation(
    Placement(visible = true, transformation(origin = {-10, 30}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
    
  
  
  /* ---------------------------------------------
          Interface
  --------------------------------------------- */
  Modelica.Blocks.Interfaces.RealInput u_m_flow_fuel(quantity = "MassFlowRate", unit = "kg/s", displayUnit = "kg/s") if use_u_m_flow_fuel "[kg/s], mass flow rate of fuel" annotation(
    Placement(visible = true, transformation(origin = {-90, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-110, 40}, extent = {{-10, -10}, {10, 10}}, rotation = 0)));
  Modelica.Blocks.Interfaces.RealInput u_LHV_fuel(quantity = "SpecificEnthalpy", unit = "J/kg", displayUnit = "J/kg") if use_u_LHV_fuel "[J/kg],  lower heating value of fuel" annotation(
    Placement(visible = true, transformation(origin = {-50, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {-40, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  Modelica.Blocks.Interfaces.RealInput u_effComb if use_u_effComb "[nond], combustion efficiency" annotation(
    Placement(visible = true, transformation(origin = {-10, 120}, extent = {{-20, -20}, {20, 20}}, rotation = -90), iconTransformation(origin = {0, 90}, extent = {{-10, -10}, {10, 10}}, rotation = -90)));
  //********************************************************************************
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
//--------------------
  if use_u_m_flow_fuel == true then
    Combustion.u_m_flow_fuel = u_m_flow_fuel;
  elseif use_u_m_flow_fuel == false then
    Combustion.u_m_flow_fuel = m_flow_fuel_paramInput;
  end if;
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
//--------------------
/********************************************************
  Graphics
********************************************************/
  annotation(
    defaultComponentName = "Comb",
    Icon(graphics = {Text(origin = {0, -69}, extent = {{-80, 9}, {80, -11}}, textString = "%name")}, coordinateSystem(extent = {{-100, -80}, {100, 80}}, initialScale = 0.1)),
    __OpenModelica_commandLineOptions = "");
end CombCharFixed00;
